begin;

-- generated from data/n5-batches/n5_vocab_notation_batch_02.json
-- generated at 2026-04-16T13:25:28.467Z

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
  '「あめ」の かきかたは どれですか。',
  '雪',
  '雲',
  '雨',
  '空',
  3,
  'あめ는 비를 뜻하므로 올바른 표기는 雨이다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '표기'
    and q.question = '「あめ」の かきかたは どれですか。'
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
  '「ゆき」の かきかたは どれですか。',
  '雪',
  '雨',
  '雲',
  '風',
  1,
  'ゆき는 눈을 뜻하므로 올바른 표기는 雪이다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '표기'
    and q.question = '「ゆき」の かきかたは どれですか。'
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
  '「くも」の かきかたは どれですか。',
  '空',
  '雲',
  '雨',
  '星',
  2,
  'くも는 구름을 뜻하므로 올바른 표기는 雲이다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '표기'
    and q.question = '「くも」の かきかたは どれですか。'
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
  '「そら」の かきかたは どれですか。',
  '空',
  '青',
  '上',
  '雲',
  1,
  'そら는 하늘을 뜻하므로 올바른 표기는 空이다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '표기'
    and q.question = '「そら」の かきかたは どれですか。'
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
  '「えき」の かきかたは どれですか。',
  '店',
  '駅',
  '道',
  '町',
  2,
  'えき는 역을 뜻하므로 올바른 표기는 駅이다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '표기'
    and q.question = '「えき」の かきかたは どれですか。'
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
  '「かいしゃ」の かきかたは どれですか。',
  '会話',
  '会社',
  '会車',
  '社内',
  2,
  'かいしゃ는 회사를 뜻하므로 올바른 표기는 会社이다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '표기'
    and q.question = '「かいしゃ」の かきかたは どれですか。'
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
  '「しゃいん」の かきかたは どれですか。',
  '社員',
  '社人',
  '会社',
  '社長',
  1,
  'しゃいん은 회사원을 뜻하므로 올바른 표기는 社員이다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '표기'
    and q.question = '「しゃいん」の かきかたは どれですか。'
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
  '「ともだち」の かきかたは どれですか。',
  '友人',
  '友立',
  '友達',
  '学生',
  3,
  'ともだちは 친구를 뜻하므로 올바른 표기는 友達이다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '표기'
    and q.question = '「ともだち」の かきかたは どれですか。'
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
  '「はは」の かきかたは どれですか。',
  '母',
  '毎',
  '姉',
  '女',
  1,
  'はは는 어머니를 뜻하므로 올바른 표기는 母이다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '표기'
    and q.question = '「はは」の かきかたは どれですか。'
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
  '「ちち」の かきかたは どれですか。',
  '兄',
  '父',
  '男',
  '母',
  2,
  'ちち는 아버지를 뜻하므로 올바른 표기는 父이다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '표기'
    and q.question = '「ちち」の かきかたは どれですか。'
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
  '「あに」の かきかたは どれですか。',
  '姉',
  '兄',
  '弟',
  '父',
  2,
  'あに는 형이나 오빠를 뜻하므로 올바른 표기는 兄이다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '표기'
    and q.question = '「あに」の かきかたは どれですか。'
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
  '「あね」の かきかたは どれですか。',
  '姉',
  '兄',
  '母',
  '妹',
  1,
  'あね는 누나나 언니를 뜻하므로 올바른 표기는 姉이다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '표기'
    and q.question = '「あね」の かきかたは どれですか。'
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
  '「おとうと」の かきかたは どれですか。',
  '妹',
  '弟',
  '兄',
  '父',
  2,
  'おとうとは 남동생을 뜻하므로 올바른 표기는 弟이다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '표기'
    and q.question = '「おとうと」の かきかたは どれですか。'
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
  '「いもうと」の かきかたは どれですか。',
  '弟',
  '姉',
  '妹',
  '母',
  3,
  'いもうとは 여동생을 뜻하므로 올바른 표기는 妹이다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '표기'
    and q.question = '「いもうと」の かきかたは どれですか。'
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
  '「しろ」の かきかたは どれですか。',
  '赤',
  '黒',
  '白',
  '青',
  3,
  'しろ는 흰색을 뜻하므로 올바른 표기는 白이다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '표기'
    and q.question = '「しろ」の かきかたは どれですか。'
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
  '「くろ」の かきかたは どれですか。',
  '白',
  '青',
  '黒',
  '赤',
  3,
  'くろ는 검은색을 뜻하므로 올바른 표기는 黒이다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '표기'
    and q.question = '「くろ」の かきかたは どれですか。'
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
  '「あか」の かきかたは どれですか。',
  '赤',
  '青',
  '白',
  '黒',
  1,
  'あか는 빨간색을 뜻하므로 올바른 표기는 赤이다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '표기'
    and q.question = '「あか」の かきかたは どれですか。'
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
  '「あお」の かきかたは どれですか。',
  '白',
  '青',
  '黒',
  '空',
  2,
  'あお는 파란색을 뜻하므로 올바른 표기는 青이다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '표기'
    and q.question = '「あお」の かきかたは どれですか。'
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
  '「みぎ」の かきかたは どれですか。',
  '左',
  '右',
  '上',
  '下',
  2,
  'みぎ는 오른쪽을 뜻하므로 올바른 표기는 右이다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '표기'
    and q.question = '「みぎ」の かきかたは どれですか。'
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
  '「ひだり」の かきかたは どれですか。',
  '右',
  '下',
  '左',
  '中',
  3,
  'ひだり는 왼쪽을 뜻하므로 올바른 표기는 左이다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '표기'
    and q.question = '「ひだり」の かきかたは どれですか。'
);

-- single item 21
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
  '「うえ」の かきかたは どれですか。',
  '下',
  '上',
  '左',
  '右',
  2,
  'うえ는 위를 뜻하므로 올바른 표기는 上이다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '표기'
    and q.question = '「うえ」の かきかたは どれですか。'
);

-- single item 22
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
  '「した」の かきかたは どれですか。',
  '上',
  '右',
  '下',
  '外',
  3,
  'した는 아래를 뜻하므로 올바른 표기는 下이다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '표기'
    and q.question = '「した」の かきかたは どれですか。'
);

commit;
