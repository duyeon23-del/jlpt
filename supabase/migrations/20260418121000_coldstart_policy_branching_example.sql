-- 신규 유저 콜드스타트 정책 실험군 분기 예시
-- 추천 함수에서 user_stats.recommendation_policy 값에 따라 분기 처리

-- 예시: get_recommended_questions_by_skill_v3 내 정책 분기
-- (실제 함수 내 적용은 별도 배포 필요)

--
-- if user_stats.recommendation_policy is null then
--   -- 기본 콜드스타트 정책 적용
-- else
--   -- 실험군/정책명에 따라 분기 추천
-- end if;
--

-- 추천 로그(recommendation_logs)에 policy/context 기록 권장
-- 신규 유저 cohort 분석 및 실험군 효과 측정에 활용
