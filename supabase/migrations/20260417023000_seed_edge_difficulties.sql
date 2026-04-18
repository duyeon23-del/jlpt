-- =============================================================
-- Seed small amount of edge difficulties (1, 5)
-- 목적: 적응형 엔진이 극단 난이도 샘플도 학습/추천할 수 있게 최소 분포 확보
-- =============================================================

begin;

-- questions: diff=2 상위 8%를 1로, diff=4 상위 8%를 5로
with q2 as (
  select id,
         row_number() over (order by id) as rn,
         count(*) over () as total
  from public.questions
  where difficulty = 2
)
update public.questions q
set difficulty = 1
from q2
where q.id = q2.id
  and q2.rn <= greatest(1, floor(q2.total * 0.08)::int);

with q4 as (
  select id,
         row_number() over (order by id) as rn,
         count(*) over () as total
  from public.questions
  where difficulty = 4
)
update public.questions q
set difficulty = 5
from q4
where q.id = q4.id
  and q4.rn <= greatest(1, floor(q4.total * 0.08)::int);

-- passage_questions 동일 비율 반영
with p2 as (
  select id,
         row_number() over (order by id::text) as rn,
         count(*) over () as total
  from public.passage_questions
  where difficulty = 2
)
update public.passage_questions pq
set difficulty = 1
from p2
where pq.id = p2.id
  and p2.rn <= greatest(1, floor(p2.total * 0.08)::int);

with p4 as (
  select id,
         row_number() over (order by id::text) as rn,
         count(*) over () as total
  from public.passage_questions
  where difficulty = 4
)
update public.passage_questions pq
set difficulty = 5
from p4
where pq.id = p4.id
  and p4.rn <= greatest(1, floor(p4.total * 0.08)::int);

-- source 메타를 question_skill_map으로 동기화
update public.question_skill_map m
set difficulty = q.difficulty,
    recommendation_weight = coalesce(q.recommendation_weight, m.recommendation_weight),
    updated_at = now()
from public.questions q
where m.question_type = 'single'
  and m.question_id = q.id::text;

update public.question_skill_map m
set difficulty = pq.difficulty,
    recommendation_weight = coalesce(pq.recommendation_weight, m.recommendation_weight),
    updated_at = now()
from public.passage_questions pq
where m.question_type in ('passage', 'grammar_context')
  and m.question_id = pq.id::text;

commit;
