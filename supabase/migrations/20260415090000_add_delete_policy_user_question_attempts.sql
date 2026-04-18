-- Allow users to delete only their own attempt rows.
-- This is required for dashboard reset action in the app.

alter table public.user_question_attempts enable row level security;

drop policy if exists "Users can delete own attempts" on public.user_question_attempts;

create policy "Users can delete own attempts"
  on public.user_question_attempts
  for delete
  using (auth.uid() = user_id);
