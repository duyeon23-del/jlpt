begin;

-- generated from data/n5-batches/n5_reading_short_batch_02.json
-- generated at 2026-04-19T16:45:06.084Z

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
  'これはわたしのいえです。いえはきれいです。わたしはまいにちここでごはんをたべます。',
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
  explanation,
  difficulty,
  recommendation_weight
)
values (
  'n5_reading_short_batch_02_set_01',
  '독해',
  '단문독해',
  'このはなしの いえ は だれの ____ ですか。',
  1,
  'わたし',
  'ともだち',
  'せんせい',
  'かぞく',
  1,
  '"わたしのいえ"라고 했으므로 답은 ''わたし''입니다.',
  1,
  0.95
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
  'n5_reading_short_batch_02_set_01',
  '독해',
  '단문독해',
  'いえは どのように ____ か。',
  2,
  'きれい',
  'あかるい',
  'ひろい',
  'せまい',
  1,
  '"きれいです"라고 되어 있으므로 답은 ''きれい''입니다.',
  1,
  0.95
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
  'n5_reading_short_batch_02_set_01',
  '독해',
  '단문독해',
  'わたしは まいにち ____ で ごはんをたべます。',
  3,
  'ここ',
  'がっこう',
  'ともだちのいえ',
  'えき',
  1,
  '"ここでごはんをたべます"라고 명시되어 있습니다.',
  1,
  0.95
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
  'n5_reading_short_batch_02_set_01',
  '독해',
  '단문독해',
  'わたしのいえは ____ ですか。',
  4,
  'きれい',
  'たかい',
  'あたらしい',
  'ふるい',
  1,
  '지문에서 ''きれいです''라고 해서 답은 ''きれい''입니다.',
  1,
  0.95
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
  'きょうはあついひです。ともだちとこうえんにいきました。アイスクリームをたべてたのしかったです。',
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
  explanation,
  difficulty,
  recommendation_weight
)
values (
  'n5_reading_short_batch_02_set_02',
  '독해',
  '단문독해',
  'きょうのてんきは ____ ですか。',
  1,
  'あつい',
  'さむい',
  'あめ',
  'くもり',
  1,
  '"あついひ"라고 하였으므로 답은 ''あつい''입니다.',
  2,
  1.05
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
  'n5_reading_short_batch_02_set_02',
  '독해',
  '단문독해',
  'ともだちと ____ にいきましたか。',
  2,
  'こうえん',
  'がっこう',
  'スーパー',
  'いえ',
  1,
  '지문에 ''こうえんにいきました''라고 쓰여 있습니다.',
  2,
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
  'n5_reading_short_batch_02_set_02',
  '독해',
  '단문독해',
  'こうえんでなにを ____ ましたか。',
  3,
  'たべ',
  'かい',
  'よみ',
  'あそび',
  1,
  '"アイスクリームをたべて"라고 하여 답은 ''たべ''입니다.',
  2,
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
  'n5_reading_short_batch_02_set_02',
  '독해',
  '단문독해',
  'ひとはこうえんでアイスクリームをたべてどう ____ でしたか。',
  4,
  'たのしかった',
  'かなしかった',
  'いたかった',
  'ねむかった',
  1,
  '지문에 ''たのしかったです''라고 하여 답은 ''たのしかった''입니다.',
  2,
  1.05
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
  'わたしのへやにはつくえといすがあります。つくえのうえにパソコンがあります。いすはあかいです。',
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
  explanation,
  difficulty,
  recommendation_weight
)
values (
  'n5_reading_short_batch_02_set_03',
  '독해',
  '단문독해',
  'へやのなかに あるのは ____ といすですか。',
  1,
  'つくえ',
  'まど',
  'ほんだな',
  'テレビ',
  1,
  '지문에 ''つくえといす''가 있다고 명확히 언급되어 있습니다.',
  2,
  1.1
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
  'n5_reading_short_batch_02_set_03',
  '독해',
  '단문독해',
  'つくえのうえには なにが ____ か。',
  2,
  'あります',
  'たべます',
  'のみます',
  'います',
  1,
  '사물이기 때문에 ''あります''가 정답입니다.',
  2,
  1.1
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
  'n5_reading_short_batch_02_set_03',
  '독해',
  '단문독해',
  'パソコンは どこに ____ か。',
  3,
  'あります',
  'とります',
  'みます',
  'はしります',
  1,
  '''つくえのうえにパソコンがあります'' 라서 ''あります''가 답입니다.',
  2,
  1.1
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
  'n5_reading_short_batch_02_set_03',
  '독해',
  '단문독해',
  'いすのいろは ____ ですか。',
  4,
  'あか',
  'くろ',
  'あお',
  'しろ',
  1,
  '''いすはあかいです'' 라고 지문에 명시되어 있습니다.',
  2,
  1.1
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
  'にちようびのあさ、わたしは７じにおきます。はをみがいて、あさごはんをたべます。そのあと、いぬとさんぽにいきます。',
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
  explanation,
  difficulty,
  recommendation_weight
)
values (
  'n5_reading_short_batch_02_set_04',
  '독해',
  '단문독해',
  'わたしは にちようびのあさ なんじに ____ か。',
  1,
  'おきます',
  'ねます',
  'でかけます',
  'かえります',
  1,
  '지문에서 ''７じにおきます''로 명시되어 있습니다.',
  5,
  1.2
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
  'n5_reading_short_batch_02_set_04',
  '독해',
  '단문독해',
  'わたしは はを ____ しますか。',
  2,
  'みがき',
  'あらい',
  'そだて',
  'きき',
  1,
  '''はをみがいて''에서 ''みがき''가 정답입니다.',
  5,
  1.2
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
  'n5_reading_short_batch_02_set_04',
  '독해',
  '단문독해',
  'あさごはんをたべた____、さんぽにいきます。',
  3,
  'あと',
  'まえ',
  'なか',
  'そと',
  1,
  '"そのあと"와 연결되어 ''あと''가 정답입니다.',
  5,
  1.2
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
  'n5_reading_short_batch_02_set_04',
  '독해',
  '단문독해',
  'だれといっしょに ____ にいきますか。',
  4,
  'いぬ',
  'ねこ',
  'ともだち',
  'かぞく',
  1,
  '"いぬとさんぽにいきます"에서 정답은 ''いぬ''입니다.',
  5,
  1.2
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
  'おとうとはちいさいです。まいにちがっこうへいきます。でもきのうはびょうきでやすみました。',
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
  explanation,
  difficulty,
  recommendation_weight
)
values (
  'n5_reading_short_batch_02_set_05',
  '독해',
  '단문독해',
  'おとうとは どんな ____ ですか。',
  1,
  'ちいさい',
  'おおきい',
  'ふるい',
  'きれい',
  1,
  '지문에 ''おとうとはちいさい''라고 명확하게 있습니다.',
  3,
  0.9
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
  explanation,
  difficulty,
  recommendation_weight
)
values (
  'n5_reading_short_batch_02_set_05',
  '독해',
  '단문독해',
  'おとうとは まいにち ____ にいきます。',
  2,
  'がっこう',
  'スーパー',
  'こうえん',
  'いえ',
  1,
  '지문에 ''まいにちがっこうへいきます''가 있습니다.',
  3,
  0.9
)
on conflict (group_id, blank_number, question) do nothing;

-- passage question 5.3
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
  'n5_reading_short_batch_02_set_05',
  '독해',
  '단문독해',
  'きのうおとうとは がっこうを ____ ましたか。',
  3,
  'やすみ',
  'いき',
  'み',
  'かい',
  1,
  '''きのうはびょうきでやすみました''라고 있었기 때문입니다.',
  3,
  0.9
)
on conflict (group_id, blank_number, question) do nothing;

-- passage question 5.4
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
  'n5_reading_short_batch_02_set_05',
  '독해',
  '단문독해',
  'おとうとが がっこうをやすんだりゆうは ____ ですか。',
  4,
  'びょうき',
  'ともだち',
  'てんき',
  'テスト',
  1,
  '지문에서 ''びょうきでやすみました''라고 명시되어 있습니다.',
  3,
  0.9
)
on conflict (group_id, blank_number, question) do nothing;

commit;
