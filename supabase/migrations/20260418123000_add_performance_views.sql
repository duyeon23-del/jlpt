-- 추천/배치 성능 측정 리포트 예시
-- 1. 추천 쿼리 평균/최대 소요시간 (recommendation_logs에 duration_ms 컬럼이 있다고 가정)
create or replace view public.vw_recommendation_performance as
select
  date_trunc('day', recommended_at) as day,
  avg(duration_ms) as avg_duration_ms,
  max(duration_ms) as max_duration_ms,
  count(*) as total_recommendations
from public.recommendation_logs
where recommended_at >= now() - interval '30 days'
group by 1
order by 1 desc;

-- 2. 배치 처리량/성공률 (예시: 별도 batch_logs 테이블 필요)
-- (batch_logs 테이블이 있다면 batch_type, 처리건수, 성공/실패율 집계)
