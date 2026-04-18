-- Backfill passage_questions for reading_short_batch_05
insert into public.question_skill_map (
  question_type,
  question_id,
  major_type,
  sub_type,
  skill_key,
  difficulty,
  recommendation_weight
)
select
  'passage' as question_type,
  pq.id::text as question_id,
  '독해' as major_type,
  pq.sub_type,
  case
    when pq.sub_type = '단문독해' then 'reading_short'
    when pq.sub_type = '중문독해' then 'reading_medium'
    when pq.sub_type = '정보검색' then 'reading_info_search'
    else 'reading_random'
  end as skill_key,
  coalesce(pq.difficulty, 3) as difficulty,
  coalesce(pq.recommendation_weight, 1.0) as recommendation_weight
from public.passage_questions pq
join public.passages p on p.group_id = pq.group_id
where p.group_id like 'n5_reading_%_batch_05%'
on conflict (question_type, question_id, skill_key) do nothing;

-- Verify counts
select 
  'passage' as question_type,
  count(*) as total_questions,
  count(*) filter (where skill_key = 'reading_short') as reading_short,
  count(*) filter (where skill_key = 'reading_medium') as reading_medium,
  count(*) filter (where skill_key = 'reading_info_search') as reading_info_search
from public.question_skill_map
where question_type = 'passage';
