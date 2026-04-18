begin;

-- generated from data/n5-batches/n5_grammar_judgement_batch_05.json
-- generated at 2026-04-17T14:33:56.221Z

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
  '문법',
  '판단',
  'きのうは雨が ____ いました。',
  'ふって',
  'ふりて',
  'ふるて',
  'ふて',
  1,
  '동사 ''ふる(내리다)''의 ~て형은 ''ふって''이다.',
  2,
  1
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '판단'
    and q.question = 'きのうは雨が ____ いました。'
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
  '문법',
  '판단',
  'あそこで本を ____ のは田中さんです。',
  'よんでいる',
  'よむいる',
  'よんでる',
  'よんでい',
  1,
  '진행을 나타내는 표현은 동사〜ている, 즉 ''よんでいる''이다.',
  3,
  1
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '판단'
    and q.question = 'あそこで本を ____ のは田中さんです。'
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
  '문법',
  '판단',
  '____ から来ましたか。',
  'どこ',
  'なに',
  'どんな',
  'いつ',
  1,
  '출신을 물을 때는 ''どこから''를 사용한다.',
  1,
  0.8
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '판단'
    and q.question = '____ から来ましたか。'
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
  '문법',
  '판단',
  '田中さんは日本語が ____。',
  'じょうずです',
  'じょうずに',
  'じょうずだ',
  'じょうずが',
  1,
  '''~がじょうずです''가 올바른 문장 구조이다.',
  2,
  0.93
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '판단'
    and q.question = '田中さんは日本語が ____。'
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
  '문법',
  '판단',
  '昨日、友だちと ____ 。',
  'あそびました',
  'あそびて',
  'あそぶます',
  'あそんで',
  1,
  '동사의 과거형은 ''~ました''를 사용한다.',
  1,
  0.82
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '판단'
    and q.question = '昨日、友だちと ____ 。'
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
  '문법',
  '판단',
  'この本はとても ____ です。',
  'おもしろい',
  'おもしろな',
  'おもしろく',
  'おもしろで',
  1,
  'い형용사의 정식 활용은 ''おもしろい''다.',
  2,
  0.92
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '판단'
    and q.question = 'この本はとても ____ です。'
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
  '문법',
  '판단',
  '朝ごはんを ____ から学校へ行きます。',
  '食べて',
  '食べ',
  '食べる',
  '食べた',
  1,
  '앞 문장에 동사 ~て형이 와야 다음 동작을 이어 나열할 수 있다.',
  3,
  1.05
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '판단'
    and q.question = '朝ごはんを ____ から学校へ行きます。'
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
  '문법',
  '판단',
  '日本へ行ったことが ____ か。',
  'あります',
  'います',
  'ありまし',
  'あます',
  1,
  '''~ことがある''에서 동사 ''ある''의 정식 활용은 ''あります''이다.',
  3,
  1
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '판단'
    and q.question = '日本へ行ったことが ____ か。'
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
  '문법',
  '판단',
  'へやにねこが ____ います。',
  '二ひき',
  '二まい',
  '二にん',
  '二さつ',
  1,
  '동물의 수를 셀 때는 ''ひき''를 사용한다.',
  3,
  1.01
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '판단'
    and q.question = 'へやにねこが ____ います。'
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
  '문법',
  '판단',
  'りんごとバナナ ____ 好きです。',
  'が',
  'で',
  'の',
  'を',
  1,
  '복수의 것들에 대해 ''~が好きです''를 사용할 수 있다.',
  2,
  0.91
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '판단'
    and q.question = 'りんごとバナナ ____ 好きです。'
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
  '문법',
  '판단',
  'この文を ____ ください。',
  '読んで',
  '読むて',
  '読んでる',
  '読んだで',
  1,
  '명령이나 청유는 동사 ~てください 활용이 정확하다.',
  2,
  0.9
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '판단'
    and q.question = 'この文を ____ ください。'
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
  '문법',
  '판단',
  'きょうは日曜日 ____。',
  'です',
  'だ',
  'ます',
  'ので',
  1,
  '명사문 공식 종결은 ''です''가 적절하다.',
  1,
  0.81
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '판단'
    and q.question = 'きょうは日曜日 ____。'
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
  '문법',
  '판단',
  '私はコーヒーが ____。',
  '好きです',
  '好きに',
  '好きだ',
  '好きで',
  1,
  '''~が好きです'' 문형이 바른 표현이다.',
  2,
  0.95
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '판단'
    and q.question = '私はコーヒーが ____。'
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
  '문법',
  '판단',
  '先週の土曜日、私は山へ ____。',
  '行きました',
  '行きます',
  '行くます',
  '行いた',
  1,
  '과거 서술은 ''~ました''를 사용해야 한다.',
  2,
  0.93
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '판단'
    and q.question = '先週の土曜日、私は山へ ____。'
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
  '문법',
  '판단',
  '田中さんは学生 ____ 先生ですか。',
  'か',
  'や',
  'も',
  'で',
  1,
  '선택의 2가지는 ''AかB'' 로 나열한다.',
  2,
  0.9
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '판단'
    and q.question = '田中さんは学生 ____ 先生ですか。'
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
  '문법',
  '판단',
  '今朝は早く ____。',
  '起きました',
  '起きます',
  '起きまし',
  '起きるた',
  1,
  '''일어나다''의 과거형은 ''起きました''가 맞는다.',
  2,
  0.85
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '판단'
    and q.question = '今朝は早く ____。'
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
  '문법',
  '판단',
  'お茶を ____ のが好きです。',
  '飲む',
  '飲ん',
  '飲みる',
  '飲ます',
  1,
  '동사 기본형 + のが好きです'' 구조가 맞다.',
  3,
  1
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '판단'
    and q.question = 'お茶を ____ のが好きです。'
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
  '문법',
  '판단',
  '午後5時に ____ ください。',
  '来て',
  '来るて',
  '来たい',
  '来んで',
  1,
  '~てください는 부탁을 나타낸다.',
  2,
  0.97
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '판단'
    and q.question = '午後5時に ____ ください。'
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
  '문법',
  '판단',
  'パソコンを ____ ことができますか。',
  '使う',
  '使って',
  '使て',
  '使うで',
  1,
  '''동사 기본형 + ことができます''는 ''할 수 있다''라는 의미가 된다.',
  3,
  1.04
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '판단'
    and q.question = 'パソコンを ____ ことができますか。'
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
  '문법',
  '판단',
  'この道をまっすぐ ____ 行きます。',
  '行って',
  '行き',
  '行くて',
  '行た',
  1,
  '나열하여 동작을 연결할 때는 동사 ~て형이 기본이다.',
  3,
  1.03
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '판단'
    and q.question = 'この道をまっすぐ ____ 行きます。'
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
  '문법',
  '판단',
  '明日までにレポートを ____ ください。',
  '出して',
  '出すで',
  '出しで',
  '出すて',
  1,
  '부탁할 때 동사 ~て형 + ください를 사용한다.',
  4,
  1.14
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '판단'
    and q.question = '明日までにレポートを ____ ください。'
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
  explanation,
  difficulty,
  recommendation_weight
)
select
  'N5',
  '문법',
  '판단',
  '朝、何を ____ ましたか。',
  '食べ',
  '食べる',
  '食べて',
  '食べた',
  1,
  '''동사ます형의 앞부분(ます줄)''이 문장서 의문문에서도 쓰인다.',
  5,
  1.22
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '판단'
    and q.question = '朝、何を ____ ましたか。'
);

commit;
