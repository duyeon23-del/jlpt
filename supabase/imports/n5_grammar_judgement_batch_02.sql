begin;

-- generated from data/n5-batches/n5_grammar_judgement_batch_02.json
-- generated at 2026-04-16T14:09:04.834Z

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
  'すしは おいしい から、また ____。',
  'あげます',
  'たべます',
  'のみます',
  'もらいます',
  2,
  '문맥상 ''또 먹다''가 자연스럽다. ''から''로 인한 결과액션을 기술한다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '판단'
    and q.question = 'すしは おいしい から、また ____。'
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
  'パーティーに ともだちも ____ きます。',
  'と',
  'へ',
  'を',
  'に',
  1,
  '같은 대상을 포함할 때는 ''も''를 쓰고, 함께(동반)를 나타낼 때는 ''と'' 조사를 사용한다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '판단'
    and q.question = 'パーティーに ともだちも ____ きます。'
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
  'かれは りょうりが ____ から、いつも たのみます。',
  'できます',
  'じょうずです',
  'つくります',
  'たべます',
  2,
  '능력이나 솜씨를 표현할 때는 ''上手です''를 사용한다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '판단'
    and q.question = 'かれは りょうりが ____ から、いつも たのみます。'
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
  'あの みせの らーめんは あじが ____ です。',
  'こい',
  'からい',
  'あたたかい',
  'つめたい',
  2,
  '라면의 맛 특성을 나타낼 때 ''辛い(からい)''가 자연스럽다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '판단'
    and q.question = 'あの みせの らーめんは あじが ____ です。'
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
  'しゅくだいを ____ から、あしたの あさ もち きます。',
  'します',
  'していません',
  'しました',
  'していますか',
  3,
  '이미 완료된 사실을 이유로 들 때는 과거형 ''しました''를 사용한다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '판단'
    and q.question = 'しゅくだいを ____ から、あしたの あさ もち きます。'
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
  'にほんご の べんきょうは むずかい ____ 、がんばります。',
  'けれど',
  'けど',
  'から',
  'ので',
  2,
  '앞뒤 의미가 모순되는 문법 표현을 나타낼 때 ''けど''(또는 ''けれど'')를 사용한다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '판단'
    and q.question = 'にほんご の べんきょうは むずかい ____ 、がんばります。'
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
  'えきは ここ ____ 5ふん です。',
  'を',
  'で',
  'から',
  'まで',
  3,
  '기점을 나타낼 때는 ''から''를 사용한다. ''여기서 5분''의 의미.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '판단'
    and q.question = 'えきは ここ ____ 5ふん です。'
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
  'さいふを かしてくれない ____?',
  'か',
  'ね',
  'よ',
  'わ',
  1,
  '물어보는 문장을 만들 때는 의문 조사 ''か''를 사용한다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '판단'
    and q.question = 'さいふを かしてくれない ____?'
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
  'さっぽろ ____ とうきょう まで の きっぷを ください。',
  'を',
  'へ',
  'から',
  'に',
  3,
  '출발지를 나타낼 때는 ''から''를 사용한다. ''삿포로에서 도쿄까지의 표''.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '판단'
    and q.question = 'さっぽろ ____ とうきょう まで の きっぷを ください。'
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
  'ねこが やすい ところで ____。',
  'ねています',
  'ねます',
  'ねました',
  'ねている',
  1,
  '현재 진행중인 상태를 나타낼 때는 ''〜ています''를 사용한다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '판단'
    and q.question = 'ねこが やすい ところで ____。'
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
  'きって ____ 50えん です。',
  'は',
  'を',
  'で',
  'が',
  1,
  '주제를 나타낼 때 ''は''를 사용한다. ''우표는 50엔입니다''의 의미.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '판단'
    and q.question = 'きって ____ 50えん です。'
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
  'ぎゅうにゅう を のみ ____ 、げんきに なりました。',
  'て',
  'ましょう',
  'ます',
  'ました',
  4,
  '''のみて''는 음식을 마진 후 건강해져라는 의미의 연결 표현이다. 과거형 ''ました''가 맞다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '판단'
    and q.question = 'ぎゅうにゅう を のみ ____ 、げんきに なりました。'
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
  'このしゃしん ____ だれが とりました か。',
  'は',
  'を',
  'に',
  'が',
  1,
  '문장의 주제를 나타낼 때 ''は''를 사용한다. ''이 사진은 누가 찍었나요?'''
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '판단'
    and q.question = 'このしゃしん ____ だれが とりました か。'
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
  'まど を ____、ねつい です。',
  'あけました',
  'あけます',
  'あける',
  'あけて',
  4,
  '''て'' 형태로 연결하면 앞뒤 액션이 자연스럽게 연결된다. ''창을 열어서 열었다''.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '판단'
    and q.question = 'まど を ____、ねつい です。'
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
  'ほんを よむ ことが できます ____。',
  'ね',
  'か',
  'よ',
  'わ',
  2,
  '상대방에게 의견을 구할 때 의문 조사 ''か''를 문장 끝에 붙인다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '판단'
    and q.question = 'ほんを よむ ことが できます ____。'
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
  'かいしゃを 8じに ____。',
  'いきました',
  'きました',
  'いきます',
  'きます',
  3,
  '미래 예정을 표현하려면 정중형 미래 ''いきます''를 사용한다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '판단'
    and q.question = 'かいしゃを 8じに ____。'
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
  'せんせいが がっこう ____ がくせいが あります。',
  'で',
  'に',
  'へ',
  'を',
  2,
  '존재하는 장소를 나타낼 때 ''に''를 사용한다. ''학교에 학생이 있습니다''.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '판단'
    and q.question = 'せんせいが がっこう ____ がくせいが あります。'
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
  'あの ひと ____ にほんじん です か。',
  'は',
  'を',
  'に',
  'で',
  1,
  '주제를 나타낼 때 ''は''를 사용한다. ''그 사람은 일본인인가요?'''
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '판단'
    and q.question = 'あの ひと ____ にほんじん です か。'
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
  'いもうとに あめを ____ あげました。',
  'を',
  'に',
  'で',
  'から',
  1,
  '직접 목적어를 나타낼 때 ''を''를 사용한다. ''여동생에게 사탕을 주었다''.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '판단'
    and q.question = 'いもうとに あめを ____ あげました。'
);

commit;
