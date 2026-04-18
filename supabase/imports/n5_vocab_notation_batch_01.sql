begin;

-- generated from data/n5-batches/n5_vocab_notation_batch_01.json
-- generated at 2026-04-15T16:47:12.461Z

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
  '표기',
  '「やま」の かきかたは どれですか。',
  '川',
  '山',
  '田',
  '口',
  2,
  'やま는 산을 뜻하므로 올바른 표기는 山이다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '표기'
    and q.question = '「やま」の かきかたは どれですか。'
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
  '표기',
  '「かわ」の かきかたは どれですか。',
  '川',
  '山',
  '人',
  '火',
  1,
  'かわ는 강을 뜻하므로 올바른 표기는 川이다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '표기'
    and q.question = '「かわ」の かきかたは どれですか。'
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
  '표기',
  '「みず」の かきかたは どれですか。',
  '木',
  '土',
  '水',
  '金',
  3,
  'みず는 물이므로 올바른 표기는 水이다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '표기'
    and q.question = '「みず」の かきかたは どれですか。'
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
  '표기',
  '「ひ」の かきかたは どれですか。',
  '月',
  '火',
  '日',
  '本',
  3,
  'ひ는 해나 날을 뜻하는 기본 표기로 日를 사용한다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '표기'
    and q.question = '「ひ」の かきかたは どれですか。'
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
  '표기',
  '「つき」の かきかたは どれですか。',
  '月',
  '日',
  '年',
  '時',
  1,
  'つき는 달을 뜻하므로 올바른 표기는 月이다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '표기'
    and q.question = '「つき」の かきかたは どれですか。'
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
  '표기',
  '「き」の かきかたは どれですか。',
  '本',
  '木',
  '林',
  '森',
  2,
  'き는 나무를 뜻하며 기본 표기는 木이다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '표기'
    and q.question = '「き」の かきかたは どれですか。'
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
  '표기',
  '「ひと」の かきかたは どれですか。',
  '入',
  '人',
  '大',
  '女',
  2,
  'ひと는 사람을 뜻하므로 올바른 표기는 人이다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '표기'
    and q.question = '「ひと」の かきかたは どれですか。'
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
  '표기',
  '「おんな」の かきかたは どれですか。',
  '母',
  '男',
  '女',
  '子',
  3,
  'おんな는 여자를 뜻하므로 올바른 표기는 女이다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '표기'
    and q.question = '「おんな」の かきかたは どれですか。'
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
  '표기',
  '「おとこ」の かきかたは どれですか。',
  '女',
  '男',
  '父',
  '兄',
  2,
  'おとこ는 남자를 뜻하므로 올바른 표기는 男이다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '표기'
    and q.question = '「おとこ」の かきかたは どれですか。'
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
  '표기',
  '「くち」の かきかたは どれですか。',
  '口',
  '目',
  '耳',
  '手',
  1,
  'くち는 입이므로 올바른 표기는 口이다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '표기'
    and q.question = '「くち」の かきかたは どれですか。'
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
  '표기',
  '「め」の かきかたは どれですか。',
  '耳',
  '目',
  '首',
  '足',
  2,
  'め는 눈을 뜻하므로 올바른 표기는 目이다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '표기'
    and q.question = '「め」の かきかたは どれですか。'
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
  '표기',
  '「みみ」の かきかたは どれですか。',
  '耳',
  '目',
  '手',
  '足',
  1,
  'みみ는 귀를 뜻하므로 올바른 표기는 耳이다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '표기'
    and q.question = '「みみ」の かきかたは どれですか。'
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
  '표기',
  '「て」の かきかたは どれですか。',
  '毛',
  '手',
  '足',
  '力',
  2,
  'て는 손을 뜻하므로 올바른 표기는 手이다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '표기'
    and q.question = '「て」の かきかたは どれですか。'
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
  '표기',
  '「あし」の かきかたは どれですか。',
  '走',
  '手',
  '足',
  '立',
  3,
  'あし는 발 또는 다리를 뜻하므로 올바른 표기는 足이다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '표기'
    and q.question = '「あし」の かきかたは どれですか。'
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
  '표기',
  '「ほん」の かきかたは どれですか。',
  '木',
  '休',
  '本',
  '文',
  3,
  'ほん은 책을 뜻하므로 올바른 표기는 本이다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '표기'
    and q.question = '「ほん」の かきかたは どれですか。'
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
  '표기',
  '「がっこう」の かきかたは どれですか。',
  '学校',
  '学生',
  '先生',
  '大学',
  1,
  'がっこう는 학교를 뜻하므로 올바른 표기는 学校이다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '표기'
    and q.question = '「がっこう」の かきかたは どれですか。'
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
  '표기',
  '「せんせい」の かきかたは どれですか。',
  '先手',
  '先生',
  '学生',
  '学校',
  2,
  'せんせい는 선생님을 뜻하므로 올바른 표기는 先生이다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '표기'
    and q.question = '「せんせい」の かきかたは どれですか。'
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
  '표기',
  '「がくせい」の かきかたは どれですか。',
  '学校',
  '学生',
  '先月',
  '学先',
  2,
  'がくせい는 학생을 뜻하므로 올바른 표기는 学生이다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '표기'
    and q.question = '「がくせい」の かきかたは どれですか。'
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
  '표기',
  '「でんしゃ」の かきかたは どれですか。',
  '電車',
  '電話',
  '自車',
  '駅車',
  1,
  'でんしゃ는 전차를 뜻하므로 올바른 표기는 電車이다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '표기'
    and q.question = '「でんしゃ」の かきかたは どれですか。'
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
  '표기',
  '「でんわ」の かきかたは どれですか。',
  '電気',
  '電話',
  '電車',
  '会話',
  2,
  'でんわ는 전화를 뜻하므로 올바른 표기는 電話이다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '표기'
    and q.question = '「でんわ」の かきかたは どれですか。'
);

commit;
