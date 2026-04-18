begin;

-- generated from data/n5-batches/n5_grammar_judgement_batch_03.json
-- generated at 2026-04-17T13:45:44.449Z

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
  'これは私____本です。',
  'の',
  'が',
  'に',
  'を',
  1,
  '소유를 나타낼 때 ''の''를 사용한다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '판단'
    and q.question = 'これは私____本です。'
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
  'わたしは毎日学校____行きます。',
  'へ',
  'が',
  'を',
  'で',
  1,
  '''へ''를 사용하여 움직임의 방향을 나타낸다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '판단'
    and q.question = 'わたしは毎日学校____行きます。'
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
  '友達____話しました。',
  'と',
  'で',
  'が',
  'を',
  1,
  '''と''는 함께 하는 대상을 나타낼 때 쓴다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '판단'
    and q.question = '友達____話しました。'
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
  'きのう映画____見ました。',
  'を',
  'が',
  'に',
  'で',
  1,
  '''を''는 목적어를 나타낼 때 사용한다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '판단'
    and q.question = 'きのう映画____見ました。'
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
  '先生____教室にいます。',
  'は',
  'が',
  'を',
  'も',
  1,
  '''は''는 주제를 나타낼 때 사용하는 조사이다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '판단'
    and q.question = '先生____教室にいます。'
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
  'にほんご____はなせますか。',
  'が',
  'を',
  'で',
  'に',
  1,
  '가능이나 능력을 나타낼 때는 ''が''를 쓴다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '판단'
    and q.question = 'にほんご____はなせますか。'
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
  'テーブルの上____りんごがあります。',
  'に',
  'で',
  'を',
  'が',
  1,
  '존재의 위치를 나타낼 때 ''に''가 온다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '판단'
    and q.question = 'テーブルの上____りんごがあります。'
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
  '日曜日____どこに行きましたか。',
  'に',
  'が',
  'で',
  'を',
  1,
  '특정 날에는 ''に''를 쓴다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '판단'
    and q.question = '日曜日____どこに行きましたか。'
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
  '車____うちへ帰ります。',
  'で',
  'に',
  'が',
  'を',
  1,
  '교통수단에는 ''で''를 사용한다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '판단'
    and q.question = '車____うちへ帰ります。'
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
  '朝ごはん____食べましたか。',
  'を',
  'が',
  'で',
  'に',
  1,
  '''を''는 목적어를 나타낼 때 사용한다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '판단'
    and q.question = '朝ごはん____食べましたか。'
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
  '田中さん____来ます。',
  'も',
  'と',
  'に',
  'で',
  1,
  '''も''는 ''도''의 의미로, 앞서 온 사람과 같은 동작임을 나타낸다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '판단'
    and q.question = '田中さん____来ます。'
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
  '毎日コーヒー____飲みます。',
  'を',
  'が',
  'へ',
  'で',
  1,
  '''を''는 목적어를 나타낼 때 사용한다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '판단'
    and q.question = '毎日コーヒー____飲みます。'
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
  'ここ____日本語で話しましょう。',
  'で',
  'が',
  'を',
  'に',
  1,
  '행동이 일어나는 장소에는 ''で''를 쓴다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '판단'
    and q.question = 'ここ____日本語で話しましょう。'
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
  '宿題____しましたか。',
  'を',
  'が',
  'に',
  'で',
  1,
  '''を''는 목적어를 나타낼 때 사용한다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '판단'
    and q.question = '宿題____しましたか。'
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
  'お母さんは買い物____行きました。',
  'に',
  'で',
  'が',
  'を',
  1,
  '''~に 行く''는 ''~하러 가다''의 의미이다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '판단'
    and q.question = 'お母さんは買い物____行きました。'
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
  'いぬ____ねこがいます。',
  'と',
  'で',
  'を',
  'が',
  1,
  '''と''는 명사와 명사를 나열할 때 쓴다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '판단'
    and q.question = 'いぬ____ねこがいます。'
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
  'この花はきれい____ですね。',
  'な',
  'の',
  'で',
  'が',
  1,
  '''きれい''는 な형용사이므로 명사 앞에서 ''な''를 붙인다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '판단'
    and q.question = 'この花はきれい____ですね。'
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
  '문법',
  '판단',
  'ノートはカバン____中にあります。',
  'の',
  'が',
  'を',
  'と',
  1,
  '위치 명사를 꾸밀 때 ''の''를 사용한다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '판단'
    and q.question = 'ノートはカバン____中にあります。'
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
  '문법',
  '판단',
  '毎朝６時____起きます。',
  'に',
  'で',
  'の',
  'が',
  1,
  '시간에는 ''に''를 쓴다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '판단'
    and q.question = '毎朝６時____起きます。'
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
  '문법',
  '판단',
  '東京から大阪____新幹線で行きます。',
  'まで',
  'で',
  'に',
  'を',
  1,
  '''から'' ~ ''まで''는 출발점과 종착점을 나타낸다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '판단'
    and q.question = '東京から大阪____新幹線で行きます。'
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
  '문법',
  '판단',
  'わたし____学生です。',
  'は',
  'が',
  'を',
  'の',
  1,
  '''は''는 주제(주어)에 쓰인다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '판단'
    and q.question = 'わたし____学生です。'
);

commit;
