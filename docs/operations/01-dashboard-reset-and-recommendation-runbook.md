# Dashboard Reset + Recommendation Runbook

## 목적
- 진단 초기화를 클라이언트 다중 쿼리 대신 서버 원자 작업(RPC)으로 일원화한다.
- 추천 엔진 품질(중복, 난이도 분포, 유형 분포)을 운영 관점에서 빠르게 검증한다.
- DB 권한(RLS)과 인덱스 상태를 배포 후 일관되게 확인한다.

## 적용 대상
- Migration: `supabase/migrations/20260418110000_add_reset_rpc_rls_and_indexes.sql`
- Verify SQL:
  - `supabase/verify_dashboard_reset_rpc.sql`
  - `supabase/check_recommend_quality.sql`

## 배포 순서
1. 마이그레이션 반영
   - `npm run db:push`
2. 리셋 RPC 검증 (트랜잭션 롤백 방식)
   - `npm run db:verify:dashboard-reset`
3. 추천 품질 검증
   - `npm run db:check:recommend`

## 기대 결과
- reset RPC 호출 결과에서 `ok = true` 또는 `message = no_data`.
- 추천 품질 점검에서:
  - duplicate_rows = 0
  - 난이도 분포와 major/sub 분포가 한쪽으로 과도하게 치우치지 않음.

## 실패 시 점검 포인트
1. reset RPC 미존재
   - 증상: `42883` 또는 `PGRST202`
   - 조치: 최신 migration 재적용 후 재검증
2. reset 권한 실패
   - 증상: permission denied 또는 삭제 후 카운트 감소 없음
   - 조치: `user_question_attempts`, `user_stats` RLS 정책 확인
3. 추천 중복/쏠림
   - 증상: duplicate_rows > 0 또는 특정 난이도 과다
   - 조치: `get_recommended_questions_by_skill_v3` 최신 정의 반영 여부 확인

## 롤백 전략
- SQL 함수/정책 단위 변경이므로 긴급 시 직전 stable migration 기준 함수/정책 재적용.
- reset 검증 SQL은 항상 `begin ... rollback`로 실행되어 실제 데이터 변경 없음.

## 운영 체크리스트
- [ ] `npm run db:push` 성공
- [ ] `npm run db:verify:dashboard-reset` 성공
- [ ] `npm run db:check:recommend`에서 duplicate_rows=0
- [ ] 앱 대시보드에서 초기화 성공 메시지 및 0 상태 확인
