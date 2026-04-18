begin;

-- generated from data/n5-batches/n5_vocab_kanji_batch_01.json
-- generated at 2026-04-15T16:47:12.256Z

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
)
select
  'N5',
  '문자·어휘',
  '한자 읽기',
  '「日よう日」の よみかたは どれですか。',
  'にちようび',
  'げつようび',
  'すいようび',
  'どようび',
  1,
  '日よう日은 일요일을 뜻하며 읽기는 にちようび이다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '한자 읽기'
    and q.question = '「日よう日」の よみかたは どれですか。'
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
)
select
  'N5',
  '문자·어휘',
  '한자 읽기',
  '「月よう日」の よみかたは どれですか。',
  'かようび',
  'げつようび',
  'もくようび',
  'きんようび',
  2,
  '月よう日은 월요일이며 읽기는 げつようび이다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '한자 읽기'
    and q.question = '「月よう日」の よみかたは どれですか。'
);

-- single item 3
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
)
select
  'N5',
  '문자·어휘',
  '한자 읽기',
  '「火山」の よみかたは どれですか。',
  'ひやま',
  'かせん',
  'かざん',
  'ひざん',
  3,
  '火山은 화산을 뜻하며 일반적인 읽기는 かざん이다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '한자 읽기'
    and q.question = '「火山」の よみかたは どれですか。'
);

-- single item 4
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
)
select
  'N5',
  '문자·어휘',
  '한자 읽기',
  '「水」の よみかたは どれですか。',
  'みず',
  'き',
  'ひ',
  'つち',
  1,
  '水는 물을 뜻하며 읽기는 みず이다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '한자 읽기'
    and q.question = '「水」の よみかたは どれですか。'
);

-- single item 5
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
)
select
  'N5',
  '문자·어휘',
  '한자 읽기',
  '「木」の よみかたは どれですか。',
  'いし',
  'き',
  'はな',
  'くさ',
  2,
  '木는 나무를 뜻하며 읽기는 き이다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '한자 읽기'
    and q.question = '「木」の よみかたは どれですか。'
);

-- single item 6
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
)
select
  'N5',
  '문자·어휘',
  '한자 읽기',
  '「金よう日」の よみかたは どれですか。',
  'げつようび',
  'もくようび',
  'にちようび',
  'きんようび',
  4,
  '金よう日은 금요일이며 읽기는 きんようび이다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '한자 읽기'
    and q.question = '「金よう日」の よみかたは どれですか。'
);

-- single item 7
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
)
select
  'N5',
  '문자·어휘',
  '한자 읽기',
  '「山」の よみかたは どれですか。',
  'かわ',
  'やま',
  'そら',
  'うみ',
  2,
  '山는 산을 뜻하며 읽기는 やま이다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '한자 읽기'
    and q.question = '「山」の よみかたは どれですか。'
);

-- single item 8
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
)
select
  'N5',
  '문자·어휘',
  '한자 읽기',
  '「川」の よみかたは どれですか。',
  'かわ',
  'やま',
  'みち',
  'まち',
  1,
  '川는 강을 뜻하며 읽기는 かわ이다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '한자 읽기'
    and q.question = '「川」の よみかたは どれですか。'
);

-- single item 9
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
)
select
  'N5',
  '문자·어휘',
  '한자 읽기',
  '「口」の よみかたは どれですか。',
  'め',
  'みみ',
  'くち',
  'あし',
  3,
  '口는 입을 뜻하며 읽기는 くち이다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '한자 읽기'
    and q.question = '「口」の よみかたは どれですか。'
);

-- single item 10
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
)
select
  'N5',
  '문자·어휘',
  '한자 읽기',
  '「目」の よみかたは どれですか。',
  'はな',
  'め',
  'かお',
  'て',
  2,
  '目는 눈을 뜻하며 읽기는 め이다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '한자 읽기'
    and q.question = '「目」の よみかたは どれですか。'
);

