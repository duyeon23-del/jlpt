begin;

-- generated from data/n5-batches/n5_reading_short_batch_02.json
-- generated at 2026-04-16T14:14:44.050Z

-- passage set 1
insert into public.passages (
  group_id,
  content,
  level,
  type,
  sub_type
)
values (
  'n5_reading_short_batch_02_set_01',
  '日本の 冬は とても さむいです。雪が たくさん ふります。',
  'N5',
  '독해',
  '단문독해'
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
  'n5_reading_short_batch_02_set_01',
  '독해',
  '단문독해',
  '日本の 冬は どうですか。',
  1,
  'あたたかいです',
  'さむいです',
  'あついです',
  'すずしいです',
  2,
  '지문에 ''冬はとても寒いです''라고 명시되어 있다.'
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
  'n5_reading_short_batch_02_set_01',
  '독해',
  '단문독해',
  '冬に なにが ふりますか。',
  2,
  'あめ',
  'ひょう',
  'ゆき',
  'あられ',
  3,
  '지문에 ''雪がたくさん降ります''라고 나와 있다.'
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
  'n5_reading_short_batch_02_set_02',
  '田中さんの お父さんは エンジニアです。毎日 会社で コンピュータの 仕事を していますします。',
  'N5',
  '독해',
  '단문독해'
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
  'n5_reading_short_batch_02_set_02',
  '독해',
  '단문독해',
  '田中さんの お父さんの 仕事は なんですか。',
  1,
  '先生',
  '医者',
  'エンジニア',
  '看護師',
  3,
  '지문에서 ''田中さんのお父さんはエンジニアです''라고 명시되어 있다.'
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
  'n5_reading_short_batch_02_set_02',
  '독해',
  '단문독해',
  'お父さんは 毎日 どこで 仕事を していますか。',
  2,
  'うち',
  '会社',
  'ぎゅうにゅう',
  'がっこう',
  2,
  '지문에 ''毎日 会社でコンピュータの仕事をしています''라고 명시되어 있다.'
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
  'n5_reading_short_batch_02_set_03',
  '明日は 私の 誕生日です。朝 両親が プレゼントを くれます。夜 友達が 来ます。楽しみです。',
  'N5',
  '독해',
  '단문독해'
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
  'n5_reading_short_batch_02_set_03',
  '독해',
  '단문독해',
  '明日は なんですか。',
  1,
  '友達の 誕生日',
  '私の 誕生日',
  '母の 誕生日',
  '父の 誕生日',
  2,
  '지문에 ''明日は私の誕生日です''라고 명시되어 있다.'
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
  'n5_reading_short_batch_02_set_03',
  '독해',
  '단문독해',
  '朝 何が ありますか。',
  2,
  '両親が プレゼントを くれます',
  '学校へ いきます',
  'ご飯を 食べます',
  '勉強します',
  1,
  '지문에 ''朝 両親がプレゼントをくれます''라고 나와 있다.'
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
  'n5_reading_short_batch_02_set_04',
  '私は 毎日 朝 7時に 起きます。7時30分に 朝ごはんを 食べます。そして バスで 学校へ 行きます。',
  'N5',
  '독해',
  '단문독해'
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
  'n5_reading_short_batch_02_set_04',
  '독해',
  '단문독해',
  '私は 何時に 起きますか。',
  1,
  '6時',
  '7時',
  '8時',
  '9時',
  2,
  '지문에 ''朝7時に起きます''라고 명시되어 있다.'
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
  'n5_reading_short_batch_02_set_04',
  '독해',
  '단문독해',
  '朝ごはんを 食べるのは いつですか。',
  2,
  '7時',
  '7時15分',
  '7時30分',
  '8時',
  3,
  '지문에 ''7時30分に朝ごはんを食べます''라고 나와 있다.'
)
on conflict (group_id, blank_number, question) do nothing;

-- passage set 5
insert into public.passages (
  group_id,
  content,
  level,
  type,
  sub_type
)
values (
  'n5_reading_short_batch_02_set_05',
  'その 店は 大きくて 新しいです。安い 野菜や 果物が たくさん あります。特に りんごは おいしいです。',
  'N5',
  '독해',
  '단문독해'
)
on conflict (group_id) do nothing;

-- passage question 5.1
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
  'n5_reading_short_batch_02_set_05',
  '독해',
  '단문독해',
  'その 店は どんな 店ですか。',
  1,
  '小さくて 古い',
  '大きくて 新しい',
  '大きくて 古い',
  '小さくて 新しい',
  2,
  '지문에 ''大きくて新しいです''라고 명시되어 있다.'
)
on conflict (group_id, blank_number, question) do nothing;

-- passage question 5.2
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
  'n5_reading_short_batch_02_set_05',
  '독해',
  '단문독해',
  'その 店では 何が 特に おいしいですか。',
  2,
  '野菜',
  '果物',
  'りんご',
  'みかん',
  3,
  '지문에 ''特にりんごはおいしいです''라고 명시되어 있다.'
)
on conflict (group_id, blank_number, question) do nothing;

commit;
