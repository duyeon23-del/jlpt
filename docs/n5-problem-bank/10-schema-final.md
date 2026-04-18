# N5 문제 스키마 최종 문서화

## 📋 데이터베이스 테이블 구조

### 1. `questions` 테이블 (단일 문제)
**용도**: 문자·어휘, 문법의 단일 선택지 문제

| 컬럼명 | 타입 | 필수 | 설명 |
|-------|------|------|------|
| id | text | ✅ | 문제 ID (PRIMARY KEY) |
| level | varchar(10) | ✅ | 난이도: N5, N4, N3, ... |
| type | varchar(50) | ✅ | 대분류: "문자·어휘", "문법", "독해" |
| sub_type | varchar(100) | ✅ | 소분류: "한자 읽기", "표기", "판단", "배열", "문맥 규정" |
| question | text | ✅ | 문제 텍스트 (밑줄은 `____` 표시) |
| option1 | text | ✅ | 선택지 1 |
| option2 | text | ✅ | 선택지 2 |
| option3 | text | ✅ | 선택지 3 |
| option4 | text | ✅ | 선택지 4 |
| answer | varchar(10) | ✅ | 정답 (1, 2, 3, 4) |
| explanation | text | ❌ | 해설 (선택사항) |
| created_at | timestamp | ✅ | 생성 시간 (자동) |

**UNIQUE 제약**:
```sql
UNIQUE(level, type, sub_type, question)
```

**예시**:
```json
{
  "id": "vocab_kanji_n5_001",
  "level": "N5",
  "type": "문자·어휘",
  "sub_type": "한자 읽기",
  "question": "新しい本を____ました。",
  "option1": "かいました",
  "option2": "かえました",
  "option3": "かきました",
  "option4": "かぶりました",
  "answer": "1",
  "explanation": "新しい(あたらしい)本を買う(かう)=新しい本を買った。過去形。"
}
```

---

### 2. `passages` 테이블 (지문)
**용도**: 독해 문제 지문 저장

| 컬럼명 | 타입 | 필수 | 설명 |
|-------|------|------|------|
| group_id | text | ✅ | 지문 그룹 ID (PRIMARY KEY) ex) `reading_short_001`, `grammar_ctx_batch_02_set_03` |
| content | text | ✅ | 지문 전체 텍스트 (개행은 `\n`으로 표시) |
| level | varchar(10) | ✅ | 난이도: N5, N4, ... |
| type | varchar(50) | ✅ | 대분류: "독해" |
| sub_type | varchar(100) | ✅ | 소분류: "단문독해", "중문독해", "정보검색", "문맥" |
| created_at | timestamp | ✅ | 생성 시간 (자동) |

**예시**:
```json
{
  "group_id": "reading_short_batch_01_set_01",
  "content": "田中さんは毎日図書館で勉強しています。\n最近、JLPT試験に合格したいと思っています。\n図書館は静かで、集中できる場所です。",
  "level": "N5",
  "type": "독해",
  "sub_type": "단문독해"
}
```

---

### 3. `passage_questions` 테이블 (지문의 문제)
**용도**: 각 지문 내 선택지 문제

| 컬럼명 | 타입 | 필수 | 설명 |
|-------|------|------|------|
| id | uuid | ✅ | 문제 ID (PRIMARY KEY, 자동 생성) |
| group_id | text | ✅ | 지문 ID (FOREIGN KEY → passages.group_id) |
| type | varchar(50) | ✅ | 대분류: "독해" |
| sub_type | varchar(100) | ✅ | 소분류: "단문독해", "중문독해", "정보검색", "문맥" |
| question | text | ✅ | 선택지 앞 질문 텍스트 |
| blank_number | integer | ✅ | 지문 내 순번 (1, 2, 3, ...) |
| option1 | text | ✅ | 선택지 1 |
| option2 | text | ✅ | 선택지 2 |
| option3 | text | ✅ | 선택지 3 |
| option4 | text | ✅ | 선택지 4 |
| answer | varchar(10) | ✅ | 정답 (1, 2, 3, 4) |
| explanation | text | ❌ | 해설 (선택사항) |
| created_at | timestamp | ✅ | 생성 시간 (자동) |

