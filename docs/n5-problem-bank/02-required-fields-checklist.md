# N5 문제은행 필수 컬럼 및 검수 체크리스트

## 1. 공통 필수 체크

- level 이 `N5` 인가
- type 값이 허용 목록 안에 있는가
- sub_type 값이 허용 목록 안에 있는가
- answer 값이 선택지와 일치하는가
- explanation 이 빈 문자열이 아닌가
- question 문장이 자연스러운가
- 같은 배치 안에 사실상 중복 문항이 없는가

## 2. questions 체크리스트

- question 에 빈칸 또는 질문 의도가 명확한가
- option1~option4 가 모두 존재하는가
- option1~option4 가 서로 중복되지 않는가
- 오답 선택지가 너무 명백하지 않은가
- explanation 에 왜 정답인지, 왜 오답인지 핵심이 드러나는가

## 3. passages 체크리스트

- content 가 한 세트로 읽히는 길이인가
- N5 학습자 기준 어휘와 문장 길이가 과도하지 않은가
- 같은 지문 안 질문 수가 너무 많지 않은가
- content 와 question 사이 의미 연결이 자연스러운가

## 4. passage_questions 체크리스트

- group_id 가 실제 지문과 연결되는가
- blank_number 가 누락 없이 증가하는가
- 선택지가 지문 정보만으로 풀 수 있는가
- 지문 밖 상식이 필요하지 않은가

## 5. 스킬 매핑 체크

- 문자·어휘/문법 단일 문제는 `single` 로 적재 가능한가
- 독해 문제는 `passage` 로 적재 가능한가
- 문법 문맥 세트는 `grammar_context` 로 매핑 가능한가
- 현재 question_skill_rules 로 커버되지 않는 조합이 없는가

## 6. 최종 적재 전 체크

- JSON 검수 스크립트 통과
- SQL 변환 결과 확인
- 샘플 3~5문항 수동 리뷰
- 적재 후 skill map 검증 SQL 실행
- 앱에서 실제 노출 확인