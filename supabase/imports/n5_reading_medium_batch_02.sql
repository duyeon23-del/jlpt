begin;

-- generated from data/n5-batches/n5_reading_medium_batch_02.json
-- generated at 2026-04-16T14:15:20.393Z

-- passage set 1
insert into public.passages (
  group_id,
  content,
  level,
  type,
  sub_type
)
values (
  'n5_reading_medium_batch_02_set_01',
  '私の 友達の 鈴木さんは 去年 大阪の 大学へ 入学しました。今 毎日 寮で 生活しています。朝 6時に 起きて、夜 10時に 寝ます。勉強が 厳しいですが、毎日 頑張っています。夏休みに は 帰省して、両親と 過ごしたいと 言っています。',
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
  explanation
)
values (
  'n5_reading_medium_batch_02_set_01',
  '독해',
  '중문독해',
  '鈴木さんは いつ 大学へ 入学しましたか。',
  1,
  '一昨年',
  '去年',
  '今年',
  '来年',
  2,
  '지문에 ''去年大阪の大学へ入学しました''라고 명시되어 있다.'
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
  'n5_reading_medium_batch_02_set_01',
  '독해',
  '중문독해',
  '鈴木さんは 今 どこで 生活していますか。',
  2,
  '実家',
  '寮',
  'アパート',
  '新しい 家',
  2,
  '지문에 ''今毎日寮で生活しています''라고 명시되어 있다.'
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
  'n5_reading_medium_batch_02_set_01',
  '독해',
  '중문독해',
  '鈴木さんは 夏休みに 何を したいと 言っていますか。',
  3,
  '旅行に 行く',
  '勉強を 続ける',
  '帰省して、両親と 過ごす',
  '友達に 会う',
  3,
  '지문에 ''夏休みには帰省して、両親と過ごしたいと言っています''라고 나와 있다.'
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
  'n5_reading_medium_batch_02_set_02',
  '田中さんは 新しい 仕事に 変わりました。給料が 少し 上がりました。が、仕事が とても 忙しいです。毎日 残業が あります。疲れていますが、新しい スキルを 学んでいるので 良いと思っています。同僚も みんな 友達です。',
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
  explanation
)
values (
  'n5_reading_medium_batch_02_set_02',
  '독해',
  '중문독해',
  '田中さんは 新しい 仕事に 変わって、給料は どうなりましたか。',
  1,
  '少し 上がった',
  '少し 下がった',
  '変わらない',
  '大きく 上がった',
  1,
  '지문에 ''給料が少し上がりました''라고 명시되어 있다.'
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
  'n5_reading_medium_batch_02_set_02',
  '독해',
  '중문독해',
  '新しい 仕事の 欠点は 何ですか。',
  2,
  '給料が 低い',
  '仕事が つまらない',
  '仕事が とても 忙しい',
  '同僚が 冷たい',
  3,
  '지문에 ''仕事がとても忙しいです。毎日残業があります''라고 나와 있다.'
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
  'n5_reading_medium_batch_02_set_02',
  '독해',
  '중문독해',
  '田中さんは 新しい 仕事を どう 思っていますか。',
  3,
  'つらい だけだ',
  'つらいが、良いと 思っている',
  '簡単だ',
  'すぐに やめたい',
  2,
  '지문에 ''疲れていますが、新しいスキルを学んでいるので良いと思っています''라고 명시되어 있다.'
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
  'n5_reading_medium_batch_02_set_03',
  '佐藤さんは 毎年 春に 京都へ 花見に 行きます。京都は 桜が とてもきれいです。旅館で 温泉に 入ります。食事も おいしいです。今年も 3月の 最後の 週に 行く予定です。友達も 一緒に 行きたいと 言っています。',
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
  explanation
)
values (
  'n5_reading_medium_batch_02_set_03',
  '독해',
  '중문독해',
  '佐藤さんは 毎年 いつ 京都へ 行きますか。',
  1,
  '冬',
  '春',
  '夏',
  '秋',
  2,
  '지문에 ''毎年春に京都へ花見に行きます''라고 명시되어 있다.'
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
  'n5_reading_medium_batch_02_set_03',
  '독해',
  '중문독해',
  '京都の 旅館では 何が できますか。',
  2,
  '山登り',
  '買い物',
  '温泉に 入る',
  '映画を 見る',
  3,
  '지문에 ''旅館で温泉に入ります''라고 명시되어 있다.'
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
  'n5_reading_medium_batch_02_set_03',
  '독해',
  '중문독해',
  '今年も 何月 に 京都へ 行く予定ですか。',
  3,
  '2月',
  '3月 の 始め',
  '3月 の 最後',
  '4月',
  3,
  '지문에 ''今年も3月の最後の週に行く予定です''라고 명시되어 있다.'
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
  'n5_reading_medium_batch_02_set_04',
  '山田さんは 有名な レストラン の シェフです。毎日 朝 5時に 起きて、市場へ 行って 新鮮な材料を 買います。調理法も 工夫しています。そのため、彼の レストラン の 料理は とても 人気があります。多くの 人が 毎日 食事に 来て います。',
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
  explanation
)
values (
  'n5_reading_medium_batch_02_set_04',
  '독해',
  '중문독해',
  '山田さんの 職業は 何ですか。',
  1,
  '医者',
  '教師',
  'シェフ',
  'エンジニア',
  3,
  '지문에 ''山田さんは有名なレストランのシェフです''라고 명시되어 있다.'
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
  'n5_reading_medium_batch_02_set_04',
  '독해',
  '중문독해',
  '山田さんは 毎日 何時に 起きますか。',
  2,
  '3時',
  '4時',
  '5時',
  '6時',
  3,
  '지문에 ''毎日朝5時に起きて''라고 명시되어 있다.'
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
  'n5_reading_medium_batch_02_set_04',
  '독해',
  '중문독해',
  '彼の レストランの 料理が 人気があるのは なぜですか。',
  3,
  '安い',
  '新鮮な材料を 使い、調理法も 工夫している',
  '有名だから',
  '近いから',
  2,
  '지문에 ''新鮮な材料を買います。調理法も工夫しています。そのため、料理はとても人気があります''라고 나와 있다.'
)
on conflict (group_id, blank_number, question) do nothing;

commit;
