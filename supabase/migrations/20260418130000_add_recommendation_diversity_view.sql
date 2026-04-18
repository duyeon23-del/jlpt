-- 추천 다양성 및 중복률 리포트 뷰
-- 1. 최근 30일간 유저별 추천 pool 내 중복률, 다양성(고유 skill_key/문제수)
create or replace view public.vw_recommendation_diversity as
select
  user_id,
  date_trunc('day', recommended_at) as day,
  count(*) as total_recommendations,
  count(distinct question_id) as unique_questions,
  count(distinct skill_key) as unique_skills,
  round(100.0 * (count(distinct question_id)::float / nullif(count(*),0)), 2) as question_diversity_rate,
  round(100.0 * (count(distinct skill_key)::float / nullif(count(*),0)), 2) as skill_diversity_rate,
  (count(*) - count(distinct question_id)) as duplicate_count,
  round(100.0 * (count(*) - count(distinct question_id)) / nullif(count(*),0), 2) as duplicate_rate
from public.recommendation_logs
where recommended_at >= now() - interval '30 days'
group by 1,2
order by 2 desc, 1;
