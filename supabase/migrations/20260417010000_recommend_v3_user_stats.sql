-- =============================================================
-- get_recommended_questions_by_skill_v3
-- user_stats 집계 테이블 기반 추천 (attempts 전체 스캔 제거)
-- 추천 점수 = weakness_score × recommendation_weight × match_rank_bonus
-- =============================================================

drop function if exists public.get_recommended_questions_by_skill_v3(uuid, text, text, text, integer);

create or replace function public.get_recommended_questions_by_skill_v3(
  p_user_id     uuid    default null,
  p_major_type  text    default null,
  p_sub_type    text    default null,
  p_skill_key   text    default null,
  p_limit       integer default 20
)
returns table (
  question_type        text,
  question_id          text,
  skill_key            text,
  skill_name           text,
  major_type           text,
  sub_type             text,
  difficulty           integer,
  recommendation_weight numeric,
  recommendation_score numeric
)
language sql
security definer
set search_path = public
as $$
  with uid_cte as (
    select coalesce(p_user_id, auth.uid()) as uid
  ),
  -- user_stats에서 취약도 점수 직접 조회 (attempts 스캔 없음)
  weak as (
    select
      us.major_type,
      us.sub_type,
      coalesce(us.skill_key, us.major_type || '::' || us.sub_type) as skill_key_norm,
      us.weakness_score
    from public.user_stats us
    join uid_cte on us.user_id = uid_cte.uid
    where us.weakness_score > 0
  ),
  -- 최근 30일 시도 문제 (재출제 방지)
  attempted_recent as (
    select distinct a.question_type, a.question_id
    from public.user_question_attempts a
    join uid_cte on a.user_id = uid_cte.uid
    where a.attempted_at >= now() - interval '30 days'
  ),
  candidates as (
    select
      qsm.question_type,
      qsm.question_id,
      qsm.skill_key,
      qsm.major_type,
      qsm.sub_type,
      coalesce(qsm.difficulty, 3)::int            as difficulty,
      coalesce(qsm.recommendation_weight, 1.0)    as recommendation_weight,
      -- 매칭 우선순위 (낮을수록 더 관련)
      case
        when p_skill_key is not null and qsm.skill_key = p_skill_key then 0
        when p_major_type is not null
          and qsm.major_type = p_major_type
          and (p_sub_type is null or p_sub_type = '랜덤' or qsm.sub_type = p_sub_type) then 1
        when p_major_type is not null and qsm.major_type = p_major_type then 2
        else 3
      end as match_rank,
      -- 취약도 점수 (user_stats 기반)
      coalesce(
        w.weakness_score,
        -- 풀이 기록 없는 유형은 기본 점수 부여 (신규 유형 탐색 장려)
        case
          when p_skill_key is not null and qsm.skill_key = p_skill_key then 0.5
          when p_major_type is not null
            and qsm.major_type = p_major_type
            and (p_sub_type is null or p_sub_type = '랜덤' or qsm.sub_type = p_sub_type) then 0.4
          when p_major_type is not null and qsm.major_type = p_major_type then 0.3
          else 0.1
        end
      ) as base_weakness
    from public.question_skill_map qsm
    left join weak w
      on w.major_type = qsm.major_type
     and w.sub_type   = qsm.sub_type
    where (p_major_type is null or qsm.major_type = p_major_type)
      and (p_sub_type is null or p_sub_type = '랜덤' or qsm.sub_type = p_sub_type)
      and (
        p_skill_key is null
        or qsm.skill_key = p_skill_key
        or (p_major_type is not null and qsm.major_type = p_major_type
            and (p_sub_type is null or p_sub_type = '랜덤' or qsm.sub_type = p_sub_type))
      )
  ),
  filtered as (
    select c.*
    from candidates c
    left join attempted_recent ar
      on ar.question_type = c.question_type
     and ar.question_id   = c.question_id
    where ar.question_id is null   -- 최근 풀었던 문제 제외
  )
  select
    f.question_type,
    f.question_id,
    f.skill_key,
    coalesce(f.skill_key, f.major_type || ' · ' || f.sub_type) as skill_name,
    f.major_type,
    f.sub_type,
    f.difficulty,
    f.recommendation_weight,
    round(
      (f.base_weakness * f.recommendation_weight)::numeric,
      4
    ) as recommendation_score
  from filtered f
  order by
    f.match_rank asc,
    recommendation_score desc,
    f.question_id asc
  limit greatest(coalesce(p_limit, 20), 1);
$$;

grant execute on function public.get_recommended_questions_by_skill_v3(uuid, text, text, text, integer)
  to authenticated, anon;

-- =============================================================
-- get_user_weak_skills_v2 개선: 최소 시도 1회 이상도 표시 (기존 3회 → 1회)
-- Dashboard에서 빠르게 취약 유형 보여주기 위해
-- =============================================================
create or replace function public.get_user_weak_skills_v2(
  p_user_id uuid    default null,
  p_limit   integer default 10
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
    and us.major_type <> '미분류'
    and us.attempts >= 1
  order by us.weakness_score desc, us.attempts desc
  limit coalesce(p_limit, 10);
$$;

grant execute on function public.get_user_weak_skills_v2(uuid, integer) to authenticated, anon;
