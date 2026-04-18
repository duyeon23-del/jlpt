-- Track and backfill attempts that still have null metadata.
-- Safe to re-run.

-- 0) Monitoring view: rows that still miss any metadata.
create or replace view public.v_attempt_meta_nulls as
select
  a.id,
  a.user_id,
  a.question_type,
  a.question_id,
  a.major_type,
  a.sub_type,
  a.skill_key,
  a.attempted_at,
  (a.major_type is null) as is_major_type_null,
  (a.sub_type is null) as is_sub_type_null,
  (a.skill_key is null) as is_skill_key_null
from public.user_question_attempts a
where a.major_type is null
   or a.sub_type is null
   or a.skill_key is null;

-- 1) First pass backfill from question_skill_map (best-ranked map row per question).
with mapped as (
  select distinct on (qsm.question_type, qsm.question_id)
    qsm.question_type,
    qsm.question_id,
    qsm.major_type,
    qsm.sub_type,
    qsm.skill_key
  from public.question_skill_map qsm
  where coalesce(qsm.is_active, true)
  order by
    qsm.question_type,
    qsm.question_id,
    qsm.recommendation_weight desc,
    qsm.difficulty asc,
    qsm.skill_key asc
)
update public.user_question_attempts a
set
  major_type = coalesce(a.major_type, m.major_type),
  sub_type = coalesce(a.sub_type, m.sub_type),
  skill_key = coalesce(a.skill_key, m.skill_key)
from mapped m
where a.question_type = m.question_type
  and a.question_id = m.question_id
  and (a.major_type is null or a.sub_type is null or a.skill_key is null);

-- 2) Second pass fallback from source banks (questions / passage_questions).
with fallback as (
  select
    'single'::text as source_question_type,
    q.id::text as question_id,
    q.type::text as major_type,
    coalesce(q.sub_type, '랜덤')::text as sub_type,
    null::text as skill_key
  from public.questions q

  union all

  select
    'passage'::text as source_question_type,
    pq.id::text as question_id,
    pq.type::text as major_type,
    coalesce(pq.sub_type, '랜덤')::text as sub_type,
    null::text as skill_key
  from public.passage_questions pq
)
update public.user_question_attempts a
set
  major_type = coalesce(a.major_type, f.major_type),
  sub_type = coalesce(a.sub_type, f.sub_type),
  skill_key = coalesce(a.skill_key, f.skill_key)
from fallback f
where a.question_id = f.question_id
  and (
    (a.question_type = 'single' and f.source_question_type = 'single')
    or
    (a.question_type in ('passage', 'grammar_context') and f.source_question_type = 'passage')
  )
  and (a.major_type is null or a.sub_type is null or a.skill_key is null);

-- 3) (Optional) Force remaining null skill_key to 'unmapped' for analytics stability.
-- Uncomment if you want zero-null skill_key in dashboards.
-- update public.user_question_attempts
-- set skill_key = 'unmapped'
-- where skill_key is null;

-- 4) Quick diagnostics to run manually after execution.
-- A) Current null ratio
-- select
--   count(*) as total_attempts,
--   count(*) filter (where major_type is null) as null_major_type,
--   count(*) filter (where sub_type is null) as null_sub_type,
--   count(*) filter (where skill_key is null) as null_skill_key,
--   round(100.0 * count(*) filter (where skill_key is null) / nullif(count(*), 0), 2) as null_skill_key_pct
-- from public.user_question_attempts;

-- B) Remaining unresolved keys by question
-- select
--   question_type,
--   question_id,
--   count(*) as attempts,
--   min(attempted_at) as first_attempt,
--   max(attempted_at) as last_attempt
-- from public.v_attempt_meta_nulls
-- group by question_type, question_id
-- order by attempts desc, last_attempt desc
-- limit 100;
