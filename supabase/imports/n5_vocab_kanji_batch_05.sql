begin;

-- generated from data/n5-batches/n5_vocab_kanji_batch_05.json
-- generated at 2026-04-17T14:32:38.535Z

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
  '「学校」의 읽기를 ____ 에 알맞게 고르세요.',
  'がっこう',
  'がくもん',
  'がっかい',
  'がくせい',
  1,
  '「学校」의 올바른 읽기는 がっこう입니다. 자주 쓰이는 단어입니다.',
  1,
  0.8
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '한자 읽기'
    and q.question = '「学校」의 읽기를 ____ 에 알맞게 고르세요.'
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
  '한자 읽기',
  '오늘은 ____ 友だちと会います.',
  'ともだち',
  'ゆうじん',
  'せんせい',
  'かいしゃ',
  1,
  '「友」는 ''친구''의 의미로, 기본적으로 ''とも''라고 읽습니다.',
  2,
  0.93
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '한자 읽기'
    and q.question = '오늘은 ____ 友だちと会います.'
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
  '한자 읽기',
  '____ 本を読みます。',
  'ほん',
  'ぼん',
  'もと',
  'ほんだ',
  1,
  '「本」은 ''ほん''이 기본 읽기이며 ''책''이란 뜻입니다.',
  2,
  0.95
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '한자 읽기'
    and q.question = '____ 本を読みます。'
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
  '한자 읽기',
  '「先生」は 어떻게 ____ 읽습니까?',
  'せんせい',
  'せいせん',
  'せんせ',
  'せんせー',
  1,
  '「先生」의 올바른 읽기는 せんせい입니다.',
  1,
  0.85
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '한자 읽기'
    and q.question = '「先生」は 어떻게 ____ 읽습니까?'
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
  '한자 읽기',
  '父は ____ へ行きました。',
  'いえ',
  'うち',
  'いえい',
  'いええ',
  1,
  '「家」에는 여러 읽기가 있지만, 여기서는 ''いえ''가 맞습니다.',
  2,
  0.94
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '한자 읽기'
    and q.question = '父は ____ へ行きました。'
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
  '한자 읽기',
  '来週、日本に____。',
  'いきます',
  'きます',
  'かえります',
  'はじまります',
  2,
  '「来」는 ''오다''라는 뜻에서 ''きます''로 읽습니다.',
  2,
  0.92
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '한자 읽기'
    and q.question = '来週、日本に____。'
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
  '한자 읽기',
  '____ 時に起きます。',
  'じ',
  'とき',
  'じかん',
  'じゅう',
  1,
  '「時」는 숫자 뒤에 붙어 ''～じ(시)''로 읽습니다.',
  2,
  0.95
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '한자 읽기'
    and q.question = '____ 時に起きます。'
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
  '한자 읽기',
  '名前を____に書いてください。',
  'ひらがな',
  'カタカナ',
  'かたかな',
  'かんじ',
  4,
  '「漢字」는 한자를 의미하며, ''かんじ''로 읽습니다.',
  2,
  0.97
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '한자 읽기'
    and q.question = '名前を____に書いてください。'
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
  '한자 읽기',
  '山が____です。',
  'たかい',
  'ながい',
  'おおきい',
  'やすい',
  1,
  '「高い」는 ''たかい''라고 읽으며 ''높다''의 의미입니다.',
  2,
  0.95
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '한자 읽기'
    and q.question = '山が____です。'
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
  '한자 읽기',
  '____ 水をのみます。',
  'みず',
  'すい',
  'みずうみ',
  'すいどう',
  1,
  '「水」는 기본적으로 ''みず''로 읽으며 ''물''입니다.',
  1,
  0.85
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '한자 읽기'
    and q.question = '____ 水をのみます。'
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
  '한자 읽기',
  '一日に一____りんごを食べます。',
  'こ',
  'ほん',
  'つ',
  'さつ',
  1,
  'りんご(사과)를 세는 단위는 ''個(こ)''입니다.',
  3,
  1
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '한자 읽기'
    and q.question = '一日に一____りんごを食べます。'
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
  '한자 읽기',
  '駅まで____で行きます。',
  'あるいて',
  'およいで',
  'はしって',
  'のって',
  1,
  '「歩」는 ''걷다''라는 뜻의 ''あるいて(歩いて)''입니다.',
  3,
  0.99
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '한자 읽기'
    and q.question = '駅まで____で行きます。'
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
  '한자 읽기',
  '今日は____天気です。',
  'いい',
  'あつい',
  'あおい',
  'たかい',
  1,
  '「良い」는 ''좋다''라는 뜻으로 ''いい''라고 읽습니다.',
  4,
  1.07
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '한자 읽기'
    and q.question = '今日は____天気です。'
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
  '한자 읽기',
  '今日は____曜日ですか？',
  'なん',
  'どよう',
  'ようび',
  'げつよう',
  1,
  '''何(なに)''의 축약형 ''なん''이 ''무슨''의 의미로 올바릅니다.',
  2,
  0.96
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '한자 읽기'
    and q.question = '今日は____曜日ですか？'
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
  '한자 읽기',
  '花が____にあります。',
  'みぎ',
  'ひだり',
  'うえ',
  'した',
  2,
  '「左」는 ''ひだり''라고 읽으며 ''왼쪽''입니다.',
  2,
  0.94
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '한자 읽기'
    and q.question = '花が____にあります。'
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
  '한자 읽기',
  '駅の____にスーパーがあります。',
  'まえ',
  'うしろ',
  'なか',
  'となり',
  1,
  '''앞(前)''의 읽기는 ''まえ''가 정답입니다.',
  2,
  0.96
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '한자 읽기'
    and q.question = '駅の____にスーパーがあります。'
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
  '한자 읽기',
  '「雨」が降っています。____を持って行きましょう。',
  'かさ',
  'あめ',
  'ぼうし',
  'かばん',
  1,
  '''우산''을 뜻하는 ''傘''는 ''かさ''로 읽으며, 문제 맥락상 어울립니다.',
  3,
  1.02
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '한자 읽기'
    and q.question = '「雨」が降っています。____を持って行きましょう。'
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
  '한자 읽기',
  '母と____を作ります。',
  'りょうり',
  'りょうこ',
  'せんたく',
  'そうじ',
  1,
  '''요리(料理)''는 ''りょうり''라고 읽습니다.',
  2,
  0.97
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '한자 읽기'
    and q.question = '母と____を作ります。'
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
  '한자 읽기',
  '毎日、____を書きます。',
  'にっき',
  'しんぶん',
  'ほん',
  'ぶんしょう',
  1,
  '「日記」는 ''일기''라는 뜻이며 ''にっき''입니다.',
  3,
  1.03
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '한자 읽기'
    and q.question = '毎日、____を書きます。'
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
  '한자 읽기',
  '兄は大学の____です。',
  'がくせい',
  'せんせい',
  'こうこう',
  'かいしゃいん',
  1,
  '「学生」는 ''がくせい''로 읽으며 ''학생''이라는 뜻입니다.',
  1,
  0.82
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '한자 읽기'
    and q.question = '兄は大学の____です。'
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
  '한자 읽기',
  '窓を____ください。',
  'あけて',
  'しめて',
  'たたいて',
  'なくして',
  1,
  '창문(窓)을 열다는 ''あける''이므로 아けて가 맞습니다.',
  2,
  0.94
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '한자 읽기'
    and q.question = '窓を____ください。'
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
  '문자·어휘',
  '한자 읽기',
  '母の車は____です。',
  'あたらしい',
  'ふるい',
  'おおきい',
  'ちいさい',
  1,
  '「新」는 ''아타라시이(あたらしい)''가 올바른 읽기이자 의미입니다.',
  5,
  1.25
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '한자 읽기'
    and q.question = '母の車は____です。'
);

commit;
