import { spawn } from "node:child_process";
import { existsSync, mkdirSync, writeFileSync } from "node:fs";
import { resolve } from "node:path";
import OpenAI from "openai";
import dotenv from "dotenv";

dotenv.config();

const [batchType, batchNumber, rawCount] = process.argv.slice(2);

if (!batchType || !batchNumber || !rawCount) {
  console.error("Usage: node scripts/generate-batch-via-gpt.mjs <type> <batch-number> <count>");
  console.error("Example: node scripts/generate-batch-via-gpt.mjs vocab_kanji 02 20");
  process.exit(1);
}

if (!process.env.OPENAI_API_KEY) {
  console.error("Missing OPENAI_API_KEY in environment.");
  console.error("Create a .env file in the project root with OPENAI_API_KEY=sk-...");
  process.exit(1);
}

const count = Number.parseInt(rawCount, 10);

if (!Number.isInteger(count) || count < 1) {
  console.error("count must be a positive integer.");
  process.exit(1);
}

const batchConfigs = {
  vocab_kanji: {
    recordType: "single",
    majorType: "문자·어휘",
    subType: "한자 읽기",
    difficulty: 2,
    recommendationWeight: 0.95,
    filenamePrefix: "n5_vocab_kanji",
    promptFocus: "한자의 읽기(요미가나)와 기초 어휘 구분",
  },
  vocab_notation: {
    recordType: "single",
    majorType: "문자·어휘",
    subType: "표기",
    difficulty: 2,
    recommendationWeight: 0.95,
    filenamePrefix: "n5_vocab_notation",
    promptFocus: "가나/한자 표기 구분과 일상 어휘 표기",
  },
  vocab_context: {
    recordType: "single",
    majorType: "문자·어휘",
    subType: "문맥 규정",
    difficulty: 3,
    recommendationWeight: 1.0,
    filenamePrefix: "n5_vocab_context",
    promptFocus: "문맥에 맞는 가장 자연스러운 어휘 선택",
  },
  grammar_judgement: {
    recordType: "single",
    majorType: "문법",
    subType: "판단",
    difficulty: 3,
    recommendationWeight: 1.0,
    filenamePrefix: "n5_grammar_judgement",
    promptFocus: "기초 문형과 조사/활용 판단",
  },
  grammar_reorder: {
    recordType: "single",
    majorType: "문법",
    subType: "배열",
    difficulty: 4,
    recommendationWeight: 1.15,
    filenamePrefix: "n5_grammar_reorder",
    promptFocus: "짧은 문장의 어순과 문장 조립",
  },
  grammar_context: {
    recordType: "passage_set",
    majorType: "문법",
    subType: "문맥",
    difficulty: 4,
    recommendationWeight: 1.12,
    filenamePrefix: "n5_grammar_context",
    promptFocus: "짧은 문맥 안에서 기초 문법 형태 선택",
  },
  reading_short: {
    recordType: "passage_set",
    majorType: "독해",
    subType: "단문독해",
    difficulty: 2,
    recommendationWeight: 1.0,
    filenamePrefix: "n5_reading_short",
    promptFocus: "짧은 생활문 독해와 핵심 정보 파악",
  },
  reading_medium: {
    recordType: "passage_set",
    majorType: "독해",
    subType: "중문독해",
    difficulty: 3,
    recommendationWeight: 1.0,
    filenamePrefix: "n5_reading_medium",
    promptFocus: "여러 문장으로 된 짧은 글 독해와 문맥 이해",
  },
  reading_search: {
    recordType: "passage_set",
    majorType: "독해",
    subType: "정보검색",
    difficulty: 4,
    recommendationWeight: 1.1,
    filenamePrefix: "n5_reading_search",
    promptFocus: "공지, 안내문, 일정표 등에서 정보 찾기",
  },
};

const config = batchConfigs[batchType];

if (!config) {
  console.error(`Unsupported type: ${batchType}`);
  console.error(`Allowed types: ${Object.keys(batchConfigs).join(", ")}`);
  process.exit(1);
}

const openai = new OpenAI({
  apiKey: process.env.OPENAI_API_KEY,
});

const batchBaseName = `${config.filenamePrefix}_batch_${batchNumber}`;
const jsonRelativePath = `data/n5-batches/${batchBaseName}.json`;
const sqlRelativePath = `supabase/imports/${batchBaseName}.sql`;

const buildSinglePrompt = () => `너는 JLPT N5 문제은행 제작자다.
아래 조건에 맞는 문제 ${count}개를 JSON 배열만으로 출력해라.

규칙:
- 최상위는 배열만 출력한다.
- 각 항목은 record_type이 "single" 이어야 한다.
- major_type은 "${config.majorType}" 이어야 한다.
- sub_type은 "${config.subType}" 이어야 한다.
- level은 "N5" 이어야 한다.
- question에는 반드시 ____ 가 포함되어야 한다.
- answer는 1, 2, 3, 4 중 하나의 정수여야 한다.
- option1~option4는 서로 달라야 한다.
- explanation은 비어 있지 않은 문자열이어야 한다.
- difficulty는 1~5 정수여야 한다.
- recommendation_weight는 0.80~1.25 사이 숫자여야 한다.
- ${count >= 10 ? "이번 배치에는 difficulty=1 문제를 최소 1개, difficulty=5 문제를 최소 1개 반드시 포함한다." : "가능하면 difficulty 1~5를 고르게 섞는다."}
- ${config.subType} 특성상 기본 중심 난이도는 ${config.difficulty} 근처로 맞춘다.
- recommendation_weight는 기본값 ${config.recommendationWeight}를 중심으로 난이도와 변별력에 따라 소폭 조정한다.
- 이전 배치와 겹치는 쉬운 상용 예시만 반복하지 말고, ${config.promptFocus} 중심으로 새로운 문제를 만들어라.
- 출력 외 설명, 제목, 코드블록 마크다운을 붙이지 마라.

출력 스키마:
[
  {
    "record_type": "single",
    "level": "N5",
    "major_type": "${config.majorType}",
    "sub_type": "${config.subType}",
    "question": "... ____ ...",
    "option1": "...",
    "option2": "...",
    "option3": "...",
    "option4": "...",
    "answer": 1,
    "explanation": "...",
    "difficulty": 3,
    "recommendation_weight": 1.0
  }
]
`;

