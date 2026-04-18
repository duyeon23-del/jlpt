# DB Ops Failure Playbook

## Scope
- Migration mismatch
- RLS denial on backfill
- Recommendation returns 0 rows
- Missing sample user for verification
- Encoding issues in SQL output

## 1) Migration Mismatch
Symptoms:
- `db push` requests repeated `applied/reverted` repairs.

Actions:
1. Run `npx supabase migration list`.
2. Check for short/non-timestamp local migration file names.
3. Move non-standard files out of `supabase/migrations` (for example into `supabase/legacy`).
4. Re-run `db push`.

## 2) RLS Denial on Backfill
Symptoms:
- `new row violates row-level security policy for table "question_skill_map"`.

Actions:
1. Confirm `SUPABASE_SERVICE_ROLE_KEY` is present.
2. Re-run with admin guard:
   - `npm run db:backfill:skill-map`
3. If key is unavailable, run SQL path:
   - `node scripts/run-sql-file.mjs supabase/backfill_question_skill_map.sql`

## 3) Recommendation Returns 0 Rows
Actions:
1. Run `node scripts/run-sql-file.mjs supabase/quick_recommend_check.sql`.
2. If no sample/weak data, create test data:
   - `npm run db:test-seed:attempts`
3. Validate report:
   - `npm run db:report:recommend`
4. Cleanup test data:
   - `npm run db:test-cleanup:attempts`

## 4) Missing Sample User
Actions:
1. Check user existence in `public.users` and `auth.users`.
2. If empty, create test account through app auth flow.
3. Re-run recommendation checks.

## 5) Encoding Issues
Symptoms:
- Korean text appears garbled in SQL output.

Actions:
1. Use standardized npm scripts (they enforce `chcp 65001` on Windows).
2. Keep `\encoding UTF8` and `\pset pager off` in report SQL files.
3. Re-run command from a new terminal session if stale codepage persists.

## 6) Release Gate Failure
Actions:
1. Run `npm run db:gate:release` and note the first failed stage.
2. If failure is `tracked secrets check`, remove tracked `.env*` files from git before continuing.
3. If failure is `skill map verification`, run `npm run db:backfill:skill-map` then retry.
4. If failure is `dashboard reset verification`, inspect `supabase/verify_dashboard_reset_rpc.sql` output and stop release.
5. If failure is `recommendation report`, restore sample data with `npm run db:test-seed:attempts` and retry verification.

## Rollback Principle
- Prefer idempotent SQL.
- Record baseline before mutating commands.
- If verification fails after mutation, stop and restore from last known-good migration+snapshot.
