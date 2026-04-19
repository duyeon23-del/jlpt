begin;

-- generated from data/n5-batches/n5_vocab_kanji_batch_01.json
-- generated at 2026-04-19T13:39:40.735Z

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
  explanation,
  difficulty,
  recommendation_weight
)
select
  'N5',
  '문자·어휘',
  '한자 읽기',
  'この花の名前は何と____か。',
  'いいます',
  'かきます',
  'たべます',
  'のみます',
  1,
  '「言う」의 읽기는 ''いう'', 정답은 ''いいます(말합니다)''입니다.',
  2,
  0.96
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '한자 읽기'
    and q.question = 'この花の名前は何と____か。'
);

commit;
