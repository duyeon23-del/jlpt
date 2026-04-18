# SQL/터미널 인코딩 완전 고정 및 가이드

## 원칙
- 모든 SQL 결과는 UTF-8로 출력되어야 하며, 한글이 깨지지 않아야 함
- Windows, Mac, Linux 환경 모두에서 일관된 결과 보장

## 자동화 적용 내역
- 모든 npm DB 명령어는 Windows에서 `chcp 65001`(UTF-8 코드페이지) 자동 실행
- run-sql-file.mjs는 `PGCLIENTENCODING=UTF8` 환경변수 강제, SQL 파일에 `\encoding UTF8` 삽입 권장
- 리포트 SQL 파일은 반드시 `\encoding UTF8`, `\pset pager off` 포함

## 실무 가이드
1. **SQL 파일 작성 시**
   - 맨 위에 반드시 다음 두 줄 추가:
     ```sql
     \encoding UTF8
     \pset pager off
     ```
2. **터미널에서 직접 psql 실행 시**
   - Windows: `chcp 65001` 입력 후 실행
   - Mac/Linux: 별도 조치 불필요(UTF-8 기본)
3. **npm 스크립트로 실행 시**
   - 자동으로 인코딩이 고정되므로 별도 조치 불필요
4. **출력 파일 저장 시**
   - run-sql-file.mjs의 --out 옵션을 사용하면 항상 UTF-8로 저장됨

## 문제 발생 시 체크리스트
- SQL 파일에 `\encoding UTF8`이 누락되지 않았는지 확인
- Windows 터미널에서 코드페이지가 65001(UTF-8)인지 확인
- npm 스크립트가 아닌 수동 실행 시 환경변수 `PGCLIENTENCODING=UTF8`을 명시
- 그래도 깨질 경우, 터미널 재시작 후 재시도

## 참고
- 모든 표준 DB 명령어는 인코딩 고정 로직이 내장되어 있음
- 추가 인코딩 이슈는 docs/operations/04-db-ops-failure-playbook.md 참고
