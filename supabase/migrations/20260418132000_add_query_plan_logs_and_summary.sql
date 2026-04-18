-- 인덱스/쿼리플랜 자동 분석 및 성능 알림용 리포트 예시
-- 1. 최근 30일간 주요 추천 쿼리의 쿼리플랜/실행시간 기록 테이블(샘플)
create table if not exists public.query_plan_logs (
  id bigserial primary key,
  query_name text not null,
  executed_at timestamptz not null default now(),
  duration_ms integer,
  plan_json jsonb,
  user_id uuid,
  extra_info jsonb
);

-- 2. 최근 추천 쿼리 실행시간/플랜 요약 뷰
create or replace view public.vw_query_plan_summary as
select
  query_name,
  date_trunc('day', executed_at) as day,
  avg(duration_ms) as avg_duration_ms,
  max(duration_ms) as max_duration_ms,
  count(*) as executions,
  jsonb_agg(plan_json order by executed_at desc) filter (where plan_json is not null) as recent_plans
from public.query_plan_logs
where executed_at >= now() - interval '30 days'
group by 1,2
order by 2 desc, 1;
