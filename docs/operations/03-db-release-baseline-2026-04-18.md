# DB Release Baseline - 2026-04-18

## Snapshot Summary
- Captured at: 2026-04-18
- Purpose: establish known-good baseline after migration reconciliation and skill-map hardening.

## Migration History
Local and remote migration versions are aligned from `20260413000000` through `20260418110000`.

## Skill Map Integrity
From `db:verify:skill-map`:
- `single`: expected 713, mapped 713, missing 0
- `passage`: expected 90, mapped 90, missing 0
- `grammar_context`: expected 40, mapped 40, missing 0

Additional integrity checks:
- stale mapping rows: 0
- orphan rows: 0
- source mismatch rows: 0

## Recommendation RPC Availability
From `quick_recommend_check.sql`:
- status: `Sample user found`
- weak skills: `1`
- recommendation options: `20`

## Operational Readiness
- Admin guard enabled via `scripts/require-admin-ops.mjs`.
- Secret tracking check enabled via `scripts/check-no-tracked-secrets.mjs`.
- Standardized admin DB commands defined in `package.json`.
- Unified release gate available via `npm run db:gate:release`.
