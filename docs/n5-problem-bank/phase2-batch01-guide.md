# Phase-2 배치 01 생성 가이드

## 🎯 생성할 배치
- **배치명**: n5_vocab_kanji_batch_02
- **분류**: 문자·어휘 > 한자 읽기
- **수량**: 20문제
- **난이도**: N5 (초급)

---

## 📝 Step 1: ChatGPT 프롬프트 (복사-붙여넣기)

아래 프롬프트를 **그대로** ChatGPT에 붙여넣으세요:

```
너는 JLPT N5 수준의 일본어 문제 출제 전문가야.
다음 조건에 맞는 20개의 문제를 JSON 형식으로만 출력해줘.

【조건】
- 대분류: 文字·語彙 (문자·어휘)
- 소분류: 漢字読み (한자 읽기) - batch_02 (첫 번째 배치와는 다른 한자/어휘)
- 난이도: N5 (초급)
- 형식: 각 문제는 4개 선택지 (객관식)

【필수 요구사항】
1. 출력은 JSON 배열만 (설명이나 다른 텍스트 금지)
2. 각 문제는 다음 필드 포함:
   - id: "vocab_kanji_batch_02_q01" ~ "vocab_kanji_batch_02_q20" (고유한 ID)
   - level: "N5"
   - type: "文字·語彙"
   - sub_type: "漢字読み"
   - question: "____" 밑줄이 반드시 포함된 문제 텍스트
   - option1~4: 선택지 (중복 금지)
   - answer: 1, 2, 3, 또는 4 (정답)
   - explanation: 해설 (1-2 문장)
3. 모든 필드는 string이거나 number (배열/객체 금지)
4. 선택지 4개는 모두 달라야 함
5. 정답이 실제로 문제의 정답인지 다시 1번 검토

【과거 배치와의 차이】
batch_01에 없는 새로운 한자/어휘로 구성해줘.
예를 들어, batch_01에서 新しい, 本 같은 기본 어휘를 썼다면,
batch_02에서는 会社, 仕事, 友達 같은 다른 어휘로.

【예시】
```json
[
  {
    "id": "vocab_kanji_batch_02_q01",
    "level": "N5",
    "type": "文字·語彙",
    "sub_type": "漢字読み",
    "question": "会社へ____に行きます。",
    "option1": "あした",
    "option2": "けど",
    "option3": "また",
    "option4": "でも",
    "answer": 1,
    "explanation": "「明日(あした)」= 내일. 시간 표현이므로 정답입니다."
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

## ✅ Step 2: 실행 및 결과 확인

### 2-1. ChatGPT에 붙여넣기
```
1. https://chat.openai.com 접속
2. 새 대화 시작
3. 위 프롬프트 전체 복사 및 붙여넣기
4. 엔터 → 생성 대기 (1-2분)
```

### 2-2. 결과 확인
ChatGPT가 JSON 배열을 출력할 것입니다:
```json
[
  { "id": "vocab_kanji_batch_02_q01", ... },
  { "id": "vocab_kanji_batch_02_q02", ... },
  ...
]
```

### 2-3. JSON만 복사
```
- 코드 블록 전체 또는 JSON 배열 선택
- Ctrl+C 복사
```

---

## 💾 Step 3: VS Code에서 파일 저장

### 3-1. 파일 생성
```
VS Code 탐색기 (Ctrl+Shift+E):
data/ → n5-batches/ 폴더 우클릭
→ "새 파일" → n5_vocab_kanji_batch_02.json
```

### 3-2. JSON 붙여넣기
```
1. 생성된 파일 열기
2. Ctrl+V (JSON 붙여넣기)
3. Shift+Alt+F (포맷팅 - 자동으로 들여쓰기 정렬)
4. Ctrl+S (저장)
```

**최종 파일 경로:**
```
c:\Users\edticket\jlpt-app\data\n5-batches\n5_vocab_kanji_batch_02.json
```

---

## 🔍 Step 4: 검증

### 4-1. 터미널 열기
```
VS Code: Ctrl+` (역따옴표)
또는 메뉴: View → Terminal
```

### 4-2. 검증 명령 실행
```bash
node scripts/validate-n5-batch.mjs data/n5-batches/n5_vocab_kanji_batch_02.json
```

### 4-3. 결과 확인

**✅ 성공:**
```
✅ 검증 완료: n5_vocab_kanji_batch_02.json
   - 총 20개 항목
   - 모든 필드 유효
   - 논리적 검증 통과
```

**❌ 오류 발생 시:**
```
[항목 5] record_type=single
⚠️ 경고: option1과 option2가 동일합니다
```

오류 발생 시:
- ChatGPT로 재질문: "항목 5번 option2를 다른 선택지로 바꿔줄래?"
- 또는 JSON 파일에서 직접 수정
- 재검증

---

## 🚀 준비 완료!

위 단계를 따라가면:

1. ✅ ChatGPT에서 JSON 생성
2. ✅ VS Code에 파일 저장
3. ✅ 검증 완료

그 다음:
- **SQL 변환** (자동 스크립트)
- **DB 적재** (한 줄 명령)
- **앱 확인** (브라우저 테스트)

---

## 📌 지금 바로 시작하세요!

위 프롬프트를 ChatGPT에 붙여넣고 결과를 알려주세요.
JSON이 생성되면 여기서 알려드린 대로 저장 및 검증하면 됩니다! 🎯
