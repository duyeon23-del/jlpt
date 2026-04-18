# 운영 명령 실패 대응 절차 (런북)

## 적용 범위
- 마이그레이션 불일치
- 백필/검증 RLS 거부
- 추천 0건 응답
- 샘플 유저 없음
- SQL 결과 인코딩 문제
- 릴리즈 게이트 실패

## 1) 마이그레이션 불일치
- 증상: `db push` 반복 적용/복구 루프
- 조치:
  1. `npx supabase migration list` 실행
  2. 비표준/짧은 파일명 확인 후 `supabase/legacy`로 이동
  3. 재실행

## 2) 백필/검증 RLS 거부
- 증상: `new row violates row-level security policy for table ...`
- 조치:
  1. `SUPABASE_SERVICE_ROLE_KEY` 환경변수 확인
  2. `npm run db:backfill:skill-map` 재실행
  3. 불가 시 SQL 직접 실행

## 3) 추천 0건 응답
- 조치:
  1. `node scripts/run-sql-file.mjs supabase/quick_recommend_check.sql` 실행
  2. 필요시 `npm run db:test-seed:attempts`로 테스트 데이터 생성
  3. `npm run db:report:recommend`로 리포트 확인
  4. 완료 후 `npm run db:test-cleanup:attempts`로 정리

## 4) 샘플 유저 없음
- 조치:
  1. `public.users`, `auth.users` 테이블 확인
  2. 없으면 앱에서 테스트 계정 생성
  3. 추천 검증 재시도

## 5) 인코딩 문제
- 증상: SQL 결과 한글 깨짐
- 조치:
  1. 표준 npm 스크립트 사용(자동 chcp 65001)
  2. SQL에 `\encoding UTF8`, `\pset pager off` 유지
  3. 터미널 재시작 후 재실행

## 6) 릴리즈 게이트 실패
- 조치:
  1. `npm run db:gate:release`로 실패 단계 확인
  2. secrets check 실패: `.env*` git 추적 해제
  3. skill map 실패: `npm run db:backfill:skill-map` 후 재시도
  4. dashboard reset 실패: 관련 SQL 점검
  5. recommend report 실패: 샘플 데이터 복구 후 재시도

## 롤백 원칙
- 변이 전 기준선 스냅샷 기록
- 검증 실패 시 즉시 중단, 마지막 정상 상태로 복구
