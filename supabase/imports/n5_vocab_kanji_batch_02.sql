begin;

-- generated from data/n5-batches/n5_vocab_kanji_batch_02.json
-- generated at 2026-04-17T13:33:07.360Z

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
  '毎日 ____ を読みます。',
  'しんぶん',
  'ごほん',
  'しゃしん',
  'きって',
  1,
  '新聞의 읽기는 しんぶん입니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '한자 읽기'
    and q.question = '毎日 ____ を読みます。'
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
  '教室で ____ を使います。',
  'つくえ',
  'みず',
  'きん',
  'ぬの',
  1,
  '机(つくえ)는 책상을 의미합니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '한자 읽기'
    and q.question = '教室で ____ を使います。'
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
  '____ の中に魚がいます。',
  'いけ',
  'かべ',
  'たに',
  'まち',
  1,
  '池(いけ)는 연못을 뜻합니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '한자 읽기'
    and q.question = '____ の中に魚がいます。'
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
  '休みの日は ____ に行きます。',
  'こうえん',
  'てら',
  'やま',
  'うち',
  1,
  '公園(こうえん)은 공원을 의미합니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '한자 읽기'
    and q.question = '休みの日は ____ に行きます。'
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
  '毎朝 ____ を飲みます。',
  'ぎゅうにゅう',
  'にく',
  'たまご',
  'こめ',
  1,
  '牛乳(ぎゅうにゅう)는 우유입니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '한자 읽기'
    and q.question = '毎朝 ____ を飲みます。'
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
  '彼の ____ は大きいです。',
  'こえ',
  'め',
  'くち',
  'て',
  1,
  '声(こえ)는 목소리를 의미합니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '한자 읽기'
    and q.question = '彼の ____ は大きいです。'
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
  '今日は ____ があります。',
  'しけん',
  'じてん',
  'かぎ',
  'まど',
  1,
  '試験(しけん)은 시험을 뜻합니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '한자 읽기'
    and q.question = '今日は ____ があります。'
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
  '図書館で ____ を借ります。',
  'ほん',
  'つくえ',
  'でんしゃ',
  'てがみ',
  1,
  '本(ほん)은 책입니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '한자 읽기'
    and q.question = '図書館で ____ を借ります。'
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
  '駅の近くの ____ で買い物しました。',
  'みせ',
  'いえ',
  'ゆうびんきょく',
  'くるま',
  1,
  '店(みせ)는 가게를 의미합니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '한자 읽기'
    and q.question = '駅の近くの ____ で買い物しました。'
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
  '今日の ____ はくもりです。',
  'てんき',
  'つき',
  'そら',
  'うみ',
  1,
  '天気(てんき)는 날씨입니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '한자 읽기'
    and q.question = '今日の ____ はくもりです。'
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
  '医者は ____ で働いています。',
  'びょういん',
  'くるま',
  'くうこう',
  'こうえん',
  1,
  '病院(びょういん)은 병원입니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '한자 읽기'
    and q.question = '医者は ____ で働いています。'
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
  '夜に____ を見ます。',
  'ほし',
  'まど',
  'かわ',
  'かみ',
  1,
  '星(ほし)는 별을 의미합니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '한자 읽기'
    and q.question = '夜に____ を見ます。'
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
  '母は毎晩 ____ を作ります。',
  'ばんごはん',
  'さかな',
  'くだもの',
  'おかし',
  1,
  '晩ご飯(ばんごはん)는 저녁밥입니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '한자 읽기'
    and q.question = '母は毎晩 ____ を作ります。'
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
  '来月 ____ があります。',
  'きょうそう',
  'かがく',
  'くすり',
  'いもうと',
  1,
  '競争(きょうそう)은 경주, 경쟁이란 뜻입니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '한자 읽기'
    and q.question = '来月 ____ があります。'
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
  '昨日 ____ に行きました。',
  'えいがかん',
  'こえん',
  'せんせい',
  'じてんしゃ',
  1,
  '映画館(えいがかん)은 영화관입니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '한자 읽기'
    and q.question = '昨日 ____ に行きました。'
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
  '部屋で ____ をします。',
  'そうじ',
  'そば',
  'びょういん',
  'たべもの',
  1,
  '掃除(そうじ)는 청소를 의미합니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '한자 읽기'
    and q.question = '部屋で ____ をします。'
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
  '____ に名前を書いてください。',
  'かみ',
  'やま',
  'おかね',
  'はし',
  1,
  '紙(かみ)는 종이입니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '한자 읽기'
    and q.question = '____ に名前を書いてください。'
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
  '____ でご飯を食べます。',
  'しょくどう',
  'ゆび',
  'けしき',
  'けいさつ',
  1,
  '食堂(しょくどう)는 식당입니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '한자 읽기'
    and q.question = '____ でご飯を食べます。'
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
  '冬に山で ____ が降ります。',
  'ゆき',
  'こおり',
  'はな',
  'いし',
  1,
  '雪(ゆき)는 눈(雪)이 내리는 것을 의미합니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '한자 읽기'
    and q.question = '冬に山で ____ が降ります。'
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
  '駅の ____ で待っています。',
  'まえ',
  'なか',
  'うしろ',
  'うえ',
  1,
  '前(まえ)는 앞을 의미합니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '한자 읽기'
    and q.question = '駅の ____ で待っています。'
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
  '한자 읽기',
  '公園に____ があります。',
  'いす',
  'ほん',
  'ひる',
  'ゆび',
  1,
  '椅子(いす)는 의자를 의미합니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '한자 읽기'
    and q.question = '公園に____ があります。'
);

commit;
