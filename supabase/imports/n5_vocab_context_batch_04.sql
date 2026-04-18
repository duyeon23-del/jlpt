begin;

-- generated from data/n5-batches/n5_vocab_context_batch_04.json
-- generated at 2026-04-17T13:53:08.055Z

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
  '寝る前に毎日____を読みます。',
  '本',
  '水',
  '時計',
  '机',
  1,
  '寝る前には普通本を読みます。他の選択肢は文脈に合いません。'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '문맥 규정'
    and q.question = '寝る前に毎日____を読みます。'
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
  '朝ごはんに____を飲みます。',
  '牛乳',
  '傘',
  '図書館',
  '時計',
  1,
  '朝ごはんと一緒に飲むのは牛乳が自然です。'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '문맥 규정'
    and q.question = '朝ごはんに____を飲みます。'
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
  '窓を____ください。',
  '開けて',
  '歌って',
  '座って',
  '洗って',
  1,
  '窓は普通開けるものです。他の動詞は窓には使いません。'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '문맥 규정'
    and q.question = '窓を____ください。'
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
  '今日はとても____ですから、コートを着ます。',
  '寒い',
  '軽い',
  '速い',
  '甘い',
  1,
  'コートを着るのは寒い時です。'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '문맥 규정'
    and q.question = '今日はとても____ですから、コートを着ます。'
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
  '毎週日曜日に____へ行きます。',
  '教会',
  '傘',
  'カレンダー',
  '魚',
  1,
  '日曜日に教会へ行く人が多いです。'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '문맥 규정'
    and q.question = '毎週日曜日に____へ行きます。'
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
  '友だちの家で晩ごはんを____。',
  '食べます',
  '歩きます',
  '泳ぎます',
  '待ちます',
  1,
  '家で晩ごはんを食べます、は自然な表現です。'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '문맥 규정'
    and q.question = '友だちの家で晩ごはんを____。'
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
  '____で写真を撮りました。',
  '公園',
  '新聞',
  '鉛筆',
  'お金',
  1,
  '写真を撮る場所として公園が自然です。'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '문맥 규정'
    and q.question = '____で写真を撮りました。'
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
  '明日、____がふるかもしれません。',
  '雨',
  '帽子',
  '料理',
  '電話',
  1,
  '「ふる」は「雨」と一緒によく使う動詞です。'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '문맥 규정'
    and q.question = '明日、____がふるかもしれません。'
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
  '毎晩9時に____を見ます。',
  'テレビ',
  '皿',
  '靴下',
  '公園',
  1,
  '毎晩決まった時間に見るのはテレビが一般的です。'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '문맥 규정'
    and q.question = '毎晩9時に____を見ます。'
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
  '____が高いので買えません。',
  '値段',
  '手紙',
  '勉強',
  '学校',
  1,
  '買い物する時、「値段」が高いや安いと言います。'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '문맥 규정'
    and q.question = '____が高いので買えません。'
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
  '午前8時に____に乗ります。',
  '電車',
  '帽子',
  '机',
  'テスト',
  1,
  '「乗ります」と一緒に使うのは「電車」が自然です。'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '문맥 규정'
    and q.question = '午前8時に____に乗ります。'
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
  '図書館で____を借りました。',
  '本',
  '食べ物',
  '窓ガラス',
  '町',
  1,
  '図書館で借りられるのは「本」です。'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '문맥 규정'
    and q.question = '図書館で____を借りました。'
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
  'スーパーで____を買いました。',
  '野菜',
  '映画',
  '勉強',
  '橋',
  1,
  'スーパーで買うものとして一般的なのは「野菜」です。'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '문맥 규정'
    and q.question = 'スーパーで____を買いました。'
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
  '昨日の____はとてもおいしかったです。',
  '夕食',
  '電話',
  '花',
  '雲',
  1,
  '「夕食」は食事なのでおいしいと言うのが自然です。'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '문맥 규정'
    and q.question = '昨日の____はとてもおいしかったです。'
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
  '山田さんの____はしんせつな人です。',
  '母',
  '自転車',
  '写真',
  '郵便',
  1,
  '人について「しんせつ」と表現します。「母」が適切です。'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '문맥 규정'
    and q.question = '山田さんの____はしんせつな人です。'
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
  '今日は学校で大きな____があります。',
  '行事',
  '猫',
  '色',
  '橋',
  1,
  '学校で開催する大きなものといえば行事が自然です。'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '문맥 규정'
    and q.question = '今日は学校で大きな____があります。'
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
  '____をしてから寝ます。',
  '歯みがき',
  '駅',
  '右',
  '外',
  1,
  '寝る前にすることとして「歯みがき」が一般的です。'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '문맥 규정'
    and q.question = '____をしてから寝ます。'
);

commit;
