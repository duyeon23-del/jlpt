begin;

-- generated from data/n5-batches/n5_vocab_notation_batch_05.json
-- generated at 2026-04-17T14:33:22.968Z

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
  '표기',
  '다음 중 ____의 올바른 히라가나는 무엇입니까? さかな',
  'さかな',
  'さなか',
  'さかね',
  'さけな',
  1,
  'さかな는 ''물고기'' 뜻의 히라가나 표기입니다.',
  1,
  0.88
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '표기'
    and q.question = '다음 중 ____의 올바른 히라가나는 무엇입니까? さかな'
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
  explanation,
  difficulty,
  recommendation_weight
)
select
  'N5',
  '문자·어휘',
  '표기',
  '아래 중 ____에 알맞은 한자를 고르세요: 水(みず)',
  '水',
  '火',
  '木',
  '土',
  1,
  '''みず''는 ''수(水)''를 한자로 씁니다.',
  2,
  0.92
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '표기'
    and q.question = '아래 중 ____에 알맞은 한자를 고르세요: 水(みず)'
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
  explanation,
  difficulty,
  recommendation_weight
)
select
  'N5',
  '문자·어휘',
  '표기',
  '다음 한국어 단어에 대한 ____의 가타카나 표기는? テレビ(텔레비전)',
  'テレビ',
  'テレヒ',
  'テレベ',
  'テレミ',
  1,
  '텔레비전은 일본어로 テレビ라고 가타카나로 표기합니다.',
  2,
  0.96
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '표기'
    and q.question = '다음 한국어 단어에 대한 ____의 가타카나 표기는? テレビ(텔레비전)'
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
  explanation,
  difficulty,
  recommendation_weight
)
select
  'N5',
  '문자·어휘',
  '표기',
  '다음 중 ____의 올바른 한자 표기는 무엇입니까? ひと',
  '人',
  '口',
  '天',
  '目',
  1,
  'ひと(사람)은 일본어로 人 입니다.',
  2,
  0.95
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '표기'
    and q.question = '다음 중 ____의 올바른 한자 표기는 무엇입니까? ひと'
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
  explanation,
  difficulty,
  recommendation_weight
)
select
  'N5',
  '문자·어휘',
  '표기',
  '____에 들어갈 알맞은 히라가나는? おちゃ',
  'おちゃ',
  'おさ',
  'おけ',
  'おし',
  1,
  '''おちゃ''는 ''차(茶)''를 히라가나로 쓴 것입니다.',
  2,
  0.95
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '표기'
    and q.question = '____에 들어갈 알맞은 히라가나는? おちゃ'
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
  explanation,
  difficulty,
  recommendation_weight
)
select
  'N5',
  '문자·어휘',
  '표기',
  '____의 가타카나 표기는 무엇입니까? パン(빵)',
  'パン',
  'バン',
  'ペン',
  'ピン',
  1,
  '''빵''은 일본어로 외래어 표기 파(パ)+응(ン)으로 나타냅니다.',
  2,
  0.93
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '표기'
    and q.question = '____의 가타카나 표기는 무엇입니까? パン(빵)'
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
  explanation,
  difficulty,
  recommendation_weight
)
select
  'N5',
  '문자·어휘',
  '표기',
  '____에 해당하는 한자는? みみ',
  '耳',
  '目',
  '口',
  '手',
  1,
  '''みみ''는 귀를 의미하는 한자 ''耳''입니다.',
  2,
  0.94
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '표기'
    and q.question = '____에 해당하는 한자는? みみ'
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
  explanation,
  difficulty,
  recommendation_weight
)
select
  'N5',
  '문자·어휘',
  '표기',
  '일본어 ____에 들어갈 알맞은 히라가나는? うみ(바다)',
  'うみ',
  'うま',
  'うも',
  'うめ',
  1,
  '''うみ''는 ''바다''라는 뜻입니다.',
  2,
  0.95
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '표기'
    and q.question = '일본어 ____에 들어갈 알맞은 히라가나는? うみ(바다)'
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
  explanation,
  difficulty,
  recommendation_weight
)
select
  'N5',
  '문자·어휘',
  '표기',
  '다음 중 ____의 한자 표기는? みち',
  '道',
  '町',
  '村',
  '田',
  1,
  'みち(길)은 ''道''로 표기합니다.',
  2,
  0.97
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '표기'
    and q.question = '다음 중 ____의 한자 표기는? みち'
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
  explanation,
  difficulty,
  recommendation_weight
)
select
  'N5',
  '문자·어휘',
  '표기',
  '다음 단어의 ____ 표기는 어느 것입니까? そら(하늘)',
  'そら',
  'そらい',
  'そり',
  'さら',
  1,
  'そら(하늘)은 히라가나로 そら라고 씁니다.',
  2,
  0.93
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '표기'
    and q.question = '다음 단어의 ____ 표기는 어느 것입니까? そら(하늘)'
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
  explanation,
  difficulty,
  recommendation_weight
)
select
  'N5',
  '문자·어휘',
  '표기',
  '아래 중 ____에 알맞은 한자를 고르세요: 山(やま)',
  '山',
  '川',
  '林',
  '田',
  1,
  '''やま''는 ''산(山)''의 한자입니다.',
  2,
  0.95
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '표기'
    and q.question = '아래 중 ____에 알맞은 한자를 고르세요: 山(やま)'
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
  explanation,
  difficulty,
  recommendation_weight
)
select
  'N5',
  '문자·어휘',
  '표기',
  '다음 중 ____의 올바른 히라가나는? まど',
  'まど',
  'まどら',
  'まだ',
  'まろ',
  1,
  '''まど''는 ''창문''을 뜻하는 히라가나 표기입니다.',
  2,
  0.92
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '표기'
    and q.question = '다음 중 ____의 올바른 히라가나는? まど'
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
  explanation,
  difficulty,
  recommendation_weight
)
select
  'N5',
  '문자·어휘',
  '표기',
  '‘학교’를 의미하는 한자 ____는 무엇입니까? がっこう',
  '学校',
  '学科',
  '校学',
  '高校',
  1,
  '''학교''는 일본어로 学校로 표기합니다.',
  2,
  0.99
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '표기'
    and q.question = '‘학교’를 의미하는 한자 ____는 무엇입니까? がっこう'
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
  explanation,
  difficulty,
  recommendation_weight
)
select
  'N5',
  '문자·어휘',
  '표기',
  '다음 중 ____의 가타카나 표기는? アイコン(아이콘)',
  'アイコン',
  'アコン',
  'アイコソ',
  'イコン',
  1,
  '''아이콘''은 일본어로 アイコン입니다.',
  3,
  1
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '표기'
    and q.question = '다음 중 ____의 가타카나 표기는? アイコン(아이콘)'
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
  explanation,
  difficulty,
  recommendation_weight
)
select
  'N5',
  '문자·어휘',
  '표기',
  '____에 들어갈 히라가나는 무엇입니까? きたない(더럽다)',
  'きたない',
  'きたなえ',
  'きたいな',
  'きたえ',
  1,
  'きたない는 ''더럽다''의 올바른 일본어 표기입니다.',
  3,
  1.04
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '표기'
    and q.question = '____에 들어갈 히라가나는 무엇입니까? きたない(더럽다)'
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
  explanation,
  difficulty,
  recommendation_weight
)
select
  'N5',
  '문자·어휘',
  '표기',
  '다음 중 ‘시계’의 올바른 ____ 한자 표기는? とけい',
  '時計',
  '時送',
  '時紙',
  '時光',
  1,
  'とけい는 ''시계''를 의미하며 ''時計''로 씁니다.',
  3,
  1.01
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '표기'
    and q.question = '다음 중 ‘시계’의 올바른 ____ 한자 표기는? とけい'
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
  explanation,
  difficulty,
  recommendation_weight
)
select
  'N5',
  '문자·어휘',
  '표기',
  '____의 히라가나 표기는 어떻게 됩니까? 友達',
  'ともだち',
  'とまだち',
  'ともちだ',
  'ともだし',
  1,
  '''友達''는 ''ともだち''로 읽습니다.',
  3,
  0.98
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '표기'
    and q.question = '____의 히라가나 표기는 어떻게 됩니까? 友達'
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
  explanation,
  difficulty,
  recommendation_weight
)
select
  'N5',
  '문자·어휘',
  '표기',
  '‘학교’의 반대말인 ____의 올바른 한자 표기는? 家(うち)',
  '家',
  '車',
  '金',
  '駅',
  1,
  'うち(집)은 일본어로 家입니다.',
  3,
  1
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '표기'
    and q.question = '‘학교’의 반대말인 ____의 올바른 한자 표기는? 家(うち)'
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
  explanation,
  difficulty,
  recommendation_weight
)
select
  'N5',
  '문자·어휘',
  '표기',
  '아래 중 ‘전철’의 ____ 한자 표기는 무엇입니까? でんしゃ',
  '電車',
  '電気',
  '車電',
  '電水',
  1,
  'でんしゃ(전철)는 전기를 뜻하는 ''電''과 차를 뜻하는 ''車''가 결합된 단어입니다.',
  3,
  1.02
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '표기'
    and q.question = '아래 중 ‘전철’의 ____ 한자 표기는 무엇입니까? でんしゃ'
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
  explanation,
  difficulty,
  recommendation_weight
)
select
  'N5',
  '문자·어휘',
  '표기',
  '일본어 ‘의자’의 올바른 ____ 표기는? いす',
  'いす',
  'いく',
  'いず',
  'いし',
  1,
  '''의자''는 일본어로 いす라고 표기합니다.',
  2,
  0.94
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '표기'
    and q.question = '일본어 ‘의자’의 올바른 ____ 표기는? いす'
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
  explanation,
  difficulty,
  recommendation_weight
)
select
  'N5',
  '문자·어휘',
  '표기',
  '다음 중 ____의 정답 한자 표기는? いぬ(개)',
  '犬',
  '犬丸',
  '犬田',
  '犬山',
  1,
  '''いぬ''는 ''개''이며, 한자 ''犬''로 표기합니다.',
  5,
  1.18
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '표기'
    and q.question = '다음 중 ____의 정답 한자 표기는? いぬ(개)'
);

commit;
