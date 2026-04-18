begin;

-- generated from data/n5-batches/n5_grammar_judgement_batch_04.json
-- generated at 2026-04-17T13:54:01.462Z

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
  '문법',
  '판단',
  'わたしは　毎日　学校____行きます。',
  'に',
  'で',
  'は',
  'を',
  1,
  '장소+に+이동동사(行きます)의 기본적인 형식입니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '판단'
    and q.question = 'わたしは　毎日　学校____行きます。'
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
  '문법',
  '판단',
  'きのう　友だち____　あいました。',
  'に',
  'が',
  'で',
  'を',
  1,
  '만나다(あう)는 만나는 대상을 に 로 표시하는 동사입니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '판단'
    and q.question = 'きのう　友だち____　あいました。'
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
  '문법',
  '판단',
  '日本語____　勉強しています。',
  'を',
  'で',
  'に',
  'が',
  1,
  '공부(べんきょう)하다의 목적어는 を 를 사용합니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '판단'
    and q.question = '日本語____　勉強しています。'
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
  '문법',
  '판단',
  'この本____　おもしろいです。',
  'は',
  'を',
  'に',
  'が',
  1,
  '주제(제목)는 は 를 사용합니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '판단'
    and q.question = 'この本____　おもしろいです。'
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
  '문법',
  '판단',
  'わたし____　名前は　山田です。',
  'の',
  'が',
  'に',
  'と',
  1,
  'わたしの名前(내 이름)은 소유를 나타내는 の 사용이 맞습니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '판단'
    and q.question = 'わたし____　名前は　山田です。'
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
  '문법',
  '판단',
  '教室____　先生が　います。',
  'に',
  'で',
  'を',
  'が',
  1,
  '존재(있다, います)는 장소+に를 씁니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '판단'
    and q.question = '教室____　先生が　います。'
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
  '문법',
  '판단',
  '昼ごはんを　食べ____、図書館へ　行きます。',
  'て',
  'たくて',
  'ます',
  'が',
  1,
  '연결(…하고)에는 동사의 て형 접속을 사용합니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '판단'
    and q.question = '昼ごはんを　食べ____、図書館へ　行きます。'
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
  '문법',
  '판단',
  '犬が　外____　走っています。',
  'を',
  'で',
  'に',
  'と',
  1,
  '이동 경로(외부)를 나타낼 때는 ''を''를 사용합니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '판단'
    and q.question = '犬が　外____　走っています。'
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
  '문법',
  '판단',
  'これは　父____　時計です。',
  'の',
  'に',
  'と',
  'が',
  1,
  '소유, 소속을 나타낼 때는 の를 사용합니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '판단'
    and q.question = 'これは　父____　時計です。'
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
  '문법',
  '판단',
  '山田さん____　教師です。',
  'は',
  'に',
  'で',
  'と',
  1,
  '주어를 나타내는 조사로, 직업을 설명할 때는 は를 사용합니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '판단'
    and q.question = '山田さん____　教師です。'
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
  '문법',
  '판단',
  'わたしは　昨日　映画____　見ました。',
  'を',
  'で',
  'が',
  'の',
  1,
  '목적어(영화)를 나타낼 때는 ''を''를 사용합니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '판단'
    and q.question = 'わたしは　昨日　映画____　見ました。'
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
  '문법',
  '판단',
  '毎週土曜日に　テニス____　します。',
  'を',
  'で',
  'が',
  'の',
  1,
  '운동이나 행위의 대상을 나타내기 위해 ''を''를 사용합니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '판단'
    and q.question = '毎週土曜日に　テニス____　します。'
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
  '문법',
  '판단',
  '部屋____　きれいです。',
  'が',
  'は',
  'を',
  'に',
  1,
  '형용사 서술문에서 주어로 ''が''를 사용할 수 있습니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '판단'
    and q.question = '部屋____　きれいです。'
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
  '문법',
  '판단',
  '私は　本田さん____　話しました。',
  'と',
  'が',
  'を',
  'に',
  1,
  '상대와 함께 하는 행동에는 ''と''를 사용합니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '판단'
    and q.question = '私は　本田さん____　話しました。'
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
  '문법',
  '판단',
  '机の上____　ノートがあります。',
  'に',
  'を',
  'が',
  'の',
  1,
  '''〜の上に''(~위에)와 같이 위치를 나타낼 때는 ''に''입니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '판단'
    and q.question = '机の上____　ノートがあります。'
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
  '문법',
  '판단',
  'ごはんを　たべ____から、でかけます。',
  'て',
  'たくて',
  'ます',
  'が',
  1,
  '…을 하고 나서, 는 동사의 て형에 ''から''를 붙입니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '판단'
    and q.question = 'ごはんを　たべ____から、でかけます。'
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
  '문법',
  '판단',
  '今朝　六時____　起きました。',
  'に',
  'で',
  'が',
  'を',
  1,
  '시간을 나타낼 때는 ''に''를 사용합니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '판단'
    and q.question = '今朝　六時____　起きました。'
);

commit;
