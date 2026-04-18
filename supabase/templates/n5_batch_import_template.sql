begin;

-- single example
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
) values (
  'N5',
  '문자·어휘',
  '한자 읽기',
  'れい: ____',
  '보기1',
  '보기2',
  '보기3',
  '보기4',
  1,
  '정답 근거 설명'
);

-- passage example
insert into public.passages (
  group_id,
  content,
  level,
  type,
  sub_type
) values (
  'n5_sample_group_001',
  '샘플 지문',
  'N5',
  '독해',
  '단문독해'
);

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
) values (
  'n5_sample_group_001',
  '독해',
  '단문독해',
  '질문 예시',
  1,
  '보기1',
  '보기2',
  '보기3',
  '보기4',
  2,
  '정답 근거 설명'
);

commit;