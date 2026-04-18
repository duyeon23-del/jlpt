# 테스트 시드 데이터 정책 및 운영 분리 가이드

## 목적
- 운영 데이터와 테스트/검증용 시드 데이터의 혼동 및 오염 방지
- 테스트 attempt 데이터는 반드시 별도 명령어로 생성/정리

## 표준 명령어
- 테스트 attempt 생성: `npm run db:test-seed:attempts`
- 테스트 attempt 정리: `npm run db:test-cleanup:attempts`

## 사용 시점
- 추천 품질 검증, 릴리즈 게이트, 장애 대응 등에서 샘플 유저/데이터가 필요할 때만 사용
- 검증 후 반드시 정리 명령어로 운영 데이터 복구

## 정책
- 시드/정리 SQL은 supabase/seeds/test/ 경로에만 위치
- 운영 데이터와 혼합 금지, 실운영 환경에서는 사용 금지
- 릴리즈/CI/운영 자동화에서는 테스트 시드 명령어를 명확히 분리하여 사용

## 참고
- 장애 대응 및 검증 절차는 docs/operations/05-db-ops-runbook.md 참고
