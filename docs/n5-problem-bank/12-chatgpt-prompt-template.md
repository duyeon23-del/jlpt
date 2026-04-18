# ChatGPT 프롬프트 템플릿 (N5 문제은행 생산용)

## 🎯 목표
ChatGPT를 통해 JSON 형식의 N5 문제 배치를 생성하고, 이를 바로 검증 및 적재할 수 있도록 하는 프롬프트

---

## 📝 프롬프트 템플릿 (복사-붙여넣기용)

### A. 단일 문제 배치 생성

```
너는 JLPT N5 수준의 일본어 문제 출제 전문가야. 
다음 조건에 맞는 20개의 문제를 JSON 형식으로만 출력해줘.

【조건】
- 대분류: 문자·어휘 (또는 문법, 독해)
- 소분류: [한자 읽기 / 표기 / 문맥 규정 / 판단 / 배열]
- 난이도: N5 (초급 일본어 학습자 대상)
- 형식: 각 문제는 4개 선택지 (객관식)

【필수 요구사항】
1. 출력은 JSON 배열만 (설명이나 다른 텍스트 금지)
2. 각 문제는 다음 필드 포함:
   - id: "vocab_kanji_batch_02_q01" 형식 (고유한 ID)
   - level: "N5"
   - type: "문자·어휘"
   - sub_type: "한자 읽기"
   - question: "____" 밑줄이 반드시 포함된 문제 텍스트
   - option1~4: 선택지 (중복 금지)
   - answer: 1, 2, 3, 또는 4 (정답)
   - explanation: 해설 (1-2 문장)
3. 모든 필드는 string이거나 number (배열/객체 금지)
4. 선택지 4개는 모두 달라야 함
5. 정답이 실제로 문제의 정답인지 다시 1번 검토

【예시】
```json
[
  {
    "id": "vocab_kanji_batch_02_q01",
    "level": "N5",
    "type": "文字·語彙",
    "sub_type": "漢字読み",
    "question": "新しい服を____しました。",
    "option1": "かいました",
    "option2": "つくりました",
    "option3": "かぶりました",
    "option4": "かじました",
    "answer": 1,
    "explanation": "「買う(かう)」の過去形。新しい服を購入したという意味。"
  },
  ...
]
```

【채점 규칙】
- 일부러 틀린 선택지: 흔한 실수 또는 한자 오독 유도
- 정답 선택지: 명백하고 올바름
- 난이도: N5 (기초, JLPT 공식 샘플 답안 참고)

지금 시작해줘. JSON만 출력.
```

---

### B. 지문 기반 문제 배치 생성 (독해·문맥)

```
너는 JLPT N5 수준의 일본어 문제 출제 전문가야.
지문 기반의 "문맥" 문제 배치를 생성해줘.

【조건】
- 대분류: 문법 (또는 독해)
- 소분류: 문맥
- 지문 길이: 50-150자 (짧은 문장 3-5개)
- 질문 개수: 4개 (각 지문마다)
- 배치 개수: 5세트 (총 20문제)

【각 지문 구조】
1. 짧은 일본어 단문 3-5개로 이루어진 자연스러운 맥락
2. 각 문장에서 1개씩 밑줄 문제 (blank_number 1-4)
3. 각 질문마다 4개 선택지

【필수 요구사항】
1. 출력은 JSON 배열만 (설명 금지)
2. record_type: "passage_set"
3. 각 항목:
   - level: "N5"
   - type: "문법" (또는 "독해")
   - sub_type: "문맥"
   - group_key: "grammar_context_batch_02_set_01" 형식
   - content: 지문 전체 (개행은 \n으로 표시)
   - questions: 배열 (4개 객체)
     - blank_number: 1, 2, 3, 4
     - question: "...____...." 형식
     - option1~4, answer, explanation

【예시】
```json
[
  {
    "record_type": "passage_set",
    "level": "N5",
    "type": "文法",
    "sub_type": "文脈",
    "group_key": "grammar_context_batch_02_set_01",
    "content": "田中さんは毎朝6時に__1__。その後、コーヒーを飲んで、会社へ__2__。\n会社では、新しいプロジェクトで__3__。夕方5時に仕事が終わって、スポーツジムで__4__。",
    "questions": [
      {
        "blank_number": 1,
        "question": "田中さんは毎朝6時に____。",
        "option1": "おきます",
        "option2": "ねます",
        "option3": "あさごはんを食べます",
        "option4": "シャワーを浴びます",
        "answer": 1,
        "explanation": "맥락상 아침 6시에 일어나는 것이 자연스럽습니다."
      },
      ...
    ]
  },
  ...
]
```

지금 시작해줘. JSON만 출력.
```

