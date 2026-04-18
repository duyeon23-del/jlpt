begin;

-- generated from data/n5-batches/n5_grammar_reorder_batch_01.json
-- generated at 2026-04-15T16:47:13.035Z

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
  'わたしは ____ がっこうへ いきます。',
  'まいにち',
  'きのう',
  'ほん',
  'おいしい',
  1,
  '습관을 나타내는 문맥이므로 매일을 뜻하는 まいにち가 가장 자연스럽다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '배열'
    and q.question = 'わたしは ____ がっこうへ いきます。'
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
  'きのう ともだちと ____。',
  'えいがを みました',
  'えいがを みます',
  'えいがが みました',
  'えいがに みました',
  1,
  'きのう가 있으므로 과거형이 필요하고, 영화를 보다에는 えいがを みました가 맞다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '배열'
    and q.question = 'きのう ともだちと ____。'
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
  'つくえの うえに ____。',
  'ほんが あります',
  'ほんが います',
  'ほんを あります',
  'ほんに あります',
  1,
  '책은 무생물이므로 あります를 쓰고, 존재 주어는 が를 사용해 ほんが あります가 맞다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '배열'
    and q.question = 'つくえの うえに ____。'
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
  'あした 7じに ____。',
  'うちを でます',
  'うちを でました',
  'うちが でます',
  'うちに でます',
  1,
  '미래 시점이므로 비과거형이 필요하고, 집을 나가다는 うちを でます가 자연스럽다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '배열'
    and q.question = 'あした 7じに ____。'
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
  'わたしの へやに テレビは ____。',
  'ありません',
  'いません',
  'あります',
  'います',
  1,
  'テレビ는 무생물이므로 あります/ありません을 쓰고, 없는 문맥이므로 ありません이 맞다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '배열'
    and q.question = 'わたしの へやに テレビは ____。'
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
  'いぬが こうえんに ____。',
  'います',
  'あります',
  'いきます',
  'みます',
  1,
  '개는 생물이므로 존재 표현으로 います를 사용한다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '배열'
    and q.question = 'いぬが こうえんに ____。'
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
  'まいあさ 6じに ____。',
  'おきます',
  'おきました',
  'おきて',
  'おきる',
  1,
  '매일 아침의 습관을 나타내므로 정중 비과거형 おきます가 맞다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '배열'
    and q.question = 'まいあさ 6じに ____。'
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
  'にちようびに うみへ ____。',
  'いきます',
  'いきました',
  'いって',
  'いく',
  1,
  '주말 계획을 말하는 기본 문장에서는 정중 비과거형 いきます가 가장 자연스럽다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '배열'
    and q.question = 'にちようびに うみへ ____。'
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
  'きょうは さかなを ____。',
  'たべます',
  'たべました',
  'たべて',
  'たべる',
  1,
  '오늘의 행동이나 예정 표현으로는 たべます가 자연스럽다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '배열'
    and q.question = 'きょうは さかなを ____。'
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
  'せんせいは きょう がっこうに ____。',
  'います',
  'あります',
  'いません',
  'ありません',
  1,
  '선생님은 사람이므로 います를 써야 한다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '배열'
    and q.question = 'せんせいは きょう がっこうに ____。'
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
  'かばんに ほんを ____。',
  'いれます',
  'でます',
  'います',
  'あります',
  1,
  '가방에 책을 넣는 문맥이므로 いれます가 맞다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '배열'
    and q.question = 'かばんに ほんを ____。'
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
  'こんばん 8じに しゅくだいを ____。',
  'します',
  'しました',
  'して',
  'しる',
  1,
  '오늘 밤 할 예정이므로 します가 맞다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '배열'
    and q.question = 'こんばん 8じに しゅくだいを ____。'
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
  'ともだちに こうえんで ____。',
  'あいました',
  'あります',
  'のみます',
  'よみます',
  1,
  '친구를 공원에서 만났다는 과거 문맥이므로 あいました가 맞다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '배열'
    and q.question = 'ともだちに こうえんで ____。'
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
  'へやに いすが 3つ ____。',
  'あります',
  'います',
  'ありましたか',
  'いきます',
  1,
  '의자는 무생물이므로 あります가 맞다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '배열'
    and q.question = 'へやに いすが 3つ ____。'
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
  'この りんごは 300えん ____。',
  'です',
  'を',
  'が',
  'へ',
  1,
  '가격을 설명하는 서술문이므로 です가 맞다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '배열'
    and q.question = 'この りんごは 300えん ____。'
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
  'きのう 9じに うちへ ____。',
  'かえりました',
  'かえります',
  'かえる',
  'かえって',
  1,
  'きのう가 있으므로 과거형 かえりました가 맞다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '배열'
    and q.question = 'きのう 9じに うちへ ____。'
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
  'わたしは まいにち バスで がっこうへ ____。',
  'いきます',
  'いきました',
  'いって',
  'いる',
  1,
  '매일 학교에 간다는 습관 표현이므로 いきます가 맞다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '배열'
    and q.question = 'わたしは まいにち バスで がっこうへ ____。'
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
  'あした こうえんで サッカーを ____。',
  'します',
  'しました',
  'して',
  'しますか',
  1,
  '미래 예정이므로 します가 가장 자연스럽다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '배열'
    and q.question = 'あした こうえんで サッカーを ____。'
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
  'うちに ねこが ____。',
  'います',
  'あります',
  'ありません',
  'おきます',
  1,
  '고양이는 생물이므로 います가 맞다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '배열'
    and q.question = 'うちに ねこが ____。'
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
  'えきの まえに コンビニが ____。',
  'あります',
  'います',
  'いきます',
  'みます',
  1,
  '편의점은 무생물이므로 あります가 맞다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '배열'
    and q.question = 'えきの まえに コンビニが ____。'
);

commit;
