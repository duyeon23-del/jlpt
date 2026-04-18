-- Add targeted recommendation RPC used by the dashboard focus flow.

drop function if exists public.get_recommended_questions_by_skill_v2(uuid, text, text, text, integer);

create or replace function public.get_recommended_questions_by_skill_v2(
  p_user_id uuid default auth.uid(),
  p_major_type text default null,
  p_sub_type text default null,
  p_skill_key text default null,
  p_limit integer default 20
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
    from public.get_user_weak_skills_v1(20, 300)
  ),
  attempted_recent as (
    select distinct
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
      coalesce(
        w.weakness_score,
        case
          when p_skill_key is not null and qsm.skill_key = p_skill_key then 24::numeric
          when p_major_type is not null
            and qsm.major_type = p_major_type
            and (p_sub_type is null or p_sub_type = '랜덤' or qsm.sub_type = p_sub_type) then 12::numeric
          when p_major_type is not null and qsm.major_type = p_major_type then 6::numeric
          else 3::numeric
        end
      ) as base_score,
      case
        when p_skill_key is not null and qsm.skill_key = p_skill_key then 0
        when p_major_type is not null
          and qsm.major_type = p_major_type
          and (p_sub_type is null or p_sub_type = '랜덤' or qsm.sub_type = p_sub_type) then 1
        when p_major_type is not null and qsm.major_type = p_major_type then 2
        else 3
      end as match_rank
    from public.question_skill_map qsm
    left join weak w
      on w.skill_key = qsm.skill_key
    where (p_major_type is null or qsm.major_type = p_major_type)
      and (p_sub_type is null or p_sub_type = '랜덤' or qsm.sub_type = p_sub_type)
      and (
        p_skill_key is null
        or qsm.skill_key = p_skill_key
        or (
          p_major_type is not null
          and qsm.major_type = p_major_type
          and (p_sub_type is null or p_sub_type = '랜덤' or qsm.sub_type = p_sub_type)
        )
      )
  ),
  filtered as (
    select c.*
    from candidates c
    left join attempted_recent ar
      on ar.question_type = c.question_type
     and ar.question_id = c.question_id
    where ar.question_id is null
  )
  select
    f.question_type,
    f.question_id,
    f.skill_key,
    coalesce(f.skill_key, f.major_type || ' · ' || f.sub_type) as skill_name,
    f.major_type,
    f.sub_type,
    f.difficulty,
    f.recommendation_weight,
    round(
      (
        f.base_score
        * f.recommendation_weight
        * (1 + ((3 - abs(f.difficulty - 3)) * 0.05))
      )::numeric,
      4
    ) as recommendation_score
  from filtered f
  order by
    f.match_rank asc,
    recommendation_score desc,
    f.difficulty asc,
    f.question_id asc
  limit greatest(coalesce(p_limit, 20), 1);
$$;

grant execute on function public.get_recommended_questions_by_skill_v2(uuid, text, text, text, integer) to authenticated;