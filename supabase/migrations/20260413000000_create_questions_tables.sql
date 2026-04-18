-- Create questions table for single questions (vocabulary, grammar, reading)
create table if not exists public.questions (
  id text primary key default gen_random_uuid()::text,
  type varchar(50) not null,
  sub_type varchar(100) not null,
  level varchar(10) not null,
  question text not null,
  option1 text not null,
  option2 text not null,
  option3 text not null,
  option4 text not null,
  answer varchar(10) not null,
  explanation text,
  difficulty integer not null default 3,
  recommendation_weight numeric(4,2) not null default 1.00,
  created_at timestamp with time zone default timezone('utc'::text, now()) not null,
  unique(level, type, sub_type, question)
);

-- Create passages table for reading comprehension
create table if not exists public.passages (
  id bigserial primary key,
  group_id text not null unique,
  content text not null,
  level varchar(10) not null,
  type varchar(50) not null,
  sub_type varchar(100) not null,
  created_at timestamp with time zone default timezone('utc'::text, now()) not null
);

-- Create passage_questions table for questions within passages
create table if not exists public.passage_questions (
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

-- Create question_skill_map table to link questions to skills
create table if not exists public.question_skill_map (
  id uuid primary key default gen_random_uuid(),
  question_type varchar(50) not null,
  question_id text not null,
  major_type varchar(100) not null,
  sub_type varchar(100) not null,
  skill_key varchar(100) not null,
  difficulty integer not null default 3,
  recommendation_weight numeric(4,2) not null default 1.00,
  is_active boolean not null default true,
  created_at timestamp with time zone default timezone('utc'::text, now()) not null,
  updated_at timestamp with time zone default timezone('utc'::text, now()) not null,
  unique(question_type, question_id, skill_key)
);

-- Create user_question_attempts table
create table if not exists public.user_question_attempts (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references public.users(id) on delete cascade,
  question_type varchar(50) not null,
  question_id text not null,
  major_type varchar(100),
  sub_type varchar(100),
  skill_key varchar(100),
  is_correct boolean not null,
  attempted_at timestamp with time zone default timezone('utc'::text, now()) not null,
  created_at timestamp with time zone default timezone('utc'::text, now()) not null
);

-- Enable RLS on new tables
alter table public.questions enable row level security;
alter table public.passages enable row level security;
alter table public.passage_questions enable row level security;
alter table public.question_skill_map enable row level security;
alter table public.user_question_attempts enable row level security;

-- Drop existing policies to keep this migration re-runnable
drop policy if exists "Questions are readable by all" on public.questions;
drop policy if exists "Passages are readable by all" on public.passages;
drop policy if exists "Passage questions are readable by all" on public.passage_questions;
drop policy if exists "Skill map is readable by all" on public.question_skill_map;
drop policy if exists "Users can view own attempts" on public.user_question_attempts;
drop policy if exists "Users can insert own attempts" on public.user_question_attempts;

-- Create RLS policies for questions (public read)
create policy "Questions are readable by all"
  on public.questions for select
  using (true);

-- Create RLS policies for passages (public read)
create policy "Passages are readable by all"
  on public.passages for select
  using (true);

-- Create RLS policies for passage_questions (public read)
create policy "Passage questions are readable by all"
  on public.passage_questions for select
  using (true);

-- Create RLS policies for question_skill_map (public read)
create policy "Skill map is readable by all"
  on public.question_skill_map for select
  using (true);

-- Create RLS policies for user_question_attempts
create policy "Users can view own attempts"
  on public.user_question_attempts for select
  using (auth.uid() = user_id);

create policy "Users can insert own attempts"
  on public.user_question_attempts for insert
  with check (auth.uid() = user_id);

-- Create indexes for performance
create index if not exists idx_questions_type on public.questions(type, sub_type);
create index if not exists idx_passages_level on public.passages(level);
create index if not exists idx_passage_questions_group_id on public.passage_questions(group_id);
create index if not exists idx_question_skill_map_question on public.question_skill_map(question_type, question_id);
create index if not exists idx_user_question_attempts_user on public.user_question_attempts(user_id, attempted_at);
