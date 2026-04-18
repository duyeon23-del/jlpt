begin;

-- generated from data/n5-batches/n5_reading_search_batch_02.json
-- generated at 2026-04-16T14:15:56.844Z

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
  'とうきょう えきは JR、メトロ、私鉄など 様々な路線が通っています。毎日 たくさんの人が利用しています。えきの南口には ビジネス街が あります。北口には デパートやレストランが あります。',
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
  explanation
)
values (
  'n5_reading_search_batch_02_set_01',
  '독해',
  '정보검색',
  '東京駅の 北口の 近くには 何がありますか。',
  1,
  'ビジネス街',
  'デパートやレストラン',
  '病院',
  '学校',
  2,
  '지문에 ''北口にはデパートやレストランがあります''라고 명시되어 있다.'
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
  explanation
)
values (
  'n5_reading_search_batch_02_set_01',
  '독해',
  '정보검색',
  '東京駅を 利用しているのは いつですか。',
  2,
  '朝だけ',
  '夜だけ',
  '毎日',
  '週末だけ',
  3,
  '지문에 ''毎日たくさんの人が利用しています''라고 명시되어 있다.'
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
  explanation
)
values (
  'n5_reading_search_batch_02_set_01',
  '독해',
  '정보검색',
  '東京駅の 南口の 近くには 何がありますか。',
  3,
  'ビジネス街',
  'デパート',
  '遊園地',
  '公園',
  1,
  '지문에 ''南口にはビジネス街があります''라고 명시되어 있다.'
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
  'カフェ「さくら」の営業時間は 平日 午前7時から午後9時、土日 午前8時から 午後 10時です。朝食、ランチ、ディナーすべて 提供しています。WiFiが あるので、仕事や 勉強に 使われています。',
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
  explanation
)
values (
  'n5_reading_search_batch_02_set_02',
  '독해',
  '정보검색',
  'カフェ「さくら」は 平日 何時に 閉まりますか。',
  1,
  '午後7時',
  '午後8時',
  '午後9時',
  '午後10時',
  3,
  '지문에 ''平日午前7時から午後9時''라고 명시되어 있다.'
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
  explanation
)
values (
  'n5_reading_search_batch_02_set_02',
  '독해',
  '정보검색',
  'カフェ「さくら」では 何が 提供されていますか。',
  2,
  '朝食とランチだけ',
  'ランチとディナーだけ',
  '朝食、ランチ、ディナーすべて',
  '夜食だけ',
  3,
  '지문에 ''朝食、ランチ、ディナーすべて提供しています''라고 명시되어 있다.'
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
  explanation
)
values (
  'n5_reading_search_batch_02_set_02',
  '독해',
  '정보검색',
  'カフェ「さくら」で 人気がある のは なぜですか。',
  3,
  '安い',
  'WiFiがあるから',
  'おいしい',
  '有名だから',
  2,
  '지문에 ''WiFiがあるので、仕事や勉強に使われています''라고 나와 있다.'
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
  'n5_reading_search_batch_02_set_03',
  '図書館の蔵書は 約10万冊です。雑誌、新聞も 多くあります。自習室もあり、学生が よく勉強しています。開館時間は 月曜から 金曜 午前9時から 午後8時、土日 午前10時から 午後6時です。',
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
  explanation
)
values (
  'n5_reading_search_batch_02_set_03',
  '독해',
  '정보검색',
  '図書館の 蔵書数は どのくらいですか。',
  1,
  '約1万冊',
  '約5万冊',
  '約10万冊',
  '約20万冊',
  3,
  '지문에 ''蔵書は約10万冊です''라고 명시되어 있다.'
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
  explanation
)
values (
  'n5_reading_search_batch_02_set_03',
  '독해',
  '정보검색',
  '図書館には 何が ありますか。',
  2,
  '本だけ',
  '本と雑誌',
  '本、雑誌、新聞、自習室',
  'カフェと本',
  3,
  '지문에 ''雑誌、新聞も多くあります。自習室もあり''라고 나와 있다.'
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
  explanation
)
values (
  'n5_reading_search_batch_02_set_03',
  '독해',
  '정보검색',
  '図書館は 土曜 何時に 閉まりますか。',
  3,
  '午後4時',
  '午後6時',
  '午後8時',
  '午後10時',
  2,
  '지문에 ''土日午前10時から午後6時''라고 명시되어 있다.'
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
  'n5_reading_search_batch_02_set_04',
  'ホテル「ガーデン」は 新宿駅から 徒歩 5分です。シングルルームが 1グラウンド 500円、ダブルルームが 1泊 7000円です。朝食は 6時から 10時まで レストランで 提供されています。駐車場も あります。',
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
  explanation
)
values (
  'n5_reading_search_batch_02_set_04',
  '독해',
  '정보검색',
  'ホテル「ガーデン」は 新宿駅から どのくらいの距離ですか。',
  1,
  '徒歩 3分',
  '徒歩 5分',
  '徒歩 10分',
  '徒歩 15分',
  2,
  '지문에 ''新宿駅から徒歩5分''라고 명시되어 있다.'
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
  explanation
)
values (
  'n5_reading_search_batch_02_set_04',
  '독해',
  '정보검색',
  'ダブルルーム の 1泊の 値段は 幾らですか。',
  2,
  '5000円',
  '6000円',
  '7000円',
  '8000円',
  3,
  '지문에 ''ダブルルームが1泊7000円''라고 명시되어 있다.'
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
  explanation
)
values (
  'n5_reading_search_batch_02_set_04',
  '독해',
  '정보검색',
  '朝食は 何時から 何時まで 提供されていますか。',
  3,
  '5時から 9時',
  '6時から 10時',
  '7時から 11時',
  '8時から 12時',
  2,
  '지문에 ''朝食は6時から10時まで''라고 명시되어 있다.'
)
on conflict (group_id, blank_number, question) do nothing;

commit;
