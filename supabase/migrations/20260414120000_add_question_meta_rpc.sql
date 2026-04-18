-- Resolve major/sub type and skill key for attempt logging.
create or replace function public.get_question_meta_for_attempt(
  p_question_type text,
  p_question_id text
)
returns table (
  major_type text,
  sub_type text,
  skill_key text
)
language sql
security definer
set search_path = public
as $$
  with mapped as (
    select
      qsm.major_type,
      qsm.sub_type,
      qsm.skill_key
    from public.question_skill_map qsm
    where qsm.question_type = p_question_type
      and qsm.question_id = p_question_id
    limit 1
  ),
  fallback as (
    select
      q.type::text as major_type,
      q.sub_type::text as sub_type,
      null::text as skill_key
    from public.questions q
    where p_question_type = 'single'
      and q.id::text = p_question_id

    union all

    select
      pq.type::text as major_type,
      pq.sub_type::text as sub_type,
      null::text as skill_key
    from public.passage_questions pq
    where p_question_type in ('passage', 'grammar_context')
      and pq.id::text = p_question_id
  )
  select m.major_type, m.sub_type, m.skill_key
  from mapped m

  union all

  select f.major_type, f.sub_type, f.skill_key
  from fallback f
  where not exists (select 1 from mapped)
  limit 1;
$$;

grant execute on function public.get_question_meta_for_attempt(text, text) to authenticated;
