-- =============================================================
-- user_stats: 유형별 실시간 집계 테이블 + 자동 업데이트 트리거
-- 목적: user_question_attempts 전체 스캔 없이 취약도 계산
-- =============================================================

-- 1. user_stats 테이블
create table if not exists public.user_stats (
  id          uuid primary key default gen_random_uuid(),
  user_id     uuid not null,
  major_type  text not null,
  sub_type    text not null,
  skill_key   text,
  attempts    integer not null default 0,
  correct     integer not null default 0,
  -- 취약도 점수: (1 - accuracy) × decay 복합 점수 (트리거로 갱신)
  weakness_score numeric(6,4) not null default 0,
  last_attempted_at timestamptz,
  updated_at  timestamptz not null default now(),
  unique (user_id, major_type, sub_type, skill_key)
);

-- RLS
alter table public.user_stats enable row level security;

drop policy if exists "user_stats: 본인만 조회" on public.user_stats;
drop policy if exists "user_stats: 본인만 수정" on public.user_stats;

create policy "user_stats: 본인만 조회"
  on public.user_stats for select
  using (user_id = auth.uid());

create policy "user_stats: 본인만 수정"
  on public.user_stats for all
  using (user_id = auth.uid());

-- 인덱스
create index if not exists idx_user_stats_user_id
  on public.user_stats (user_id);

create index if not exists idx_user_stats_weakness
  on public.user_stats (user_id, weakness_score desc);

-- =============================================================
-- 2. 시도 저장 시 user_stats 자동 갱신 트리거 함수
--    취약도 = (1 - accuracy) × time_decay
--    time_decay: 마지막 풀이로부터 경과일이 길수록 커짐 (망각 곡선)
--      decay = 1 + ln(1 + days_since_last) × 0.3
-- =============================================================
create or replace function public.fn_update_user_stats()
returns trigger
language plpgsql
security definer
set search_path = public
as $$
declare
  v_major  text;
  v_sub    text;
  v_skill  text;
  v_days   numeric;
  v_decay  numeric;
  v_acc    numeric;
begin
  -- 메타 우선순위: 시도 레코드 → 직접 값 사용
  v_major := coalesce(NEW.major_type, '미분류');
  v_sub   := coalesce(NEW.sub_type,   '랜덤');
  v_skill := NEW.skill_key; -- nullable

  -- upsert user_stats
  insert into public.user_stats
    (user_id, major_type, sub_type, skill_key, attempts, correct, last_attempted_at, updated_at)
  values
    (NEW.user_id, v_major, v_sub, v_skill, 1,
     case when NEW.is_correct then 1 else 0 end,
     NEW.attempted_at, now())
  on conflict (user_id, major_type, sub_type, skill_key) do update
    set attempts          = user_stats.attempts + 1,
        correct           = user_stats.correct + (case when NEW.is_correct then 1 else 0 end),
        last_attempted_at = greatest(user_stats.last_attempted_at, NEW.attempted_at),
        updated_at        = now();

  -- weakness_score 갱신
  select
    extract(epoch from (now() - us.last_attempted_at)) / 86400.0,
    case when us.attempts > 0
         then (us.attempts - us.correct)::numeric / us.attempts
         else 0 end
  into v_days, v_acc
  from public.user_stats us
  where us.user_id = NEW.user_id
    and us.major_type = v_major
    and us.sub_type   = v_sub
    and (us.skill_key = v_skill or (us.skill_key is null and v_skill is null));

  v_decay := 1.0 + ln(1.0 + greatest(coalesce(v_days, 0), 0)) * 0.3;

  update public.user_stats
  set weakness_score = round((v_acc * v_decay)::numeric, 4)
  where user_id   = NEW.user_id
    and major_type = v_major
    and sub_type   = v_sub
    and (skill_key = v_skill or (skill_key is null and v_skill is null));

  return NEW;
end;
$$;

-- 트리거 등록
drop trigger if exists trg_update_user_stats on public.user_question_attempts;

create trigger trg_update_user_stats
  after insert on public.user_question_attempts
  for each row
  execute function public.fn_update_user_stats();

-- =============================================================
-- 3. 기존 attempts 데이터 백필 (이미 쌓인 시도 반영)
-- =============================================================
insert into public.user_stats
  (user_id, major_type, sub_type, skill_key, attempts, correct, last_attempted_at, updated_at)
select
  a.user_id,
  coalesce(a.major_type, '미분류')   as major_type,
  coalesce(a.sub_type,   '랜덤')     as sub_type,
  a.skill_key,
  count(*)::int                       as attempts,
  count(*) filter (where a.is_correct)::int as correct,
  max(a.attempted_at)                 as last_attempted_at,
  now()                               as updated_at
from public.user_question_attempts a
group by a.user_id, coalesce(a.major_type,'미분류'), coalesce(a.sub_type,'랜덤'), a.skill_key
on conflict (user_id, major_type, sub_type, skill_key) do update
  set attempts          = excluded.attempts,
      correct           = excluded.correct,
      last_attempted_at = excluded.last_attempted_at,
      updated_at        = now();

-- weakness_score 백필
update public.user_stats us
set weakness_score = round(
  (
    case when us.attempts > 0
         then (us.attempts - us.correct)::numeric / us.attempts
         else 0 end
    *
    (1.0 + ln(1.0 + greatest(
      extract(epoch from (now() - us.last_attempted_at)) / 86400.0, 0
    )) * 0.3)
  )::numeric, 4
)
where us.attempts > 0;

-- =============================================================
-- 4. user_stats 기반 취약 스킬 조회 RPC (get_user_weak_skills_v1 대체)
--    → 전체 attempts 스캔 없이 집계 테이블만 읽음
-- =============================================================
create or replace function public.get_user_weak_skills_v2(
  p_user_id uuid default null,
  p_limit   integer default 5
)
returns table (
  skill_key      text,
  skill_name     text,
  major_type     text,
  sub_type       text,
  attempts       integer,
  correct        integer,
  accuracy_rate  numeric,
  weakness_score numeric
)
language sql
security definer
set search_path = public
as $$
  select
    coalesce(us.skill_key, us.major_type || '::' || us.sub_type) as skill_key,
    us.major_type || ' · ' || us.sub_type                        as skill_name,
    us.major_type,
    us.sub_type,
    us.attempts,
    us.correct,
    case when us.attempts > 0
         then round((us.correct::numeric / us.attempts * 100), 1)
         else 0 end as accuracy_rate,
    us.weakness_score
  from public.user_stats us
  where us.user_id = coalesce(p_user_id, auth.uid())
    and us.attempts >= 3        -- 최소 3회 이상 시도한 유형만
  order by us.weakness_score desc
  limit p_limit;
$$;

grant execute on function public.get_user_weak_skills_v2 to authenticated, anon;
grant select on public.user_stats to authenticated, anon;
