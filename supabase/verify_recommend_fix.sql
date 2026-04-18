with sample_user as (
  select user_id
  from public.user_stats
  order by updated_at desc
  limit 1
),
stale_passage as (
  select count(*) as n
  from public.question_skill_map qsm
  where qsm.question_type in ('passage', 'grammar_context')
    and not exists (
      select 1 from public.passage_questions pq where pq.id::text = qsm.question_id
    )
),
rpc_rows as (
  select r.*
  from sample_user su,
       public.get_recommended_questions_by_skill_v3(su.user_id, null, null, null, 100) r
),
rpc_dups as (
  select count(*) as n
  from (
    select question_type, question_id, count(*)
    from rpc_rows
    group by 1,2
    having count(*) > 1
  ) t
)
select 'stale_passage_mappings' as metric, (select n::text from stale_passage) as value
union all
select 'rpc_total_rows', (select count(*)::text from rpc_rows)
union all
select 'rpc_duplicate_question_rows', (select n::text from rpc_dups);
