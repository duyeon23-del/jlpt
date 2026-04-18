begin;

-- generated from data/n5-batches/n5_grammar_reorder_batch_05.json
-- generated at 2026-04-17T14:34:27.012Z

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
  '문법',
  '배열',
  'わたしは毎朝____を飲みます。',
  'みず',
  '黒い',
  '走る',
  '高い',
  1,
  '마실 수 있는 것은 ''みず''가 적절하다. 나머지는 형용사 또는 동사이다.',
  1,
  0.8
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '배열'
    and q.question = 'わたしは毎朝____を飲みます。'
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
  '문법',
  '배열',
  'このリンゴは ____ です。',
  'あまい',
  'きのう',
  'ゆうめい',
  'いぬ',
  1,
  '''あまい''(달다)가 사과를 수식하는 적절한 형용사이다.',
  2,
  0.95
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '배열'
    and q.question = 'このリンゴは ____ です。'
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
  '문법',
  '배열',
  'ここで____をしてはいけません。',
  'たばこ',
  '青い',
  '読む',
  '高い',
  1,
  '''たばこ''(담배)가 금지의 대상에 맞다.',
  3,
  1.1
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '배열'
    and q.question = 'ここで____をしてはいけません。'
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
  '문법',
  '배열',
  '私は今朝 ____ へ行きました。',
  'がっこう',
  'はやい',
  'のむ',
  'いす',
  1,
  '''~へ行きました'' 뒤에는 장소가 어울리므로 ''がっこう''가 정답이다.',
  3,
  1.13
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '배열'
    and q.question = '私は今朝 ____ へ行きました。'
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
  '문법',
  '배열',
  '山田さんは今____にいます。',
  'きょうしつ',
  'うれしい',
  'はなす',
  '青い',
  1,
  '''~にいます''는 위치를 나타내므로 ''きょうしつ''(교실)이 맞다.',
  2,
  1.02
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '배열'
    and q.question = '山田さんは今____にいます。'
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
  '문법',
  '배열',
  '私は毎晩 ____ をします。',
  'べんきょう',
  'さむい',
  '大きい',
  'いぬ',
  1,
  '''~をします''의 대상으로 ''べんきょう''(공부)가 적합하다.',
  3,
  1.1
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '배열'
    and q.question = '私は毎晩 ____ をします。'
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
  '문법',
  '배열',
  'このケーキは____です。',
  'おいしい',
  'みどり',
  '月曜日',
  '読む',
  1,
  '''おいしい''(맛있다)가 케이크에 어울린다.',
  2,
  0.98
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '배열'
    and q.question = 'このケーキは____です。'
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
  '문법',
  '배열',
  '先生は____で本を読んでいます。',
  'としょかん',
  'あたらしい',
  'かわいい',
  '長い',
  1,
  '''~で''는 장소를 나타내기 때문에 ''としょかん''(도서관)이 맞다.',
  4,
  1.18
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '배열'
    and q.question = '先生は____で本を読んでいます。'
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
  '문법',
  '배열',
  '____に手紙を書きます。',
  'ともだち',
  '大きい',
  'のむ',
  '高い',
  1,
  '''~に手紙を書きます''에서 ''~에게''의 의미로 ''ともだち''(친구)가 올 수 있다.',
  4,
  1.18
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '배열'
    and q.question = '____に手紙を書きます。'
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
  '문법',
  '배열',
  '田中さんの____は看護師です。',
  'おかあさん',
  '読んだ',
  '白い',
  '速く',
  1,
  '''田中さんの〜は'' 형태에서 가족 명사인 ''おかあさん''(어머니)이 적당하다.',
  3,
  1.13
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '배열'
    and q.question = '田中さんの____は看護師です。'
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
  '문법',
  '배열',
  'きょうはとても____です。',
  'あつい',
  'にぎやか',
  '読む',
  '青い',
  1,
  '''とても''는 정도를 강조하므로 ''あつい''(덥다)가 자연스럽다.',
  2,
  1
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '배열'
    and q.question = 'きょうはとても____です。'
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
  '문법',
  '배열',
  '私はバスで____へ行きます。',
  'しごと',
  '赤い',
  '飲む',
  '高い',
  1,
  '''~へ行きます''의 대상은 장소가 와야 하므로 ''しごと''(직장)가 맞다.',
  4,
  1.15
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '배열'
    and q.question = '私はバスで____へ行きます。'
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
  '문법',
  '배열',
  '田中さんは____が上手です。',
  'りょうり',
  'おおきい',
  '早い',
  'みず',
  1,
  '''~が上手です'' 앞에는 기술이나 능력이 오므로 ''りょうり''(요리)가 어울린다.',
  3,
  1.12
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '배열'
    and q.question = '田中さんは____が上手です。'
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
  '문법',
  '배열',
  '私は今、図書館で____。',
  'べんきょうしています',
  'はやい',
  '青い',
  'ひくい',
  1,
  '지금 도서관이 장소이므로, 현재진행형 동사 ''べんきょうしています''(공부하고 있다)가 맞다.',
  4,
  1.14
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '배열'
    and q.question = '私は今、図書館で____。'
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
  '문법',
  '배열',
  '来週、友達と____へ行きます。',
  'うみ',
  '赤い',
  '速い',
  '小さい',
  1,
  '''~へ行きます''에서 이동할 수 있는 장소인 ''うみ''(바다)가 적절하다.',
  3,
  1.18
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '배열'
    and q.question = '来週、友達と____へ行きます。'
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
  '문법',
  '배열',
  '夜ご飯に____を食べました。',
  'さかな',
  'いい',
  '高い',
  '散歩',
  1,
  '''夜ご飯に~を食べました''의 대상인 ''さかな''(생선)가 문맥상 맞다.',
  2,
  1.12
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '배열'
    and q.question = '夜ご飯に____を食べました。'
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
  '문법',
  '배열',
  '昨日、家で____を見ました。',
  'えいが',
  '大きい',
  'たべる',
  '明るい',
  1,
  '''~を見ました'' 앞에는 볼 수 있는 대상이 오는 것이 자연스러워 ''えいが''(영화)가 정답이다.',
  2,
  1.08
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '배열'
    and q.question = '昨日、家で____を見ました。'
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
  '문법',
  '배열',
  '弟は毎日 ____ を弾きます。',
  'ピアノ',
  '白い',
  'おそい',
  'かわいい',
  1,
  '''~を弾きます''에서 악기를 연주하는 표현이므로 ''ピアノ''(피아노)가 해당한다.',
  3,
  1.16
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '배열'
    and q.question = '弟は毎日 ____ を弾きます。'
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
  '문법',
  '배열',
  '山に____がたくさんあります。',
  'き',
  '赤い',
  'のむ',
  '明日',
  1,
  '산에는 ''き''(나무)가 많다는 것이 자연스럽다.',
  4,
  1.21
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '배열'
    and q.question = '山に____がたくさんあります。'
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
  '문법',
  '배열',
  '駅前に新しい ____ ができました。',
  'みせ',
  'はやい',
  'こわい',
  '歩く',
  1,
  '''新しい''로 꾸밀 수 있는 명사는 ''みせ''(가게)가 어울린다.',
  5,
  1.25
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '배열'
    and q.question = '駅前に新しい ____ ができました。'
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
  '문법',
  '배열',
  '私の趣味は____を撮ることです。',
  'しゃしん',
  '黒い',
  '走る',
  'いえ',
  1,
  '''~を撮る''의 대상은 ''しゃしん''(사진)밖에 없다.',
  4,
  1.15
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '배열'
    and q.question = '私の趣味は____を撮ることです。'
);

commit;
