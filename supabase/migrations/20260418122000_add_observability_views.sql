-- 추천/운영 관측 지표 대시보드용 뷰 및 리포트 SQL
-- 주요 지표: 추천 0건 비율, reset 성공률, skill_map 누락률, RPC 오류율 등

-- 1. 추천 0건 비율
create or replace view public.vw_recommend_zero_rate as
select
  date_trunc('day', recommended_at) as day,
  count(*) filter (where recommendation_score is null or recommendation_score = 0) as zero_count,
  count(*) as total_count,
  round(100.0 * count(*) filter (where recommendation_score is null or recommendation_score = 0) / nullif(count(*),0), 2) as zero_rate
from public.recommendation_logs
where recommended_at >= now() - interval '30 days'
group by 1
order by 1 desc;

-- 2. reset 실행 성공률 (예시: reset_user_learning_data RPC 로그 필요)
-- (reset 로그 테이블이 있다면 success/fail 비율 집계)

-- 3. skill_map 누락률
create or replace view public.vw_skill_map_missing as
select
  major_type,
  sub_type,
  count(*) filter (where skill_key is null or skill_key = '') as missing_count,
  count(*) as total_count,
  round(100.0 * count(*) filter (where skill_key is null or skill_key = '') / nullif(count(*),0), 2) as missing_rate
from public.question_skill_map
group by 1,2
order by missing_rate desc;

-- 4. 추천 RPC 오류율 (예시: 별도 error 로그 테이블 필요)
-- (error_logs 테이블이 있다면 error_type, 발생률 집계)
