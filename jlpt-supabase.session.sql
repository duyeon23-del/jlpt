-- 5) 검증(누락 있으면 행이 나옴)
with expected as (
  select 'single'::text as question_type, q.id::text as question_id
  from questions q
  join question_skill_rules r on r.major_type = q.type and r.sub_type = q.sub_type
  union all
  select 'passage'::text, pq.id::text
  from passage_questions pq
  join question_skill_rules r on r.major_type = pq.type and r.sub_type = pq.sub_type
)
select e.question_type, count(*) as missing_count
from expected e
left join question_skill_map m
  on m.question_type = e.question_type
 and m.question_id::text = e.question_id
where m.question_id is null
group by e.question_type;