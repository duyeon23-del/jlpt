\pset pager off
\encoding UTF8

begin;

with target_user as (
  select id as user_id
  from public.users
  order by created_at asc
  limit 1
), sample_questions as (
  select
    id::text as question_id,
    type,
    sub_type,
    row_number() over (order by id) as rn
  from public.questions
  limit 12
), mapped as (
  select
    tu.user_id,
    'single'::text as question_type,
    sq.question_id,
    sq.type as major_type,
    sq.sub_type,
    case
      when sq.sub_type = '한자 읽기' then 'vocab_kanji_reading'
      when sq.sub_type = '표기' then 'vocab_notation'
      when sq.sub_type = '문맥 규정' then 'vocab_context_usage'
      when sq.sub_type = '판단' then 'grammar_judgement'
      when sq.sub_type = '배열' then 'grammar_reorder'
      when sq.sub_type = '문맥' then 'grammar_context'
      else 'general_misc'
    end as skill_key,
    sq.rn
  from target_user tu
  cross join sample_questions sq
)
insert into public.user_question_attempts (
  user_id,
  question_type,
  question_id,
  major_type,
  sub_type,
  skill_key,
  is_correct,
  attempted_at
)
select
  m.user_id,
  m.question_type,
  m.question_id,
  m.major_type,
  m.sub_type,
  m.skill_key,
  case when m.rn % 3 = 0 then true else false end as is_correct,
  timestamp with time zone '2001-01-01 00:00:00+00' + (m.rn || ' seconds')::interval
from mapped m
where m.user_id is not null;

commit;
