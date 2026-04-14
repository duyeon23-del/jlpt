-- Create users table
create table if not exists public.users (
  id uuid primary key references auth.users(id) on delete cascade,
  created_at timestamp with time zone default timezone('utc'::text, now()) not null,
  updated_at timestamp with time zone default timezone('utc'::text, now()) not null
);

-- Create user_targets table
create table if not exists public.user_targets (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references public.users(id) on delete cascade,
  exam_date date not null,
  goal_score integer not null check (goal_score >= 0 and goal_score <= 180),
  current_estimated_score integer default 30,
  created_at timestamp with time zone default timezone('utc'::text, now()) not null,
  updated_at timestamp with time zone default timezone('utc'::text, now()) not null,
  constraint unique_user_target unique (user_id)
);

-- Create user_section_stats table
create table if not exists public.user_section_stats (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references public.users(id) on delete cascade,
  section_type varchar(50) not null,
  section_name varchar(255) not null,
  total_attempts integer default 0,
  correct_count integer default 0,
  accuracy numeric(5, 2) default 0,
  created_at timestamp with time zone default timezone('utc'::text, now()) not null,
  updated_at timestamp with time zone default timezone('utc'::text, now()) not null,
  constraint unique_user_section unique(user_id, section_type, section_name)
);

-- Create study_sessions table  
create table if not exists public.study_sessions (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references public.users(id) on delete cascade,
  session_date date not null,
  duration_minutes integer,
  questions_attempted integer default 0,
  questions_correct integer default 0,
  section_type varchar(50),
  created_at timestamp with time zone default timezone('utc'::text, now()) not null
);

-- Enable RLS
alter table public.users enable row level security;
alter table public.user_targets enable row level security;
alter table public.user_section_stats enable row level security;
alter table public.study_sessions enable row level security;

-- Create RLS policies for users
create policy "Users can view own data"
  on public.users for select
  using (auth.uid() = id);

create policy "Users can insert own data"
  on public.users for insert
  with check (auth.uid() = id);

create policy "Users can update own data"
  on public.users for update
  using (auth.uid() = id);

-- Create RLS policies for user_targets
create policy "Users can view own targets"
  on public.user_targets for select
  using (auth.uid() = user_id);

create policy "Users can insert own targets"
  on public.user_targets for insert
  with check (auth.uid() = user_id);

create policy "Users can update own targets"
  on public.user_targets for update
  using (auth.uid() = user_id);

-- Create RLS policies for user_section_stats
create policy "Users can view own stats"
  on public.user_section_stats for select
  using (auth.uid() = user_id);

create policy "Users can insert own stats"
  on public.user_section_stats for insert
  with check (auth.uid() = user_id);

create policy "Users can update own stats"
  on public.user_section_stats for update
  using (auth.uid() = user_id);

-- Create RLS policies for study_sessions
create policy "Users can view own sessions"
  on public.study_sessions for select
  using (auth.uid() = user_id);

create policy "Users can insert own sessions"
  on public.study_sessions for insert
  with check (auth.uid() = user_id);

-- Create indexes for performance
create index if not exists idx_user_targets_user_id on public.user_targets(user_id);
create index if not exists idx_user_section_stats_user_id on public.user_section_stats(user_id);
create index if not exists idx_study_sessions_user_id on public.study_sessions(user_id);
create index if not exists idx_study_sessions_date on public.study_sessions(session_date);
