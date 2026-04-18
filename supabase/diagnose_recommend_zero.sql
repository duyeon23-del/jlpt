-- Diagnose recommendation coverage and stale mappings
with sample_user as (
  select user_id
  from public.user_stats
  order by updated_at desc
  limit 1
),
stale_passage as (
  select count(*) as stale_count
  from public.question_skill_map qsm
  where qsm.question_type in ('passage','grammar_context')
    and not exists (
      select 1
      from public.passage_questions pq
      where pq.id::text = qsm.question_id
    )
),
stale_single as (
  select count(*) as stale_count
  from public.question_skill_map qsm
  where qsm.question_type = 'single'
    and not exists (
      select 1
      from public.questions q
      where q.id::text = qsm.question_id
    )
),
rpc_count as (
  select count(*) as n
  from sample_user su,
       public.get_recommended_questions_by_skill_v3(su.user_id, null, null, null, 50) r
),
weak_count as (
  select count(*) as n
  from sample_user su
  join public.user_stats us on us.user_id = su.user_id
  where us.weakness_score > 0
)
select 'sample_user_exists' as metric, (select count(*)::text from sample_user) as value
union all
select 'weak_stats_count', (select n::text from weak_count)
union all
select 'rpc_recommend_count', (select n::text from rpc_count)
union all
select 'stale_passage_mappings', (select stale_count::text from stale_passage)
union all
select 'stale_single_mappings', (select stale_count::text from stale_single);