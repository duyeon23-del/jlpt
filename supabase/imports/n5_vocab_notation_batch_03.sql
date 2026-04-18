begin;

-- generated from data/n5-batches/n5_vocab_notation_batch_03.json
-- generated at 2026-04-17T13:43:47.341Z

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
  '표기',
  '東京に行くときは____で行きます。',
  'でんしゃ',
  'じてんしゃ',
  'くるま',
  'ひこうき',
  1,
  '東京(とうきょう)은 대도시이므로 전철(でんしゃ)로 자주 갑니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '표기'
    and q.question = '東京に行くときは____で行きます。'
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
  '표기',
  '____を食べたいです。',
  'さかな',
  'みず',
  'くつ',
  'いぬ',
  1,
  '먹을 수 있는 것은 물고기(さかな)입니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '표기'
    and q.question = '____を食べたいです。'
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
  '표기',
  '昨日の夜、星が____。',
  'きれいでした',
  'はやいです',
  'おおきいでした',
  'しずかでした',
  1,
  '밤하늘의 별은 보통 예쁘다고 표현합니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '표기'
    and q.question = '昨日の夜、星が____。'
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
  '표기',
  '____で手紙を書きます。',
  'ペン',
  'くつ',
  'じてんしゃ',
  'ぼうし',
  1,
  '편지는 펜으로 씁니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '표기'
    and q.question = '____で手紙を書きます。'
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
  '표기',
  '友達に____をあげました。',
  'おかし',
  'でんしゃ',
  'くるま',
  'ほんや',
  1,
  '친구에게 줄 수 있는 것은 과자(おかし)입니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '표기'
    and q.question = '友達に____をあげました。'
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
  '표기',
  'テーブルの上に____があります。',
  'りんご',
  'みずうみ',
  'やま',
  'とり',
  1,
  '테이블 위에 올려놓을 수 있는 것은 사과(りんご)입니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '표기'
    and q.question = 'テーブルの上に____があります。'
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
  '표기',
  '冷たい____をください。',
  'ジュース',
  'けしごむ',
  'じてんしゃ',
  'ほんだな',
  1,
  '차가운 주스(ジュース)를 달라는 자연스러운 요청입니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '표기'
    and q.question = '冷たい____をください。'
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
  '표기',
  '今日はとても____です。',
  'あつい',
  'ながい',
  'せまい',
  'にぎやか',
  1,
  '오늘 같은 날씨 상황을 묻는 문제에서 ''더운''(あつい)을 사용합니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '표기'
    and q.question = '今日はとても____です。'
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
  '표기',
  '図書館に____を借りました。',
  'ほん',
  'いぬ',
  'りんご',
  'でんしゃ',
  1,
  '도서관에서는 책(ほん)을 빌립니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '표기'
    and q.question = '図書館に____を借りました。'
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
  '표기',
  '朝ごはんに____をのみます。',
  'ぎゅうにゅう',
  'そら',
  'やま',
  'へや',
  1,
  '아침에 마시는 대표적 음료는 우유(ぎゅうにゅう)입니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '표기'
    and q.question = '朝ごはんに____をのみます。'
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
  '표기',
  '学校の前で____を待っています。',
  'ともだち',
  'とけい',
  'き',
  'がっこう',
  1,
  '학교 앞에서 기다릴 수 있는 것은 친구(ともだち)입니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '표기'
    and q.question = '学校の前で____を待っています。'
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
  '표기',
  '日本の____はきれいです。',
  'さくら',
  'ごはん',
  'つくえ',
  'でんしゃ',
  1,
  '일본하면 떠오르는 대표적인 꽃, 사쿠라(さくら)가 정답입니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '표기'
    and q.question = '日本の____はきれいです。'
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
  '표기',
  '教室には____があります。',
  'つくえ',
  'こうえん',
  'びょういん',
  'たてもの',
  1,
  '교실(きょうしつ) 안에는 책상(つくえ)이 있습니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '표기'
    and q.question = '教室には____があります。'
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
  '표기',
  '夏は____が高いです。',
  'きおん',
  'ほん',
  'ともだち',
  'りんご',
  1,
  '여름에는 기온(きおん, 온도)이 높습니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '표기'
    and q.question = '夏は____が高いです。'
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
  '표기',
  '走るとき____をはきます。',
  'くつ',
  'ぼうし',
  'てがみ',
  'きっぷ',
  1,
  '달릴 때 신는 것은 신발(くつ)입니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '표기'
    and q.question = '走るとき____をはきます。'
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
  '표기',
  '食堂で____を食べます。',
  'ひるごはん',
  'くるま',
  'しんぶん',
  'き',
  1,
  '식당에서 점심(ひるごはん)을 먹습니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '표기'
    and q.question = '食堂で____を食べます。'
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
  '표기',
  '夏休みに____に行きました。',
  'うみ',
  'ほん',
  'でんわ',
  'たべもの',
  1,
  '여름에 자주 가는 곳은 바다(うみ)입니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '표기'
    and q.question = '夏休みに____に行きました。'
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
  '표기',
  '旅行に____を持って行きます。',
  'カメラ',
  'いす',
  'ふとん',
  'まど',
  1,
  '여행할 때 흔히 챙기는 것은 카메라(カメラ)입니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '표기'
    and q.question = '旅行に____を持って行きます。'
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
  '표기',
  '母に花を____。',
  'あげます',
  'ききます',
  'のります',
  'すいます',
  1,
  '꽃을 주다(あげます)가 어울리는 표현입니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '표기'
    and q.question = '母に花を____。'
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
  '표기',
  '私の部屋は____です。',
  'ひろい',
  'ながい',
  'おそい',
  'すくない',
  1,
  '방의 특징 중에서 넓은(ひろい)이 적절합니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '표기'
    and q.question = '私の部屋は____です。'
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
  '표기',
  '駅で____を買います。',
  'きっぷ',
  'ごはん',
  'えんぴつ',
  'ふく',
  1,
  '역(えき)에서 대표적으로 사는 것은 표(きっぷ)입니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '표기'
    and q.question = '駅で____を買います。'
);

commit;
