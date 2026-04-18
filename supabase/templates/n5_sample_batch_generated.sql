begin;

-- generated from data/n5-batches/sample-n5-batch.json
-- generated at 2026-04-15T16:05:45.852Z

-- single item 1
insert into public.questions (
  level,
  type,
  sub_type,
  question,
  option1,
  option2,
  option3,
  option4,
  answer,
  explanation
) values (
  'N5',
  '문자·어휘',
  '한자 읽기',
  'わたしは まいあさ ____ を のみます。',
  'みず',
  'つくえ',
  'でんしゃ',
  'ほん',
  1,
  '문맥상 매일 아침 마시는 대상은 물이므로 정답은 みず이다.'
);

-- single item 2
insert into public.questions (
  level,
  type,
  sub_type,
  question,
  option1,
  option2,
  option3,
  option4,
  answer,
  explanation
) values (
  'N5',
  '문법',
  '판단',
  'きのう ともだちと えいがを ____。',
  'みます',
  'みました',
  'みる',
  'みて',
  2,
  'きのう 가 있으므로 과거형인 みました 가 맞다.'
);

-- passage set 3
insert into public.passages (
  group_id,
  content,
  level,
  type,
  sub_type
) values (
  'n5_reading_sample_001',
  'やまださんは きょう がっこうの あとで スーパーへ いきます。そこで りんごと ぎゅうにゅうを かいます。',
  'N5',
  '독해',
  '단문독해'
);

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
) values (
  'n5_reading_sample_001',
  '독해',
  '단문독해',
  'やまださんは どこへ いきますか。',
  1,
  'びょういん',
  'ゆうびんきょく',
  'スーパー',
  'えき',
  3,
  '지문에 スーパーへ いきます 라고 나와 있다.'
);

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
) values (
  'n5_reading_sample_001',
  '독해',
  '단문독해',
  'やまださんは スーパーで なにを かいますか。',
  2,
  'りんごと ぎゅうにゅう',
  'ほんと ノート',
  'パンと たまご',
  'みずと さかな',
  1,
  '지문에 りんごと ぎゅうにゅうを かいます 라고 적혀 있다.'
);

commit;
