-- =============================================================
-- Persist adaptive metadata on source question tables
-- - questions / passage_questions 에 difficulty, recommendation_weight 추가
-- - 기존 데이터는 question_skill_rules 기준으로 백필
-- =============================================================

begin;

alter table public.questions
  add column if not exists difficulty integer not null default 3
    check (difficulty between 1 and 5),
  add column if not exists recommendation_weight numeric(4,2) not null default 1.00;

alter table public.passage_questions
  add column if not exists difficulty integer not null default 3
    check (difficulty between 1 and 5),
  add column if not exists recommendation_weight numeric(4,2) not null default 1.00;

-- questions 백필
update public.questions q
set
  difficulty = r.difficulty,
  recommendation_weight = r.recommendation_weight
from public.question_skill_rules r
where r.source_table = 'questions'
  and r.target_question_type = 'single'
  and r.major_type = q.type
  and r.sub_type = coalesce(q.sub_type, '랜덤');

-- passage_questions 백필
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
