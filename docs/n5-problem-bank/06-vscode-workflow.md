# VS Code 안에서 JSON 생성 -> SQL 변환 -> Supabase 적재 워크플로

## 1. 목표

브라우저에서 ChatGPT 사이트로 이동하지 않고, VS Code 안에서 N5 문제은행 배치를 만드는 반복 작업 흐름을 고정한다.

## 2. 권장 방식

가장 안정적인 방식은 아래 흐름이다.

1. VS Code 안에서 프롬프트 템플릿 열기
2. Copilot Chat 또는 LLM 도구로 JSON 생성
3. `data/n5-batches/` 아래에 배치 파일 저장
4. 로컬 검수 스크립트 실행
5. SQL 생성 스크립트 실행
6. Supabase DB 에 SQL 적용
7. skill map 검증
8. 앱에서 노출 확인

## 3. 폴더 기준

- 프롬프트: [prompts/n5-json-generation.prompt.md](prompts/n5-json-generation.prompt.md)
- 배치 JSON: [data/n5-batches/sample-n5-batch.json](data/n5-batches/sample-n5-batch.json)
- 검수 스크립트: [scripts/validate-n5-batch.mjs](scripts/validate-n5-batch.mjs)
- SQL 생성 스크립트: [scripts/generate-n5-sql.mjs](scripts/generate-n5-sql.mjs)
- SQL 실행 스크립트: [scripts/run-sql-file.mjs](scripts/run-sql-file.mjs)

## 4. VS Code 안에서 실제 작업 순서

### 4.1 생성

1. 프롬프트 파일을 연다.
2. 원하는 탭과 개수를 채운다.
3. JSON 배열만 받는다.
4. 새 파일로 `data/n5-batches/n5_<type>_<subtype>_batch_01.json` 형식으로 저장한다.

### 4.2 검수

```bash
npm run n5:validate -- data/n5-batches/n5_vocab_kanji_batch_01.json
```

### 4.3 SQL 생성

```bash
npm run n5:generate-sql -- data/n5-batches/n5_vocab_kanji_batch_01.json supabase/imports/n5_vocab_kanji_batch_01.sql
```

### 4.4 DB 적용

```bash
node scripts/run-sql-file.mjs supabase/imports/n5_vocab_kanji_batch_01.sql
node scripts/run-sql-file.mjs supabase/verify_skill_map_after_load.sql
```

### 4.5 앱 확인

1. `npm run dev`
2. 해당 탭으로 이동
3. 샘플 문제가 노출되는지 확인
4. 오답 저장/추천 이동까지 확인

## 5. 확장프로그램 활용 의견

VS Code 확장으로 문제를 받을 수는 있다. 다만 대량 문제은행 생산은 아래 기준으로 판단하는 편이 좋다.

### 5.1 확장 대화형 방식

- 장점: 빠르게 초안 생성 가능
- 단점: 출력 형식이 흔들릴 수 있음
- 추천 용도: 소량 시험 생성, 프롬프트 실험

### 5.2 API 또는 반복 가능한 에이전트 방식

- 장점: 같은 형식으로 배치 생산 가능
- 단점: 초기 세팅 필요
- 추천 용도: 원본 문제은행 축적

결론적으로, 브라우저 ChatGPT 대체 수단으로는 VS Code 안의 대화형 도구를 쓸 수 있지만,
문제은행 구축은 지금 만든 프롬프트 + 검수 + SQL 생성 파이프라인으로 고정하는 편이 훨씬 낫다.

## 6. 현재 권장 루틴

1. 한 번에 한 sub_type 씩 20~30문항 생성
2. 검수 통과 여부 확인
3. SQL 생성 후 적재
4. 앱 확인
5. 통과 시 다음 batch 로 이동