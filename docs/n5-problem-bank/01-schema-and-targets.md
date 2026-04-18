# N5 문제은행 스키마 및 목표 수량

## 1. 목적

이 문서는 JLPT N5 전용 원본 문제은행을 안정적으로 축적하기 위한 기준 문서다.
현재 서비스의 모든 문제는 N5 기준으로 운영하며, 추천 로직은 원본 문제 row를 생성/삭제하지 않고
추천 후보 세트만 바꾸는 방향으로 유지한다.

## 2. 운영 원칙

1. 모든 문제의 level 값은 `N5`로 고정한다.
2. 운영 테이블에 바로 넣지 않고, `JSON 생성 -> 검수 -> SQL 변환 -> 적재` 순서를 지킨다.
3. 같은 유형이라도 해설과 정답 근거가 빈약하면 적재하지 않는다.
4. 추천 정확도보다 먼저 데이터 일관성을 확보한다.

## 3. 문제 유형 정의

### 3.1 questions 테이블용 단일 문제

- major_type: `문자·어휘` | `문법`
- sub_type:
  - 문자·어휘: `한자 읽기` | `표기` | `문맥 규정`
  - 문법: `판단` | `배열` | `문맥`
- target_question_type: `single`

### 3.2 passages / passage_questions 테이블용 지문 문제

- major_type: `독해`
- sub_type: `단문독해` | `중문독해` | `정보검색`
- target_question_type: `passage`

### 3.3 grammar_context 전용 문맥 세트

- source: `passage_questions`
- major_type: `문법`
- sub_type: `문맥`
- target_question_type: `grammar_context`

## 4. 필수 컬럼 기준

### 4.1 questions

| 컬럼 | 필수 | 규칙 |
| --- | --- | --- |
| level | 예 | 항상 `N5` |
| type | 예 | `문자·어휘` 또는 `문법` |
| sub_type | 예 | 허용된 하위 유형만 사용 |
| question | 예 | 문제 문장 또는 빈칸 문장 |
| option1~option4 | 예 | 중복 없는 4지선다 |
| answer | 예 | `1~4` 정수 권장 |
| explanation | 예 | 정답 근거 포함 |

### 4.2 passages

| 컬럼 | 필수 | 규칙 |
| --- | --- | --- |
| group_id | 예 | 같은 지문 세트를 묶는 공통 키 |
| level | 예 | 항상 `N5` |
| type | 예 | `독해` 또는 `문법` |
| sub_type | 예 | 허용된 하위 유형만 사용 |
| content | 예 | 지문 전문 |

### 4.3 passage_questions

| 컬럼 | 필수 | 규칙 |
| --- | --- | --- |
| group_id | 예 | passages.group_id 와 일치 |
| level | 권장 | 가능하면 `N5` 고정 저장 |
| type | 예 | `독해` 또는 `문법` |
| sub_type | 예 | 허용된 하위 유형만 사용 |
| question | 예 | 지문 기반 질문 |
| blank_number | 예 | 같은 group_id 내 1부터 시작 |
| option1~option4 | 예 | 중복 없는 4지선다 |
| answer | 예 | `1~4` 정수 권장 |
| explanation | 예 | 정답 근거 포함 |

## 5. 스킬 매핑 기준

문제 생성 시 아래 매핑을 어기지 않는다.

| major_type | sub_type | skill_key |
| --- | --- | --- |
| 문자·어휘 | 한자 읽기 | vocab_kanji_reading |
| 문자·어휘 | 표기 | vocab_notation |
| 문자·어휘 | 문맥 규정 | vocab_context_usage |
| 문법 | 판단 | grammar_judgement |
| 문법 | 배열 | grammar_reorder |
| 문법 | 문맥 | grammar_context |
| 독해 | 단문독해 | reading_short |
| 독해 | 중문독해 | reading_medium |
| 독해 | 정보검색 | reading_info_search |

## 6. N5 기본 목표 수량

초기 운영 목표는 "충분히 다양하지만 검수 가능한 규모"를 기준으로 한다.

### 6.1 단일 문제

| 탭 | 목표 수량 |
| --- | ---: |
| 문자·어휘 > 한자 읽기 | 70 |
| 문자·어휘 > 표기 | 70 |
| 문자·어휘 > 문맥 규정 | 70 |
| 문법 > 판단 | 70 |
| 문법 > 배열 | 70 |
| 문법 > 문맥 | 70 |

단일 문제 합계: `420`

### 6.2 독해 세트

| 탭 | 지문 세트 수 | 질문 수 목표 |
| --- | ---: | ---: |
| 독해 > 단문독해 | 18 | 54 |
| 독해 > 중문독해 | 14 | 42 |
| 독해 > 정보검색 | 12 | 36 |

독해 질문 합계: `132`

### 6.3 총량 기준

- questions 기준: 약 `420`
- passage_questions 기준: 약 `132`
- 총 질문 row 기준: 약 `552`

이 수량이면 N5 단일 운영에서 반복 노출을 늦추면서도 수동 검수가 가능한 범위다.

## 7. 적재 단위 기준

대량 적재 대신 아래 소량 배치 단위를 유지한다.

- 단일 문제: 배치당 20~30문항
- 독해 문제: 배치당 6~10세트
- 문법 문맥: 배치당 5~8세트

## 8. 완료 기준

아래를 모두 만족해야 해당 배치를 "문제은행에 추가 완료"로 본다.

1. 필수 컬럼 누락이 없다.
2. answer 와 선택지가 일치한다.
3. explanation 이 정답 근거를 포함한다.
4. level 이 모두 `N5` 이다.
5. question_skill_rules 기준으로 skill_key 매핑이 가능하다.
6. 검증 SQL 에서 missing mapping 0건이 나온다.