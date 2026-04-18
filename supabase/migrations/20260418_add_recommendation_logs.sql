-- 추천 품질 튜닝 및 피드백 루프를 위한 추천 로그 테이블 설계
-- 추천 결과 노출, 클릭, 정답률, 추천 점수 등 품질 분석용 로그 저장

create table if not exists public.recommendation_logs (
  id bigserial primary key,
  user_id uuid not null references public.users(id),
  question_type text not null,
  question_id text not null,
  skill_key text,
  major_type text,
  sub_type text,
  difficulty integer,
  recommendation_weight numeric,
  recommendation_score numeric,
  recommended_at timestamptz not null default now(),
  clicked_at timestamptz,
  answered_at timestamptz,
  is_correct boolean,
  context text, -- 예: 추천 호출 경로, 실험군 등
  extra jsonb -- 기타 실험/분석용
);

create index if not exists idx_recommendation_logs_user on public.recommendation_logs(user_id, recommended_at desc);
create index if not exists idx_recommendation_logs_question on public.recommendation_logs(question_id, recommended_at desc);
create index if not exists idx_recommendation_logs_skill on public.recommendation_logs(skill_key, recommended_at desc);
