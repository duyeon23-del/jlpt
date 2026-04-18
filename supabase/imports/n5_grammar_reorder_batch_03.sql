begin;

-- generated from data/n5-batches/n5_grammar_reorder_batch_03.json
-- generated at 2026-04-17T13:47:41.450Z

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
  '私は朝ごはんを____食べます。',
  '毎日',
  '昨日',
  '早く',
  '少し',
  1,
  '"毎日"는 ''매일''이라는 뜻으로, 아침밥을 매일 먹는다는 문장을 만듭니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '배열'
    and q.question = '私は朝ごはんを____食べます。'
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
  '先生は教室に____。',
  'います',
  'いきます',
  'はしります',
  'のみます',
  1,
  '"います"는 ''있다''라는 의미로, ''선생님은 교실에 있습니다.''라는 자연스러운 표현입니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '배열'
    and q.question = '先生は教室に____。'
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
  '図書館で本を____。',
  '読みます',
  '買います',
  '食べます',
  '作ります',
  1,
  '"読みます"는 ''읽다''라는 의미로, 도서관에서 책을 읽는 것이 자연스럽습니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '배열'
    and q.question = '図書館で本を____。'
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
  '____を飲みますか。',
  'お茶',
  '手紙',
  '電話',
  '財布',
  1,
  '"お茶"는 차라는 의미로, 마실 수 있는 대상입니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '배열'
    and q.question = '____を飲みますか。'
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
  '山田さんは学生____。',
  'です',
  'ます',
  'いる',
  'でした',
  1,
  '"です"는 N5존댓말 끝맺음으로 맞는 표현입니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '배열'
    and q.question = '山田さんは学生____。'
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
  '車で駅へ____。',
  '行きます',
  '見ます',
  '帰ります',
  '書きます',
  1,
  '"行きます"는 ''갑니다''로, ''차로 역에 갑니다.''가 자연스럽습니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '배열'
    and q.question = '車で駅へ____。'
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
  '私は日本語を____。',
  '勉強します',
  '食べます',
  '掃除します',
  '遊びます',
  1,
  '일본어를 ''공부한다''가 가장 자연스러운 조합입니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '배열'
    and q.question = '私は日本語を____。'
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
  '田中さんの家は学校の____です。',
  '近く',
  '上',
  '右',
  '中',
  1,
  '"近く"는 ''가깝다''이므로, 집이 학교 근처에 있다는 의미입니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '배열'
    and q.question = '田中さんの家は学校の____です。'
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
  '今週の土曜日に友だちと____。',
  '会います',
  '借ります',
  '待ちます',
  '教えます',
  1,
  '"会います"는 ''만나다''이므로, 친구와 만난다는 의미입니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '배열'
    and q.question = '今週の土曜日に友だちと____。'
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
  'この道をまっすぐ____ください。',
  '行って',
  '読んで',
  '選んで',
  '買って',
  1,
  '"行って"는 ''가다''의 て형으로, 계속 가달라는 요청입니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '배열'
    and q.question = 'この道をまっすぐ____ください。'
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
  '手紙をポストに____。',
  '入れます',
  '閉めます',
  '座ります',
  '降ります',
  1,
  '"入れます"는 ''넣다''로, 편지는 우체통에 넣는 것이 자연스럽습니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '배열'
    and q.question = '手紙をポストに____。'
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
  '今日は____天気ですね。',
  'いい',
  'わるい',
  '小さい',
  '遠い',
  1,
  '"いい"는 ''좋다''로, ''오늘은 좋은 날씨네요.''가 올바른 조합입니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '배열'
    and q.question = '今日は____天気ですね。'
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
  '私の部屋は____です。',
  '広い',
  '早い',
  '強い',
  '高い',
  1,
  '"広い"는 ''넓다''로, 방이 넓다는 의미로 사용됩니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '배열'
    and q.question = '私の部屋は____です。'
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
  '子どもたちは公園で____います。',
  '遊んで',
  '降りて',
  '洗って',
  '切って',
  1,
  '아이들이 공원에서 ''놀고 있다''는 게 가장 자연스럽습니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '배열'
    and q.question = '子どもたちは公園で____います。'
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
  '机の上にペンが____。',
  'あります',
  'のります',
  'すわります',
  'あらいます',
  1,
  '"あります"는 무생물의 존재동사로, ''책상 위에 펜이 있습니다.''와 어울립니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '배열'
    and q.question = '机の上にペンが____。'
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
  '私は昨日友だちにプレゼントを____。',
  'あげました',
  'つけました',
  'おくりました',
  'ならいました',
  1,
  '"あげました"는 ''주었습니다''라는 뜻으로, 선물을 주었다는 의미입니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '배열'
    and q.question = '私は昨日友だちにプレゼントを____。'
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
  '父は毎朝コーヒーを____。',
  'のみます',
  'みます',
  'やります',
  'します',
  1,
  '"のみます"는 ''마십니다.''로, 커피를 마신다는 표현입니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '배열'
    and q.question = '父は毎朝コーヒーを____。'
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
  '____が好きですか。',
  '何',
  'どこ',
  '誰',
  'いつ',
  1,
  '"何"는 ''무엇''이며, 무엇을 좋아하는지에 대한 질문입니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '배열'
    and q.question = '____が好きですか。'
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
  '私は毎週花に____をやります。',
  '水',
  '風',
  '音',
  '色',
  1,
  '"水"를 ''줍니다''이므로, 꽃에 물을 준다는 의미입니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '배열'
    and q.question = '私は毎週花に____をやります。'
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
  '배열',
  '昨日の夜ごはんはカレー____。',
  'でした',
  'ます',
  'たい',
  'する',
  1,
  '"でした"는 과거형으로, 어젯밤 밥이 ''카레였습니다.''라는 문장이 완성됩니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '배열'
    and q.question = '昨日の夜ごはんはカレー____。'
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
  '배열',
  'あの店でケーキを____ことができます。',
  '買う',
  '歩く',
  '立つ',
  '泳ぐ',
  1,
  '케이크를 ''살 수 있다''는 뜻이므로 "買う"가 적합합니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '배열'
    and q.question = 'あの店でケーキを____ことができます。'
);

commit;
