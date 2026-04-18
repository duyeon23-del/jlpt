# N5 JSON -> SQL 변환 기준

## 1. 목적

검수를 통과한 JSON 배치를 Supabase 적재용 SQL 파일로 변환한다.

## 2. 변환 규칙

### 2.1 single

`record_type = single` 은 `questions` 테이블 insert 로 변환한다.

삽입 컬럼:

- level
- type
- sub_type
- question
- option1
- option2
- option3
- option4
- answer
- explanation

### 2.2 passage_set

`record_type = passage_set` 은 아래 두 단계로 변환한다.

1. `passages` 에 지문 1건 insert
2. `passage_questions` 에 하위 questions 배열 수만큼 insert

passages 삽입 컬럼:

- group_id
- content
- level
- type
- sub_type

passage_questions 삽입 컬럼:

- group_id
- type
- sub_type
- question
- blank_number
- option1
- option2
- option3
- option4
- answer
- explanation

## 3. 실행 방식

```bash
node scripts/generate-n5-sql.mjs path/to/batch.json path/to/output.sql
```

## 4. 권장 실행 순서

1. JSON 생성
2. `validate-n5-batch.mjs` 실행
3. `generate-n5-sql.mjs` 실행
4. 생성된 SQL 검토
5. `scripts/run-sql-file.mjs` 로 적용
6. skill map 검증 SQL 실행
