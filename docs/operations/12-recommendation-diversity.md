# 추천 다양성/중복률 리포트 및 활용 가이드

## 주요 지표
- question_diversity_rate: 추천 pool 내 고유 문제 비율(%)
- skill_diversity_rate: 추천 pool 내 고유 skill_key 비율(%)
- duplicate_rate: 중복 추천 비율(%)

## 실무 적용
- vw_recommendation_diversity 뷰를 통해 유저별/일자별 추천 다양성, 중복률 모니터링
- 추천 품질 저하(중복/편중) 탐지, 추천 로직 개선 근거로 활용

## 확장/실험
- 실험군별(AB test) diversity 비교, 추천 pool size/조건별 분석 등 확장 가능
- 대시보드/알림 연동 시 품질 이상 신호 자동 감지 가능

## 참고
- SQL 뷰: supabase/migrations/20260418130000_add_recommendation_diversity_view.sql
- 품질/관측 대시보드: docs/operations/10-observability-dashboard.md
