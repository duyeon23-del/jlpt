begin;

-- generated from data/n5-batches/n5_vocab_kanji_batch_03.json
-- generated at 2026-04-17T13:42:48.473Z

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
  'この____は本当に美味しいです。',
  'さかな',
  'くるま',
  'とけい',
  'うみ',
  1,
  '魚(さかな)은 ''물고기''라는 의미입니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '한자 읽기'
    and q.question = 'この____は本当に美味しいです。'
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
  '私は____へ行きます。',
  'がっこう',
  'ともだち',
  'きょうしつ',
  'にほん',
  1,
  '学校(がっこう)은 ''학교''입니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '한자 읽기'
    and q.question = '私は____へ行きます。'
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
  '昨日、____を書きました。',
  'てがみ',
  'じしょ',
  'しんぶん',
  'なつ',
  1,
  '手紙(てがみ)은 ''편지''라는 뜻입니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '한자 읽기'
    and q.question = '昨日、____を書きました。'
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
  '山の____がきれいです。',
  'うえ',
  'かわ',
  'みち',
  'あさ',
  1,
  '上(うえ)는 ''위''라는 뜻입니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '한자 읽기'
    and q.question = '山の____がきれいです。'
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
  'わたしの____は大きいです。',
  'いえ',
  'はな',
  'かぜ',
  'いぬ',
  1,
  '家(いえ)는 ''집''입니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '한자 읽기'
    and q.question = 'わたしの____は大きいです。'
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
  'きのう、____で勉強しました。',
  'としょかん',
  'びょういん',
  'こうえん',
  'えき',
  1,
  '図書館(としょかん)은 ''도서관''입니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '한자 읽기'
    and q.question = 'きのう、____で勉強しました。'
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
  '春には____が咲きます。',
  'はな',
  'くすり',
  'て',
  'つき',
  1,
  '花(はな)는 ''꽃''이라는 뜻입니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '한자 읽기'
    and q.question = '春には____が咲きます。'
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
  '私の____は青いです。',
  'ふく',
  'ゆき',
  'くるま',
  'せんせい',
  1,
  '服(ふく)는 ''옷''을 의미합니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '한자 읽기'
    and q.question = '私の____は青いです。'
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
  '明日、____があります。',
  'しけん',
  'しゃしん',
  'にわ',
  'きょうだい',
  1,
  '試験(しけん)은 ''시험''이라는 뜻입니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '한자 읽기'
    and q.question = '明日、____があります。'
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
  '____で水をのみます。',
  'コップ',
  'かさ',
  'ゆき',
  'はな',
  1,
  '''コップ''는 컵을 의미하는 카타카나어입니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '한자 읽기'
    and q.question = '____で水をのみます。'
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
  '彼は____をひきます。',
  'ピアノ',
  'おちゃ',
  'いぬ',
  'みせ',
  1,
  '''ピアノ''는 피아노입니다. 한자 대신 자주 쓰이는 기초 명사입니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '한자 읽기'
    and q.question = '彼は____をひきます。'
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
  'お____を食べました。',
  'かし',
  'でんわ',
  'ともだち',
  'あさ',
  1,
  '菓子(かし)는 ''과자''라는 뜻입니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '한자 읽기'
    and q.question = 'お____を食べました。'
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
  '今日は____が高いです。',
  'てんき',
  'おんど',
  'とけい',
  'こども',
  2,
  '温度(おんど)는 ''온도''라는 뜻이며, 높을 때 씁니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '한자 읽기'
    and q.question = '今日は____が高いです。'
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
  '____はどこですか。',
  'だいがく',
  'はなび',
  'とり',
  'きせつ',
  1,
  '大学(だいがく)은 ''대학교''입니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '한자 읽기'
    and q.question = '____はどこですか。'
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
  '夏休みに____へ行きました。',
  'うみ',
  'かわ',
  'かわべ',
  'おか',
  1,
  '海(うみ)는 ''바다''라는 뜻입니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '한자 읽기'
    and q.question = '夏休みに____へ行きました。'
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
  '大きい____が通ります。',
  'トラック',
  'とり',
  'きもの',
  'せんせい',
  1,
  '''トラック'' 는 대형 트럭을 가리킵니다. 자주 쓰이는 기초 명사입니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '한자 읽기'
    and q.question = '大きい____が通ります。'
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
  '毎朝、____で歯をみがきます。',
  'はぶらし',
  'かいしゃ',
  'しろ',
  'くるま',
  1,
  '歯ブラシ(はぶらし)는 ''칫솔''이라는 의미입니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '한자 읽기'
    and q.question = '毎朝、____で歯をみがきます。'
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
  '机の____に本があります。',
  'うえ',
  'なか',
  'した',
  'まえ',
  3,
  '下(した)는 ''아래''라는 뜻입니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '한자 읽기'
    and q.question = '机の____に本があります。'
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
  '先生の____です。',
  'こえ',
  'いえ',
  'かさ',
  'き',
  1,
  '声(こえ)는 ''목소리''입니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '한자 읽기'
    and q.question = '先生の____です。'
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
  '____が好きです。',
  'りんご',
  'ゆき',
  'めがね',
  'そら',
  1,
  'りんご는 ''사과''입니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '한자 읽기'
    and q.question = '____が好きです。'
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
  '駅の____で人に会います。',
  'まえ',
  'うしろ',
  'ひだり',
  'みぎ',
  1,
  '前(まえ)는 ''앞''이라는 뜻입니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '한자 읽기'
    and q.question = '駅の____で人に会います。'
);

commit;
