-- =============================================================
-- Dashboard reset hardening bundle
-- 1) Atomic reset RPC (attempts + stats)
-- 2) Explicit RLS policies for user_stats
-- 3) Additional indexes for dashboard/recommend queries
-- =============================================================

begin;

alter table if exists public.user_question_attempts enable row level security;
alter table if exists public.user_stats enable row level security;

-- user_question_attempts: keep explicit delete/update ownership policies.
drop policy if exists "Users can delete own attempts" on public.user_question_attempts;
drop policy if exists "Users can update own attempts" on public.user_question_attempts;

create policy "Users can delete own attempts"
  on public.user_question_attempts
  for delete
  using (auth.uid() = user_id);

create policy "Users can update own attempts"
  on public.user_question_attempts
  for update
  using (auth.uid() = user_id)
  with check (auth.uid() = user_id);

-- user_stats: split broad ALL policy into explicit per-action policies.
drop policy if exists "user_stats: 본인만 수정" on public.user_stats;
drop policy if exists "user_stats: 본인만 삭제" on public.user_stats;
drop policy if exists "user_stats: 본인만 입력" on public.user_stats;
drop policy if exists "user_stats: 본인만 갱신" on public.user_stats;

create policy "user_stats: 본인만 입력"
  on public.user_stats for insert
  with check (user_id = auth.uid());

create policy "user_stats: 본인만 갱신"
  on public.user_stats for update
  using (user_id = auth.uid())
  with check (user_id = auth.uid());

create policy "user_stats: 본인만 삭제"
  on public.user_stats for delete
  using (user_id = auth.uid());

-- Atomic reset RPC used by dashboard reset button.
create or replace function public.reset_user_learning_data(
  p_user_id uuid default null
)
returns table (
  before_attempts integer,
  before_stats integer,
  deleted_attempts integer,
  deleted_stats integer,
  after_attempts integer,
  after_stats integer,
  ok boolean,
  message text
)
language plpgsql
security definer
set search_path = public
as $$
declare
  v_actor uuid;
  v_uid uuid;
  v_before_attempts integer := 0;
  v_before_stats integer := 0;
  v_deleted_attempts integer := 0;
  v_deleted_stats integer := 0;
  v_after_attempts integer := 0;
  v_after_stats integer := 0;
begin
  v_actor := auth.uid();
  v_uid := coalesce(p_user_id, v_actor);

  if v_uid is null then
    raise exception 'reset_user_learning_data requires authenticated user or p_user_id';
  end if;

  -- Client callers can only reset their own data.
  if v_actor is not null and v_actor is distinct from v_uid then
    raise exception 'permission denied for reset_user_learning_data';
  end if;

  select count(*)::int
    into v_before_attempts
  from public.user_question_attempts
  where user_id = v_uid;

  select count(*)::int
    into v_before_stats
  from public.user_stats
  where user_id = v_uid;

  delete from public.user_question_attempts
  where user_id = v_uid;
  get diagnostics v_deleted_attempts = row_count;

  delete from public.user_stats
  where user_id = v_uid;
  get diagnostics v_deleted_stats = row_count;

  select count(*)::int
    into v_after_attempts
  from public.user_question_attempts
  where user_id = v_uid;

  select count(*)::int
    into v_after_stats
  from public.user_stats
  where user_id = v_uid;

  return query
  select
    v_before_attempts,
    v_before_stats,
    v_deleted_attempts,
    v_deleted_stats,
    v_after_attempts,
    v_after_stats,
    (v_after_attempts = 0 and v_after_stats = 0) as ok,
    case
      when (v_before_attempts + v_before_stats) = 0 then 'no_data'
      when (v_after_attempts = 0 and v_after_stats = 0) then 'reset_success'
      else 'reset_incomplete'
    end as message;
end;
$$;

grant execute on function public.reset_user_learning_data(uuid)
  to authenticated, anon;

-- Dashboard/recommend query indexes.
create index if not exists idx_user_question_attempts_user_major_sub_attempted
  on public.user_question_attempts (user_id, major_type, sub_type, attempted_at desc);

create index if not exists idx_user_stats_user_major_sub
  on public.user_stats (user_id, major_type, sub_type);

create index if not exists idx_question_skill_map_major_sub_active
  on public.question_skill_map (major_type, sub_type, is_active);

create index if not exists idx_question_skill_map_skill_active
  on public.question_skill_map (skill_key, is_active);

commit;
