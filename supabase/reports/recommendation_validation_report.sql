\pset pager off
\encoding UTF8

-- Unified recommendation validation report

with sample_user as (
  select user_id
  from public.user_stats
  order by updated_at desc
  limit 1
), weak as (
  select count(*) as weak_skill_count
  from sample_user su
  join public.user_stats us on us.user_id = su.user_id
  where us.weakness_score > 0
), rec as (
  select *
  from sample_user su,
       public.get_recommended_questions_by_skill_v3(su.user_id, null, null, null, 20)
)
select 'baseline' as section,
       case when exists (select 1 from sample_user) then 'sample_user_found' else 'sample_user_missing' end as status,
       coalesce((select weak_skill_count::text from weak), '0') as weak_skills,
       (select count(*)::text from rec) as recommendation_rows;

with sample_user as (
  select user_id
  from public.user_stats
  order by updated_at desc
  limit 1
), rec as (
  select *
  from sample_user su,
       public.get_recommended_questions_by_skill_v3(su.user_id, null, null, null, 20)
)
select 'general_20' as section, *
from rec
order by recommendation_score desc;

with sample_user as (
  select user_id
  from public.user_stats
  order by updated_at desc
  limit 1
), rec as (
  select *
  from sample_user su,
       public.get_recommended_questions_by_skill_v3(su.user_id, '문법', null, null, 20)
)
select 'grammar_20' as section, *
from rec
order by recommendation_score desc;

with sample_user as (
  select user_id
  from public.user_stats
  order by updated_at desc
  limit 1
), rec as (
  select *
  from sample_user su,
       public.get_recommended_questions_by_skill_v3(su.user_id, '독해', null, null, 20)
)
select 'reading_20' as section, *
from rec
order by recommendation_score desc;

with sample_user as (
  select user_id
  from public.user_stats
  order by updated_at desc
  limit 1
), rec as (
  select *
  from sample_user su,
       public.get_recommended_questions_by_skill_v3(su.user_id, null, null, null, 100)
), dup as (
  select question_type, question_id, count(*) as cnt
  from rec
  group by question_type, question_id
  having count(*) > 1
)
select 'duplicate_check' as section,
       count(*) as duplicate_keys,
       coalesce(sum(cnt), 0) as duplicate_rows
from dup;

with sample_user as (
  select user_id
  from public.user_stats
  order by updated_at desc
  limit 1
), rec as (
  select *
  from sample_user su,
       public.get_recommended_questions_by_skill_v3(su.user_id, null, null, null, 100)
)
select 'difficulty_distribution' as section,
       difficulty,
       count(*) as n
from rec
group by difficulty
order by difficulty;

with sample_user as (
  select user_id
  from public.user_stats
  order by updated_at desc
  limit 1
), rec as (
  select *
  from sample_user su,
       public.get_recommended_questions_by_skill_v3(su.user_id, null, null, null, 100)
)
select 'skill_distribution' as section,
       major_type,
       sub_type,
       skill_key,
       count(*) as n
from rec
group by major_type, sub_type, skill_key
order by n desc, major_type, sub_type;
