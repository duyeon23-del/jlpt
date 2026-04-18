begin;

-- generated from data/n5-batches/n5_vocab_notation_batch_04.json
-- generated at 2026-04-17T13:52:29.135Z

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
  '표기',
  'きょうの天気は ____ ですか。',
  'どう',
  'どこ',
  'なに',
  'だれ',
  1,
  '날씨와 같이 상태를 물을 때는 ''どう''가 알맞습니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '표기'
    and q.question = 'きょうの天気は ____ ですか。'
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
  '표기',
  '私は毎朝七時に ____。',
  'おきます',
  'たべます',
  'のみます',
  'いきます',
  1,
  '아침에 하는 대표적인 행동인 ''일어나다''는 ''おきます''입니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '표기'
    and q.question = '私は毎朝七時に ____。'
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
  '표기',
  '本は机の ____ です。',
  'うえ',
  'した',
  'なか',
  'そと',
  1,
  '''책상이 위''라는 말은 ''うえ(위)''입니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '표기'
    and q.question = '本は机の ____ です。'
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
  '표기',
  'いぬは ____ のどうぶつです。',
  'ともだち',
  'くすり',
  'おかし',
  'でんわ',
  1,
  '개는 친구가 될 수 있는 동물입니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '표기'
    and q.question = 'いぬは ____ のどうぶつです。'
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
  '표기',
  'おふろに ____。',
  'はいります',
  'でます',
  'あけます',
  'もちます',
  1,
  '''목욕을 하다''는 일본어로 ''おふろにはいります''입니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '표기'
    and q.question = 'おふろに ____。'
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
  '표기',
  '今日は ____ です。',
  'げつようび',
  'さんようび',
  'といようび',
  'かじょうび',
  1,
  '''월요일''의 표기는 ''げつようび''입니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '표기'
    and q.question = '今日は ____ です。'
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
  '표기',
  'これは山田さんの ____ です。',
  'かばん',
  'ごはん',
  'かわ',
  'きょうしつ',
  1,
  '''가방''을 나타내는 일상 단어는 ''かばん''입니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '표기'
    and q.question = 'これは山田さんの ____ です。'
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
  '표기',
  'あそこに ____ がいます。',
  'せんせい',
  'とけい',
  'くつ',
  'テーブル',
  1,
  '사람이 있을 때는 ''선생님''이나 ''학생'' 등 사람이 들어가야 합니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '표기'
    and q.question = 'あそこに ____ がいます。'
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
  '표기',
  '夜8時に ____ を食べます。',
  'ばんごはん',
  'おべんとう',
  'あさごはん',
  'ひるやすみ',
  1,
  '''밤 8시에 먹는 밥''은 일반적으로 ''저녁밥''인 ''ばんごはん''입니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '표기'
    and q.question = '夜8時に ____ を食べます。'
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
  '표기',
  '昨日、友だちと ____ に行きました。',
  'えいが',
  'えんぴつ',
  'じしょ',
  'きっぷ',
  1,
  '친구와 함께 갈 수 있는 장소는 ''영화관''이라는 의미의 ''えいが''입니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '표기'
    and q.question = '昨日、友だちと ____ に行きました。'
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
  '표기',
  'きのうは ____ でした。',
  'にちようび',
  'いつか',
  'いちがつ',
  'いま',
  1,
  '''일요일''이 어제였다는 뜻입니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '표기'
    and q.question = 'きのうは ____ でした。'
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
  '표기',
  '出入口はここでは ____。',
  'ありません',
  'たべません',
  'はしりません',
  'のみません',
  1,
  '''없다''는 뜻을 나타내는 것은 ''ありません''입니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '표기'
    and q.question = '出入口はここでは ____。'
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
  '표기',
  '駅まで歩いて ____ 分かかります。',
  'じゅっ',
  'きゅう',
  'さん',
  'ろく',
  1,
  '10분은 ''じゅっぷん''에서 앞 글자 ''じゅっ''이 알맞습니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '표기'
    and q.question = '駅まで歩いて ____ 分かかります。'
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
  '표기',
  '母は ____ がじょうずです。',
  'りょうり',
  'しごと',
  'べんきょう',
  'えんぴつ',
  1,
  '''요리''가 능숙하다는 표현입니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '표기'
    and q.question = '母は ____ がじょうずです。'
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
  '표기',
  '毎日、学校で ____ をします。',
  'べんきょう',
  'テレビ',
  'ゆうびん',
  'あそび',
  1,
  '학교에서 하는 대표적인 활동은 ''공부(べんきょう)''입니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '표기'
    and q.question = '毎日、学校で ____ をします。'
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
  '표기',
  '____　をください。',
  'みず',
  'みせ',
  'みち',
  'みみ',
  1,
  '''물을 주세요''라는 표기입니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '표기'
    and q.question = '____　をください。'
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
  '표기',
  '私は日本語が ____。',
  'すこしできます',
  'たべます',
  'いきます',
  'みます',
  1,
  '''할 수 있다''는 표현은 ''できます''가 사용됩니다.'
where not exists (
  select 1
  from public.questions q
  where q.level = 'N5'
    and q.type = '문자·어휘'
    and q.sub_type = '표기'
    and q.question = '私は日本語が ____。'
);

commit;
