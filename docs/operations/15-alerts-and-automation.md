# 대시보드/운영 알림 고도화 및 자동 감지 가이드

## 주요 내용
- vw_alert_signals: 추천 0건 비율, 중복률, 성능(실행시간) 등 주요 품질/성능 이상 신호 집계 뷰
- alert_logs: 임계치 초과 등 이상 신호 발생시 기록하는 로그 테이블(앱/서버/ETL 연동)

## 실무 적용
- 대시보드에서 vw_alert_signals를 주기적으로 모니터링, 임계치 초과시 alert_logs에 기록
- alert_logs를 Slack/Discord/이메일 등 알림 시스템과 연동하여 운영자에게 자동 통보
- 임계치(예: 추천 0건 비율 10%↑, 중복률 30%↑, 평균 실행시간 2초↑ 등)는 운영 정책에 맞게 설정

## 확장/실험
- alert_logs에 alert_type, alert_value, extra_info 등 다양한 신호 기록 가능
- 실험군별, 유형별, 시간대별 등 세분화된 이상 신호 감지 가능
- 향후 anomaly detection, ML 기반 품질 감지로 확장 가능

## 참고
- SQL 뷰/테이블: supabase/migrations/20260418133000_add_alert_signals_and_logs.sql
- 품질/관측/성능 대시보드: docs/operations/10-observability-dashboard.md, 11-performance-measurement.md
