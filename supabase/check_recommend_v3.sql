select difficulty, count(*) as n
from public.question_skill_map
group by difficulty
order by difficulty;

select major_type, sub_type, difficulty, recommendation_weight
from public.question_skill_rules
order by major_type, sub_type;