const buildPassagePrompt = () => {
  const setCount = Math.max(1, Math.floor(count / 4));
  return `너는 JLPT N5 문제은행 제작자다.
아래 조건에 맞는 passage_set ${setCount}개를 JSON 배열만으로 출력해라.

규칙:
- 최상위는 배열만 출력한다.
- 각 항목은 record_type이 "passage_set" 이어야 한다.
- 각 세트의 major_type은 "${config.majorType}" 이어야 한다.
- sub_type은 "${config.subType}" 이어야 한다.
- level은 "N5" 이어야 한다.
- group_key는 "${batchBaseName}_set_01" 같은 형식으로 고유해야 한다.
- content는 3~5문장 정도의 짧은 일본어 지문이어야 한다.
- 각 세트는 questions 배열에 정확히 4개 문항을 가져야 한다.
- 각 문항의 blank_number는 1,2,3,4 순서여야 한다.
- 각 question에는 반드시 ____ 가 포함되어야 한다.
- answer는 1, 2, 3, 4 중 하나의 정수여야 한다.
- option1~option4는 서로 달라야 한다.
- explanation은 비어 있지 않은 문자열이어야 한다.
- ${config.promptFocus}에 맞게 생활 일본어 수준으로 작성해라.
- 각 세트에 difficulty(1~5), recommendation_weight(0.80~1.25)를 포함해라.
- questions 각 문항에도 difficulty/recommendation_weight를 포함해라.
- ${setCount >= 3 ? "이번 배치 전체에서 difficulty=1 세트 최소 1개, difficulty=5 세트 최소 1개를 포함한다." : "가능하면 difficulty 1~5를 섞는다."}
- ${config.subType} 특성상 기본 중심 난이도는 ${config.difficulty} 근처로 맞춘다.
- 출력 외 설명, 제목, 코드블록 마크다운을 붙이지 마라.

출력 스키마:
[
  {
    "record_type": "passage_set",
    "level": "N5",
    "major_type": "${config.majorType}",
    "sub_type": "${config.subType}",
    "group_key": "${batchBaseName}_set_01",
    "difficulty": 3,
    "recommendation_weight": 1.0,
    "content": "...",
    "questions": [
      {
        "blank_number": 1,
        "question": "... ____ ...",
        "option1": "...",
        "option2": "...",
        "option3": "...",
        "option4": "...",
        "answer": 1,
        "explanation": "...",
        "difficulty": 3,
        "recommendation_weight": 1.0
      }
    ]
  }
]
`;
};

const prompt = config.recordType === "single" ? buildSinglePrompt() : buildPassagePrompt();

const extractJson = (content) => {
  const trimmed = String(content || "").trim();
  const fenced = trimmed.match(/```(?:json)?\s*([\s\S]*?)\s*```/i);
  return fenced ? fenced[1].trim() : trimmed;
};

const runCommand = (command, args) =>
  new Promise((resolvePromise, rejectPromise) => {
    const child = spawn(command, args, {
      cwd: process.cwd(),
      stdio: "inherit",
      env: process.env,
    });

    child.on("exit", (code) => {
      if (code === 0) {
        resolvePromise();
        return;
      }

      rejectPromise(new Error(`${command} ${args.join(" ")} failed with exit code ${code ?? 1}`));
    });

    child.on("error", rejectPromise);
  });

try {
  console.log(`Generating ${batchBaseName}...`);

  const response = await openai.responses.create({
    model: "gpt-4.1",
    input: prompt,
  });

  const rawText = response.output_text;
  const jsonText = extractJson(rawText);
  const parsed = JSON.parse(jsonText);

  if (!Array.isArray(parsed) || parsed.length === 0) {
    throw new Error("Generated payload is not a non-empty array.");
  }

  const absoluteJsonPath = resolve(process.cwd(), jsonRelativePath);
  const absoluteJsonDir = resolve(process.cwd(), "data/n5-batches");

  if (!existsSync(absoluteJsonDir)) {
    mkdirSync(absoluteJsonDir, { recursive: true });
  }

  writeFileSync(absoluteJsonPath, `${JSON.stringify(parsed, null, 2)}\n`, "utf8");
  console.log(`Saved JSON: ${absoluteJsonPath}`);

  await runCommand(process.execPath, ["scripts/validate-n5-batch.mjs", jsonRelativePath]);
  await runCommand(process.execPath, ["scripts/generate-n5-sql.mjs", jsonRelativePath, sqlRelativePath]);

  console.log(`Saved SQL: ${resolve(process.cwd(), sqlRelativePath)}`);
  console.log("Done.");
  console.log(`Next: node scripts/run-sql-file.mjs ${sqlRelativePath}`);
} catch (error) {
  console.error(`Failed to generate batch: ${error.message}`);
  process.exit(1);
}