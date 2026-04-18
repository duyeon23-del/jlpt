begin;

-- generated from data/n5-batches/n5_reading_search_batch_05.json
-- generated at 2026-04-17T14:45:58.677Z

-- passage set 1
insert into public.passages (
  group_id,
  content,
  level,
  type,
  sub_type
)
values (
  'n5_reading_search_batch_05_set_01',
  'コンビニはあさ6時からよる11時まであいています。やさいやパン、おにぎりも売っています。店の前にはじてんしゃをとめるところがあります。',
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
  'n5_reading_search_batch_05_set_01',
  '독해',
  '정보검색',
  'コンビニは何時からあいていますか。____',
  1,
  '6時',
  '7時',
  '8時',
  '9時',
  1,
  '지문에서 ''あさ6時から''라고 되어 있어 정답은 6시입니다.',
  1,
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
  'n5_reading_search_batch_05_set_01',
  '독해',
  '정보검색',
  'この店の前にあるものは何ですか。____',
  2,
  'じてんしゃをとめるところ',
  'バスてい',
  '公園',
  'タクシーのりば',
  1,
  '''店の前にはじてんしゃをとめるところがあります。''가 정답을 알려줍니다.',
  1,
  0.9
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
  'n5_reading_search_batch_05_set_01',
  '독해',
  '정보검색',
  'コンビニで売っていないものは何ですか。____',
  3,
  'さかな',
  'やさい',
  'パン',
  'おにぎり',
  1,
  '지문에는 ''やさい、パン、おにぎり''만 나오며, ''さかな''는 언급이 없습니다.',
  1,
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
  'n5_reading_search_batch_05_set_01',
  '독해',
  '정보검색',
  'コンビニはよる何時まであいていますか。____',
  4,
  '11時',
  '10時',
  '12時',
  '9時',
  1,
  '지문에서 ''よる11時まで''라고 명확하게 나와 있습니다.',
  1,
  0.9
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
  'n5_reading_search_batch_05_set_02',
  '田中さんはまいにち8時に会社に行きます。お昼は12時から1時までです。かいしゃの近くに安くておいしいレストランがあります。',
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
  'n5_reading_search_batch_05_set_02',
  '독해',
  '정보검색',
  '田中さんは何時に会社に____。',
  1,
  '行きます',
  '帰ります',
  '来ます',
  '出ます',
  1,
  '지문에 ''8時に会社に行きます''라고 되어 있으므로 정답입니다.',
  4,
  1.18
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
  'n5_reading_search_batch_05_set_02',
  '독해',
  '정보검색',
  '田中さんのお昼は____からですか。',
  2,
  '12時',
  '11時',
  '1時',
  '2時',
  1,
  '지문에 ''お昼は12時から1時までです''라고 나옵니다.',
  4,
  1.18
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
  'n5_reading_search_batch_05_set_02',
  '독해',
  '정보검색',
  '会社の近くにあるレストランはどうですか。____',
  3,
  '安くておいしい',
  '高くてまずい',
  '新しい',
  'きれい',
  1,
  '내용에 ''安くておいしい''라고 나와 있습니다.',
  4,
  1.18
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
  'n5_reading_search_batch_05_set_02',
  '독해',
  '정보검색',
  '田中さんはまいにち何時に会社に行きますか。____',
  4,
  '8時',
  '9時',
  '7時',
  '10時',
  1,
  '지문에 ''まいにち8時に会社に行きます''라고 명시되어 있습니다.',
  4,
  1.18
)
on conflict (group_id, blank_number, question) do nothing;

-- passage set 3
insert into public.passages (
  group_id,
  content,
  level,
  type,
  sub_type
)
values (
  'n5_reading_search_batch_05_set_03',
  '山田さんの家は学校から近いです。でも、バスで行きます。朝、7時に家を出て、7時15分のバスにのります。土曜日と日曜日は学校がありません。',
  'N5',
  '독해',
  '정보검색'
)
on conflict (group_id) do nothing;

-- passage question 3.1
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
  'n5_reading_search_batch_05_set_03',
  '독해',
  '정보검색',
  '山田さんはがっこうへ何で行きますか。____',
  1,
  'バス',
  'じてんしゃ',
  'くるま',
  'あるいて',
  1,
  '지문에 ''バスで行きます''라고 나와 있습니다.',
  5,
  1.23
)
on conflict (group_id, blank_number, question) do nothing;

-- passage question 3.2
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
  'n5_reading_search_batch_05_set_03',
  '독해',
  '정보검색',
  '山田さんはいつ家を出ますか。____',
  2,
  '7時',
  '7時15分',
  '6時',
  '8時',
  1,
  '''朝、7時に家を出て''라고 지문에 나와 있습니다.',
  5,
  1.23
)
on conflict (group_id, blank_number, question) do nothing;

