# N5 JSON 검수 규칙

## 1. 목표

LLM 이 생성한 JSON 이 운영 가능한 최소 품질을 만족하는지 자동 검수한다.

## 2. 배치 파일 기본 규칙

1. 최상위는 JSON 배열이어야 한다.
2. 배열은 비어 있으면 안 된다.
3. 각 객체는 `record_type` 을 가져야 한다.
4. `record_type` 은 `single` 또는 `passage_set` 만 허용한다.

## 3. single 규칙

- level = `N5`
- major_type 허용값: `문자·어휘`, `문법`
- sub_type 허용값:
  - 문자·어휘: `한자 읽기`, `표기`, `문맥 규정`
  - 문법: `판단`, `배열`, `문맥`
- question 필수
- option1~option4 필수
- answer 는 1~4 정수
- explanation 필수
- 선택지 4개는 trim 기준 중복 금지

## 4. passage_set 규칙

- level = `N5`
- major_type 허용값: `독해`, `문법`
- sub_type 허용값:
  - 독해: `단문독해`, `중문독해`, `정보검색`
  - 문법: `문맥`
- group_key 필수
- content 필수
- questions 는 비어 있지 않은 배열

questions 내부 규칙:

- blank_number 필수
- question 필수
- option1~option4 필수
- answer 는 1~4 정수
- explanation 필수
- blank_number 는 같은 세트에서 중복 금지
- 선택지 4개는 trim 기준 중복 금지

## 5. 권장 추가 점검

- explanation 길이 최소 10자 이상
- question 길이 최소 5자 이상
- content 길이 최소 15자 이상
- 같은 batch 안에서 동일 question 중복 금지

## 6. 실행 방식

```bash
node scripts/validate-n5-batch.mjs path/to/batch.json
```

오류가 있으면 1 이상의 종료 코드로 끝난다.