-- single item 11
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
)
select
  'N5',
  '문자·어휘',
  '한자 읽기',
  '「耳」の よみかたは どれですか。',
  'みみ',
  'くび',
  'あたま',
  'おなか',
  1,
  '耳는 귀를 뜻하며 읽기는 みみ이다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '한자 읽기'
    and q.question = '「耳」の よみかたは どれですか。'
);

-- single item 12
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
)
select
  'N5',
  '문자·어휘',
  '한자 읽기',
  '「手」の よみかたは どれですか。',
  'あし',
  'かた',
  'て',
  'ゆび',
  3,
  '手는 손을 뜻하며 읽기는 て이다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '한자 읽기'
    and q.question = '「手」の よみかたは どれですか。'
);

-- single item 13
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
)
select
  'N5',
  '문자·어휘',
  '한자 읽기',
  '「足」の よみかたは どれですか。',
  'あし',
  'うで',
  'ひざ',
  'せなか',
  1,
  '足는 발 또는 다리를 뜻하며 읽기는 あし이다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '한자 읽기'
    and q.question = '「足」の よみかたは どれですか。'
);

-- single item 14
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
)
select
  'N5',
  '문자·어휘',
  '한자 읽기',
  '「本」の よみかたは どれですか。',
  'しんぶん',
  'えんぴつ',
  'ほん',
  'じしょ',
  3,
  '本는 책을 뜻하며 읽기는 ほん이다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '한자 읽기'
    and q.question = '「本」の よみかたは どれですか。'
);

-- single item 15
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
)
select
  'N5',
  '문자·어휘',
  '한자 읽기',
  '「人」の よみかたは どれですか。',
  'ひと',
  'ともだち',
  'せんせい',
  'がくせい',
  1,
  '人는 사람을 뜻하며 읽기는 ひと이다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '한자 읽기'
    and q.question = '「人」の よみかたは どれですか。'
);

-- single item 16
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
)
select
  'N5',
  '문자·어휘',
  '한자 읽기',
  '「女」の よみかたは どれですか。',
  'おとこ',
  'ひと',
  'おんな',
  'こども',
  3,
  '女는 여자를 뜻하며 읽기는 おんな이다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '한자 읽기'
    and q.question = '「女」の よみかたは どれですか。'
);

-- single item 17
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
)
select
  'N5',
  '문자·어휘',
  '한자 읽기',
  '「男」の よみかたは どれですか。',
  'おとこ',
  'おんな',
  'おや',
  'ともだち',
  1,
  '男는 남자를 뜻하며 읽기는 おとこ이다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '한자 읽기'
    and q.question = '「男」の よみかたは どれですか。'
);

-- single item 18
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
)
select
  'N5',
  '문자·어휘',
  '한자 읽기',
  '「先生」の よみかたは どれですか。',
  'せいと',
  'せんせい',
  'かいしゃいん',
  'いしゃ',
  2,
  '先生은 선생님을 뜻하며 읽기는 せんせい이다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '한자 읽기'
    and q.question = '「先生」の よみかたは どれですか。'
);

-- single item 19
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
)
select
  'N5',
  '문자·어휘',
  '한자 읽기',
  '「学生」の よみかたは どれですか。',
  'がくせい',
  'せんせい',
  'だいがく',
  'がっこう',
  1,
  '学生은 학생을 뜻하며 읽기는 がくせい이다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '한자 읽기'
    and q.question = '「学生」の よみかたは どれですか。'
);

-- single item 20
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
)
select
  'N5',
  '문자·어휘',
  '한자 읽기',
  '「学校」の よみかたは どれですか。',
  'きょうしつ',
  'がくこう',
  'がっこう',
  'だいがく',
  3,
  '学校는 학교를 뜻하며 읽기는 がっこう이다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '한자 읽기'
    and q.question = '「学校」の よみかたは どれですか。'
);

commit;
