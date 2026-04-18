-- 신규 유저 콜드스타트 정책 분리 및 실험군 분기 지원
-- 신규 유저(풀이 이력 없음)에게 별도 정책 적용을 위한 recommendation_policy 필드 추가

alter table if exists public.user_stats
  add column if not exists recommendation_policy text default null;

-- 추천 함수에서 신규 유저 분기 시, 해당 필드 활용 가능
-- (예: 실험군/정책명 기록 및 추천 로그에 context로 남김)

-- 기존 user_stats row에는 null로 남음. 신규 집계/실험 시 정책명 기록 권장
