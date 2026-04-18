begin;

-- generated from data/n5-batches/n5_vocab_context_batch_02.json
-- generated at 2026-04-16T14:03:52.333Z

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
  'きょうは あめです。かさを ____。',
  'もちます',
  'すてます',
  'わすれます',
  'ぬぎます',
  1,
  '비가 오는 날에는 우산을 가져간다는 의미로 もちます가 자연스럽다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '문맥 규정'
    and q.question = 'きょうは あめです。かさを ____。'
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
  'しゅくだいが おおいので、きょうは うちで ____。',
  'べんきょうします',
  'さんぽします',
  'りょこうします',
  'かいものします',
  1,
  '숙제가 많다는 문맥이므로 집에서 공부하는 べんきょうします가 맞다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '문맥 규정'
    and q.question = 'しゅくだいが おおいので、きょうは うちで ____。'
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
  'れいぞうこに ぎゅうにゅうを ____。',
  'いれます',
  'だします',
  'わたします',
  'しめます',
  1,
  '냉장고에 우유를 넣는 상황이므로 いれます가 맞다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '문맥 규정'
    and q.question = 'れいぞうこに ぎゅうにゅうを ____。'
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
  'まいあさ 6じに ____。',
  'おきます',
  'ねます',
  'とまります',
  'まがります',
  1,
  '아침 6시에 하는 행동은 보통 일어나다인 おきます이다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '문맥 규정'
    and q.question = 'まいあさ 6じに ____。'
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
  'せんせいに しつもんを ____。',
  'します',
  'つきます',
  'のぼります',
  'おろします',
  1,
  '질문을 한다는 표현은 しつもんを します가 자연스럽다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '문맥 규정'
    and q.question = 'せんせいに しつもんを ____。'
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
  'つかれたので、ソファーで ____。',
  'やすみます',
  'おどります',
  'うたいます',
  'とびます',
  1,
  '피곤하다는 문맥에서는 쉬다인 やすみます가 가장 적절하다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '문맥 규정'
    and q.question = 'つかれたので、ソファーで ____。'
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
  'えきで ともだちを ____。',
  'まちます',
  'けします',
  'わらいます',
  'なくします',
  1,
  '역에서 친구를 기다리는 상황이므로 まちます가 맞다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '문맥 규정'
    and q.question = 'えきで ともだちを ____。'
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
  'この かんじの よみかたが わかりません。じしょで ____。',
  'しらべます',
  'あそびます',
  'はらいます',
  'あらいます',
  1,
  '사전으로 찾아본다는 의미로 しらべます가 자연스럽다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '문맥 규정'
    and q.question = 'この かんじの よみかたが わかりません。じしょで ____。'
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
  'コンビニで パンを ____。',
  'かいます',
  'かします',
  'おきます',
  'あいます',
  1,
  '편의점에서 빵을 사는 문맥이므로 かいます가 맞다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '문맥 규정'
    and q.question = 'コンビニで パンを ____。'
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
  'ドアを ____ から へやに はいってください。',
  'あけて',
  'しめて',
  'つけて',
  'けして',
  1,
  '방에 들어가기 위해 문을 여는 동작이 필요하므로 あけて가 맞다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '문맥 규정'
    and q.question = 'ドアを ____ から へやに はいってください。'
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
  'あついので、エアコンを ____。',
  'つけます',
  'けします',
  'だします',
  'なおします',
  1,
  '더운 상황에서 에어컨을 켠다는 의미로 つけます가 자연스럽다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '문맥 규정'
    and q.question = 'あついので、エアコンを ____。'
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
  'さむいので まどを ____。',
  'しめます',
  'あけます',
  'こわします',
  'ひろいます',
  1,
  '추울 때는 창문을 닫는 것이 자연스러우므로 しめます가 맞다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '문맥 규정'
    and q.question = 'さむいので まどを ____。'
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
  'よる、いぬと こうえんを ____。',
  'さんぽします',
  'しゅっぱつします',
  'けっこんします',
  'せんたくします',
  1,
  '개와 공원을 산책한다는 문맥으로 さんぽします가 가장 적절하다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '문맥 규정'
    and q.question = 'よる、いぬと こうえんを ____。'
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
  'しごとの あとで うちへ ____。',
  'かえります',
  'およぎます',
  'おしえます',
  'きめます',
  1,
  '일이 끝난 뒤 집에 돌아간다는 의미로 かえります가 맞다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '문맥 규정'
    and q.question = 'しごとの あとで うちへ ____。'
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
  'ともだちの たんじょうびに プレゼントを ____。',
  'あげます',
  'かります',
  'きります',
  'わります',
  1,
  '선물을 준다는 문맥에서는 あげます를 사용한다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '문맥 규정'
    and q.question = 'ともだちの たんじょうびに プレゼントを ____。'
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
  'せんせいに ほんを ____。',
  'かります',
  'あげます',
  'おします',
  'ふきます',
  1,
  '선생님에게 책을 빌린다는 상황으로 かります가 자연스럽다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '문맥 규정'
    and q.question = 'せんせいに ほんを ____。'
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
  'しけんの まえに、ノートを ____。',
  'みなおします',
  'なくします',
  'こわします',
  'あらいます',
  1,
  '시험 전에는 노트를 다시 보는 것이 자연스러워 みなおします가 맞다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '문맥 규정'
    and q.question = 'しけんの まえに、ノートを ____。'
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
  'けさは いそいで いたので、あさごはんを ____。',
  'たべませんでした',
  'たべました',
  'つくりました',
  'のみました',
  1,
  '바빴기 때문에 아침을 먹지 못했다는 흐름으로 たべませんでした가 맞다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '문맥 규정'
    and q.question = 'けさは いそいで いたので、あさごはんを ____。'
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
  'にほんごの クラスで となりの ひとと ____。',
  'はなします',
  'ねます',
  'あびます',
  'ぬぎます',
  1,
  '수업에서 옆 사람과 대화하는 상황이므로 はなします가 맞다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '문맥 규정'
    and q.question = 'にほんごの クラスで となりの ひとと ____。'
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
  'ほんを よんだ あとで、でんきを ____。',
  'けします',
  'つけます',
  'かけます',
  'はらいます',
  1,
  '책을 읽은 뒤 불을 끈다는 문맥으로 けします가 자연스럽다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '문맥 규정'
    and q.question = 'ほんを よんだ あとで、でんきを ____。'
);

commit;
