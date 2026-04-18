begin;

-- generated from data/n5-batches/n5_grammar_context_batch_02.json
-- generated at 2026-04-16T14:13:54.455Z

-- passage set 1
insert into public.passages (
  group_id,
  content,
  level,
  type,
  sub_type
)
values (
  'n5_grammar_context_batch_02_set_01',
  'たなかさんは 高校生です。毎日 学校へ 行っています。今日は 数学の テストが あります。朝 7時半に 起きて、朝ごはんを 食べてから 学校へ 行きました。中休みに ともだちと 話します。',
  'N5',
  '문법',
  '문맥'
)
on conflict (group_id) do nothing;

-- passage question 1.1
insert into public.passage_questions (
  group_id,
  type,
  sub_type,
  question,
  blank_number,
  option1,
  option2,
  option3,
  option4,
  answer,
  explanation
)
values (
  'n5_grammar_context_batch_02_set_01',
  '문법',
  '문맥',
  'たなかさんは 毎日 学校へ ____。',
  1,
  'いきます',
  'いきました',
  'いって',
  'いく',
  1,
  '지문에 毎日 (매일) 있으므로 습관을 나타내는 いきます 가 맞다.'
)
on conflict (group_id, blank_number, question) do nothing;

-- passage question 1.2
insert into public.passage_questions (
  group_id,
  type,
  sub_type,
  question,
  blank_number,
  option1,
  option2,
  option3,
  option4,
  answer,
  explanation
)
values (
  'n5_grammar_context_batch_02_set_01',
  '문법',
  '문맥',
  '朝 7時半に ____ 、朝ごはんを 食べてから 学校へ 行きました。',
  2,
  'おきます',
  'おきました',
  'おきて',
  'おきる',
  2,
  '지문이 과거 상황(行きました)이므로 과거형 おきました 가 맞다.'
)
on conflict (group_id, blank_number, question) do nothing;

-- passage question 1.3
insert into public.passage_questions (
  group_id,
  type,
  sub_type,
  question,
  blank_number,
  option1,
  option2,
  option3,
  option4,
  answer,
  explanation
)
values (
  'n5_grammar_context_batch_02_set_01',
  '문법',
  '문맥',
  '今日は 数学の テストが ____。',
  3,
  'あります',
  'あった',
  'あって',
  'あるでしょう',
  1,
  '현재의 상황이므로 있다는 의미의 あります 가 맞다.'
)
on conflict (group_id, blank_number, question) do nothing;

-- passage question 1.4
insert into public.passage_questions (
  group_id,
  type,
  sub_type,
  question,
  blank_number,
  option1,
  option2,
  option3,
  option4,
  answer,
  explanation
)
values (
  'n5_grammar_context_batch_02_set_01',
  '문법',
  '문맥',
  '中休みに ともだちと ____。',
  4,
  'はなします',
  'はなしました',
  'はなして',
  'はなしている',
  1,
  '중간 휴식 시간에 인사를 하는 일반적인 행동이므로 비과거형 はなします 가 자연스럽다.'
)
on conflict (group_id, blank_number, question) do nothing;

-- passage set 2
insert into public.passages (
  group_id,
  content,
  level,
  type,
  sub_type
)
values (
  'n5_grammar_context_batch_02_set_02',
  'きのう わたしは あに と レストランへ 行きました。わたしは ラーメンを 注文しました。あに は カレーを 注文して、食べました。おいしかったので、また 行きたいです。',
  'N5',
  '문법',
  '문맥'
)
on conflict (group_id) do nothing;

-- passage question 2.1
insert into public.passage_questions (
  group_id,
  type,
  sub_type,
  question,
  blank_number,
  option1,
  option2,
  option3,
  option4,
  answer,
  explanation
)
values (
  'n5_grammar_context_batch_02_set_02',
  '문법',
  '문맥',
  'きのう わたしは あに と レストランへ ____。',
  1,
  'いきます',
  'いきました',
  'いって',
  'いく',
  2,
  'きのう (어제) 있으므로 과거형 いきました 가 맞다.'
)
on conflict (group_id, blank_number, question) do nothing;

-- passage question 2.2
insert into public.passage_questions (
  group_id,
  type,
  sub_type,
  question,
  blank_number,
  option1,
  option2,
  option3,
  option4,
  answer,
  explanation
)
values (
  'n5_grammar_context_batch_02_set_02',
  '문법',
  '문맥',
  'わたしは ラーメンを ____。',
  2,
  'たべます',
  'ちゅうもんします',
  'ちゅうもんしました',
  'たべました',
  3,
  '지문이 과거이고, 라면을 주문했다는 의미이므로 ちゅうもんしました 가 맞다.'
)
on conflict (group_id, blank_number, question) do nothing;

