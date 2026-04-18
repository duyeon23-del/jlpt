begin;

-- generated from data/n5-batches/n5_grammar_judgement_batch_01.json
-- generated at 2026-04-15T16:47:12.844Z

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
  '판단',
  'わたしは にほん ____ きました。',
  'を',
  'に',
  'で',
  'へ',
  4,
  '도착 방향을 나타낼 때는 へ 또는 に를 쓸 수 있지만, 여기서는 이동 방향을 나타내는 へ가 자연스럽다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '판단'
    and q.question = 'わたしは にほん ____ きました。'
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
  '판단',
  'きのう ともだちと えいがを ____。',
  'みます',
  'みました',
  'みる',
  'みて',
  2,
  'きのう 가 있으므로 과거형인 みました 가 맞다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '판단'
    and q.question = 'きのう ともだちと えいがを ____。'
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
  '판단',
  'つくえの うえ ____ ほんが あります。',
  'に',
  'を',
  'へ',
  'と',
  1,
  '장소에 존재함을 나타낼 때는 に를 사용한다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '판단'
    and q.question = 'つくえの うえ ____ ほんが あります。'
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
  '판단',
  'あした 7じに うちを ____。',
  'でます',
  'でました',
  'でる',
  'でて',
  1,
  'あした 는 미래이므로 비과거 정중형인 でます 가 맞다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '판단'
    and q.question = 'あした 7じに うちを ____。'
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
  '판단',
  'わたしの へやに テレビは ____。',
  'あります',
  'います',
  'ありません',
  'いません',
  3,
  'テレビ는 무생물이므로 あります/ありません 을 쓰며, は 가 있어 부정문 문맥에서는 ありません 이 자연스럽다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '판단'
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
  '판단',
  'いぬが こうえん ____ います。',
  'を',
  'に',
  'と',
  'へ',
  2,
  '존재하는 장소를 나타낼 때는 に를 사용한다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '판단'
    and q.question = 'いぬが こうえん ____ います。'
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
  '판단',
  'まいあさ 6じに ____。',
  'おきます',
  'おきました',
  'おきる',
  'おきて',
  1,
  '매일 아침의 습관이므로 비과거 정중형 おきます 가 맞다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '판단'
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
  '판단',
  'にちようびに うみ ____ いきます。',
  'を',
  'と',
  'へ',
  'が',
  3,
  '이동 방향을 나타낼 때는 へ가 맞다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '판단'
    and q.question = 'にちようびに うみ ____ いきます。'
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
  '판단',
  'きょうは さかなを ____。',
  'たべます',
  'たべました',
  'たべる',
  'たべて',
  1,
  '오늘의 예정이나 현재 문맥이므로 비과거 정중형 たべます 가 자연스럽다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '판단'
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
  '판단',
  'せんせいは きょう がっこうに ____。',
  'います',
  'あります',
  'いません',
  'ありません',
  1,
  '선생님은 사람이라 존재 표현으로 います 를 사용한다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '판단'
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
  '판단',
  'かばん ____ ほんを いれます。',
  'が',
  'に',
  'で',
  'と',
  2,
  '무언가를 넣는 대상 장소는 に를 사용한다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '판단'
    and q.question = 'かばん ____ ほんを いれます。'
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
  '판단',
  'こんばん 8じに しゅくだいを ____。',
  'します',
  'しました',
  'して',
  'しる',
  1,
  '오늘 밤 할 예정이므로 비과거 정중형 します 가 맞다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '판단'
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
  '판단',
  'ともだち ____ こうえんで あいました。',
  'に',
  'を',
  'で',
  'へ',
  1,
  '만나는 대상은 に를 사용한다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '판단'
    and q.question = 'ともだち ____ こうえんで あいました。'
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
  '판단',
  'へやに いすが 3つ ____。',
  'います',
  'あります',
  'ありません',
  'いません',
  2,
  '의자는 무생물이므로 あります 를 사용한다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '판단'
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
  '판단',
  'この りんごは 300えん ____。',
  'を',
  'に',
  'です',
  'が',
  3,
  '가격을 말할 때는 명사 뒤에 です 를 써서 서술한다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '판단'
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
  '판단',
  'きのう 9じに うちへ ____。',
  'かえります',
  'かえりました',
  'かえる',
  'かえって',
  2,
  'きのう 가 있으므로 과거형인 かえりました 가 맞다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '판단'
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
  '판단',
  'わたしは まいにち バス ____ がっこうへ いきます。',
  'に',
  'で',
  'を',
  'と',
  2,
  '교통수단을 나타낼 때는 で를 사용한다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '판단'
    and q.question = 'わたしは まいにち バス ____ がっこうへ いきます。'
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
  '판단',
  'あした こうえんで サッカーを ____。',
  'します',
  'しました',
  'して',
  'しませんでした',
  1,
  '내일 할 예정이므로 비과거형 します 가 맞다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '판단'
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
  '판단',
  'うちに ねこは ____。',
  'あります',
  'います',
  'ありません',
  'いません',
  2,
  '고양이는 생물이므로 います 를 사용한다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '판단'
    and q.question = 'うちに ねこは ____。'
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
  '판단',
  'えきの まえ ____ コンビニが あります。',
  'に',
  'を',
  'で',
  'と',
  1,
  '존재하는 장소를 나타낼 때는 に가 맞다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문법'
    and q.sub_type = '판단'
    and q.question = 'えきの まえ ____ コンビニが あります。'
);

commit;
