create table if not exists public.user_feedbacks (
  id bigserial primary key,
  user_id uuid,
  feedback_text text not null,
  created_at timestamptz not null default now(),
  status text default 'new',
  extra_info jsonb
);create table if not exists public.user_feedbacks (
  id bigserial primary key,
  user_id uuid,
  feedback_text text not null,
  created_at timestamptz not null default now(),
  status text default 'new',
  extra_info jsonb
);