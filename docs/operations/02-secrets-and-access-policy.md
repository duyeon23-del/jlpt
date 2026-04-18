# Secrets and Access Policy

## Goal
- Prevent privileged keys from being committed.
- Restrict DB mutate/verify operations to admin operators only.
- Define a repeatable key rotation policy.

## Required Controls
1. Keep `.env*` out of git.
2. Never commit `SUPABASE_SERVICE_ROLE_KEY`.
3. Run `npm run db:check:secrets-tracked` before release.
4. Require `ADMIN_DB_OPS=1` for all admin DB commands.

## Admin-Only Commands
- `npm run db:push`
- `npm run db:backfill:skill-map`
- `npm run db:apply:skill-rules`
- `npm run db:verify:skill-map`
- `npm run db:check:recommend`
- `npm run db:verify:dashboard-reset`
- `npm run db:report:recommend`
- `npm run db:gate:release`
- `npm run db:test-seed:attempts`
- `npm run db:test-cleanup:attempts`

All commands above are protected by `scripts/require-admin-ops.mjs`.

## Key Rotation Policy
- Rotation trigger:
  - every 30 days, or
  - immediately after suspected exposure.
- Rotation steps:
  1. Issue new service role key from Supabase.
  2. Update local/CI secret store only.
  3. Verify with `npm run db:backfill:skill-map` and `npm run db:verify:skill-map`.
  4. Revoke old key.
  5. Record timestamp/operator in release note.

## CI/Release Gate
- Mandatory checks before release:
  1. `npm run db:gate:release`

`db:gate:release` runs the following checks in order:
1. `npm run db:check:secrets-tracked`
2. `npm run db:guard:admin`
3. `npm run db:verify:skill-map`
4. `npm run db:verify:dashboard-reset`
5. `npm run db:report:recommend`
