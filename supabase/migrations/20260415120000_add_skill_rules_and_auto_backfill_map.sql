-- Add rule-based skill mapping for repeatable backfill/automation.
-- Safe to run multiple times.

begin;

-- 1) Mapping rules table used by batch jobs and manual backfills.
create table if not exists public.question_skill_rules (
  source_table text not null check (source_table in ('questions', 'passage_questions')),
  target_question_type text not null check (target_question_type in ('single', 'passage', 'grammar_context')),
  major_type text not null,
  sub_type text not null,
  skill_key text not null,
  difficulty integer not null default 3,
  recommendation_weight numeric(4,2) not null default 1.00,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  constraint question_skill_rules_pk primary key (source_table, target_question_type, major_type, sub_type)
);

-- 2) Seed/refresh canonical rules.
insert into public.question_skill_rules (
  source_table,
  target_question_type,
  major_type,
  sub_type,
  skill_key,
  difficulty,
  recommendation_weight
)
values
  ('questions', 'single', '문자·어휘', '한자 읽기', 'vocab_kanji_reading', 3, 1.00),
  ('questions', 'single', '문자·어휘', '표기', 'vocab_notation', 3, 1.00),
  ('questions', 'single', '문자·어휘', '문맥 규정', 'vocab_context_usage', 3, 1.00),
  ('questions', 'single', '문법', '판단', 'grammar_judgement', 3, 1.00),
  ('questions', 'single', '문법', '배열', 'grammar_reorder', 3, 1.00),
  ('questions', 'single', '문법', '문맥', 'grammar_context', 3, 1.00),
  ('passage_questions', 'passage', '독해', '단문독해', 'reading_short', 3, 1.00),
  ('passage_questions', 'passage', '독해', '중문독해', 'reading_medium', 3, 1.00),
  ('passage_questions', 'passage', '독해', '정보검색', 'reading_info_search', 3, 1.00),
  ('passage_questions', 'grammar_context', '문법', '문맥', 'grammar_context', 3, 1.00)
on conflict (source_table, target_question_type, major_type, sub_type)
do update set
  skill_key = excluded.skill_key,
  difficulty = excluded.difficulty,
  recommendation_weight = excluded.recommendation_weight,
  updated_at = now();

-- 3) Upsert mapping rows from questions (single mode).
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
  r.target_question_type as question_type,
  q.id::text as question_id,
  q.type::text as major_type,
  coalesce(q.sub_type, '랜덤')::text as sub_type,
  r.skill_key,
  coalesce(q.difficulty, r.difficulty),
  coalesce(q.recommendation_weight, r.recommendation_weight)
from public.questions q
join public.question_skill_rules r
  on r.source_table = 'questions'
 and r.target_question_type = 'single'
 and r.major_type = q.type
 and r.sub_type = coalesce(q.sub_type, '랜덤')
on conflict (question_type, question_id, skill_key)
do update set
  major_type = excluded.major_type,
  sub_type = excluded.sub_type,
  difficulty = excluded.difficulty,
  recommendation_weight = excluded.recommendation_weight,
  updated_at = now();

-- 4) Upsert mapping rows from passage_questions (독해 passage mode).
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
  r.target_question_type as question_type,
  pq.id::text as question_id,
  pq.type::text as major_type,
  coalesce(pq.sub_type, '랜덤')::text as sub_type,
  r.skill_key,
  coalesce(pq.difficulty, r.difficulty),
  coalesce(pq.recommendation_weight, r.recommendation_weight)
from public.passage_questions pq
join public.question_skill_rules r
  on r.source_table = 'passage_questions'
 and r.target_question_type = 'passage'
 and r.major_type = pq.type
 and r.sub_type = coalesce(pq.sub_type, '랜덤')
on conflict (question_type, question_id, skill_key)
do update set
  major_type = excluded.major_type,
  sub_type = excluded.sub_type,
  difficulty = excluded.difficulty,
  recommendation_weight = excluded.recommendation_weight,
  updated_at = now();

-- 5) Upsert mapping rows from passage_questions (문법 문맥 grammar_context mode).
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
  r.target_question_type as question_type,
  pq.id::text as question_id,
  pq.type::text as major_type,
  coalesce(pq.sub_type, '문맥')::text as sub_type,
  r.skill_key,
  coalesce(pq.difficulty, r.difficulty),
  coalesce(pq.recommendation_weight, r.recommendation_weight)
from public.passage_questions pq
join public.question_skill_rules r
  on r.source_table = 'passage_questions'
 and r.target_question_type = 'grammar_context'
 and r.major_type = pq.type
 and r.sub_type = coalesce(pq.sub_type, '문맥')
on conflict (question_type, question_id, skill_key)
do update set
  major_type = excluded.major_type,
  sub_type = excluded.sub_type,
  difficulty = excluded.difficulty,
  recommendation_weight = excluded.recommendation_weight,
  updated_at = now();

commit;

-- Optional verification query (run manually):
-- with expected as (
--   select 'single'::text as question_type, q.id::text as question_id
--   from public.questions q
--   join public.question_skill_rules r
--     on r.source_table = 'questions'
--    and r.target_question_type = 'single'
--    and r.major_type = q.type
--    and r.sub_type = coalesce(q.sub_type, '랜덤')
--   union all
--   select 'passage'::text, pq.id::text
--   from public.passage_questions pq
--   join public.question_skill_rules r
--     on r.source_table = 'passage_questions'
--    and r.target_question_type = 'passage'
--    and r.major_type = pq.type
--    and r.sub_type = coalesce(pq.sub_type, '랜덤')
--   union all
--   select 'grammar_context'::text, pq.id::text
--   from public.passage_questions pq
--   join public.question_skill_rules r
--     on r.source_table = 'passage_questions'
--    and r.target_question_type = 'grammar_context'
--    and r.major_type = pq.type
--    and r.sub_type = coalesce(pq.sub_type, '문맥')
-- )
-- select e.question_type, count(*) as missing_count
-- from expected e
-- left join public.question_skill_map m
--   on m.question_type = e.question_type
--  and m.question_id::text = e.question_id
-- where m.question_id is null
-- group by e.question_type
-- order by e.question_type;
