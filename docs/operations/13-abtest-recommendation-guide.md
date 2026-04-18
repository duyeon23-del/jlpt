# 실험군(AB test)별 추천 성과 집계 및 실험 가이드

## 주요 지표
- ab_group: 실험군(예: control, experiment1 등)
- total_recommendations: 추천 시도 수
- unique_questions: 고유 문제 수(다양성)
- avg_score: 평균 추천 점수
- avg_duration_ms: 평균 추천 쿼리 소요시간
- click_rate: 추천 클릭률(로그에 clicked 필드 필요)

## 실무 적용
- vw_abtest_recommendation_performance 뷰로 실험군별 추천 품질/성능/다양성 비교
- 추천 로직 실험(AB test) 효과 검증, 품질 개선 근거로 활용

## 확장/실험
- ab_group 컬럼이 없으면 user_stats에 추가 필요
- 실험군별 세부 지표(정답률, 중복률 등) 추가 가능
- 대시보드/알림 연동 시 실험 효과 실시간 모니터링 가능

## 참고
- SQL 뷰: supabase/migrations/20260418131000_add_abtest_recommendation_performance_view.sql
- 다양성/중복률: docs/operations/12-recommendation-diversity.md
