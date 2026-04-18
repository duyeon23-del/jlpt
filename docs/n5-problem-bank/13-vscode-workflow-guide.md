# VS Code 워크플로우 가이드 (N5 문제은행 생산)

## 🎯 목표
VS Code 환경에서 ChatGPT → JSON → SQL → Supabase 적용까지 한 번에 처리하는 실전 워크플로우

---

## 📋 전체 흐름 (한눈에 보기)

```
1. ChatGPT 프롬프트 실행
   ↓
2. JSON 파일 저장 (data/n5-batches/)
   ↓
3. VS Code 터미널에서 검증
   ↓
4. SQL 변환
   ↓
5. DB 적용
   ↓
6. 앱에서 문제 확인
```

---

## 🚀 Step-by-Step 가이드

### Step 1: ChatGPT에서 JSON 생성

#### 1-1. 프롬프트 준비
```
docs/n5-problem-bank/12-chatgpt-prompt-template.md 에서 
A번 또는 B번 프롬프트 복사
```

#### 1-2. ChatGPT 실행
```
1. ChatGPT 웹사이트 열기 (https://chat.openai.com)
2. 새 대화 시작
3. 프롬프트 붙여넣기
4. 엔터 → 생성 대기 (1-2분)
```

#### 1-3. 결과 복사
```
ChatGPT 출력 결과에서:
- JSON 블록만 순수 텍스트로 선택
- Ctrl+C 복사
```

**예시 결과:**
```json
[
  {
    "id": "vocab_kanji_batch_02_q01",
    "level": "N5",
    "type": "文字·語彙",
    ...
  }
]
```

---

### Step 2: JSON 파일 저장 (VS Code)

#### 2-1. 파일 생성
```
VS Code 탐색기:
data/n5-batches/ 폴더 우클릭
→ "새 파일" → n5_vocab_kanji_batch_02.json
```

#### 2-2. JSON 붙여넣기
```
1. 생성된 파일 열기
2. Ctrl+V (복사한 JSON 붙여넣기)
3. Ctrl+S (저장)
```

#### 2-3. 포맷팅
```
Shift+Alt+F (또는 우클릭 → "Format Document")
→ JSON이 자동으로 정렬됨
```

---

### Step 3: JSON 검증

#### 3-1. 터미널 열기
```
VS Code 메뉴: View → Terminal (또는 Ctrl+`)
```

#### 3-2. 검증 명령 실행
```bash
node scripts/validate-n5-batch.mjs data/n5-batches/n5_vocab_kanji_batch_02.json
```

#### 3-3 결과 확인
```
✅ 성공:
   검증 완료: n5_vocab_kanji_batch_02.json
   - 총 20개 항목
   - 모든 필드 유효

❌ 실패:
   [항목 5] record_type=single
   ⚠️ 경고: option1과 option2가 동일합니다
```

#### 3-4 오류 수정
```json
// ChatGPT로 수정 요청:
"항목 5번 option2가 option1과 중복됐어. 
다른 선택지로 바꿔줄래?"

// 또는 직접 수정:
"option2": "かえました"  // 변경
```

---

### Step 4: SQL 변환

#### 4-1. SQL 생성 명령
```bash
node scripts/generate-n5-sql.mjs data/n5-batches/n5_vocab_kanji_batch_02.json supabase/imports/n5_vocab_kanji_batch_02.sql
```

#### 4-2 결과 확인
```
SQL generated: C:\.../supabase/imports/n5_vocab_kanji_batch_02.sql
```

#### 4-3 SQL 파일 검토 (선택사항)
```
supabase/imports/n5_vocab_kanji_batch_02.sql 파일 열기
→ 처음 20-30줄 훑어보기 (INSERT 문법 확인)

일반적인 구조:
BEGIN;
INSERT INTO public.questions (...) 
  VALUES (...) 
  ON CONFLICT (...) DO NOTHING;
...
COMMIT;
```

---

### Step 5: Supabase에 적재

#### 5-1. 환경 변수 설정 (첫 번째만)
```bash
# PowerShell:
$env:SUPABASE_DB_URL="postgresql://postgres:P4eLzIrHmVC5hhIo@db.ssflbxgjhrknaruozjjy.supabase.co:5432/postgres"

# Bash:
export SUPABASE_DB_URL="postgresql://postgres:P4eLzIrHmVC5hhIo@db.ssflbxgjhrknaruozjjy.supabase.co:5432/postgres"
```

#### 5-2. SQL 적용
```bash
node scripts/run-sql-file.mjs supabase/imports/n5_vocab_kanji_batch_02.sql
```

#### 5-3 결과 확인
```
BEGIN
INSERT 0 1
INSERT 0 1
  ... (20줄)
COMMIT
```

**의미:**
- `INSERT 0 1` = 1개 행 삽입 성공
- 20줄이면 20개 문제 모두 삽입

---

### Step 6: 앱에서 확인

#### 6-1. 개발 서버 시작 (이미 실행 중이면 스킵)
```bash
npm run dev
```

#### 6-2. 브라우저에서 확인
```
http://localhost:3000
```

#### 6-3 탭별 확인
```
문자·어휘 탭 → 한자 읽기 클릭
→ "5문항 Done! Try again?" 버튼이 나오면 성공
→ 다른 문제로는 20개 이상 문제 풀 수 있어야 함
```

---

## 📊 배치 생산 체크리스트

각 배치마다 다음을 반복:

```
□ Step 1: ChatGPT 프롬프트 실행
  - 프롬프트 템플릿 복사
  - ChatGPT에서 생성
  - JSON 결과 복사

