-- =============================================================
-- Diversify general recommendation v3 ordering
-- 목적:
-- 1) 전역 추천에서 난이도 2만 상단을 채우지 않도록 완화
-- 2) 난이도 2와 3을 교차 노출해 학습 흐름을 더 자연스럽게 유지
-- =============================================================

create or replace function public.get_recommended_questions_by_skill_v3(
  p_user_id     uuid    default null,
  p_major_type  text    default null,
  p_sub_type    text    default null,
  p_skill_key   text    default null,
  p_limit       integer default 20
)
returns table (
  question_type         text,
  question_id           text,
  skill_key             text,
  skill_name            text,
  major_type            text,
  sub_type              text,
  difficulty            integer,
  recommendation_weight numeric,
  recommendation_score  numeric
)
language sql
security definer
set search_path = public
as $$
  with uid_cte as (
    select coalesce(p_user_id, auth.uid()) as uid
  ),
  weak as (
    select
      us.major_type,
      us.sub_type,
      coalesce(us.skill_key, us.major_type || '::' || us.sub_type) as skill_key_norm,
      us.weakness_score
    from public.user_stats us
    join uid_cte on us.user_id = uid_cte.uid
    where us.weakness_score > 0
  ),
  recent_attempts as (
    select
      a.major_type,
      a.sub_type,
      count(*)::int as recent_attempts,
      count(*) filter (where not a.is_correct)::int as recent_wrong
    from public.user_question_attempts a
    join uid_cte on a.user_id = uid_cte.uid
    where a.attempted_at >= now() - interval '7 days'
    group by a.major_type, a.sub_type
  ),
  attempted_recent as (
    select distinct a.question_type, a.question_id
    from public.user_question_attempts a
    join uid_cte on a.user_id = uid_cte.uid
    where a.attempted_at >= now() - interval '30 days'
  ),
  candidates as (
    select
      qsm.question_type,
      qsm.question_id,
      qsm.skill_key,
      qsm.major_type,
      qsm.sub_type,
      coalesce(qsm.difficulty, 3)::int         as difficulty,
      coalesce(qsm.recommendation_weight, 1.0) as recommendation_weight,
      case
        when p_skill_key is not null and qsm.skill_key = p_skill_key then 0
        when p_major_type is not null
          and qsm.major_type = p_major_type
          and (p_sub_type is null or p_sub_type = '랜덤' or qsm.sub_type = p_sub_type) then 1
        when p_major_type is not null and qsm.major_type = p_major_type then 2
        else 3
      end as match_rank,
      coalesce(
        w.weakness_score,
        case
          when p_skill_key is not null and qsm.skill_key = p_skill_key then 0.5
          when p_major_type is not null
            and qsm.major_type = p_major_type
            and (p_sub_type is null or p_sub_type = '랜덤' or qsm.sub_type = p_sub_type) then 0.4
          when p_major_type is not null and qsm.major_type = p_major_type then 0.3
          else 0.1
        end
      ) as base_weakness,
      coalesce(
        case
          when ra.recent_attempts > 0 then ra.recent_wrong::numeric / ra.recent_attempts
          else 0
        end,
        0
      ) as recent_wrong_ratio
    from public.question_skill_map qsm
    left join weak w
      on w.major_type = qsm.major_type
     and w.sub_type = qsm.sub_type
    left join recent_attempts ra
      on ra.major_type = qsm.major_type
     and ra.sub_type = qsm.sub_type
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
  ),
  scored as (
    select
      f.*,
      least(f.base_weakness + (f.recent_wrong_ratio * 0.35), 1.5) as adaptive_weakness,
      case
        when least(f.base_weakness + (f.recent_wrong_ratio * 0.35), 1.5) >= 1.08 then 2
        when least(f.base_weakness + (f.recent_wrong_ratio * 0.35), 1.5) >= 0.55 then 3
        else 4
      end as target_difficulty,
      abs(
        f.difficulty -
        case
          when least(f.base_weakness + (f.recent_wrong_ratio * 0.35), 1.5) >= 1.08 then 2
          when least(f.base_weakness + (f.recent_wrong_ratio * 0.35), 1.5) >= 0.55 then 3
          else 4
        end
      ) as difficulty_gap
    from filtered f
  ),
  ranked as (
    select
      s.question_type,
      s.question_id,
      s.skill_key,
      s.major_type,
      s.sub_type,
      s.difficulty,
      s.recommendation_weight,
      s.match_rank,
      s.difficulty_gap,
      round(
        (
          s.adaptive_weakness
          * s.recommendation_weight
          * case
              when s.difficulty_gap = 0 then 1.18
              when s.difficulty_gap = 1 then 1.00
              when s.adaptive_weakness >= 1.08 and s.difficulty > s.target_difficulty then 0.72
              when s.difficulty_gap = 2 then 0.78
              else 0.62
            end
        )::numeric,
        4
      ) as recommendation_score,
      row_number() over (
        partition by s.question_type, s.question_id
        order by
          s.match_rank asc,
          s.difficulty_gap asc,
          round(
            (
              s.adaptive_weakness
              * s.recommendation_weight
              * case
                  when s.difficulty_gap = 0 then 1.18
                  when s.difficulty_gap = 1 then 1.00
                  when s.adaptive_weakness >= 1.08 and s.difficulty > s.target_difficulty then 0.72
                  when s.difficulty_gap = 2 then 0.78
                  else 0.62
                end
            )::numeric,
            4
          ) desc,
          s.skill_key asc
      ) as pick_rank,
      row_number() over (
        partition by s.difficulty
        order by
          s.match_rank asc,
          s.difficulty_gap asc,
          round(
            (
              s.adaptive_weakness
              * s.recommendation_weight
              * case
                  when s.difficulty_gap = 0 then 1.18
                  when s.difficulty_gap = 1 then 1.00
                  when s.adaptive_weakness >= 1.08 and s.difficulty > s.target_difficulty then 0.72
                  when s.difficulty_gap = 2 then 0.78
                  else 0.62
                end
            )::numeric,
            4
          ) desc,
          s.question_id asc
      ) as difficulty_slot
    from scored s
  )
  select
    r.question_type,
    r.question_id,
    r.skill_key,
    coalesce(r.skill_key, r.major_type || ' · ' || r.sub_type) as skill_name,
    r.major_type,
    r.sub_type,
    r.difficulty,
    r.recommendation_weight,
    r.recommendation_score
  from ranked r
  where r.pick_rank = 1
  order by
    case
      when p_major_type is null and p_sub_type is null and p_skill_key is null and r.difficulty in (2, 3) then 0
      when p_major_type is null and p_sub_type is null and p_skill_key is null then 1
      else 0
    end,
    case
      when p_major_type is null and p_sub_type is null and p_skill_key is null and r.difficulty in (2, 3) then r.difficulty_slot
      else 0
    end,
    case
      when p_major_type is null and p_sub_type is null and p_skill_key is null and r.difficulty = 2 then 0
      when p_major_type is null and p_sub_type is null and p_skill_key is null and r.difficulty = 3 then 1
      when p_major_type is null and p_sub_type is null and p_skill_key is null and r.difficulty = 4 then 2
      when p_major_type is null and p_sub_type is null and p_skill_key is null then 3
      else 0
    end,
    r.match_rank asc,
    r.difficulty_gap asc,
    r.recommendation_score desc,
    r.question_id asc
  limit greatest(coalesce(p_limit, 20), 1);
$$;

grant execute on function public.get_recommended_questions_by_skill_v3(uuid, text, text, text, integer)
  to authenticated, anon;