# 추천/운영 관측 지표 대시보드 설계 가이드

## 주요 지표
- 추천 0건 비율 (vw_recommend_zero_rate)
- reset 실행 성공률 (reset 로그 필요)
- skill_map 누락률 (vw_skill_map_missing)
- 추천 RPC 오류율 (error 로그 필요)
- 추천 클릭률/정답률 (recommendation_logs 기반)

## 실무 적용
- 각 지표는 뷰/리포트 SQL로 집계, 대시보드(예: Supabase/Metabase/Redash 등)에서 시각화
- 운영/품질 모니터링, 장애 탐지, 품질 튜닝 루프에 활용

## 확장/실험
- 신규 지표 추가(예: 추천 다양성, 중복률, 실험군별 성과 등)
- error_logs, reset_logs 등 별도 테이블 연동 권장

## 참고
- SQL 뷰/리포트는 supabase/migrations/20260418122000_add_observability_views.sql 참고
- 추천 로그/콜드스타트 정책 등은 docs/operations/09-coldstart-policy.md 참고
