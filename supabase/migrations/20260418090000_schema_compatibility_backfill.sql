-- Compatibility patch for environments that were migrated before base schema fixes.
-- Safe and idempotent.

begin;

-- 1) Ensure questions.id can be auto-generated when omitted by imports.
do $$
declare
  v_data_type text;
  v_is_identity text;
begin
  select c.data_type, c.is_identity
  into v_data_type, v_is_identity
  from information_schema.columns c
  where c.table_schema = 'public'
    and c.table_name = 'questions'
    and c.column_name = 'id';

  if found and coalesce(v_is_identity, 'NO') = 'NO' then
    if v_data_type in ('text', 'character varying') then
      execute 'alter table public.questions alter column id set default gen_random_uuid()::text';
    elsif v_data_type = 'uuid' then
      execute 'alter table public.questions alter column id set default gen_random_uuid()';
    end if;
  end if;
end $$;

-- 2) Ensure adaptive metadata columns exist on question_skill_map.
alter table if exists public.question_skill_map
  add column if not exists difficulty integer not null default 3,
  add column if not exists recommendation_weight numeric(4,2) not null default 1.00,
  add column if not exists is_active boolean not null default true,
  add column if not exists updated_at timestamptz not null default now();

-- 3) Ensure attempted_at exists and is populated for attempt history.
alter table if exists public.user_question_attempts
  add column if not exists attempted_at timestamptz default timezone('utc'::text, now()) not null;

-- Backfill attempted_at from legacy attempt_date only when attempt_date exists.
do $$
begin
  if exists (
    select 1
    from information_schema.columns
    where table_schema = 'public'
      and table_name = 'user_question_attempts'
      and column_name = 'attempt_date'
  ) then
    execute $sql$
      update public.user_question_attempts
      set attempted_at = coalesce(attempted_at, attempt_date)
    $sql$;
  end if;
end $$;

-- 4) Keep query performance consistent with app/rpc usage.
drop index if exists public.idx_user_question_attempts_user;

create index if not exists idx_user_question_attempts_user
  on public.user_question_attempts(user_id, attempted_at);

commit;
