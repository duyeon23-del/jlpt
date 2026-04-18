begin;

-- generated from data/n5-batches/n5_grammar_context_batch_01.json
-- generated at 2026-04-15T16:47:13.256Z

-- passage set 1
insert into public.passages (
  group_id,
  content,
  level,
  type,
  sub_type
)
values (
  'n5_grammar_context_batch_01_set_01',
  'やまださんは まいあさ 6じに おきます。7じに あさごはんを たべて、7じ30ぷんに うちを でます。がっこうへは バスで いきます。',
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
  'n5_grammar_context_batch_01_set_01',
  '문법',
  '문맥',
  'やまださんは まいあさ 6じに ____。',
  1,
  'おきます',
  'おきました',
  'おきて',
  'おきる',
  1,
  '지문에 まいあさ 6じに おきます 라고 있으므로 습관 표현인 おきます 가 맞다.'
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
  'n5_grammar_context_batch_01_set_01',
  '문법',
  '문맥',
  'あさごはんを ____ うちを でます。',
  2,
  'たべる',
  'たべて',
  'たべます',
  'たべた',
  2,
  '두 동작을 자연스럽게 잇기 위해 て형인 たべて 가 맞다.'
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
  'n5_grammar_context_batch_01_set_01',
  '문법',
  '문맥',
  'がっこうへは バス ____ いきます。',
  3,
  'に',
  'を',
  'で',
  'へ',
  3,
  '교통수단을 나타낼 때는 で를 사용한다.'
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
  'n5_grammar_context_batch_01_set_01',
  '문법',
  '문맥',
  '7じ30ぷんに うちを ____。',
  4,
  'でます',
  'でました',
  'でて',
  'でる',
  1,
  '지문은 하루 일정 설명이므로 비과거 정중형 でます 가 맞다.'
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
  'n5_grammar_context_batch_01_set_02',
  'きのう さとうさんは ともだちと スーパーへ いきました。そこで りんごを 3つと ぎゅうにゅうを 1ほん かいました。うちへ かえってから、りんごを たべました。',
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
  'n5_grammar_context_batch_01_set_02',
  '문법',
  '문맥',
  'きのう さとうさんは ともだちと スーパーへ ____。',
  1,
  'いきます',
  'いきました',
  'いって',
  'いく',
  2,
  'きのう 가 있으므로 과거형 いきました 가 맞다.'
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
  'n5_grammar_context_batch_01_set_02',
  '문법',
  '문맥',
  'りんごを 3つ ____ かいました。',
  2,
  'が',
  'を',
  'と',
  'で',
  2,
  '직접 목적어에는 を를 사용한다.'
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
  'n5_grammar_context_batch_01_set_02',
  '문법',
  '문맥',
  'ぎゅうにゅうを 1 ____ かいました。',
  3,
  'まい',
  'ほん',
  'にん',
  'さつ',
  2,
  '병이나 긴 물건 수량 표현에는 ほん을 사용한다.'
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
  'n5_grammar_context_batch_01_set_02',
  '문법',
  '문맥',
  'うちへ かえってから、りんごを ____。',
  4,
  'たべます',
  'たべました',
  'たべて',
  'たべる',
  2,
  '지문 전체가 과거 상황이므로 たべました 가 맞다.'
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
  'n5_grammar_context_batch_01_set_03',
  'わたしの へやには つくえと いすが あります。つくえの うえには ほんが 2さつ あります。でも テレビは ありません。まどの そばに ねこが います。',
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
  'n5_grammar_context_batch_01_set_03',
  '문법',
  '문맥',
  'わたしの へやには つくえと いすが ____。',
  1,
  'います',
  'あります',
  'いきます',
  'みます',
  2,
  'つくえ와 いす는 무생물이므로 あります를 쓴다.'
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
  'n5_grammar_context_batch_01_set_03',
  '문법',
  '문맥',
  'つくえの うえには ほんが 2 ____ あります。',
  2,
  'にん',
  'ほん',
  'さつ',
  'まい',
  3,
  '책의 수는 さつ를 사용한다.'
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
  'n5_grammar_context_batch_01_set_03',
  '문법',
  '문맥',
  'テレビは ____。',
  3,
  'あります',
  'ありません',
  'います',
  'いません',
  2,
  '지문에 テレビは ありません 이라고 되어 있다.'
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
  'n5_grammar_context_batch_01_set_03',
  '문법',
  '문맥',
  'まどの そばに ねこが ____。',
  4,
  'あります',
  'います',
  'ありません',
  'みます',
  2,
  'ねこ는 생물이므로 います가 맞다.'
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
  'n5_grammar_context_batch_01_set_04',
  'たなかさんは きょう えきで 9じに ともだちに あいます。その あと、いっしょに えいがを みます。えいがの あとで レストランへ いって、ばんごはんを たべます。',
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
  'n5_grammar_context_batch_01_set_04',
  '문법',
  '문맥',
  'たなかさんは えきで 9じに ともだちに ____。',
  1,
  'あいます',
  'ありました',
  'あいて',
  'あう',
  1,
  '오늘의 예정이므로 비과거 정중형 あいます 가 맞다.'
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
  'n5_grammar_context_batch_01_set_04',
  '문법',
  '문맥',
  'その あと、いっしょに えいがを ____。',
  2,
  'ききます',
  'みます',
  'たべます',
  'のります',
  2,
  '영화는 보다인 みます 를 사용한다.'
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
  'n5_grammar_context_batch_01_set_04',
  '문법',
  '문맥',
  'えいがの あとで レストランへ ____。',
  3,
  'いって',
  'いきます',
  'いきました',
  'いく',
  1,
  '뒤의 동작과 연결되므로 て형인 いって 가 자연스럽다.'
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
  'n5_grammar_context_batch_01_set_04',
  '문법',
  '문맥',
  'レストランで ばんごはんを ____。',
  4,
  'たべます',
  'のみます',
  'みます',
  'ききます',
  1,
  'ばんごはん은 저녁밥이므로 たべます 가 맞다.'
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
  'n5_grammar_context_batch_01_set_05',
  'にちようびに かぞくで こうえんへ いきます。こうえんで しゃしんを とって、ジュースを のみます。ひるに うちへ かえって、みんなで ごはんを たべます。',
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
  'n5_grammar_context_batch_01_set_05',
  '문법',
  '문맥',
  'にちようびに かぞくで こうえんへ ____。',
  1,
  'いきます',
  'いきました',
  'いって',
  'いく',
  1,
  '주말 계획을 말하는 문맥이므로 いきます 가 맞다.'
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
  'n5_grammar_context_batch_01_set_05',
  '문법',
  '문맥',
  'こうえんで しゃしんを ____。',
  2,
  'とります',
  'のみます',
  'いれます',
  'おきます',
  1,
  '사진을 찍다는 しゃしんを とります 가 맞다.'
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
  'n5_grammar_context_batch_01_set_05',
  '문법',
  '문맥',
  'ジュースを ____。',
  3,
  'たべます',
  'ききます',
  'のみます',
  'みます',
  3,
  'ジュース는 마시는 것이므로 のみます 가 맞다.'
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
  'n5_grammar_context_batch_01_set_05',
  '문법',
  '문맥',
  'ひるに うちへ かえって、みんなで ごはんを ____。',
  4,
  'たべます',
  'のみます',
  'かきます',
  'あいます',
  1,
  'ごはん은 먹는 것이므로 たべます 가 맞다.'
)
on conflict (group_id, blank_number, question) do nothing;

commit;
