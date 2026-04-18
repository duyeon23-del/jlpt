begin;

-- generated from data/n5-batches/n5_reading_medium_batch_05.json
-- generated at 2026-04-17T14:45:26.904Z

-- passage set 1
insert into public.passages (
  group_id,
  content,
  level,
  type,
  sub_type
)
values (
  'n5_reading_medium_batch_05_set_01',
  '私は毎朝パンを食べます。朝ごはんのとき牛乳も飲みます。パンはとてもおいしいです。',
  'N5',
  '독해',
  '중문독해'
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
  explanation,
  difficulty,
  recommendation_weight
)
values (
  'n5_reading_medium_batch_05_set_01',
  '독해',
  '중문독해',
  '私は毎朝パンを____。',
  1,
  '食べます',
  '読みます',
  '書きます',
  '行きます',
  1,
  '지문에서 아침마다 빵을 먹는다고 했으므로 ''食べます''가 맞습니다.',
  1,
  0.85
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
  explanation,
  difficulty,
  recommendation_weight
)
values (
  'n5_reading_medium_batch_05_set_01',
  '독해',
  '중문독해',
  '朝ごはんのとき、牛乳も____。',
  2,
  '飲みます',
  '買います',
  '作ります',
  '読みます',
  1,
  '지문에 ''牛乳も飲みます''로 언급되어 있습니다.',
  1,
  0.9
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
  explanation,
  difficulty,
  recommendation_weight
)
values (
  'n5_reading_medium_batch_05_set_01',
  '독해',
  '중문독해',
  'パンはとても____です。',
  3,
  'おいしい',
  'むずかしい',
  'たかい',
  'ふるい',
  1,
  '빵이 맛있다고 했으니 ''おいしい''가 정답입니다.',
  1,
  0.8
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
  explanation,
  difficulty,
  recommendation_weight
)
values (
  'n5_reading_medium_batch_05_set_01',
  '독해',
  '중문독해',
  'この文の主な話題は____です。',
  4,
  '朝ごはん',
  '夜ごはん',
  'お母さん',
  '学校',
  1,
  '지문 내용이 전부 아침 식사에 관한 내용입니다.',
  1,
  0.85
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
  'n5_reading_medium_batch_05_set_02',
  '日曜日に友だちと公園へ行きました。天気がよかったので、みんなでサッカーをしました。そのあと、アイスクリームを食べました。',
  'N5',
  '독해',
  '중문독해'
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
  explanation,
  difficulty,
  recommendation_weight
)
values (
  'n5_reading_medium_batch_05_set_02',
  '독해',
  '중문독해',
  '友だちと____へ行きました。',
  1,
  '公園',
  '駅',
  '学校',
  '病院',
  1,
  '지문 첫 문장에서 친구와 공원에 갔다고 했습니다.',
  3,
  1.05
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
  explanation,
  difficulty,
  recommendation_weight
)
values (
  'n5_reading_medium_batch_05_set_02',
  '독해',
  '중문독해',
  '天気が____のでサッカーをしました。',
  2,
  'よかった',
  'わるかった',
  'さむかった',
  'あぶなかった',
  1,
  '''天気がよかったので''가 사커를 한 이유입니다.',
  3,
  1.1
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
  explanation,
  difficulty,
  recommendation_weight
)
values (
  'n5_reading_medium_batch_05_set_02',
  '독해',
  '중문독해',
  'そのあと、みんなで____を食べました。',
  3,
  'アイスクリーム',
  'ケーキ',
  'すし',
  'おにぎり',
  1,
  '지문에서 사커 후 아이스크림을 먹었다고 되어 있습니다.',
  3,
  1
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
  explanation,
  difficulty,
  recommendation_weight
)
values (
  'n5_reading_medium_batch_05_set_02',
  '독해',
  '중문독해',
  'この文章の出来事は____ですか。',
  4,
  '日曜日',
  '月曜日',
  '金曜日',
  '土曜日',
  1,
  '본문 첫 문장에서 ''日曜日に''로 시작합니다.',
  3,
  1.05
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
  'n5_reading_medium_batch_05_set_03',
  'けさはバスが遅くきました。私は学校に遅れそうになりました。でも、先生はやさしかったです。',
  'N5',
  '독해',
  '중문독해'
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
  explanation,
  difficulty,
  recommendation_weight
)
values (
  'n5_reading_medium_batch_05_set_03',
  '독해',
  '중문독해',
  'バスは____きました。',
  1,
  '遅く',
  '早く',
  'うるさく',
  'しずかに',
  1,
  '지문에 ''バスが遅くきました''라고 되어 있습니다.',
  3,
  1.15
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
  explanation,
  difficulty,
  recommendation_weight
)
values (
  'n5_reading_medium_batch_05_set_03',
  '독해',
  '중문독해',
  '私は学校に____そうになりました。',
  2,
  '遅れ',
  '帰り',
  '来',
  '出',
  1,
  '''遅れそうになりました''에서 ''遅れ''가 필요합니다.',
  3,
  1.2
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
  explanation,
  difficulty,
  recommendation_weight
)
values (
  'n5_reading_medium_batch_05_set_03',
  '독해',
  '중문독해',
  '先生はとても____です。',
  3,
  'やさしい',
  'きびしい',
  'かなしい',
  'おもしろい',
  1,
  '''先生はやさしかったです''에서 ''やさしい''가 올바릅니다.',
  3,
  1.1
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
  explanation,
  difficulty,
  recommendation_weight
)
values (
  'n5_reading_medium_batch_05_set_03',
  '독해',
  '중문독해',
  'この文章で問題だったことは____です。',
  4,
  'バスが遅れた',
  '朝ごはんがなかった',
  '雨がふった',
  '友だちがいない',
  1,
  '본 문장에서 문제로 언급된 것은 ''バスが遅くきました''입니다.',
  3,
  1.12
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
  'n5_reading_medium_batch_05_set_04',
  '日本で春になると、さくらの花が咲きます。多くの人が公園で花見をします。家族や友だちと一緒にお弁当を食べながら、きれいな花を楽しみます。',
  'N5',
  '독해',
  '중문독해'
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
  explanation,
  difficulty,
  recommendation_weight
)
values (
  'n5_reading_medium_batch_05_set_04',
  '독해',
  '중문독해',
  '春になると、____が咲きます。',
  1,
  'さくら',
  'ひまわり',
  'ばら',
  'き',
  1,
  '지문에 봄이 되면 핀다는 꽃은 ''さくら''입니다.',
  5,
  1.23
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
  explanation,
  difficulty,
  recommendation_weight
)
values (
  'n5_reading_medium_batch_05_set_04',
  '독해',
  '중문독해',
  '人々は公園で____をします。',
  2,
  '花見',
  'うた',
  '買い物',
  'さんぽ',
  1,
  '''花見をします''가 맞는 표현입니다.',
  5,
  1.2
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
  explanation,
  difficulty,
  recommendation_weight
)
values (
  'n5_reading_medium_batch_05_set_04',
  '독해',
  '중문독해',
  'みんなで____を食べながら、花を楽しんでいます。',
  3,
  'お弁当',
  '朝ごはん',
  'ラーメン',
  'パン',
  1,
  '''お弁当を食べながら''에서 ''お弁当''가 정답입니다.',
  5,
  1.25
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
  explanation,
  difficulty,
  recommendation_weight
)
values (
  'n5_reading_medium_batch_05_set_04',
  '독해',
  '중문독해',
  'この文章はどんな時期のことを話していますか。____',
  4,
  '春',
  '夏',
  '秋',
  '冬',
  1,
  '지문 처음에 ''春になると'' 이라 명시되어 있습니다.',
  5,
  1.22
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
  'n5_reading_medium_batch_05_set_05',
  '昨日、母とスーパーへ行きました。たくさんのくだものを買いました。私の好きなりんごも買いました。',
  'N5',
  '독해',
  '중문독해'
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
  explanation,
  difficulty,
  recommendation_weight
)
values (
  'n5_reading_medium_batch_05_set_05',
  '독해',
  '중문독해',
  '昨日、____とスーパーへ行きました。',
  1,
  '母',
  '父',
  '先生',
  '兄',
  1,
  '지문에서 엄마와 슈퍼에 간 것으로 나옵니다.',
  3,
  1
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
  explanation,
  difficulty,
  recommendation_weight
)
values (
  'n5_reading_medium_batch_05_set_05',
  '독해',
  '중문독해',
  'たくさんの____を買いました。',
  2,
  'くだもの',
  '本',
  'ふく',
  'おかし',
  1,
  '''たくさんのくだもの''가 나오므로 과일이 정답입니다.',
  3,
  0.98
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
  explanation,
  difficulty,
  recommendation_weight
)
values (
  'n5_reading_medium_batch_05_set_05',
  '독해',
  '중문독해',
  '私の好きな____も買いました。',
  3,
  'りんご',
  'みかん',
  'バナナ',
  'なし',
  1,
  '지문에서 ''私の好きなりんごも買いました''가 정답입니다.',
  3,
  1.02
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
  explanation,
  difficulty,
  recommendation_weight
)
values (
  'n5_reading_medium_batch_05_set_05',
  '독해',
  '중문독해',
  'この文章で買わなかったものはどれですか。____',
  4,
  'ふく',
  'くだもの',
  'りんご',
  'みかん',
  1,
  '본문에서는 ''ふく''는 언급되어 있지 않습니다.',
  3,
  1
)
on conflict (group_id, blank_number, question) do nothing;

commit;
