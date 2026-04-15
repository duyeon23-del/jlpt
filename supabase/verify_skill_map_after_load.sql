-- Post-load validation script for question_skill_map
-- Run this right after loading new questions/passage_questions data.
-- Expected behavior:
-- 1) All source rows that have rules must be mapped in question_skill_map.
-- 2) No question_skill_map rows should violate existing rules.
-- 3) New source rows with unknown (major_type, sub_type) should be explicitly listed.

-- ------------------------------------------------------------
-- A) Quick summary: source vs mapped row counts (rule-covered only)
-- ------------------------------------------------------------
with source_expected as (
  select 'single'::text as question_type, q.id::text as question_id
  from public.questions q
  join public.question_skill_rules r
    on r.source_table = 'questions'
   and r.target_question_type = 'single'
   and r.major_type = q.type
   and r.sub_type = coalesce(q.sub_type, '랜덤')

  union all

  select 'passage'::text as question_type, pq.id::text as question_id
  from public.passage_questions pq
  join public.question_skill_rules r
    on r.source_table = 'passage_questions'
   and r.target_question_type = 'passage'
   and r.major_type = pq.type
   and r.sub_type = coalesce(pq.sub_type, '랜덤')

  union all

  select 'grammar_context'::text as question_type, pq.id::text as question_id
  from public.passage_questions pq
  join public.question_skill_rules r
    on r.source_table = 'passage_questions'
   and r.target_question_type = 'grammar_context'
   and r.major_type = pq.type
   and r.sub_type = coalesce(pq.sub_type, '문맥')
),
actual_mapped as (
  select m.question_type, m.question_id
  from public.question_skill_map m
)
select
  e.question_type,
  count(*) as expected_rows,
  count(*) filter (where a.question_id is not null) as mapped_rows,
  count(*) filter (where a.question_id is null) as missing_rows
from source_expected e
left join actual_mapped a
  on a.question_type = e.question_type
 and a.question_id = e.question_id
group by e.question_type
order by e.question_type;

-- ------------------------------------------------------------
-- B) Missing mappings (must return 0 rows)
-- ------------------------------------------------------------
with source_expected as (
  select 'single'::text as question_type, q.id::text as question_id
  from public.questions q
  join public.question_skill_rules r
    on r.source_table = 'questions'
   and r.target_question_type = 'single'
   and r.major_type = q.type
   and r.sub_type = coalesce(q.sub_type, '랜덤')

  union all

  select 'passage'::text as question_type, pq.id::text as question_id
  from public.passage_questions pq
  join public.question_skill_rules r
    on r.source_table = 'passage_questions'
   and r.target_question_type = 'passage'
   and r.major_type = pq.type
   and r.sub_type = coalesce(pq.sub_type, '랜덤')

  union all

  select 'grammar_context'::text as question_type, pq.id::text as question_id
  from public.passage_questions pq
  join public.question_skill_rules r
    on r.source_table = 'passage_questions'
   and r.target_question_type = 'grammar_context'
   and r.major_type = pq.type
   and r.sub_type = coalesce(pq.sub_type, '문맥')
)
select e.question_type, e.question_id
from source_expected e
left join public.question_skill_map m
  on m.question_type = e.question_type
 and m.question_id = e.question_id
where m.question_id is null
order by e.question_type, e.question_id;

-- ------------------------------------------------------------
-- C) Rule-violating rows in question_skill_map (must return 0 rows)
-- ------------------------------------------------------------
select
  m.question_type,
  m.question_id,
  m.major_type,
  m.sub_type,
  m.skill_key
from public.question_skill_map m
left join public.question_skill_rules r
  on (
       m.question_type = 'single'
   and r.source_table = 'questions'
   and r.target_question_type = 'single'
  )
  or (
       m.question_type = 'passage'
   and r.source_table = 'passage_questions'
   and r.target_question_type = 'passage'
  )
  or (
       m.question_type = 'grammar_context'
   and r.source_table = 'passage_questions'
   and r.target_question_type = 'grammar_context'
  )
where r.major_type = m.major_type
  and r.sub_type = m.sub_type
  and r.skill_key = m.skill_key
is not true
order by m.question_type, m.question_id;

-- ------------------------------------------------------------
-- D) New source combinations with no rule (review list)
-- ------------------------------------------------------------
select
  'questions'::text as source_table,
  q.type as major_type,
  coalesce(q.sub_type, '랜덤') as sub_type,
  count(*) as source_count
from public.questions q
left join public.question_skill_rules r
  on r.source_table = 'questions'
 and r.target_question_type = 'single'
 and r.major_type = q.type
 and r.sub_type = coalesce(q.sub_type, '랜덤')
where r.skill_key is null
group by q.type, coalesce(q.sub_type, '랜덤')

union all

select
  'passage_questions'::text as source_table,
  pq.type as major_type,
  coalesce(pq.sub_type, '랜덤') as sub_type,
  count(*) as source_count
from public.passage_questions pq
left join public.question_skill_rules r
  on r.source_table = 'passage_questions'
 and r.target_question_type in ('passage', 'grammar_context')
 and r.major_type = pq.type
 and r.sub_type = coalesce(pq.sub_type, case when pq.type = '문법' then '문맥' else '랜덤' end)
where r.skill_key is null
group by pq.type, coalesce(pq.sub_type, '랜덤')
order by source_table, major_type, sub_type;

-- ------------------------------------------------------------
-- E) Optional hard-fail block for CI (uncomment to enforce)
-- ------------------------------------------------------------
-- do $$
-- declare
--   v_missing integer;
-- begin
--   with source_expected as (
--     select 'single'::text as question_type, q.id::text as question_id
--     from public.questions q
--     join public.question_skill_rules r
--       on r.source_table = 'questions'
--      and r.target_question_type = 'single'
--      and r.major_type = q.type
--      and r.sub_type = coalesce(q.sub_type, '랜덤')
--
--     union all
--
--     select 'passage'::text as question_type, pq.id::text as question_id
--     from public.passage_questions pq
--     join public.question_skill_rules r
--       on r.source_table = 'passage_questions'
--      and r.target_question_type = 'passage'
--      and r.major_type = pq.type
--      and r.sub_type = coalesce(pq.sub_type, '랜덤')
--
--     union all
--
--     select 'grammar_context'::text as question_type, pq.id::text as question_id
--     from public.passage_questions pq
--     join public.question_skill_rules r
--       on r.source_table = 'passage_questions'
--      and r.target_question_type = 'grammar_context'
--      and r.major_type = pq.type
--      and r.sub_type = coalesce(pq.sub_type, '문맥')
--   )
--   select count(*) into v_missing
--   from source_expected e
--   left join public.question_skill_map m
--     on m.question_type = e.question_type
--    and m.question_id = e.question_id
--   where m.question_id is null;
--
--   if v_missing > 0 then
--     raise exception 'Validation failed: % mappings are missing in question_skill_map', v_missing;
--   end if;
-- end $$;
