begin;

-- generated from data/n5-batches/n5_reading_short_batch_05.json
-- generated at 2026-04-17T14:44:11.793Z

-- passage set 1
insert into public.passages (
  group_id,
  content,
  level,
  type,
  sub_type
)
values (
  'n5_reading_short_batch_05_set_01',
  'わたしはかいしゃいんです。まいにち、でんしゃでしごとにいきます。しごとはたのしいです。',
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
  'n5_reading_short_batch_05_set_01',
  '독해',
  '단문독해',
  'わたしは____です。',
  1,
  'かいしゃいん',
  'せんせい',
  'がくせい',
  'いしゃ',
  1,
  '지문 첫 문장에 ''わたしはかいしゃいんです''라고 나와 있습니다.',
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
  'n5_reading_short_batch_05_set_01',
  '독해',
  '단문독해',
  'わたしはまいにち____でしごとにいきます。',
  2,
  'でんしゃ',
  'じてんしゃ',
  'くるま',
  'あるいて',
  1,
  '''まいにち、でんしゃでしごとにいきます''라는 부분에서 알 수 있습니다.',
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
  'n5_reading_short_batch_05_set_01',
  '독해',
  '단문독해',
  'わたしのしごとは____です。',
  3,
  'たのしい',
  'むずかしい',
  'たいへん',
  'つまらない',
  1,
  '마지막 문장에 ''しごとはたのしいです''라고 나옵니다.',
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
  'n5_reading_short_batch_05_set_01',
  '독해',
  '단문독해',
  'このひとはまいにち____。',
  4,
  'しごとにいきます',
  'ともだちとあそびます',
  'がっこうへいきます',
  'いえにいます',
  1,
  '지문 전반부에서 매일 회사에 간다는 것을 알 수 있습니다.',
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
  'n5_reading_short_batch_05_set_02',
  'きのう、わたしはともだちとこうえんへいきました。あめがふっていましたが、たのしかったです。あとで、みんなでケーキをたべました。',
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
  'n5_reading_short_batch_05_set_02',
  '독해',
  '단문독해',
  'きのう、わたしはともだちと____へいきました。',
  1,
  'こうえん',
  'うみ',
  'いえ',
  'えき',
  1,
  '''ともだちとこうえんへいきました''라는 문장이 있습니다.',
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
  'n5_reading_short_batch_05_set_02',
  '독해',
  '단문독해',
  'そのひ、てんきは____でした。',
  2,
  'あめ',
  'はれ',
  'ゆき',
  'くもり',
  1,
  '''あめがふっていました''라는 문장에서 알 수 있습니다.',
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
  'n5_reading_short_batch_05_set_02',
  '독해',
  '단문독해',
  'こうえんで、わたしは____。',
  3,
  'たのしかった',
  'さびしかった',
  'こわかった',
  'つまらなかった',
  1,
  '지문에 ''たのしかった'' 라고 언급되어 있습니다.',
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
  'n5_reading_short_batch_05_set_02',
  '독해',
  '단문독해',
  'あとで、みんなで____をたべました。',
  4,
  'ケーキ',
  'りんご',
  'パン',
  'おにぎり',
  1,
  '''ケーキをたべました''가 마지막 문장에 나옵니다.',
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
  'n5_reading_short_batch_05_set_03',
  'あさごはんをたべて、がっこうにいきます。きょうはにちようびなので、がっこうはやすみです。わたしはうちでべんきょうします。',
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
  'n5_reading_short_batch_05_set_03',
  '독해',
  '단문독해',
  'わたしはあさごはんを____。',
  1,
  'たべます',
  'のみます',
  'つくります',
  'かいます',
  1,
  '지문에 ''あさごはんをたべて''라고 나옵니다.',
  2,
  0.8
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
  'n5_reading_short_batch_05_set_03',
  '독해',
  '단문독해',
  'きょうは____です。',
  2,
  'にちようび',
  'げつようび',
  'かようび',
  'きんようび',
  1,
  '''きょうはにちようびなので''에서 알 수 있습니다.',
  2,
  0.8
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
  'n5_reading_short_batch_05_set_03',
  '독해',
  '단문독해',
  'きょう、がっこうは____。',
  3,
  'やすみ',
  'あります',
  'いきます',
  'はじまります',
  1,
  '''がっこうはやすみです''라고 명시되어 있습니다.',
  2,
  0.8
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
  'n5_reading_short_batch_05_set_03',
  '독해',
  '단문독해',
  'わたしはうちで____します。',
  4,
  'べんきょう',
  'りょうり',
  'さんぽ',
  'そうじ',
  1,
  '''うちでべんきょうします''라는 정보가 있습니다.',
  2,
  0.8
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
  'n5_reading_short_batch_05_set_04',
  'たなかさんはあかいくるまをもっています。まいしゅう、にちようびにやまへいきます。くるまのなかでおんがくをききながら、ドライブをたのしみます。',
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
  'n5_reading_short_batch_05_set_04',
  '독해',
  '단문독해',
  'たなかさんのくるまのいろは____です。',
  1,
  'あかい',
  'あおい',
  'しろい',
  'くろい',
  1,
  '''あかいくるまをもっています''라고 나와 있습니다.',
  5,
  1.25
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
  'n5_reading_short_batch_05_set_04',
  '독해',
  '단문독해',
  'たなかさんはまいしゅう、なにようびにやまへいきますか。____',
  2,
  'にちようび',
  'げつようび',
  'すいようび',
  'どようび',
  1,
  '''まいしゅう、にちようび''라고 지문에 언급되어 있습니다.',
  5,
  1.25
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
  'n5_reading_short_batch_05_set_04',
  '독해',
  '단문독해',
  'ドライブちゅう、たなかさんは____をききます。',
  3,
  'おんがく',
  'ラジオ',
  'ニュース',
  'テレビ',
  1,
  '''おんがくをききながら''라는 표현이 사용되었습니다.',
  5,
  1.25
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
  'n5_reading_short_batch_05_set_04',
  '독해',
  '단문독해',
  'たなかさんはドライブを____。',
  4,
  'たのしみます',
  'きらいます',
  'やすみます',
  'やめます',
  1,
  '마지막에 ''ドライブをたのしみます''라고 적혀 있습니다.',
  5,
  1.25
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
  'n5_reading_short_batch_05_set_05',
  'いもうとはせいがたかいです。まいあさ、ミルクをのみます。そして、サッカーがすきです。',
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
  'n5_reading_short_batch_05_set_05',
  '독해',
  '단문독해',
  'いもうとは____がたかいです。',
  1,
  'せい',
  'め',
  'みみ',
  'て',
  1,
  '처음 문장에서 ''せいがたかいです''라고 적혀 있습니다.',
  3,
  1.15
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
  'n5_reading_short_batch_05_set_05',
  '독해',
  '단문독해',
  'いもうとはまいあさ、____をのみます。',
  2,
  'ミルク',
  'おちゃ',
  'みず',
  'コーヒー',
  1,
  '''まいあさ、ミルクをのみます'' 부분이 해당 정보를 줍니다.',
  3,
  1.15
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
  'n5_reading_short_batch_05_set_05',
  '독해',
  '단문독해',
  'いもうとは____がすきです。',
  3,
  'サッカー',
  'テニス',
  'えいが',
  'ほん',
  1,
  '''サッカーがすきです''라는 마지막 문장이 있습니다.',
  3,
  1.15
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
  'n5_reading_short_batch_05_set_05',
  '독해',
  '단문독해',
  'いもうとはせいが____です。',
  4,
  'たかい',
  'ひくい',
  'ながい',
  'ちいさい',
  1,
  '높다는 의미의 ''たかい''가 정답입니다.',
  3,
  1.15
)
on conflict (group_id, blank_number, question) do nothing;

commit;
