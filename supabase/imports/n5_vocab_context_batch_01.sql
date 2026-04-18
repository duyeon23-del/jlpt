begin;

-- generated from data/n5-batches/n5_vocab_context_batch_01.json
-- generated at 2026-04-15T16:47:12.645Z

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
  'あさ ごはんを ____。',
  'のみます',
  'たべます',
  'みます',
  'ききます',
  2,
  'ごはん은 밥이므로 먹다인 たべます 가 자연스럽다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '문맥 규정'
    and q.question = 'あさ ごはんを ____。'
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
  'みずを ____。',
  'のみます',
  'たべます',
  'かきます',
  'あけます',
  1,
  'みず는 물이므로 마시다인 のみます 가 맞다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '문맥 규정'
    and q.question = 'みずを ____。'
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
  'がっこうで にほんごを ____。',
  'およぎます',
  'べんきょうします',
  'ねます',
  'あらいます',
  2,
  '학교에서 일본어를 하는 행동은 공부하다인 べんきょうします 가 가장 자연스럽다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '문맥 규정'
    and q.question = 'がっこうで にほんごを ____。'
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
  'でんしゃで うちへ ____。',
  'かえります',
  'きります',
  'しめます',
  'たちます',
  1,
  '집으로 돌아간다는 문맥이므로 かえります 가 맞다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '문맥 규정'
    and q.question = 'でんしゃで うちへ ____。'
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
  'へやの まどを ____。',
  'あけます',
  'のみます',
  'はしります',
  'おきます',
  1,
  '창문을 여는 상황이므로 あけます 가 맞다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '문맥 규정'
    and q.question = 'へやの まどを ____。'
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
  'よる 11じに ____。',
  'おきます',
  'ねます',
  'あびます',
  'つかいます',
  2,
  '밤 11시에 하는 자연스러운 행동은 자다인 ねます 이다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '문맥 규정'
    and q.question = 'よる 11じに ____。'
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
  'スーパーで くだものを ____。',
  'かいます',
  'つくります',
  'あいます',
  'おしえます',
  1,
  '슈퍼에서 과일을 사는 문맥이므로 かいます 가 맞다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '문맥 규정'
    and q.question = 'スーパーで くだものを ____。'
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
  'ともだちに てがみを ____。',
  'かきます',
  'ききます',
  'およぎます',
  'たべます',
  1,
  '편지를 쓰는 문맥이므로 かきます 가 정답이다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '문맥 규정'
    and q.question = 'ともだちに てがみを ____。'
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
  'せんせいの はなしを ____。',
  'みます',
  'ききます',
  'かえります',
  'いれます',
  2,
  '이야기나 설명은 듣는 것이므로 ききます 가 맞다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '문맥 규정'
    and q.question = 'せんせいの はなしを ____。'
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
  'えいがを ____。',
  'みます',
  'ききます',
  'のります',
  'はなします',
  1,
  '영화는 보다인 みます 를 사용한다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '문맥 규정'
    and q.question = 'えいがを ____。'
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
  'バスに ____。',
  'のります',
  'あびます',
  'あけます',
  'ならびます',
  1,
  '버스에는 탄다를 써서 のります 가 맞다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '문맥 규정'
    and q.question = 'バスに ____。'
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
  'あついので シャワーを ____。',
  'うります',
  'あびます',
  'つくります',
  'ならいます',
  2,
  '샤워는 몸에 뒤집어쓰는 동사 あびます 를 사용한다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '문맥 규정'
    and q.question = 'あついので シャワーを ____。'
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
  'わからない ことを せんせいに ____。',
  'ききます',
  'ぬぎます',
  'いそぎます',
  'たちます',
  1,
  '모르는 것을 선생님에게 묻는 문맥이므로 ききます 가 맞다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '문맥 규정'
    and q.question = 'わからない ことを せんせいに ____。'
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
  'あした はやいので きょうは はやく ____。',
  'ねます',
  'あいます',
  'かきます',
  'つかいます',
  1,
  '내일 일찍 일어나야 하니 오늘은 일찍 자는 것이 자연스럽다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '문맥 규정'
    and q.question = 'あした はやいので きょうは はやく ____。'
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
  'ほんやで じしょを ____。',
  'よみます',
  'かいます',
  'おきます',
  'すわります',
  2,
  '서점에서 사전을 사는 상황이므로 かいます 가 맞다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '문맥 규정'
    and q.question = 'ほんやで じしょを ____。'
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
  'まいにち にっきを ____。',
  'かきます',
  'ききます',
  'のります',
  'まちます',
  1,
  '일기는 쓰는 것이므로 かきます 가 맞다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '문맥 규정'
    and q.question = 'まいにち にっきを ____。'
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
  'こうえんで いぬと ____。',
  'あそびます',
  'しめます',
  'ぬぎます',
  'あらいます',
  1,
  '공원에서 개와 하는 자연스러운 행동은 놀다인 あそびます 이다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '문맥 규정'
    and q.question = 'こうえんで いぬと ____。'
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
  'さむいので コートを ____。',
  'きます',
  'ぬぎます',
  'おします',
  'きります',
  1,
  '추울 때 코트는 입는 것이므로 きます 가 맞다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '문맥 규정'
    and q.question = 'さむいので コートを ____。'
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
  'うちへ かえってから テレビを ____。',
  'つけます',
  'けします',
  'あけます',
  'まがります',
  1,
  '집에 와서 TV를 켠다는 문맥이므로 つけます 가 자연스럽다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '문맥 규정'
    and q.question = 'うちへ かえってから テレビを ____。'
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
  'きっさてんで コーヒーを ____。',
  'たべます',
  'のみます',
  'はしります',
  'あらいます',
  2,
  '커피는 마시는 것이므로 のみます 가 맞다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '문맥 규정'
    and q.question = 'きっさてんで コーヒーを ____。'
);

commit;
