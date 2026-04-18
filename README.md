# JLPT App

Next.js + Supabase 기반 JLPT 연습 앱입니다.

## 실행

```bash
npm install
npm run dev
```

브라우저에서 `http://localhost:3000` 접속.

## 필수 환경 변수

- `NEXT_PUBLIC_SUPABASE_URL`
- `NEXT_PUBLIC_SUPABASE_ANON_KEY`
- `SUPABASE_DB_URL` (SQL 스크립트 실행용)
- `SUPABASE_SERVICE_ROLE_KEY` (관리자 DB 작업용)
- `ADMIN_DB_OPS=1` (관리자 DB 작업 실행 스위치)

`.env.local` 또는 `.env`에 설정합니다.

## 주요 명령어

- 앱
	- `npm run dev`
	- `npm run build`
	- `npm run lint`
- DB
	- `npm run db:push`
	- `npm run db:backfill:skill-map`
	- `npm run db:gate:release`
	- `npm run db:push:verify`
	- `npm run db:verify:skill-map`
	- `npm run db:verify:dashboard-reset`
	- `npm run db:check:recommend`
	- `npm run db:report:recommend`
	- `npm run db:test-seed:attempts`
	- `npm run db:test-cleanup:attempts`
	- `npm run db:check:secrets-tracked`
- N5 데이터
	- `npm run n5:validate`
	- `npm run n5:generate-sql`
	- `npm run db:apply:n5-phase1`

## 최근 운영 변경

- 대시보드 초기화는 `reset_user_learning_data` RPC 우선 호출(원자 작업)로 동작.
- RPC 미적용 환경은 클라이언트 레거시 경로로 자동 fallback.
- 추천 품질 체크 SQL에 중복/유형 분포 점검 항목 추가.
- 릴리즈 전 통합 DB 게이트는 `npm run db:gate:release`로 실행.

## 운영 런북

- 대시보드 리셋/추천 검증:
	- `docs/operations/01-dashboard-reset-and-recommendation-runbook.md`
- 비밀키/권한 정책:
	- `docs/operations/02-secrets-and-access-policy.md`
- 릴리즈 기준선:
	- `docs/operations/03-db-release-baseline-2026-04-18.md`
- 장애 대응 플레이북:
	- `docs/operations/04-db-ops-failure-playbook.md`

## 관련 문서

- 문제은행 워크플로우: `docs/n5-problem-bank/`
