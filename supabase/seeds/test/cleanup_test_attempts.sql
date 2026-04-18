\pset pager off
\encoding UTF8

begin;

with target_user as (
  select id as user_id
  from public.users
  order by created_at asc
  limit 1
), deleted as (
  delete from public.user_question_attempts
  where user_id in (select user_id from target_user)
    and attempted_at >= timestamp with time zone '2001-01-01 00:00:00+00'
    and attempted_at < timestamp with time zone '2001-01-02 00:00:00+00'
  returning id
)
select count(*) as deleted_attempt_rows from deleted;

-- Rebuild user_stats for the target user after cleanup.
with target_user as (
  select id as user_id
  from public.users
  order by created_at asc
  limit 1
)
delete from public.user_stats us
where us.user_id in (select user_id from target_user);

with target_user as (
  select id as user_id
  from public.users
  order by created_at asc
  limit 1
), rebuilt as (
  select
    a.user_id,
    coalesce(a.major_type, '미분류') as major_type,
    coalesce(a.sub_type, '랜덤') as sub_type,
    a.skill_key,
    count(*)::int as attempts,
    count(*) filter (where a.is_correct)::int as correct,
    max(a.attempted_at) as last_attempted_at
  from public.user_question_attempts a
  where a.user_id in (select user_id from target_user)
  group by a.user_id, coalesce(a.major_type, '미분류'), coalesce(a.sub_type, '랜덤'), a.skill_key
)
insert into public.user_stats (
  user_id,
  major_type,
  sub_type,
  skill_key,
  attempts,
  correct,
  weakness_score,
  last_attempted_at,
  updated_at
)
select
  r.user_id,
  r.major_type,
  r.sub_type,
  r.skill_key,
  r.attempts,
  r.correct,
  round(
    (
      case when r.attempts > 0 then (r.attempts - r.correct)::numeric / r.attempts else 0 end
      *
      (1.0 + ln(1.0 + greatest(extract(epoch from (now() - r.last_attempted_at)) / 86400.0, 0)) * 0.3)
    )::numeric,
    4
  ) as weakness_score,
  r.last_attempted_at,
  now()
from rebuilt r;

commit;