□ Step 2: 파일 저장
  - data/n5-batches/n5_[type]_batch_[num].json 생성
  - JSON 붙여넣기 및 포맷팅

□ Step 3: 검증
  - validate-n5-batch.mjs 실행
  - 오류 수정 및 재생성

□ Step 4: SQL 변환
  - generate-n5-sql.mjs 실행
  - SQL 파일 생성 확인

□ Step 5: DB 적재
  - 환경 변수 설정 (첫 번째만)
  - run-sql-file.mjs 실행
  - BEGIN...COMMIT 결과 확인

□ Step 5-1: 스킬맵 동기화/검증
   - 20260415120000_add_skill_rules_and_auto_backfill_map.sql 실행
   - verify_skill_map_after_load.sql 실행
   - missing_rows = 0 확인

□ Step 5-2: 추천 품질 점검
   - npm run db:check:recommend 실행
   - 추천 결과의 difficulty 분포 확인
   - 취약 유형과 추천 top 결과가 논리적으로 일치하는지 확인

□ Step 6: 앱 확인
  - http://localhost:3000 접속
  - 해당 탭에서 새 문제 풀기
  - 정답/오답 저장 확인
```

---

## ⏱️ 소요 시간 목표

| 단계 | 소요 시간 | 비고 |
|------|---------|------|
| ChatGPT 생성 | 2-3분 | API 대기 시간 |
| JSON 저장 + 포맷 | 1분 | VS Code 작업 |
| 검증 | 10초 | 스크립트 실행 |
| SQL 변환 | 5초 | 스크립트 실행 |
| DB 적재 | 10-20초 | 네트워크 지연 |
| 앱 확인 | 1-2분 | 브라우저 확인 + 테스트 |
| **총합** | **7-10분** | **배치당** |

**20배치 (600문제) 총 소요**: 약 2.5-3시간

---

## 🔄 병렬 처리 (고급)

여러 배치를 동시에 준비하려면:

```
이번에 생성할 배치:
- n5_vocab_kanji_batch_02-04 (3개)
- n5_vocab_notation_batch_02-04 (3개)
- n5_vocab_context_batch_02-04 (3개)

추천 방법:
1. ChatGPT에서 3개 배치 순차 생성 (3 × 3분 = 9분)
2. 3개 파일 동시 저장 (2-3분)
3. 3개 검증 순차 실행 (3 × 10초)
4. 3개 SQL 변환 순차 실행 (3 × 5초)
5. 3개 DB 적재 순차 실행 (3 × 20초)

전체: 약 16-18분 (개별 총 30분과 비교하면 40% 시간 단축)
```

---

## 🛠️ 트러블슈팅

### 문제 1: 검증 실패 "answer 범위 초과"
```
에러: answer=5 범위 초과 (1-4만 허용)

해결:
1. JSON 파일에서 해당 항목의 "answer" 수정 (1-4만)
2. ChatGPT 재질문: "항목 3번의 answer가 5인데 1-4 중 맞는 번호로 바꿔줄래?"
3. 재검증
```

### 문제 2: SQL 적용 중 오류 "DUPLICATE KEY"
```
에러: duplicate key value violates unique constraint

이유: 같은 배치를 두 번 적용함

해결:
1. 의도적이면 괜찮음 (ON CONFLICT DO NOTHING이 처리)
2. 만약 다른 버전을 적용하려면:
   - DELETE FROM questions WHERE id LIKE 'vocab_kanji_batch_02_%'
   - 그 후 새 SQL 적용
```

### 문제 3: 앱에서 새 문제가 안 보임
```
원인 1: 캐시 문제
해결: 개발자도구 Ctrl+Shift+Del → 캐시 삭제 → 새로고침

원인 2: 탭을 전환했다 다시 돌아옴
해결: 페이지 새로고침 (F5)

원인 3: 데이터베이스 적재 실패
해결: 터미널에서 검증 결과 다시 확인
```

---

## 📚 빠른 참조 (복사-붙여넣기)

### 환경 변수 설정
```powershell
# PowerShell
$env:SUPABASE_DB_URL="postgresql://postgres:P4eLzIrHmVC5hhIo@db.ssflbxgjhrknaruozjjy.supabase.co:5432/postgres"
```

### 한 줄로 전체 실행 (검증→변환→적재)
```bash
# PowerShell
$env:SUPABASE_DB_URL="..."; node scripts/validate-n5-batch.mjs data/n5-batches/n5_vocab_kanji_batch_02.json; node scripts/generate-n5-sql.mjs data/n5-batches/n5_vocab_kanji_batch_02.json supabase/imports/n5_vocab_kanji_batch_02.sql; node scripts/run-sql-file.mjs supabase/imports/n5_vocab_kanji_batch_02.sql
```

### 배치 이름 규칙
```
형식: n5_[type]_[sub_type]_batch_[num].json

예시:
- n5_vocab_kanji_batch_02.json
- n5_grammar_judgement_batch_03.json
- n5_reading_short_batch_02.json
- n5_grammar_context_batch_04.json
```

---

## 🎯 다음 단계

1. **Phase-2 시작** (150문제)
   - 각 소분류별 추가 배치 생성
   - 일정: 1-2주

2. **자동화 고도화** (선택)
   - ChatGPT API 연동 스크립트 작성
   - 배치 자동 생성 파이프라인

3. **품질 개선**
   - 생성된 문제에 대한 피드백
   - ChatGPT 프롬프트 개선
