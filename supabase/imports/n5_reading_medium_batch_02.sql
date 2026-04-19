begin;

-- generated from data/n5-batches/n5_reading_medium_batch_02.json
-- generated at 2026-04-19T16:46:56.495Z

-- passage set 1
insert into public.passages (
  group_id,
  content,
  level,
  type,
  sub_type
)
values (
  'n5_reading_medium_batch_02_set_01',
  '私は毎日朝ごはんを食べます。朝ごはんの後、学校へ行きます。学校では友だちと話します。そして、昼ごはんを一緒に食べます。',
  'N5',
  '독해',
  '중문독해'
)
on conflict (group_id) do nothing;

-- passage question 1.1
insert into public.passage_questions (
  group_id,
  type,
  sub_type,
  question,
  blank_number,
  option1,
  option2,
  option3,
  option4,
  answer,
  explanation,
  difficulty,
  recommendation_weight
)
values (
  'n5_reading_medium_batch_02_set_01',
  '독해',
  '중문독해',
  '私は毎日朝ごはんを ____ 。',
  1,
  '食べます',
  '行きます',
  '飲みます',
  '話します',
  1,
  '지문에서 ''매일 아침밥을 먹는다''라고 했으므로 ''食べます''가 정답입니다.',
  2,
  1
)
on conflict (group_id, blank_number, question) do nothing;

-- passage question 1.2
insert into public.passage_questions (
  group_id,
  type,
  sub_type,
  question,
  blank_number,
  option1,
  option2,
  option3,
  option4,
  answer,
  explanation,
  difficulty,
  recommendation_weight
)
values (
  'n5_reading_medium_batch_02_set_01',
  '독해',
  '중문독해',
  '朝ごはんの後、私は ____ へ行きます。',
  2,
  '学校',
  '家',
  '公園',
  '店',
  1,
  '''学校へ行きます''라고 적혀 있으니 ''학교''가 맞는 답입니다.',
  3,
  1.05
)
on conflict (group_id, blank_number, question) do nothing;

-- passage question 1.3
insert into public.passage_questions (
  group_id,
  type,
  sub_type,
  question,
  blank_number,
  option1,
  option2,
  option3,
  option4,
  answer,
  explanation,
  difficulty,
  recommendation_weight
)
values (
  'n5_reading_medium_batch_02_set_01',
  '독해',
  '중문독해',
  '学校では友だちと何をしますか。____ と話します。',
  3,
  '友だち',
  '先生',
  '母',
  '兄',
  1,
  '지문에서 ''학교에서는 친구랑 이야기해요''라고 했으므로 ''友だち''가 맞습니다.',
  3,
  0.9
)
on conflict (group_id, blank_number, question) do nothing;

-- passage question 1.4
insert into public.passage_questions (
  group_id,
  type,
  sub_type,
  question,
  blank_number,
  option1,
  option2,
  option3,
  option4,
  answer,
  explanation,
  difficulty,
  recommendation_weight
)
values (
  'n5_reading_medium_batch_02_set_01',
  '독해',
  '중문독해',
  '昼ごはんを ____ 食べます。',
  4,
  '一緒に',
  '早く',
  'ひとりで',
  '外で',
  1,
  '''一緒に''는 ''함께''라는 뜻으로, 친구와 점심을 같이 먹는다는 의미에 맞습니다.',
  4,
  1.2
)
on conflict (group_id, blank_number, question) do nothing;

-- passage set 2
insert into public.passages (
  group_id,
  content,
  level,
  type,
  sub_type
)
values (
  'n5_reading_medium_batch_02_set_02',
  '昨日、私は図書館へ行きました。図書館で新しい本を読みました。その本はとてもおもしろかったです。帰りに友だちに会いました。',
  'N5',
  '독해',
  '중문독해'
)
on conflict (group_id) do nothing;

-- passage question 2.1
insert into public.passage_questions (
  group_id,
  type,
  sub_type,
  question,
  blank_number,
  option1,
  option2,
  option3,
  option4,
  answer,
  explanation,
  difficulty,
  recommendation_weight
)
values (
  'n5_reading_medium_batch_02_set_02',
  '독해',
  '중문독해',
  '昨日、私は ____ へ行きました。',
  1,
  '図書館',
  '駅',
  '学校',
  '店',
  1,
  '지문에서 어제 ''図書館에 갔다''고 했으므로 ''図書館''이 정답입니다.',
  1,
  0.85
)
on conflict (group_id, blank_number, question) do nothing;

-- passage question 2.2
insert into public.passage_questions (
  group_id,
  type,
  sub_type,
  question,
  blank_number,
  option1,
  option2,
  option3,
  option4,
  answer,
  explanation,
  difficulty,
  recommendation_weight
)
values (
  'n5_reading_medium_batch_02_set_02',
  '독해',
  '중문독해',
  '図書館で新しい ____ を読みました。',
  2,
  '本',
  '雑誌',
  '新聞',
  '手紙',
  1,
  '새로운 것을 읽었다고 했으니 ''本(책)''이 문맥상 정답입니다.',
  4,
  1.25
)
on conflict (group_id, blank_number, question) do nothing;

-- passage question 2.3
insert into public.passage_questions (
  group_id,
  type,
  sub_type,
  question,
  blank_number,
  option1,
  option2,
  option3,
  option4,
  answer,
  explanation,
  difficulty,
  recommendation_weight
)
values (
  'n5_reading_medium_batch_02_set_02',
  '독해',
  '중문독해',
  'その本はとても ____ かったです。',
  3,
  'おもしろ',
  'つまらな',
  'あたらし',
  'ふる',
  1,
  '''とても'' 뒤에는 감정 형용사가 와야 하고, ''おもしろかったです''가 적절합니다.',
  3,
  1.05
)
on conflict (group_id, blank_number, question) do nothing;

-- passage question 2.4
insert into public.passage_questions (
  group_id,
  type,
  sub_type,
  question,
  blank_number,
  option1,
  option2,
  option3,
  option4,
  answer,
  explanation,
  difficulty,
  recommendation_weight
)
values (
  'n5_reading_medium_batch_02_set_02',
  '독해',
  '중문독해',
  '帰りに ____ に会いました。',
  4,
  '友だち',
  '先生',
  '家族',
  '兄',
  1,
  '지문에 ''친구를 만났다''라고 하므로 ''友だち''가 맞아요.',
  4,
  1.1
)
on conflict (group_id, blank_number, question) do nothing;

commit;
