begin;

-- generated from data/n5-batches/n5_vocab_context_batch_03.json
-- generated at 2026-04-17T13:44:37.623Z

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
  '문맥 규정',
  '毎日、朝ごはんにパンを____。',
  '食べます',
  '読みます',
  '書きます',
  '買います',
  1,
  '문맥상 아침 식사에 빵을 ''먹는다''가 올바른 어휘입니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '문맥 규정'
    and q.question = '毎日、朝ごはんにパンを____。'
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
  '문맥 규정',
  'きのう、友だちと映画を____。',
  '見ました',
  '作りました',
  '乗りました',
  '歩きました',
  1,
  '''영화''와 관련이 있는 동사는 ''보다''가 자연스럽습니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '문맥 규정'
    and q.question = 'きのう、友だちと映画を____。'
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
  '문맥 규정',
  '母はスーパーで野菜を____。',
  '買います',
  '書きます',
  '泳ぎます',
  '飲みます',
  1,
  '슈퍼에서는 주로 야채를 ''산다''는 맥락이 가장 자연스럽습니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '문맥 규정'
    and q.question = '母はスーパーで野菜を____。'
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
  '문맥 규정',
  'クラスで日本語を____。',
  '勉強します',
  '掃除します',
  '洗います',
  '走ります',
  1,
  '''교실''과 ''일본어''의 조합에는 ''공부하다''가 자연스럽습니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '문맥 규정'
    and q.question = 'クラスで日本語を____。'
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
  '문맥 규정',
  '夏に海で____のが好きです。',
  '泳ぐ',
  '起きる',
  '掃除する',
  '読む',
  1,
  '여름 바다에서는 ''수영하는'' 것이 자연스러운 선택입니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '문맥 규정'
    and q.question = '夏に海で____のが好きです。'
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
  '문맥 규정',
  '午後10時に____。',
  '寝ます',
  '働きます',
  '食べます',
  '遊びます',
  1,
  '밤 10시는 보통 잠을 자는 시간입니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '문맥 규정'
    and q.question = '午後10時に____。'
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
  '문맥 규정',
  '窓を____ください。',
  '開けて',
  '閉めて',
  '撮って',
  '洗って',
  1,
  '창문을 ''열어 주세요''라는 요청이 문맥에 맞습니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '문맥 규정'
    and q.question = '窓を____ください。'
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
  '문맥 규정',
  'この____は、とても高いです。',
  'ビル',
  '靴',
  '皿',
  '机',
  1,
  '높은 것과 어울리는 것은 ''빌딩''입니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '문맥 규정'
    and q.question = 'この____は、とても高いです。'
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
  '문맥 규정',
  '冷蔵庫の中に____があります。',
  '牛乳',
  'ラジオ',
  'テレビ',
  'ノート',
  1,
  '냉장고 안에는 ''우유''가 가장 자연스럽습니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '문맥 규정'
    and q.question = '冷蔵庫の中に____があります。'
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
  '문맥 규정',
  '駅まで歩いて____。',
  '行きます',
  '見ます',
  '聞きます',
  '飲みます',
  1,
  '역까지는 ''걸어서 갑니다''가 자연스럽습니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '문맥 규정'
    and q.question = '駅まで歩いて____。'
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
  '문맥 규정',
  'ふゆには、よくコートを____。',
  '着ます',
  '切ります',
  '書きます',
  '泳ぎます',
  1,
  '겨울에는 코트를 ''입는다''가 올바른 선택입니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '문맥 규정'
    and q.question = 'ふゆには、よくコートを____。'
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
  '문맥 규정',
  '夏休みに旅行に____。',
  '行きます',
  '書きます',
  '歌います',
  '起きます',
  1,
  '여름방학에 여행 ''간다''가 문맥상 올바릅니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '문맥 규정'
    and q.question = '夏休みに旅行に____。'
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
  '문맥 규정',
  '毎朝、７時に____。',
  '起きます',
  '泳ぎます',
  '乗ります',
  '走ります',
  1,
  '매일 아침 7시는 ''일어납니다''가 가장 자연스럽습니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '문맥 규정'
    and q.question = '毎朝、７時に____。'
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
  '문맥 규정',
  '晩ごはんのあと、歯を____。',
  'みがきます',
  'とります',
  'さがします',
  'あげます',
  1,
  '저녁 식사 후에는 이를 ''닦는다''가 정답입니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '문맥 규정'
    and q.question = '晩ごはんのあと、歯を____。'
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
  '문맥 규정',
  '彼はサッカーがとても____。',
  '上手です',
  '下手です',
  '遅いです',
  '古いです',
  1,
  '문맥상 ''매우''라는 단어와 잘 어울리는 표현은 ''잘한다''입니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '문맥 규정'
    and q.question = '彼はサッカーがとても____。'
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
  '문맥 규정',
  '日曜日、公園で犬と____。',
  'あそびます',
  'つかいます',
  '見せます',
  '作ります',
  1,
  '공원에서 강아지와 함께하는 자연스러운 행동은 ''논다''입니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '문맥 규정'
    and q.question = '日曜日、公園で犬と____。'
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
  '문맥 규정',
  '山で写真を____。',
  'とります',
  'かけます',
  '読みます',
  '聞きます',
  1,
  '산에서 하는 활동 중 문맥상 ''사진을 찍다''가 맞습니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '문맥 규정'
    and q.question = '山で写真を____。'
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
  '문맥 규정',
  '部屋をきれいに____。',
  '掃除します',
  '開けます',
  '持ちます',
  '寝ます',
  1,
  '방을 ''깨끗하게'' 만드는 행동은 ''청소한다''가 맞습니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '문맥 규정'
    and q.question = '部屋をきれいに____。'
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
  '문맥 규정',
  '友達に手紙を____。',
  '書きます',
  '通ります',
  '売ります',
  '借ります',
  1,
  '친구에게 하는 자연스러운 행동은 ''편지를 쓴다''입니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '문맥 규정'
    and q.question = '友達に手紙を____。'
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
  '문맥 규정',
  '日曜日に家でテレビを____。',
  '見ます',
  '乗ります',
  '作ります',
  '習います',
  1,
  '집에서 하는 자연스러운 활동은 ''텔레비전을 본다''입니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '문맥 규정'
    and q.question = '日曜日に家でテレビを____。'
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
  '문맥 규정',
  '日本の歌を____ことが好きです。',
  '歌う',
  '書く',
  '飲む',
  '洗う',
  1,
  '''노래''와 관련된 올바른 동사는 ''부르다''입니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '문맥 규정'
    and q.question = '日本の歌を____ことが好きです。'
);

commit;
