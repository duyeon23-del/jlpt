# DB 적용 명령 가이드

## 1. 전제

`scripts/run-sql-file.mjs` 를 쓰려면 `SUPABASE_DB_URL` 환경변수가 필요하다.

## 2. PowerShell 세션 기준

```powershell
$env:SUPABASE_DB_URL = "postgresql://USER:PASSWORD@HOST:5432/postgres"
node scripts/run-sql-file.mjs supabase/imports/n5_vocab_kanji_batch_01.sql
node scripts/run-sql-file.mjs supabase/verify_skill_map_after_load.sql
```

## 3. CMD 기준

```cmd
set SUPABASE_DB_URL=postgresql://USER:PASSWORD@HOST:5432/postgres
node scripts/run-sql-file.mjs supabase/imports/n5_vocab_kanji_batch_01.sql
node scripts/run-sql-file.mjs supabase/verify_skill_map_after_load.sql
```

## 4. bash 기준

```bash
export SUPABASE_DB_URL="postgresql://USER:PASSWORD@HOST:5432/postgres"
node scripts/run-sql-file.mjs supabase/imports/n5_vocab_kanji_batch_01.sql
node scripts/run-sql-file.mjs supabase/verify_skill_map_after_load.sql
```

## 5. 적용 후 확인 순서

1. skill map 검증 결과에 missing row 가 없는지 확인
2. 앱에서 `문자·어휘 > 한자 읽기` 탭 확인
3. 일부러 오답을 만든 뒤 진단 탭 반영 확인
4. 추천 집중 학습 이동 확인

## 6. 다음 배치 적용 예시

```powershell
node scripts/validate-n5-batch.mjs data/n5-batches/n5_vocab_notation_batch_01.json
node scripts/generate-n5-sql.mjs data/n5-batches/n5_vocab_notation_batch_01.json supabase/imports/n5_vocab_notation_batch_01.sql
node scripts/run-sql-file.mjs supabase/imports/n5_vocab_notation_batch_01.sql
node scripts/run-sql-file.mjs supabase/verify_skill_map_after_load.sql
```