**UNIQUE 제약**:
```sql
UNIQUE(group_id, blank_number, question)
```

**예시**:
```json
{
  "id": "uuid-generated",
  "group_id": "reading_short_batch_01_set_01",
  "type": "독해",
  "sub_type": "단문독해",
  "question": "田中さんが図書館で勉強する理由は？",
  "blank_number": 1,
  "option1": "友達と会うため",
  "option2": "集中できるから",
  "option3": "家が狭いから",
  "option4": "宿題があるから",
  "answer": "2",
  "explanation": "지문에서 '図書館は静かで、集中できる場所です'라고 설명했습니다."
}
```

---

### 4. `question_skill_map` 테이블 (문제-스킬 매핑)
**용도**: 각 문제가 어떤 스킬을 테스트하는지 기록

| 컬럼명 | 타입 | 필수 | 설명 |
|-------|------|------|------|
| id | uuid | ✅ | 매핑 ID (PRIMARY KEY, 자동 생성) |
| question_type | varchar(50) | ✅ | "single" 또는 "passage" 또는 "grammar_context" |
| question_id | text | ✅ | 문제 ID (questions.id 또는 passage_questions.id) |
| major_type | varchar(100) | ✅ | 대분류 (문자·어휘 / 문법 / 독해) |
| sub_type | varchar(100) | ✅ | 소분류 |
| skill_key | varchar(100) | ✅ | 스킬 코드 (예: vocab_kanji_reading, grammar_te_form, ...) |
| created_at | timestamp | ✅ | 생성 시간 (자동) |

**UNIQUE 제약**:
```sql
UNIQUE(question_type, question_id, skill_key)
```

**스킬 코드 규칙**:
- 어휘: `vocab_kanji_reading`, `vocab_notation`, `vocab_context`
- 문법: `grammar_judgement`, `grammar_reorder`, `grammar_context`
- 독해: `reading_short`, `reading_medium`, `reading_search`

---

## 📝 데이터 생성 워크플로우

### Phase-1: 현재 (125문제)
- 각 소분류 20문제 × 6개 = 120문제
- 지문: 5세트 × 4문제 = 20문제

### Phase-2: (계획 중, 75문제)
- 문자·어휘 추가: 30문제
- 문법 추가: 30문제
- 독해 추가: 15문제

### Phase-3: (계획 중, 100문제)
- 지문 독해 확대: 100문제

### Phase-4+: (계획 중, 200+문제)
- 모든 분류 확대

**최종 목표 (B옵션)**: 600문제

---

## 🔄 데이터 적재 프로세스

1. **JSON 생성** → ChatGPT 또는 문제 저장소에서 JSON 형식 출력
2. **검증** → JSON 스키마 검증 규칙 적용 (`validate-n5-batch.mjs`)
3. **SQL 변환** → `generate-n5-sql.mjs`로 SQL 파일 생성
4. **적재** → `apply-n5-phase1.mjs`로 Supabase 적용

---

## 🎯 필수 컬럼 체크리스트

### 단일 문제 JSON
- [ ] id (문제 고유 ID)
- [ ] level ("N5")
- [ ] type (문자·어휘 / 문법 / 독해)
- [ ] sub_type (소분류)
- [ ] question (텍스트, ____ 포함)
- [ ] option1, option2, option3, option4 (모두 필수)
- [ ] answer (1, 2, 3, 4 중 하나)
- [ ] explanation (선택사항이지만 권장)

### 지문 + 지문 문제 JSON
- [ ] record_type ("passage_set" 또는 동일한 questions 구조)
- [ ] group_key (지문 그룹 ID)
- [ ] content (지문 텍스트)
- [ ] level, type, sub_type
- [ ] questions[] 배열
  - [ ] blank_number
  - [ ] question
  - [ ] option1-4
  - [ ] answer
  - [ ] explanation
