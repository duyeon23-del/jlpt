-- Backfill question_skill_map from source question tables.
-- Uses DB-level privileges via SUPABASE_DB_URL runner (bypasses anon RLS limits).

begin;

insert into public.question_skill_map (
  question_type,
  question_id,
  major_type,
  sub_type,
  skill_key,
  difficulty,
  recommendation_weight,
  is_active
)
select
  'single'::text as question_type,
  q.id::text as question_id,
  q.type::text as major_type,
  coalesce(q.sub_type, '랜덤')::text as sub_type,
  case
    when q.type = '문자·어휘' and q.sub_type = '한자 읽기' then 'vocab_kanji_reading'
    when q.type = '문자·어휘' and q.sub_type = '표기' then 'vocab_notation'
    when q.type = '문자·어휘' and q.sub_type = '문맥 규정' then 'vocab_context_usage'
    when q.type = '문법' and q.sub_type = '판단' then 'grammar_judgement'
    when q.type = '문법' and q.sub_type = '배열' then 'grammar_reorder'
    when q.type = '문법' and q.sub_type = '문맥' then 'grammar_context'
    else 'general_misc'
  end as skill_key,
  coalesce(q.difficulty, 3)::int as difficulty,
  coalesce(q.recommendation_weight, 1.00)::numeric as recommendation_weight,
  true as is_active
from public.questions q
on conflict (question_type, question_id, skill_key)
do update set
  major_type = excluded.major_type,
  sub_type = excluded.sub_type,
  difficulty = excluded.difficulty,
  recommendation_weight = excluded.recommendation_weight,
  is_active = true,
  updated_at = now();

insert into public.question_skill_map (
  question_type,
  question_id,
  major_type,
  sub_type,
  skill_key,
  difficulty,
  recommendation_weight,
  is_active
)
select
  case
    when pq.type = '문법' and pq.sub_type = '문맥' then 'grammar_context'
    else 'passage'
  end as question_type,
  pq.id::text as question_id,
  pq.type::text as major_type,
  coalesce(pq.sub_type, '랜덤')::text as sub_type,
  case
    when pq.type = '독해' and pq.sub_type = '단문독해' then 'reading_short'
    when pq.type = '독해' and pq.sub_type = '중문독해' then 'reading_medium'
    when pq.type = '독해' and pq.sub_type = '정보검색' then 'reading_info_search'
    when pq.type = '독해' then 'reading_random'
    when pq.type = '문법' and pq.sub_type = '문맥' then 'grammar_context'
    else 'general_misc'
  end as skill_key,
  coalesce(pq.difficulty, 3)::int as difficulty,
  coalesce(pq.recommendation_weight, 1.00)::numeric as recommendation_weight,
  true as is_active
from public.passage_questions pq
on conflict (question_type, question_id, skill_key)
do update set
  major_type = excluded.major_type,
  sub_type = excluded.sub_type,
  difficulty = excluded.difficulty,
  recommendation_weight = excluded.recommendation_weight,
  is_active = true,
  updated_at = now();

commit;