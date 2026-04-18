-- Comprehensive Verification Report
-- 1. Overall skill map status

with counts as (
  select
    'single' as question_type,
    count(distinct qsm.question_id) as mapped_count,
    (select count(*) from public.questions) as total_count
  from public.question_skill_map qsm
  where qsm.question_type = 'single'

  union all

  select
    'passage',
    count(distinct qsm.question_id),
    (select count(*) from public.passage_questions)
  from public.question_skill_map qsm
  where qsm.question_type = 'passage'

  union all

  select
    'grammar_context',
    count(distinct qsm.question_id),
    (select count(*) from public.passage_questions where type = '문법' and sub_type = '문맥')
  from public.question_skill_map qsm
  where qsm.question_type = 'grammar_context'
)
select
  question_type,
  mapped_count,
  total_count,
  (total_count - mapped_count) as missing_count,
  round(100.0 * mapped_count / nullif(total_count, 0), 2) as mapping_percentage
from counts
order by question_type;

select '---' as separator;
select 'skill_key', count(*) as question_count 
from public.question_skill_map 
where question_type in ('passage', 'grammar_context')
group by skill_key
order by skill_key;

select '---' as separator;
-- Reading batch_05 distribution check
select
  sub_type,
  count(*) as passage_count,
  (select count(*) from public.passage_questions pq2 where pq2.group_id = p.group_id) as total_questions
from public.passages p
where p.group_id like 'n5_reading_%_batch_05%'
group by p.group_id, sub_type
order by sub_type;
