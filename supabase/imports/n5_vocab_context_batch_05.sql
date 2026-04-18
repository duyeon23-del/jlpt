begin;

-- generated from data/n5-batches/n5_vocab_context_batch_05.json
-- generated at 2026-04-17T14:25:35.468Z

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
  '문맥 규정',
  'わたしは あたらしいせいふくを ____。',
  'きます',
  'のみます',
  'かきます',
  'いきます',
  1,
  'せいふく(교복)은 입기 때문에 ''きます''가 맞다.',
  2,
  0.98
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '문맥 규정'
    and q.question = 'わたしは あたらしいせいふくを ____。'
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
  '문맥 규정',
  'おかあさんは にわで はなを ____。',
  'うえます',
  'まわります',
  'とります',
  'すいます',
  1,
  '정원(にわ)에 꽃(はな)을 심다. ''うえます''가 자연스럽다.',
  2,
  1
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '문맥 규정'
    and q.question = 'おかあさんは にわで はなを ____。'
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
  '문맥 규정',
  'きょうは とても ____ ですから、うみへ いきません。',
  'さむい',
  'あつい',
  'たのしい',
  'おおきい',
  1,
  '춥기 때문에 바다에 가지 않는 상황. ''さむい''가 맞다.',
  2,
  0.97
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '문맥 규정'
    and q.question = 'きょうは とても ____ ですから、うみへ いきません。'
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
  '문맥 규정',
  'わたしの ともだちは へやを いつも ____。',
  'きれいにします',
  'あたらしくします',
  'しろくします',
  'うるさくします',
  1,
  '방을 항상 깨끗이 한다는 자연스러운 문맥. ''きれいにします''가 답이다.',
  3,
  1.01
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '문맥 규정'
    and q.question = 'わたしの ともだちは へやを いつも ____。'
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
  '문맥 규정',
  'まいにち ____ を よんで べんきょうします。',
  'ほん',
  'はし',
  'くつ',
  'ねこ',
  1,
  '공부에 사용하는 것은 책(ほん)이다.',
  1,
  0.85
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '문맥 규정'
    and q.question = 'まいにち ____ を よんで べんきょうします。'
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
  '문맥 규정',
  'あさ ____ を のみました。',
  'みず',
  'かみ',
  'しま',
  'おかし',
  1,
  '아침에 마신 것은 ''みず(물)''이 자연스럽다.',
  1,
  0.8
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '문맥 규정'
    and q.question = 'あさ ____ を のみました。'
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
  '문맥 규정',
  'でんしゃのなかで ____ を よみます。',
  'しんぶん',
  'だいどころ',
  'いえ',
  'みち',
  1,
  '전철 안에서는 신문(しんぶん)을 읽는 것이 자연스럽다.',
  3,
  1
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '문맥 규정'
    and q.question = 'でんしゃのなかで ____ を よみます。'
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
  '문맥 규정',
  'あのひとは たかい ____ を して います。',
  'ぼうし',
  'かさ',
  'かばん',
  'ふろしき',
  1,
  '값이 비싼 것을 착용하는 경우 모자(ぼうし)가 적합하다.',
  3,
  1.05
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '문맥 규정'
    and q.question = 'あのひとは たかい ____ を して います。'
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
  '문맥 규정',
  'わたしの ねこは まいにち ____ で あそびます。',
  'そと',
  'みず',
  'さかな',
  'ことば',
  1,
  '고양이가 매일 노는 곳으로 밖(そと)이 자연스럽다.',
  2,
  0.96
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '문맥 규정'
    and q.question = 'わたしの ねこは まいにち ____ で あそびます。'
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
  '문맥 규정',
  'さいふの なかに ____ が ありません。',
  'おかね',
  'でんしゃ',
  'くるま',
  'いえ',
  1,
  '지갑에는 돈(おかね)이 있어 자연스럽다.',
  2,
  0.94
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '문맥 규정'
    and q.question = 'さいふの なかに ____ が ありません。'
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
  '문맥 규정',
  'ともだちと ____ で しゃしんを とりました。',
  'こうえん',
  'がいこく',
  'レストラン',
  'きさてん',
  1,
  '친구와 사진은 공원(こうえん)에서 찍는 경우가 자연스럽다.',
  3,
  1.03
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '문맥 규정'
    and q.question = 'ともだちと ____ で しゃしんを とりました。'
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
  '문맥 규정',
  'きょうしつには つくえと ____ が あります。',
  'いす',
  'ビル',
  'にく',
  'せんせい',
  1,
  '교실에 있는 것으로 의자(いす)가 자연스럽다.',
  2,
  0.95
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '문맥 규정'
    and q.question = 'きょうしつには つくえと ____ が あります。'
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
  '문맥 규정',
  'しごとは ____ から はじまります。',
  'ごぜん',
  'ひるやすみ',
  'よるごはん',
  'こんにゃく',
  1,
  '일은 보통 오전(ごぜん)부터 시작한다.',
  3,
  1.02
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '문맥 규정'
    and q.question = 'しごとは ____ から はじまります。'
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
  '문맥 규정',
  'かぞくと いっしょに ____ を つくります。',
  'ばんごはん',
  'でんわ',
  'ほんや',
  'くつした',
  1,
  '저녁식사(ばんごはん)를 가족과 만드는 경우가 가장 자연스럽다.',
  2,
  0.98
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '문맥 규정'
    and q.question = 'かぞくと いっしょに ____ を つくります。'
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
  '문맥 규정',
  'たなかさんの へやは ____ です。',
  'ひろい',
  'はやい',
  'きいろい',
  'とおい',
  1,
  '방의 상태를 표현하는 데 ''ひろい(넓다)''가 자연스럽다.',
  2,
  0.97
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '문맥 규정'
    and q.question = 'たなかさんの へやは ____ です。'
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
  '문맥 규정',
  'くだもののなかで ____ が いちばん すきです。',
  'りんご',
  'だいこん',
  'にく',
  'うみ',
  1,
  '과일 중에 가장 좋아하는 것을 묻기 때문에 ''りんご(사과)''가 맞다.',
  1,
  0.86
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '문맥 규정'
    and q.question = 'くだもののなかで ____ が いちばん すきです。'
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
  '문맥 규정',
  'でんきを ____ ください。',
  'つけて',
  'あらって',
  'よんで',
  'およいで',
  1,
  '''전등을 켜 주세요''라는 의미로 ''つけて''가 맞다.',
  2,
  0.95
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '문맥 규정'
    and q.question = 'でんきを ____ ください。'
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
  '문맥 규정',
  'わたしの ちちは ____ が つよいです。',
  'からだ',
  'おと',
  'でんき',
  'かいしゃ',
  1,
  '아버지의 건강(몸)이 강하다는 의미로 ''からだ''가 적절하다.',
  3,
  1
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '문맥 규정'
    and q.question = 'わたしの ちちは ____ が つよいです。'
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
  '문맥 규정',
  'ドアを ____ ください。',
  'あけて',
  'たべて',
  'みせて',
  'つかって',
  1,
  '문을 ''열다''는 의미로 ''あけて''가 자연스럽다.',
  2,
  0.92
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '문맥 규정'
    and q.question = 'ドアを ____ ください。'
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
  '문맥 규정',
  'おとうとは へやで おんがくを ____ います。',
  'きいて',
  'あるいて',
  'のんで',
  'かぞえて',
  1,
  '음악을 듣고 있다는 상황으로 ''きいて''가 가장 맞다.',
  3,
  1.01
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '문맥 규정'
    and q.question = 'おとうとは へやで おんがくを ____ います。'
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
  '문맥 규정',
  'やまださんは きのう ____ へ いきました。',
  'びょういん',
  'ふでばこ',
  'シャツ',
  'まど',
  1,
  '병원에 간 상황으로 ''びょういん''이 가장 자연스럽다.',
  5,
  1.17
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '문맥 규정'
    and q.question = 'やまださんは きのう ____ へ いきました。'
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
  '문맥 규정',
  'ははは うるさいので、よるは ____ して ください。',
  'しずかに',
  'あかるく',
  'にぎやかに',
  'ながく',
  1,
  '시끄러우니 밤에는 조용히 해 달라는 의미로 ''しずかに''가 맞다.',
  4,
  1.1
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '문맥 규정'
    and q.question = 'ははは うるさいので、よるは ____ して ください。'
);

commit;
