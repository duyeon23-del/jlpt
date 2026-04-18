# 운영자 전용 DB 명령어 표준 세트

## 목적
- 모든 DB 백필, 검증, 품질체크, 리셋 검증, 추천 리포트 등은 운영자(admin)만 실행 가능
- 실수/오염 방지 및 운영 안정성 확보

## 표준 명령어
- 백필: `npm run db:backfill:skill-map`
- 스킬맵 검증: `npm run db:verify:skill-map`
- 추천 품질 체크: `npm run db:check:recommend`
- 대시보드 리셋 검증: `npm run db:verify:dashboard-reset`
- 추천 리포트: `npm run db:report:recommend` (export 포함)
- 릴리즈 게이트: `npm run db:gate:release`
- 테스트 시드/정리: `npm run db:test-seed:attempts`, `npm run db:test-cleanup:attempts`
- 기준선 스냅샷: `npm run snapshot:release-baseline`

## 운영자 전용 보호
- 모든 명령어는 `scripts/require-admin-ops.mjs`로 운영자 권한(`ADMIN_DB_OPS=1` 및 서비스 롤 키) 필요
- 일반 유저/CI 환경에서는 실행 불가

## 실패/오류 시 참고
- docs/operations/05-db-ops-runbook.md (운영 명령 실패 대응)
- docs/operations/04-db-ops-failure-playbook.md (장애 대응)

## 참고
- 명령어/정책 변경 시 README 및 docs/operations/02-secrets-and-access-policy.md 동시 갱신
