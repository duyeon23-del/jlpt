-- JLPT app query performance indexes
-- Run in Supabase SQL editor.

-- questions: filtered by type and often sub_type
create index if not exists idx_questions_type_sub_type
  on public.questions (type, sub_type);

-- passages: filtered by type and sometimes sub_type, then joined by group_id
create index if not exists idx_passages_type_sub_type_group_id
  on public.passages (type, sub_type, group_id);

-- passages: passage mode often filters only by type
create index if not exists idx_passages_type
  on public.passages (type);

-- passage_questions: filtered by type/sub_type + group_id and sorted by blank_number
create index if not exists idx_pq_type_sub_type_group_blank
  on public.passage_questions (type, sub_type, group_id, blank_number);

-- passage_questions: passage mode path can use type + group_id + blank_number
create index if not exists idx_pq_type_group_blank
  on public.passage_questions (type, group_id, blank_number);