-- passage question 2.3
insert into public.passage_questions (
  group_id,
  type,
  sub_type,
  question,
  blank_number,
  option1,
  option2,
  option3,
  option4,
  answer,
  explanation
)
values (
  'n5_grammar_context_batch_02_set_02',
  '문법',
  '문맥',
  'あに は カレーを ____、食べました。',
  3,
  'ちゅうもんして',
  'ちゅうもんする',
  'ちゅうもんした',
  'ちゅうもんします',
  1,
  '두 동작(주문하고 먹었다)을 자연스럽게 잇기 위해 て형 ちゅうもんして 가 맞다.'
)
on conflict (group_id, blank_number, question) do nothing;

-- passage question 2.4
insert into public.passage_questions (
  group_id,
  type,
  sub_type,
  question,
  blank_number,
  option1,
  option2,
  option3,
  option4,
  answer,
  explanation
)
values (
  'n5_grammar_context_batch_02_set_02',
  '문법',
  '문맥',
  'おいしかった ので 、また 行き ____。',
  4,
  'たいです',
  'ます',
  'ました',
  'ている',
  1,
  '향후 소망을 나타내므로 たい (~하고 싶다) 형태와 です를 붙여 たいです 가 맞다.'
)
on conflict (group_id, blank_number, question) do nothing;

-- passage set 3
insert into public.passages (
  group_id,
  content,
  level,
  type,
  sub_type
)
values (
  'n5_grammar_context_batch_02_set_03',
  '来月 ハワイへ 旅行します。飛行機 で 行きます。ホテルの 予約を しました。ビーチで 泳ぎたいです。時間が あれば 山にも 登りたいです。',
  'N5',
  '문법',
  '문맥'
)
on conflict (group_id) do nothing;

-- passage question 3.1
insert into public.passage_questions (
  group_id,
  type,
  sub_type,
  question,
  blank_number,
  option1,
  option2,
  option3,
  option4,
  answer,
  explanation
)
values (
  'n5_grammar_context_batch_02_set_03',
  '문법',
  '문맥',
  '来月 ハワイへ ____。',
  1,
  'りょこうします',
  'りょこうしました',
  'りょこうしている',
  'りょこうしたい',
  1,
  '미래 계획이므로 비과거형 りょこうします 가 맞다.'
)
on conflict (group_id, blank_number, question) do nothing;

-- passage question 3.2
insert into public.passage_questions (
  group_id,
  type,
  sub_type,
  question,
  blank_number,
  option1,
  option2,
  option3,
  option4,
  answer,
  explanation
)
values (
  'n5_grammar_context_batch_02_set_03',
  '문법',
  '문맥',
  '飛行機で ____。',
  2,
  'いきます',
  'のります',
  'かえります',
  'あるきます',
  1,
  '목적지로 가다는 의미이므로 いきます 가 맞다.'
)
on conflict (group_id, blank_number, question) do nothing;

-- passage question 3.3
insert into public.passage_questions (
  group_id,
  type,
  sub_type,
  question,
  blank_number,
  option1,
  option2,
  option3,
  option4,
  answer,
  explanation
)
values (
  'n5_grammar_context_batch_02_set_03',
  '문법',
  '문맥',
  'ホテルの 予約を ____。',
  3,
  'します',
  'しました',
  'している',
  'したい',
  2,
  '이미 예약한 과거의 사실이므로 しました 가 맞다.'
)
on conflict (group_id, blank_number, question) do nothing;

-- passage question 3.4
insert into public.passage_questions (
  group_id,
  type,
  sub_type,
  question,
  blank_number,
  option1,
  option2,
  option3,
  option4,
  answer,
  explanation
)
values (
  'n5_grammar_context_batch_02_set_03',
  '문법',
  '문맥',
  '時間が あれば 山にも ____。',
  4,
  'のぼります',
  'のぼりたいです',
  'のぼった',
  'のぼっている',
  2,
  '조건부 미래 소망을 나타내므로 たいです 형태의 のぼりたいです 가 맞다.'
)
on conflict (group_id, blank_number, question) do nothing;

-- passage set 4
insert into public.passages (
  group_id,
  content,
  level,
  type,
  sub_type
)
values (
  'n5_grammar_context_batch_02_set_04',
  'あした 美術の 授業が あります。先生は 絵を 描くことを 教えています。みんな 楽しく 勉強しています。わたしは 絵が 下手ですが、頑張ります。友達と 一緒に 勉強しましょう。',
  'N5',
  '문법',
  '문맥'
)
on conflict (group_id) do nothing;

-- passage question 4.1
insert into public.passage_questions (
  group_id,
  type,
  sub_type,
  question,
  blank_number,
  option1,
  option2,
  option3,
  option4,
  answer,
  explanation
)
values (
  'n5_grammar_context_batch_02_set_04',
  '문법',
  '문맥',
  'あした 美術の 授業が ____。',
  1,
  'あります',
  'あった',
  'あって',
  'あるでしょう',
  1,
  '명일 예정된 일이므로 있다는 의미의 あります 가 맞다.'
)
on conflict (group_id, blank_number, question) do nothing;

