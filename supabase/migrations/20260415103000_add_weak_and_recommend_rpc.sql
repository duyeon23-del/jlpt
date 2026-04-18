-- Weak-skill analysis and similar-type recommendations based on attempt history.

drop function if exists public.get_recommended_questions_v1(uuid, integer);
drop function if exists public.get_user_weak_skills_v1(integer, integer);

create or replace function public.get_user_weak_skills_v1(
  p_limit integer default 5,
  p_lookback integer default 200
)
returns table (
  skill_key text,
  skill_name text,
  major_type text,
  sub_type text,
  total_attempts integer,
  wrong_attempts integer,
  accuracy_rate numeric,
  weakness_score numeric
)
language sql
security definer
set search_path = public
as $$
  with me as (
    select auth.uid() as uid
  ),
  base as (
    select
      a.skill_key,
      coalesce(a.major_type, m.major_type, '미분류') as major_type,
      coalesce(a.sub_type, m.sub_type, '랜덤') as sub_type,
      a.is_correct,
      a.attempted_at
    from public.user_question_attempts a
    join me on a.user_id = me.uid
    left join public.question_skill_map m
      on m.question_type = a.question_type
     and m.question_id = a.question_id
    order by a.attempted_at desc
    limit greatest(coalesce(p_lookback, 200), 1)
  ),
  agg as (
    select
      coalesce(skill_key, major_type || '::' || sub_type) as skill_key_norm,
      min(skill_key) as skill_key,
      min(major_type) as major_type,
      min(sub_type) as sub_type,
      count(*)::int as total_attempts,
      count(*) filter (where not is_correct)::int as wrong_attempts,
      round((100.0 * count(*) filter (where is_correct) / nullif(count(*), 0))::numeric, 2) as accuracy_rate
    from base
    group by 1
  )
  select
    coalesce(a.skill_key, a.skill_key_norm) as skill_key,
    coalesce(a.skill_key, a.major_type || ' · ' || a.sub_type) as skill_name,
    a.major_type,
    a.sub_type,
    a.total_attempts,
    a.wrong_attempts,
    a.accuracy_rate,
    round(((100 - a.accuracy_rate) * ln(a.total_attempts + 1))::numeric, 4) as weakness_score
  from agg a
  order by weakness_score desc, wrong_attempts desc, total_attempts desc
  limit greatest(coalesce(p_limit, 5), 1);
$$;

create or replace function public.get_recommended_questions_v1(
  p_user_id uuid default auth.uid(),
  p_limit integer default 10
)
returns table (
  question_type text,
  question_id text,
  skill_key text,
  skill_name text,
  major_type text,
  sub_type text,
  difficulty integer,
  recommendation_weight numeric,
  recommendation_score numeric
)
language sql
security definer
set search_path = public
as $$
  with me as (
    select coalesce(p_user_id, auth.uid()) as uid
  ),
  weak as (
    select *
    from public.get_user_weak_skills_v1(8, 300)
  ),
  attempted_recent as (
    select
      a.question_type,
      a.question_id
    from public.user_question_attempts a
    join me on a.user_id = me.uid
    where a.attempted_at >= now() - interval '30 days'
  ),
  candidates as (
    select
      qsm.question_type,
      qsm.question_id,
      qsm.skill_key,
      qsm.major_type,
      qsm.sub_type,
      coalesce(qsm.difficulty, 3)::int as difficulty,
      coalesce(qsm.recommendation_weight, 1.0)::numeric as recommendation_weight,
      w.weakness_score
    from public.question_skill_map qsm
    join weak w
      on w.skill_key = qsm.skill_key
    left join attempted_recent ar
      on ar.question_type = qsm.question_type
     and ar.question_id = qsm.question_id
    where ar.question_id is null
  )
  select
    c.question_type,
    c.question_id,
    c.skill_key,
    coalesce(c.skill_key, c.major_type || ' · ' || c.sub_type) as skill_name,
    c.major_type,
    c.sub_type,
    c.difficulty,
    c.recommendation_weight,
    round((c.weakness_score * c.recommendation_weight * (1 + ((c.difficulty - 3) * 0.1)))::numeric, 4) as recommendation_score
  from candidates c
  order by recommendation_score desc, difficulty asc
  limit greatest(coalesce(p_limit, 10), 1);
$$;

grant execute on function public.get_user_weak_skills_v1(integer, integer) to authenticated;
grant execute on function public.get_recommended_questions_v1(uuid, integer) to authenticated;
