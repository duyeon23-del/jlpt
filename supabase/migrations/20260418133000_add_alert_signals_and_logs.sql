-- 품질/성능/이상 신호 자동 감지용 뷰 및 트리거 예시
-- 1. 최근 1일간 주요 품질/성능 이상 신호 집계 뷰
create or replace view public.vw_alert_signals as
select
  now()::date as alert_date,
  (select zero_rate from public.vw_recommend_zero_rate order by day desc limit 1) as recommend_zero_rate,
  (select max(duplicate_rate) from public.vw_recommendation_diversity where day = now()::date) as max_duplicate_rate,
  (select max(avg_duration_ms) from public.vw_recommendation_performance where day = now()::date) as max_recommend_duration_ms,
  (select max(avg_duration_ms) from public.vw_query_plan_summary where day = now()::date) as max_query_duration_ms
;

-- 2. (옵션) 알림 트리거/함수: 일정 임계치 초과시 alert_logs에 기록 (앱/서버 연동)
create table if not exists public.alert_logs (
  id bigserial primary key,
  alert_type text not null,
  alert_value numeric,
  alert_date date not null default now(),
  created_at timestamptz not null default now(),
  extra_info jsonb
);
