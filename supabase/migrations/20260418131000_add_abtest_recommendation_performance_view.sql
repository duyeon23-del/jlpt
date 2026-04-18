-- 실험군(AB test)별 추천 성과 집계 뷰 예시
-- user_stats 테이블에 ab_group 컬럼이 있다고 가정
create or replace view public.vw_abtest_recommendation_performance as
select
  us.ab_group,
  date_trunc('day', rl.recommended_at) as day,
  count(*) as total_recommendations,
  count(distinct rl.question_id) as unique_questions,
  avg(rl.recommendation_score) as avg_score,
  avg(rl.duration_ms) as avg_duration_ms,
  sum(case when rl.clicked then 1 else 0 end) as total_clicks,
  round(100.0 * sum(case when rl.clicked then 1 else 0 end) / nullif(count(*),0), 2) as click_rate
from public.recommendation_logs rl
join public.user_stats us on rl.user_id = us.user_id
where rl.recommended_at >= now() - interval '30 days'
group by 1,2
order by 2 desc, 1;
