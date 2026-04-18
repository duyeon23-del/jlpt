-- 피드백 저장용 테이블
create table if not exists public.user_feedbacks (
  id bigserial primary key,
  user_id uuid,
  feedback_text text not null,
  created_at timestamptz not null default now(),
  status text default 'new', -- new, in_progress, done 등
  extra_info jsonb
);
