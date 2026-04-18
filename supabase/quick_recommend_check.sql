-- Quick Recommendation Check (RPC 기준)

with sample_user as (
  select user_id
  from public.user_stats
  order by updated_at desc
  limit 1
),
weak_count as (
  select count(*) as n
  from public.user_stats us
  join sample_user su on su.user_id = us.user_id
  where us.weakness_score > 0
),
recommend_count as (
  select count(*) as n
  from sample_user su,
       public.get_recommended_questions_by_skill_v3(su.user_id, null, null, null, 20) r
)
select
  case when count(*) = 0 then 'No sample user found' else 'Sample user found' end as status
from sample_user
union all
select 'Weak skills: ' || coalesce((select n::text from weak_count), '0')
union all
select 'Recommendation options: ' || coalesce((select n::text from recommend_count), '0');
