begin;

-- generated from data/n5-batches/n5_reading_search_batch_02.json
-- generated at 2026-04-19T16:46:40.981Z

-- passage set 1
insert into public.passages (
  group_id,
  content,
  level,
  type,
  sub_type
)
values (
  'n5_reading_search_batch_02_set_01',
  'こちらは田中さんの一日（いちにち）のよていです。午前7時におきます。午前8時に朝ごはんを食べます。午後3時にともだちとこうえんへ行きます。午後10時にねます。',
  'N5',
  '독해',
  '정보검색'
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
  'n5_reading_search_batch_02_set_01',
  '독해',
  '정보검색',
  '田中さんは何時におきますか。____',
  1,
  '午前7時',
  '午前8時',
  '午後3時',
  '午後10時',
  1,
  '文の最初に『午前7時におきます』と書いてあります。',
  2,
  0.9
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
  'n5_reading_search_batch_02_set_01',
  '독해',
  '정보검색',
  '田中さんはどこへ行きますか。____',
  2,
  'こうえん',
  'がっこう',
  'いえ',
  'えき',
  1,
  '午後3時に『こうえんへ行きます』とあります。',
  4,
  1.1
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
  'n5_reading_search_batch_02_set_01',
  '독해',
  '정보검색',
  '田中さんは何時に朝ごはんを食べますか。____',
  3,
  '午前8時',
  '午前7時',
  '午後3時',
  '午後10時',
  1,
  '『午前8時に朝ごはんを食べます』とあります。',
  3,
  1.05
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
  'n5_reading_search_batch_02_set_01',
  '독해',
  '정보검색',
  '田中さんは午後10時に何をしますか。____',
  4,
  'ねます',
  'おきます',
  'べんきょうします',
  'ともだちとあそびます',
  1,
  '『午後10時にねます』と書かれています。',
  4,
  1.15
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
  'n5_reading_search_batch_02_set_02',
  'スーパーは毎日午前9時から午後8時までです。日曜日は午前10時に開きます。土曜日と日曜日はやすみのスーパーもあります。',
  'N5',
  '독해',
  '정보검색'
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
  'n5_reading_search_batch_02_set_02',
  '독해',
  '정보검색',
  '平日はスーパーはいつから開いていますか。____',
  1,
  '午前9時',
  '午前10時',
  '午後8時',
  '午後9時',
  1,
  '『毎日午前9時から午後8時まで』とあります。平日は午前9時に開きます。',
  3,
  1
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
  'n5_reading_search_batch_02_set_02',
  '독해',
  '정보검색',
  'スーパーは日曜日に何時に開きますか。____',
  2,
  '午前10時',
  '午前9時',
  '午後8時',
  '午後7時',
  1,
  '『日曜日は午前10時に開きます』と書かれています。',
  4,
  1.05
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
  'n5_reading_search_batch_02_set_02',
  '독해',
  '정보검색',
  'スーパーは午後何時までですか。____',
  3,
  '午後8時',
  '午後9時',
  '午後7時',
  '午後6時',
  1,
  '全ての日に『午後8時まで』とあります。',
  2,
  0.8
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
  'n5_reading_search_batch_02_set_02',
  '독해',
  '정보검색',
  '土曜日と日曜日はどうですか。____',
  4,
  'やすみのスーパーもある',
  'いつもひらいている',
  '午後12時にしめる',
  '朝しかひらかない',
  1,
  '最後の文に『やすみのスーパーもあります』と書いてあります。',
  5,
  1.25
)
on conflict (group_id, blank_number, question) do nothing;

commit;
