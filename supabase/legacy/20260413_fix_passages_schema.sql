-- Legacy manual schema fix kept for reference only.
-- Do not place this file under supabase/migrations because the short version prefix
-- causes Supabase CLI migration history mismatches.

-- Drop and recreate passages table with correct schema
drop table if exists public.passages cascade;
drop table if exists public.passage_questions cascade;

create table public.passages (
  group_id text primary key,
  content text not null,
  level varchar(10) not null,
  type varchar(50) not null,
  sub_type varchar(100) not null,
  created_at timestamp with time zone default timezone('utc'::text, now()) not null
);

comment on table public.passages is 'Readings passages for N5 questions';
comment on column public.passages.group_id is 'Unique identifier like n5_grammar_context_batch_01_set_01';

create table public.passage_questions (
  id uuid primary key default gen_random_uuid(),
  group_id text not null references public.passages(group_id) on delete cascade,
  type varchar(50) not null,
  sub_type varchar(100) not null,
  question text not null,
  blank_number integer not null,
  option1 text not null,
  option2 text not null,
  option3 text not null,
  option4 text not null,
  answer varchar(10) not null,
  explanation text,
  difficulty integer not null default 3,
  recommendation_weight numeric(4,2) not null default 1.00,
  created_at timestamp with time zone default timezone('utc'::text, now()) not null,
  unique(group_id, blank_number, question)
);

comment on table public.passage_questions is 'Individual questions within passages';

alter table public.passages enable row level security;
alter table public.passage_questions enable row level security;

drop policy if exists "Passages are readable by all" on public.passages;
drop policy if exists "Passage questions are readable by all" on public.passage_questions;

create policy "Passages are readable by all"
  on public.passages for select
  using (true);

create policy "Passage questions are readable by all"
  on public.passage_questions for select
  using (true);

create index if not exists idx_passages_level on public.passages(level);
create index if not exists idx_passage_questions_group_id on public.passage_questions(group_id);