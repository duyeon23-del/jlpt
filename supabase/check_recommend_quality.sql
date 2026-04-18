-- Recommendation quality check (encoding-friendly output)
\pset pager off
\encoding UTF8

with sample_user as (
  select user_id
  from public.user_stats
  order by updated_at desc
  limit 1
)
select 'sample_user' as section, su.user_id::text as value
from sample_user su;

-- 1) Top weak stats (ASCII-first columns)
with sample_user as (
  select user_id
  from public.user_stats
  order by updated_at desc
  limit 1
)
select
  coalesce(us.skill_key, us.major_type || '::' || us.sub_type) as skill_key,
  case
    when us.major_type = '문자·어휘' and us.sub_type = '한자 읽기' then 'vocab_kanji_reading'
    when us.major_type = '문자·어휘' and us.sub_type = '표기' then 'vocab_notation'
    when us.major_type = '문자·어휘' and us.sub_type = '문맥 규정' then 'vocab_context_usage'
    when us.major_type = '문법' and us.sub_type = '판단' then 'grammar_judgement'
    when us.major_type = '문법' and us.sub_type = '배열' then 'grammar_reorder'
    when us.major_type = '문법' and us.sub_type = '문맥' then 'grammar_context'
    when us.major_type = '독해' and us.sub_type = '단문독해' then 'reading_short'
    when us.major_type = '독해' and us.sub_type = '중문독해' then 'reading_medium'
    when us.major_type = '독해' and us.sub_type = '정보검색' then 'reading_info_search'
    else 'other'
  end as skill_label,
  us.attempts,
  us.correct,
  case when us.attempts > 0 then round(us.correct::numeric / us.attempts * 100, 1) else 0 end as accuracy_rate,
  us.weakness_score,
  us.last_attempted_at
from public.user_stats us
join sample_user su on su.user_id = us.user_id
order by us.weakness_score desc, us.attempts desc
limit 10;

-- 2) Top recommendations (ASCII-first columns)
with sample_user as (
  select user_id
  from public.user_stats
  order by updated_at desc
  limit 1
)
select
  r.question_type,
  r.question_id,
  coalesce(r.skill_key, r.major_type || '::' || r.sub_type) as skill_key,
  coalesce(r.skill_name, r.skill_key, r.major_type || '::' || r.sub_type) as skill_name,
  r.difficulty,
  r.recommendation_weight,
  r.recommendation_score
from sample_user su,
     public.get_recommended_questions_by_skill_v3(su.user_id, null, null, null, 20) r
order by r.recommendation_score desc
limit 20;

-- 3) Recommendation difficulty distribution
with sample_user as (
  select user_id
  from public.user_stats
  order by updated_at desc
  limit 1
), rec as (
  select difficulty
  from sample_user su,
       public.get_recommended_questions_by_skill_v3(su.user_id, null, null, null, 100)
)
select difficulty, count(*) as n
from rec
group by difficulty
order by difficulty;

-- 4) Duplicate recommendation row check (must be 0)
with sample_user as (
  select user_id
  from public.user_stats
  order by updated_at desc
  limit 1
), rec as (
  select r.question_type, r.question_id
  from sample_user su,
       public.get_recommended_questions_by_skill_v3(su.user_id, null, null, null, 100) r
), dups as (
  select question_type, question_id, count(*) as dup_count
  from rec
  group by question_type, question_id
  having count(*) > 1
)
select
  coalesce(sum(dup_count), 0) as duplicate_rows,
  count(*) as duplicate_keys
from dups;

-- 5) Top recommendation mix by major/sub type
with sample_user as (
  select user_id
  from public.user_stats
  order by updated_at desc
  limit 1
), rec as (
  select r.major_type, r.sub_type
  from sample_user su,
       public.get_recommended_questions_by_skill_v3(su.user_id, null, null, null, 100) r
)
select
  major_type,
  sub_type,
  count(*) as n
from rec
group by major_type, sub_type
order by n desc, major_type, sub_type;