---

### C. 매개변수화된 프롬프트 (배치별 재사용)

```
JLPT N5 문제 생성 전문가로서, 다음 사양의 문제 배치를 생성해줘:

【설정】
{
  "batch_id": "n5_vocab_notation_batch_03",
  "type": "文字·語彙",
  "sub_type": "表記",
  "question_count": 20,
  "format": "single",
  "difficulty": "N5",
  "focus": "일상적인 어휘의 표기법 / 가나 / 한자 혼용"
}

지문 기반 예시:
- 카나만: "あいさつ" 대신 대체 표기
- 한자 옵션: 같은 발음 다른 한자
- 후리가나: 한자 읽기와의 차이

【최종 결과】
JSON 배열 형식으로만 [{ ... }, { ... }, ...] 30줄 이상 출력.
설명, 마크다운, 코드블록 금지.
```

---

## 🚀 사용 방법

### Step 1: 프롬프트 선택
- **A 템플릿**: 어휘, 문법 단일 선택지 문제
- **B 템플릿**: 지문 기반 독해/문맥 문제
- **C 템플릿**: 특정 배치 ID와 함께 파라미터화된 요청

### Step 2: ChatGPT 실행
```
1. ChatGPT (또는 Claude) 접속
2. 위 프롬프트 중 하나 복사-붙여넣기
3. JSON마크다운 블록 아래 출력물만 복사
```

### Step 3: 파일 저장
```bash
# 출력된 JSON을 다음에 저장:
data/n5-batches/n5_vocab_notation_batch_03.json
```

### Step 4: 검증 및 변환
```bash
# 검증
node scripts/validate-n5-batch.mjs data/n5-batches/n5_vocab_notation_batch_03.json

# SQL 변환
node scripts/generate-n5-sql.mjs data/n5-batches/n5_vocab_notation_batch_03.json supabase/imports/n5_vocab_notation_batch_03.sql

# DB 적용
SUPABASE_DB_URL="..." node scripts/run-sql-file.mjs supabase/imports/n5_vocab_notation_batch_03.sql
```

---

## 💡 팁: 프롬프트 최적화

### 좋은 프롬프트
```
✅ "JLPT N5 수준의 일상적인 어휘 20개 문제를 JSON 배열로 출력해줘.
   정답은 명백하고, 오답지는 흔한 실수나 발음 유사 어휘로 구성."
```

### 나쁜 프롬프트
```
❌ "일본어 문제 만들어줘"
❌ "뭐 추천하냐"
❌ "문제 좀 만들어" (JSON 형식 미지정)
```

### 재질문 예시
```
ChatGPT: [JSON 출력]

너: "이 중 항목 5번의 정답이 정말 1번이 맞나? 다시 확인해줄래?"

ChatGPT: [수정된 JSON]
```

---

## 📊 배치 생성 일정 (B옵션, 600문제)

### Phase-2 (150문제, 1-2주)
```
- vocab_kanji_batch_02~04 (60문제)
- vocab_notation_batch_02~04 (60문제)
- vocab_context_batch_02~04 (30문제)
```

### Phase-3 (100문제, 2-3주)
```
- reading_short_batch_02~04 (50문제 = 10-12 지문)
- reading_medium_batch_02~04 (50문제 = 8-10 지문)
```

### Phase-4 (150문제, 3-4주)
```
- grammar_judgement_batch_02~04 (50문제)
- grammar_reorder_batch_02~04 (50문제)
- grammar_context_batch_02~05 (50문제 = 10-12 지문)
```

### Phase-5+ (200+문제, 병행 진행)
```
- reading_search (정보검색) 배치
- 각 분류별 추가 배치
```

---

## ⚙️ 자동화 (향후 고도화)

```bash
# ChatGPT API 사용 자동화 (Python 예시)
python scripts/generate-batch-via-gpt.py \
  --type "vocab_kanji" \
  --count 20 \
  --output data/n5-batches/vocab_kanji_batch_02.json
```

현재는 수동이지만, 나중에 자동화 가능.
