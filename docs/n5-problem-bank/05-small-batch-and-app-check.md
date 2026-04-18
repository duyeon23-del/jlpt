# 소량 배치 적재 및 앱 노출 점검 가이드

## 1. 소량 배치 원칙

처음부터 대량 적재하지 않고, 샘플 배치 하나가 아래 흐름을 모두 통과하는지 먼저 확인한다.

1. JSON 생성
2. JSON 검수
3. SQL 생성
4. DB 적재
5. skill map 검증
6. 앱 노출 확인

## 2. 샘플 배치 파일

샘플 파일:

- [data/n5-batches/sample-n5-batch.json](data/n5-batches/sample-n5-batch.json)

이 파일은 아래를 모두 포함한다.

- 단일 문제 2개
- 독해 세트 1개

## 3. 로컬 실행 순서

```bash
node scripts/validate-n5-batch.mjs data/n5-batches/sample-n5-batch.json
node scripts/generate-n5-sql.mjs data/n5-batches/sample-n5-batch.json supabase/templates/n5_sample_batch_generated.sql
node scripts/run-sql-file.mjs supabase/templates/n5_sample_batch_generated.sql
node scripts/run-sql-file.mjs supabase/verify_skill_map_after_load.sql
```

## 4. 앱 노출 점검 순서

### 4.1 단일 문제 확인

1. 앱에서 `문자·어휘 > 한자 읽기` 탭 진입
2. 샘플 문항이 노출되는지 확인
3. 선택지 셔플 후에도 정답 판정이 맞는지 확인

### 4.2 문법 확인

1. 앱에서 `문법 > 판단` 탭 진입
2. 샘플 문항이 보이는지 확인
3. 해설과 정답 표시가 맞는지 확인

### 4.3 독해 확인

1. 앱에서 `독해 > 단문독해` 탭 진입
2. 지문과 하위 질문 2개가 순서대로 보이는지 확인
3. passage_questions 의 blank_number 순서가 맞는지 확인

### 4.4 추천 확인

1. 일부러 오답을 만든다
2. 진단 탭으로 이동한다
3. 해당 유형이 세부 지표에 반영되는지 본다
4. `이 유형 추천문제 풀기` 클릭 시 추천 집중 학습으로 이동하는지 확인

## 5. 합격 기준

아래를 모두 만족하면 샘플 배치 적재 구조가 통과한 것이다.

1. 검수 스크립트 통과
2. SQL 생성 성공
3. SQL 실행 성공
4. verify_skill_map_after_load.sql 에서 missing row 없음
5. 앱에서 각 탭 노출 정상
6. 오답/시도/추천 흐름 정상