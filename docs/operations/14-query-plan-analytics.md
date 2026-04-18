# 인덱스/쿼리플랜 자동 분석 및 성능 알림 가이드

## 주요 내용
- query_plan_logs: 추천/주요 쿼리 실행시 쿼리플랜(EXPLAIN), 실행시간 기록 테이블
- vw_query_plan_summary: 쿼리별 일자별 평균/최대 실행시간, 최근 쿼리플랜 요약 뷰

## 실무 적용
- 추천/배치 쿼리 실행시 EXPLAIN 결과와 duration_ms를 query_plan_logs에 기록(앱/스크립트에서 자동화)
- vw_query_plan_summary로 성능 저하, 인덱스 미적용, 쿼리플랜 변화 등 탐지
- 대시보드/알림 연동 시 성능 이상 자동 감지 가능

## 확장/실험
- 주요 테이블/인덱스 통계, 쿼리별 경고 임계치 설정 등 고도화 가능
- query_plan_logs는 앱/스크립트에서 직접 insert 필요

## 참고
- SQL 테이블/뷰: supabase/migrations/20260418132000_add_query_plan_logs_and_summary.sql
- 성능/관측 대시보드: docs/operations/11-performance-measurement.md, 10-observability-dashboard.md
