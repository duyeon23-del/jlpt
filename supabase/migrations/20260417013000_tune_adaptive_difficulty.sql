-- =============================================================
-- Adaptive difficulty tuning
-- 1) question_skill_rules 난이도/가중치 분산
-- 2) question_skill_map 백필 업데이트
-- 3) 추천 RPC(v3)에 난이도 적합도 반영
-- =============================================================

begin;

-- 1) 난이도/가중치 분산 (전부 3/1.00 고정 상태 해소)
update public.question_skill_rules
set
  difficulty = case
    when major_type = '문자·어휘' and sub_type = '한자 읽기' then 2
    when major_type = '문자·어휘' and sub_type = '표기' then 2
    when major_type = '문자·어휘' and sub_type = '문맥 규정' then 3
    when major_type = '문법' and sub_type = '판단' then 3
    when major_type = '문법' and sub_type = '배열' then 4
    when major_type = '문법' and sub_type = '문맥' then 4
    when major_type = '독해' and sub_type = '단문독해' then 2
    when major_type = '독해' and sub_type = '중문독해' then 3
    when major_type = '독해' and sub_type = '정보검색' then 4
    else difficulty
  end,
  recommendation_weight = case
    when major_type = '문법' and sub_type = '배열' then 1.15
    when major_type = '문법' and sub_type = '문맥' then 1.12
    when major_type = '독해' and sub_type = '정보검색' then 1.10
    when major_type = '문자·어휘' and sub_type in ('한자 읽기', '표기') then 0.95
    else 1.00
  end,
  updated_at = now();

-- 2) 기존 skill_map에도 즉시 반영
update public.question_skill_map m
set
  difficulty = r.difficulty,
  recommendation_weight = r.recommendation_weight,
  updated_at = now()
from public.question_skill_rules r
where m.question_type = r.target_question_type
  and m.major_type = r.major_type
  and m.sub_type = r.sub_type;

commit;

-- 3) 추천 RPC 재정의: 취약도에 따라 목표 난이도 자동 조절
--    weakness가 높을수록(취약) 쉬운 난이도(2~3) 우선
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
      ) as base_weakness
    from public.question_skill_map qsm
    left join weak w
      on w.major_type = qsm.major_type
     and w.sub_type = qsm.sub_type
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
      case
        when f.base_weakness >= 0.70 then 2
        when f.base_weakness >= 0.45 then 3
        else 4
      end as target_difficulty
    from filtered f
  )
  select
    s.question_type,
    s.question_id,
    s.skill_key,
    coalesce(s.skill_key, s.major_type || ' · ' || s.sub_type) as skill_name,
    s.major_type,
    s.sub_type,
    s.difficulty,
    s.recommendation_weight,
    round(
      (
        s.base_weakness
        * s.recommendation_weight
        * greatest(0.70, 1.10 - (abs(s.difficulty - s.target_difficulty) * 0.15))
      )::numeric,
      4
    ) as recommendation_score
  from scored s
  order by
    s.match_rank asc,
    recommendation_score desc,
    abs(s.difficulty - s.target_difficulty) asc,
    s.question_id asc
  limit greatest(coalesce(p_limit, 20), 1);
$$;

grant execute on function public.get_recommended_questions_by_skill_v3(uuid, text, text, text, integer)
  to authenticated, anon;