-- passage question 4.2
insert into public.passage_questions (
  group_id,
  type,
  sub_type,
  question,
  blank_number,
  option1,
  option2,
  option3,
  option4,
  answer,
  explanation
)
values (
  'n5_grammar_context_batch_02_set_04',
  '문법',
  '문맥',
  '先生は 絵を ____ことを 教えています。',
  2,
  'かきます',
  'かきましょう',
  'かく',
  'かいた',
  3,
  '명사구를 만들기 위해 기본형 かく 를 사용한다.'
)
on conflict (group_id, blank_number, question) do nothing;

-- passage question 4.3
insert into public.passage_questions (
  group_id,
  type,
  sub_type,
  question,
  blank_number,
  option1,
  option2,
  option3,
  option4,
  answer,
  explanation
)
values (
  'n5_grammar_context_batch_02_set_04',
  '문법',
  '문맥',
  'みんな 楽しく 勉強 ____。',
  3,
  'しています',
  'しました',
  'しますよ',
  'している',
  1,
  '현재 진행 중인 상태를 나타내므로 しています 가 맞다.'
)
on conflict (group_id, blank_number, question) do nothing;

-- passage question 4.4
insert into public.passage_questions (
  group_id,
  type,
  sub_type,
  question,
  blank_number,
  option1,
  option2,
  option3,
  option4,
  answer,
  explanation
)
values (
  'n5_grammar_context_batch_02_set_04',
  '문법',
  '문맥',
  '友達と 一緒に 勉強 ____。',
  4,
  'しましょう',
  'した',
  'しても',
  'しなければ',
  1,
  '제안과 권유를 나타내므로 ましょう 형태의 しましょう 가 맞다.'
)
on conflict (group_id, blank_number, question) do nothing;

-- passage set 5
insert into public.passages (
  group_id,
  content,
  level,
  type,
  sub_type
)
values (
  'n5_grammar_context_batch_02_set_05',
  '日曜日 にどなたが おうちへ 来ました。わたしは お母さんと 一緒に 料理を 準備しました。おじさんと おばさんと 楽しく 食べました。来週も 来たいって 言っていました。',
  'N5',
  '문법',
  '문맥'
)
on conflict (group_id) do nothing;

-- passage question 5.1
insert into public.passage_questions (
  group_id,
  type,
  sub_type,
  question,
  blank_number,
  option1,
  option2,
  option3,
  option4,
  answer,
  explanation
)
values (
  'n5_grammar_context_batch_02_set_05',
  '문법',
  '문맥',
  '日曜日に だれが おうちへ ____。',
  1,
  'きました',
  'きます',
  'くる',
  'きて',
  1,
  '日曜日 (지난 일요일) 의 과거 사실이므로 きました 가 맞다.'
)
on conflict (group_id, blank_number, question) do nothing;

-- passage question 5.2
insert into public.passage_questions (
  group_id,
  type,
  sub_type,
  question,
  blank_number,
  option1,
  option2,
  option3,
  option4,
  answer,
  explanation
)
values (
  'n5_grammar_context_batch_02_set_05',
  '문법',
  '문맥',
  'わたしは お母さんと 一緒に 料理を ____。',
  2,
  'たべました',
  'じゅんびしました',
  'つくりました',
  'たべます',
  2,
  '요리를 준비했다는 의미이므로 じゅんびしました 가 맞다.'
)
on conflict (group_id, blank_number, question) do nothing;

-- passage question 5.3
insert into public.passage_questions (
  group_id,
  type,
  sub_type,
  question,
  blank_number,
  option1,
  option2,
  option3,
  option4,
  answer,
  explanation
)
values (
  'n5_grammar_context_batch_02_set_05',
  '문법',
  '문맥',
  'おじさんと おばさんと 楽しく ____。',
  3,
  'たべました',
  'すいました',
  'のみました',
  'あそびました',
  1,
  '주위의 음식 준비 맥락에서 함께 먹었다는 의미이므로 たべました 가 맞다.'
)
on conflict (group_id, blank_number, question) do nothing;

-- passage question 5.4
insert into public.passage_questions (
  group_id,
  type,
  sub_type,
  question,
  blank_number,
  option1,
  option2,
  option3,
  option4,
  answer,
  explanation
)
values (
  'n5_grammar_context_batch_02_set_05',
  '문법',
  '문맥',
  '来週も 来たいって ____。',
  4,
  'いっていました',
  'いいました',
  'いっています',
  'いった',
  1,
  '과거에 남긴 말이므로 과거 진행형 いっていました 가 맞다.'
)
on conflict (group_id, blank_number, question) do nothing;

commit;