-- passage question 3.3
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
  'n5_reading_search_batch_05_set_03',
  '독해',
  '정보검색',
  'バスは何時に出ますか。____',
  3,
  '7時15分',
  '7時',
  '7時30分',
  '8時',
  1,
  '지문에서 ''7時15分のバスにのります''라는 정보를 찾을 수 있습니다.',
  5,
  1.23
)
on conflict (group_id, blank_number, question) do nothing;

-- passage question 3.4
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
  'n5_reading_search_batch_05_set_03',
  '독해',
  '정보검색',
  '山田さんは土曜日と日曜日、学校がありますか。____',
  4,
  'いいえ、ありません',
  'はい、あります',
  'いつもあります',
  'わかりません',
  1,
  '지문 마지막 문장에 ''土曜日と日曜日は学校がありません''라고 명확하게 적혀 있습니다.',
  5,
  1.23
)
on conflict (group_id, blank_number, question) do nothing;

-- passage set 4
insert into public.passages (
  group_id,
  content,
  level,
  type,
  sub_type
)
values (
  'n5_reading_search_batch_05_set_04',
  '午後2時から図書館のそうじをします。おさらや本をきちんと並べてください。本は9時までかりることができます。月曜日は休みです。',
  'N5',
  '독해',
  '정보검색'
)
on conflict (group_id) do nothing;

-- passage question 4.1
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
  'n5_reading_search_batch_05_set_04',
  '독해',
  '정보검색',
  '図書館のそうじはいつしますか。____',
  1,
  '午後2時から',
  '午前9時から',
  '午後5時から',
  '午前11時から',
  1,
  '지문 처음에 ''午後2時から図書館のそうじをします''라고 나와 있습니다.',
  4,
  1.05
)
on conflict (group_id, blank_number, question) do nothing;

-- passage question 4.2
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
  'n5_reading_search_batch_05_set_04',
  '독해',
  '정보검색',
  '本を並べるとき、どうしますか。____',
  2,
  'きちんと並べる',
  'たくさん並べる',
  '高く並べる',
  '早く並べる',
  1,
  '지문에 ''きちんと並べてください''라고 쓰여 있습니다.',
  4,
  1.05
)
on conflict (group_id, blank_number, question) do nothing;

-- passage question 4.3
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
  'n5_reading_search_batch_05_set_04',
  '독해',
  '정보검색',
  '本はいつまでかりることができますか。____',
  3,
  '9時まで',
  '2時まで',
  '12時まで',
  '8時まで',
  1,
  '내용상 ''本は9時までかりることができます''가 정답입니다.',
  4,
  1.05
)
on conflict (group_id, blank_number, question) do nothing;

-- passage question 4.4
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
  'n5_reading_search_batch_05_set_04',
  '독해',
  '정보검색',
  '図書館は何曜日に休みですか。____',
  4,
  '月曜日',
  '土曜日',
  '日曜日',
  '水曜日',
  1,
  '지문 마지막에 ''月曜日は休みです''라고 나와 있습니다.',
  4,
  1.05
)
on conflict (group_id, blank_number, question) do nothing;

commit;
