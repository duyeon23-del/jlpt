with sample_user as (
  select user_id
  from public.user_stats
  order by updated_at desc
  limit 1
), attempted_recent as (
  select distinct a.question_type, a.question_id
  from public.user_question_attempts a
  join sample_user su on su.user_id = a.user_id
  where a.attempted_at >= now() - interval '30 days'
)
select 'all_skill_map' as bucket, difficulty, count(*) as n
from public.question_skill_map
group by difficulty
union all
select 'remaining_candidates' as bucket, qsm.difficulty, count(*) as n
from public.question_skill_map qsm
left join attempted_recent ar
  on ar.question_type = qsm.question_type
 and ar.question_id = qsm.question_id
where ar.question_id is null
group by qsm.difficulty
order by bucket, difficulty;
