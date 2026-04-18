-- Seed question_skill_map with initial skill taxonomy and backfill attempts metadata.
-- This script is idempotent.

-- 1) Seed from single-question bank.
insert into public.question_skill_map (
  question_type,
  question_id,
  major_type,
  sub_type,
  skill_key,
  difficulty,
  recommendation_weight
)
select
  'single' as question_type,
  q.id::text as question_id,
  q.type::text as major_type,
  coalesce(q.sub_type, '랜덤')::text as sub_type,
  case
    when q.type = '문자·어휘' and q.sub_type = '한자 읽기' then 'vocab_kanji_reading'
    when q.type = '문자·어휘' and q.sub_type = '표기' then 'vocab_notation'
    when q.type = '문자·어휘' and q.sub_type = '문맥 규정' then 'vocab_context_usage'
    when q.type = '문자·어휘' then 'vocab_random'
    when q.type = '문법' and q.sub_type = '판단' then 'grammar_judgement'
    when q.type = '문법' and q.sub_type = '배열' then 'grammar_reorder'
    when q.type = '문법' and q.sub_type = '문맥' then 'grammar_context'
    when q.type = '문법' then 'grammar_random'
    when q.type = '독해' and q.sub_type = '단문독해' then 'reading_short'
    when q.type = '독해' and q.sub_type = '중문독해' then 'reading_medium'
    when q.type = '독해' and q.sub_type = '정보검색' then 'reading_info_search'
    when q.type = '독해' then 'reading_random'
    else 'general_misc'
  end as skill_key,
  3 as difficulty,
  1.00 as recommendation_weight
from public.questions q
on conflict (question_type, question_id, skill_key)
do update set
  major_type = excluded.major_type,
  sub_type = excluded.sub_type,
  updated_at = now();

-- 2) Seed from passage-question bank used by 독해 mode.
insert into public.question_skill_map (
  question_type,
  question_id,
  major_type,
  sub_type,
  skill_key,
  difficulty,
  recommendation_weight
)
select
  'passage' as question_type,
  pq.id::text as question_id,
  pq.type::text as major_type,
  coalesce(pq.sub_type, '랜덤')::text as sub_type,
  case
    when pq.type = '독해' and pq.sub_type = '단문독해' then 'reading_short'
    when pq.type = '독해' and pq.sub_type = '중문독해' then 'reading_medium'
    when pq.type = '독해' and pq.sub_type = '정보검색' then 'reading_info_search'
    when pq.type = '독해' then 'reading_random'
    else 'general_misc'
  end as skill_key,
  3 as difficulty,
  1.00 as recommendation_weight
from public.passage_questions pq
where pq.type = '독해'
on conflict (question_type, question_id, skill_key)
do update set
  major_type = excluded.major_type,
  sub_type = excluded.sub_type,
  updated_at = now();

-- 3) Seed from passage-question bank used by 문법 문맥 mode.
insert into public.question_skill_map (
  question_type,
  question_id,
  major_type,
  sub_type,
  skill_key,
  difficulty,
  recommendation_weight
)
select
  'grammar_context' as question_type,
  pq.id::text as question_id,
  pq.type::text as major_type,
  coalesce(pq.sub_type, '문맥')::text as sub_type,
  'grammar_context' as skill_key,
  3 as difficulty,
  1.00 as recommendation_weight
from public.passage_questions pq
where pq.type = '문법' and pq.sub_type = '문맥'
on conflict (question_type, question_id, skill_key)
do update set
  major_type = excluded.major_type,
  sub_type = excluded.sub_type,
  updated_at = now();

-- 4) Backfill existing attempts where metadata is missing.
update public.user_question_attempts a
set
  major_type = coalesce(a.major_type, m.major_type),
  sub_type = coalesce(a.sub_type, m.sub_type),
  skill_key = coalesce(a.skill_key, m.skill_key)
from public.question_skill_map m
where a.question_type = m.question_type
  and a.question_id = m.question_id
  and (a.major_type is null or a.sub_type is null or a.skill_key is null);

-- 5) Optional fast sanity checks.
-- select question_type, count(*) as mapped_count
-- from public.question_skill_map
-- group by 1
-- order by 2 desc;

-- select
--   count(*) as total_attempts,
--   count(*) filter (where skill_key is null) as null_skill_key_attempts,
--   round(100.0 * count(*) filter (where skill_key is null) / nullif(count(*), 0), 2) as null_skill_key_pct
-- from public.user_question_attempts;
