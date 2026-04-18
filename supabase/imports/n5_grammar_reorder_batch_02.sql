begin;

-- generated from data/n5-batches/n5_grammar_reorder_batch_02.json
-- generated at 2026-04-16T14:11:43.155Z

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
  '배열',
  'あの ていしゃば は ____。',
  'しょうがっこうの ちかくです',
  'しょうがっこう ちかくです',
  'しょうがっこうに ちかくです',
  'しょうがっこうと ちかくです',
  1,
  '위치를 나타낼 때 ''の'' 관계사를 사용하는 것이 자연스럽다. ''그 정류장은 초등학교 근처입니다''.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '배열'
    and q.question = 'あの ていしゃば は ____。'
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
  '배열',
  'けっこんしきに ____。',
  'いきたいです',
  'いきたい です',
  'いき たい です',
  'いく たい です',
  1,
  '''たい'' 요망형은 동사에 바로 붙어서 ''~したい''를 만든다. ''결혼식에 가고 싶습니다''.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '배열'
    and q.question = 'けっこんしきに ____。'
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
  '배열',
  'コーヒーより ____。',
  'こうちゃが すきです',
  'こうちゃの すきです',
  'こうちゃを すきです',
  'こうちゃに すきです',
  1,
  '''が''는 선호도나 감정 표현에서 주어를 나타낸다. ''홍차가 더 좋습니다''.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '배열'
    and q.question = 'コーヒーより ____。'
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
  '배열',
  'いえの ちかくに ____。',
  'コンビニが あります',
  'コンビニを あります',
  'コンビニに あります',
  'コンビニで あります',
  1,
  '존재하는 것을 나타낼 때 주어는 ''が''를 사용한다. ''집 근처에 편의점이 있습니다''.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '배열'
    and q.question = 'いえの ちかくに ____。'
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
  '배열',
  'せんせいが がっこうで ____。',
  'よんでいました',
  'よんでました',
  'よみています',
  'よみました',
  1,
  '진행 상태의 과거를 나타낼 때 ''〜ていました'' 형태를 사용한다. ''선생님이 학교에서 읽고 있었습니다''.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '배열'
    and q.question = 'せんせいが がっこうで ____。'
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
  '배열',
  'もうすぐ ____。',
  'あめが ふるでしょう',
  'あめに ふるでしょう',
  'あめを ふるでしょう',
  'あめて ふるでしょう',
  1,
  '자연 현상에서는 주어가 ''が''를 취한다. ''곧 비가 내릴 것 같습니다''.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '배열'
    and q.question = 'もうすぐ ____。'
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
  '배열',
  'ビールを ____。',
  'のむことが できます',
  'のむ ことが できます',
  'のむこと できます',
  'のん ことが できます',
  1,
  '수행 가능함을 나타낼 때 ''noun form + ことが できる'' 구조를 사용한다. ''맥주를 마실 수 있습니다''.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '배열'
    and q.question = 'ビールを ____。'
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
  '배열',
  'えきから うちまで ____。',
  '30ぷんで いきます',
  '30ぷんに いきます',
  '30ぷんと いきます',
  '30ぷんの いきます',
  1,
  '소요 시간을 나타낼 때 ''で''를 사용한다. ''역에서 집까지 30분에 갑니다''.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '배열'
    and q.question = 'えきから うちまで ____。'
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
  '배열',
  'あククション かっこいいから ____。',
  'すきです',
  'すき です',
  'すきました',
  'すきなです',
  1,
  '선호도는 ''な'' 형용사 ''好き''로 표현하고 정중형으로 ''です''를 붙인다. ''악수가 멋져서 좋습니다''.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '배열'
    and q.question = 'あククション かっこいいから ____。'
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
  '배열',
  'けしゴムで えんぴつの あと を ____。',
  'けします',
  'けしました',
  'けしています',
  'けしてください',
  1,
  '습관이나 반복되는 액션은 보통형/정중형을 사용한다. ''지우개로 연필 자국을 지웁니다''.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '배열'
    and q.question = 'けしゴムで えんぴつの あと を ____。'
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
  '배열',
  'ねずみは ____。',
  'ちいさくて かわいいです',
  'ちいさく かわいいです',
  'ちいさいで かわいいです',
  'ちいさくで かわいいです',
  1,
  '형용사 연결은 ''く'' 형태로 바꿔 접속한다. ''쥐는 작고 귀엽습니다''.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '배열'
    and q.question = 'ねずみは ____。'
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
  '배열',
  'でんしゃは ____。',
  'こむでしょう',
  'こむだろう',
  'こむだもん',
  'こむでしょうね',
  1,
  '추측이나 예상을 나타낼 때 ''でしょう''를 정중형으로 사용한다. ''기차는 붐빌 것입니다''.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '배열'
    and q.question = 'でんしゃは ____。'
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
  '배열',
  'さんぽが ____。',
  'すきです',
  'するです',
  'いきます',
  'つくります',
  1,
  '선호도는 ''すき''로 표현한다. ''산책이 좋습니다''.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '배열'
    and q.question = 'さんぽが ____。'
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
  '배열',
  'せんせいが ____。',
  'えいごを おしえています',
  'えいごで おしえています',
  'えいごを おしえていました',
  'えいごて おしえています',
  1,
  '현재의 영구적 직업이나 상태를 나타낼 때 ''ています'' 형태를 사용한다. ''선생님이 영어를 가르치고 있습니다''.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '배열'
    and q.question = 'せんせいが ____。'
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
  '배열',
  'うどんを ____。',
  'つくりました',
  'つくった',
  'つくります',
  'つくるた',
  1,
  '이미 완료된 사실은 과거형으로 표현한다. ''우동을 만들었습니다''.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '배열'
    and q.question = 'うどんを ____。'
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
  '배열',
  'ねこの ____。',
  'みみが ながいです',
  'みみが ながくです',
  'みみを ながいです',
  'みみで ながいです',
  1,
  '소유격 ''の''와 선술어 ''형용사 + が''를 함께 사용한다. ''고양이의 귀가 길다''.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '배열'
    and q.question = 'ねこの ____。'
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
  '배열',
  'りんごは ____。',
  'あかいあ あまいです',
  'あかくて あまいです',
  'あかいで あまいです',
  'あかいと あまいです',
  2,
  '두 형용사를 연결할 때는 ''くて'' 형태를 사용한다. ''사과는 빨갛고 달콤합니다''.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '배열'
    and q.question = 'りんごは ____。'
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
  '배열',
  'かいしゃから ____。',
  'うちへ もどります',
  'うちを もどります',
  'うちで もどります',
  'うちと もどります',
  1,
  '목적지를 나타낼 때 ''へ''를 사용한다. ''회사에서 집으로 돌아갑니다''.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '배열'
    and q.question = 'かいしゃから ____。'
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
  '배열',
  'あした ____。',
  'あめが ふるかもしれません',
  'あめを ふるかもしれません',
  'あめに ふるかもしれません',
  'あめて ふるかもしれません',
  1,
  '''かもしれません''는 가능성을 나타낸다. ''내일 비가 올 수도 있습니다''.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '배열'
    and q.question = 'あした ____。'
);

commit;
