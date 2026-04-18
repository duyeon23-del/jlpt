begin;

-- generated from data/n5-batches/n5_vocab_kanji_batch_04.json
-- generated at 2026-04-17T13:51:35.432Z

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
  '____ を見るのが好きです。',
  'えいが',
  'きょうかしょ',
  'へや',
  'みず',
  1,
  '「映画(えいが)」는 영화라는 뜻으로, 영화 보는 것을 좋아한다는 맥락에서 맞는 읽기입니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '한자 읽기'
    and q.question = '____ を見るのが好きです。'
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
  '明日、____ へ行きます。',
  'がっこう',
  'たいしかん',
  'ぎんこう',
  'えいがかん',
  1,
  '「学校(がっこう)」는 학교라는 뜻으로, 초급에서 자주 나오는 단어입니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '한자 읽기'
    and q.question = '明日、____ へ行きます。'
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
  '水を____ ください。',
  'のんで',
  'あらって',
  'すって',
  'いれて',
  1,
  '「飲んで(のんで)」는 마시다라는 뜻으로, 물을 마시다라는 의미입니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '한자 읽기'
    and q.question = '水を____ ください。'
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
  '朝ごはんは、毎日 ____ です。',
  'はやい',
  'おそい',
  'ながい',
  'あつい',
  1,
  '「早い(はやい)」는 빠르다, 이르다는 의미로 아침 식사가 매일 빠르다는 문맥에 맞습니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '한자 읽기'
    and q.question = '朝ごはんは、毎日 ____ です。'
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
  '家の ____ に花があります。',
  'まえ',
  'うしろ',
  'した',
  'なか',
  1,
  '「前(まえ)」는 앞을 의미하며, 집 앞에 꽃이 있다는 문맥에 맞는 답입니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '한자 읽기'
    and q.question = '家の ____ に花があります。'
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
  '今日は、日曜日の ____ です。',
  'あさ',
  'ゆうがた',
  'ひる',
  'ばん',
  1,
  '「朝(あさ)」는 아침을 의미합니다. 일요일의 아침이라는 뜻입니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '한자 읽기'
    and q.question = '今日は、日曜日の ____ です。'
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
  '山へ ____ に行きます。',
  'のぼり',
  'あるき',
  'はしり',
  'くだり',
  1,
  '「登り(のぼり)」는 오르다라는 뜻으로, 산을 오르러 간다는 문맥입니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '한자 읽기'
    and q.question = '山へ ____ に行きます。'
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
  '____ で手紙を書きます。',
  'ペン',
  'かみ',
  'てがみ',
  'ほん',
  1,
  '문장에서 빈칸에 「ペン」이 들어가며, ''펜으로 편지를 쓴다''는 의미입니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '한자 읽기'
    and q.question = '____ で手紙を書きます。'
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
  '____ の横に友だちがいます。',
  'いす',
  'つくえ',
  'まど',
  'とけい',
  1,
  '「椅子(いす)」는 의자라는 의미로, 의자 옆에 친구가 있다는 뜻입니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '한자 읽기'
    and q.question = '____ の横に友だちがいます。'
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
  '____ の料理はおいしいです。',
  'にほん',
  'アメリカ',
  'インド',
  'イタリア',
  1,
  '「日本(にほん)」의 요리가 맛있다는 뜻입니다. 한자 읽기 문제로 출제되었습니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '한자 읽기'
    and q.question = '____ の料理はおいしいです。'
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
  '父は ____ をしています。',
  'しごと',
  'ほん',
  'うた',
  'てがみ',
  1,
  '「仕事(しごと)」는 일, 직업을 의미합니다. 아버지가 일을 한다는 내용입니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '한자 읽기'
    and q.question = '父は ____ をしています。'
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
  '机の____にノートがあります。',
  'うえ',
  'した',
  'なか',
  'となり',
  1,
  '「上(うえ)」는 위를 뜻합니다. 책상 위에 공책이 있다는 의미입니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '한자 읽기'
    and q.question = '机の____にノートがあります。'
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
  '小さい ____ をもっています。',
  'かばん',
  'はこ',
  'かさ',
  'ぼうし',
  1,
  '「鞄(かばん)」은 가방이라는 의미로, ''작은 가방을 갖고 있다''는 뜻입니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '한자 읽기'
    and q.question = '小さい ____ をもっています。'
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
  '日本の ____ はきれいです。',
  'さくら',
  'たけ',
  'まつ',
  'いちょう',
  1,
  '「桜(さくら)」는 벚꽃을 의미하며, 일본의 벚꽃이 예쁘다는 문장입니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '한자 읽기'
    and q.question = '日本の ____ はきれいです。'
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
  '本を ____ に行きました。',
  'かり',
  'のり',
  'きき',
  'あげ',
  1,
  '「借り(かり)」는 빌리다라는 뜻이며, 책을 빌리러 갔다는 문맥입니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '한자 읽기'
    and q.question = '本を ____ に行きました。'
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
  '毎日 ____ をしなければなりません。',
  'べんきょう',
  'りょうり',
  'そうじ',
  'さんぽ',
  1,
  '「勉強(べんきょう)」는 공부라는 뜻으로, 매일 공부를 해야 한다는 내용입니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '한자 읽기'
    and q.question = '毎日 ____ をしなければなりません。'
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
  '駅の前に ____ があります。',
  'タクシー',
  'バス',
  'じてんしゃ',
  'でんしゃ',
  1,
  '역 앞에 택시가 있다는 문맥입니다. 「タクシー」가 정답입니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '한자 읽기'
    and q.question = '駅の前に ____ があります。'
);

commit;
