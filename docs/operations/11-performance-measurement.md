# 추천/배치 성능 점검 및 측정 가이드

## 주요 성능 지표
- 추천 쿼리 평균/최대 소요시간 (vw_recommendation_performance)
- 배치 처리량/성공률 (batch_logs 필요)
- 추천 RPC 응답시간/오류율 (error_logs 필요)

## 실무 적용
- 각 지표는 SQL 뷰/리포트로 집계, 대시보드에서 시각화
- 성능 저하/장애 탐지, 튜닝/최적화 근거로 활용

## 확장/실험
- duration_ms, error_logs, batch_logs 등 로그 테이블 확장 권장
- 쿼리 플랜/인덱스 분석, 실시간 알림 등 고도화 가능

## 참고
- SQL 뷰/리포트는 supabase/migrations/20260418123000_add_performance_views.sql 참고
- 관측/품질 대시보드는 docs/operations/10-observability-dashboard.md 참고
