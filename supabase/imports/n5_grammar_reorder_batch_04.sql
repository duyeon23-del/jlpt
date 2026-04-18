begin;

-- generated from data/n5-batches/n5_grammar_reorder_batch_04.json
-- generated at 2026-04-17T13:54:45.821Z

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
  'きのう　ともだちと ____ いきました。',
  'えいがに',
  'えいがが',
  'えいがを',
  'えいがで',
  1,
  '‘~に行く’는 목적지에 ‘~に’를 붙여 사용합니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '배열'
    and q.question = 'きのう　ともだちと ____ いきました。'
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
  'ごはんを ____ たべます。',
  'ゆっくり',
  'ゆっくさ',
  'ゆっくと',
  'ゆっかり',
  1,
  'ゆっくり는 ‘천천히’란 뜻의 부사로 올바른 형태입니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '배열'
    and q.question = 'ごはんを ____ たべます。'
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
  'あした　テストが ____。',
  'あります',
  'います',
  'のります',
  'はしります',
  1,
  '‘테스트가 있다’는 ‘あります’가 맞는 표현입니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '배열'
    and q.question = 'あした　テストが ____。'
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
  'わたしは　りんごが ____。',
  'すきです',
  'おいしいです',
  'たのしいです',
  'きれいです',
  1,
  '‘~が好きです’로 좋아하는 대상을 나타냅니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '배열'
    and q.question = 'わたしは　りんごが ____。'
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
  'うちへ ____。',
  'かえります',
  'はしります',
  'おきます',
  'あそびます',
  1,
  '‘うちへ帰ります’는 집에 돌아간다는 의미입니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '배열'
    and q.question = 'うちへ ____。'
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
  'きょうは　いい ____ です。',
  'てんき',
  'きもち',
  'せいと',
  'がっこう',
  1,
  '날씨가 좋다는 뜻에서는 ''てんき''를 사용합니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '배열'
    and q.question = 'きょうは　いい ____ です。'
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
  'この____は　いくらですか。',
  'ほん',
  'あさ',
  'こども',
  'まいにち',
  1,
  '‘이 책’은 ‘このほん’입니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '배열'
    and q.question = 'この____は　いくらですか。'
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
  'ゆうびんきょくは　どこに ____ か。',
  'あります',
  'います',
  'きます',
  'いきます',
  1,
  '장소의 위치를 묻고 있을 때는 ‘あります’가 맞습니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '배열'
    and q.question = 'ゆうびんきょくは　どこに ____ か。'
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
  'でんしゃで　がっこうへ ____。',
  'いきます',
  'とります',
  'ねます',
  'ききます',
  1,
  '학교에 간다는 표현은 ‘学校へ行きます’입니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '배열'
    and q.question = 'でんしゃで　がっこうへ ____。'
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
  'じしょを　つかって ____。',
  'しらべます',
  'つくります',
  'みがきます',
  'あそびます',
  1,
  '사전을 써서 찾아본다는 의미로 ‘しらべます’를 씁니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '배열'
    and q.question = 'じしょを　つかって ____。'
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
  'テーブルの　うえに ____。',
  'ほんがあります',
  'ほんをよみます',
  'ほんがたべます',
  'ほんのべんきょう',
  1,
  '‘위에 있습니다’의 표현은 ‘~があります’ 입니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '배열'
    and q.question = 'テーブルの　うえに ____。'
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
  'あのおんなのこは　だれの ____ ですか。',
  'ともだち',
  'みち',
  'かばん',
  'ことり',
  1,
  '‘누구의 친구’라는 문장에 알맞은 답은 ''ともだち''입니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '배열'
    and q.question = 'あのおんなのこは　だれの ____ ですか。'
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
  'こんしゅうの　しゅうまつは ____。',
  'やすみます',
  'いれます',
  'かわきます',
  'おきます',
  1,
  '주말에는 쉬는 경우가 많으므로 ''やすみます''가 자연스럽습니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '배열'
    and q.question = 'こんしゅうの　しゅうまつは ____。'
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
  'わたしのうちは　えきから ____。',
  'ちかいです',
  'くらいです',
  'ふるいです',
  'あかいです',
  1,
  '가깝다는 표현은 ‘ちかい’가 맞습니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '배열'
    and q.question = 'わたしのうちは　えきから ____。'
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
  'おかあさんと　いっしょに ____。',
  'かいものします',
  'しごとします',
  'でんわします',
  'うたいます',
  1,
  '‘함께 쇼핑합니다’의 자연스러운 조합입니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '배열'
    and q.question = 'おかあさんと　いっしょに ____。'
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
  'きのうの　ばんごはんは　____　でした。',
  'カレー',
  'たのしい',
  'とけい',
  'のみもの',
  1,
  '저녁 식사에 해당하는 음식명 ‘カレー’가 맞습니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '배열'
    and q.question = 'きのうの　ばんごはんは　____　でした。'
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
  'にほんごのクラスで ____。',
  'べんきょうします',
  'うたいます',
  'あそびます',
  'はなします',
  1,
  '수업에서는 ‘공부합니다(べんきょうします)’가 어울리는 답입니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '배열'
    and q.question = 'にほんごのクラスで ____。'
);

commit;
