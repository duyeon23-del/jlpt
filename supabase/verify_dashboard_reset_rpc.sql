-- Dashboard reset RPC verification
-- Safe-by-default: wrapped in transaction and rolled back.
-- Usage:
--   npm run db:verify:dashboard-reset

\pset pager off
\encoding UTF8

begin;

with sample_user as (
  select user_id
  from public.user_question_attempts
  group by user_id
  order by max(attempted_at) desc
  limit 1
),
before_counts as (
  select
    su.user_id,
    (select count(*)::int from public.user_question_attempts a where a.user_id = su.user_id) as attempts_before,
    (select count(*)::int from public.user_stats s where s.user_id = su.user_id) as stats_before
  from sample_user su
),
rpc_result as (
  select r.*
  from before_counts b,
       public.reset_user_learning_data(b.user_id) r
)
select
  b.user_id::text as user_id,
  b.attempts_before,
  b.stats_before,
  r.deleted_attempts,
  r.deleted_stats,
  r.after_attempts,
  r.after_stats,
  r.ok,
  r.message
from before_counts b
join rpc_result r on true;

-- Hard checks for CI/local verification.
do $$
declare
  v_user uuid;
  v_attempts_before int := 0;
  v_stats_before int := 0;
  v_after_attempts int := 0;
  v_after_stats int := 0;
begin
  select user_id
    into v_user
  from public.user_question_attempts
  group by user_id
  order by max(attempted_at) desc
  limit 1;

  if v_user is null then
    raise notice 'verify_dashboard_reset_rpc: skipped (no sample user in user_question_attempts)';
    return;
  end if;

  select count(*)::int into v_attempts_before from public.user_question_attempts where user_id = v_user;
  select count(*)::int into v_stats_before from public.user_stats where user_id = v_user;

  perform * from public.reset_user_learning_data(v_user);

  select count(*)::int into v_after_attempts from public.user_question_attempts where user_id = v_user;
  select count(*)::int into v_after_stats from public.user_stats where user_id = v_user;

  if v_attempts_before > 0 and v_after_attempts <> 0 then
    raise exception 'verify_dashboard_reset_rpc failed: attempts not fully deleted';
  end if;

  if v_stats_before > 0 and v_after_stats <> 0 then
    raise exception 'verify_dashboard_reset_rpc failed: user_stats not fully deleted';
  end if;
end $$;

rollback;
