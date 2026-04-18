# N5 1차 반영 순서

## 1. 반영 대상

이번 1차 반영 묶음은 아래 6개 배치다.

1. [supabase/imports/n5_vocab_kanji_batch_01.sql](supabase/imports/n5_vocab_kanji_batch_01.sql)
2. [supabase/imports/n5_vocab_notation_batch_01.sql](supabase/imports/n5_vocab_notation_batch_01.sql)
3. [supabase/imports/n5_vocab_context_batch_01.sql](supabase/imports/n5_vocab_context_batch_01.sql)
4. [supabase/imports/n5_grammar_judgement_batch_01.sql](supabase/imports/n5_grammar_judgement_batch_01.sql)
5. [supabase/imports/n5_grammar_reorder_batch_01.sql](supabase/imports/n5_grammar_reorder_batch_01.sql)
6. [supabase/imports/n5_grammar_context_batch_01.sql](supabase/imports/n5_grammar_context_batch_01.sql)

## 2. 선행 적용

먼저 최신 마이그레이션을 DB에 반영해야 한다.

특히 대시보드 추천 집중 학습은 `get_recommended_questions_by_skill_v2` RPC가 필요하므로,
phase 1 import 전에 아래를 먼저 실행한다.

```powershell
npm run db:push
```

## 3. 가장 짧은 실행 방법

PowerShell 기준:

```powershell
$env:SUPABASE_DB_URL = "postgresql://USER:PASSWORD@HOST:5432/postgres"
npm run db:apply:n5-phase1
```

이 명령은 아래를 순서대로 실행한다.

1. 6개 SQL import 적용
2. [supabase/verify_skill_map_after_load.sql](supabase/verify_skill_map_after_load.sql) 실행

## 4. 적용 후 앱 확인 순서

1. `npm run dev`
2. `문자·어휘 > 한자 읽기` 진입
3. `문자·어휘 > 표기` 진입
4. `문자·어휘 > 문맥 규정` 진입
5. `문법 > 판단` 진입
6. `문법 > 배열` 진입
7. `문법 > 문맥` 진입

## 5. 실제 확인 포인트

1. 각 탭에 새 문제 노출 여부
2. 선택지 셔플 후 정답 판정 정상 여부
3. 해설 노출 정상 여부
4. 오답 저장 정상 여부
5. 진단 탭에 시도 반영 여부
6. 추천 집중 학습 이동 여부

## 6. 실패 시 먼저 볼 것

1. `SUPABASE_DB_URL` 설정 여부
2. `psql` 설치 여부
3. `npm run db:push` 로 최신 마이그레이션이 반영되었는지 여부
4. verify skill map 결과에서 missing row 존재 여부
5. `question_skill_rules` 와 `sub_type` 값 불일치 여부