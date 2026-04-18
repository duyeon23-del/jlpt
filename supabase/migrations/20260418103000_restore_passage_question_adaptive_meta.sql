-- Restore adaptive metadata on passage_questions after legacy schema replay.

begin;

alter table if exists public.passage_questions
  add column if not exists difficulty integer not null default 3
    check (difficulty between 1 and 5),
  add column if not exists recommendation_weight numeric(4,2) not null default 1.00;

update public.passage_questions pq
set
  difficulty = r.difficulty,
  recommendation_weight = r.recommendation_weight
from public.question_skill_rules r
where r.source_table = 'passage_questions'
  and r.target_question_type in ('passage', 'grammar_context')
  and r.major_type = pq.type
  and r.sub_type = coalesce(pq.sub_type, '랜덤');

commit;