import { readFileSync } from "node:fs";
import { resolve } from "node:path";

const batchPath = process.argv[2];

if (!batchPath) {
  console.error("Usage: node scripts/validate-n5-batch.mjs <batch-json-path>");
  process.exit(1);
}

const absolutePath = resolve(process.cwd(), batchPath);

const allowedSubTypes = {
  "문자·어휘": new Set(["한자 읽기", "표기", "문맥 규정"]),
  "문법": new Set(["판단", "배열", "문맥"]),
  "독해": new Set(["단문독해", "중문독해", "정보검색"]),
};

const errors = [];

const addError = (message) => {
  errors.push(message);
};

const requireText = (value, label) => {
  if (typeof value !== "string" || value.trim() === "") {
    addError(`${label} must be a non-empty string.`);
    return false;
  }
  return true;
};

const validateOptions = (item, prefix) => {
  const options = [item.option1, item.option2, item.option3, item.option4];
  options.forEach((option, index) => {
    requireText(option, `${prefix}.option${index + 1}`);
  });

  const normalized = options.map((option) => String(option || "").trim());
  if (new Set(normalized).size !== 4) {
    addError(`${prefix} options must be 4 unique values.`);
  }
};

const validateAnswer = (value, label) => {
  if (!Number.isInteger(value) || value < 1 || value > 4) {
    addError(`${label} must be an integer between 1 and 4.`);
  }
};

const validateAdaptiveMeta = (item, labelPrefix) => {
  if (item.difficulty !== undefined) {
    if (!Number.isInteger(item.difficulty) || item.difficulty < 1 || item.difficulty > 5) {
      addError(`${labelPrefix}.difficulty must be an integer between 1 and 5 when provided.`);
    }
  }

  if (item.recommendation_weight !== undefined) {
    if (typeof item.recommendation_weight !== "number" || item.recommendation_weight <= 0) {
      addError(`${labelPrefix}.recommendation_weight must be a positive number when provided.`);
    }
  }
};

const validateSingle = (item, index) => {
  const prefix = `items[${index}]`;

  if (item.level !== "N5") {
    addError(`${prefix}.level must be N5.`);
  }

  if (!["문자·어휘", "문법"].includes(item.major_type)) {
    addError(`${prefix}.major_type must be 문자·어휘 or 문법.`);
  }

  if (!allowedSubTypes[item.major_type]?.has(item.sub_type)) {
    addError(`${prefix}.sub_type is invalid for major_type ${item.major_type}.`);
  }

  requireText(item.question, `${prefix}.question`);
  requireText(item.explanation, `${prefix}.explanation`);
  validateAdaptiveMeta(item, prefix);
  validateOptions(item, prefix);
  validateAnswer(item.answer, `${prefix}.answer`);
};

const validatePassageSet = (item, index) => {
  const prefix = `items[${index}]`;

  if (item.level !== "N5") {
    addError(`${prefix}.level must be N5.`);
  }

  if (!["독해", "문법"].includes(item.major_type)) {
    addError(`${prefix}.major_type must be 독해 or 문법.`);
  }

  if (!allowedSubTypes[item.major_type]?.has(item.sub_type)) {
    addError(`${prefix}.sub_type is invalid for major_type ${item.major_type}.`);
  }

  requireText(item.group_key, `${prefix}.group_key`);
  requireText(item.content, `${prefix}.content`);
  validateAdaptiveMeta(item, prefix);

  if (!Array.isArray(item.questions) || item.questions.length === 0) {
    addError(`${prefix}.questions must be a non-empty array.`);
    return;
  }

  const blankNumbers = new Set();

  item.questions.forEach((question, questionIndex) => {
    const questionPrefix = `${prefix}.questions[${questionIndex}]`;

    if (!Number.isInteger(question.blank_number) || question.blank_number < 1) {
      addError(`${questionPrefix}.blank_number must be a positive integer.`);
    }

    if (blankNumbers.has(question.blank_number)) {
      addError(`${questionPrefix}.blank_number must be unique within a set.`);
    }
    blankNumbers.add(question.blank_number);

    requireText(question.question, `${questionPrefix}.question`);
    requireText(question.explanation, `${questionPrefix}.explanation`);
    validateAdaptiveMeta(question, questionPrefix);
    validateOptions(question, questionPrefix);
    validateAnswer(question.answer, `${questionPrefix}.answer`);
  });
};

let payload;

try {
  payload = JSON.parse(readFileSync(absolutePath, "utf8"));
} catch (error) {
  console.error(`Failed to read or parse JSON: ${error.message}`);
  process.exit(1);
}

if (!Array.isArray(payload)) {
  console.error("Top-level JSON must be an array.");
  process.exit(1);
}

if (payload.length === 0) {
  console.error("JSON array must not be empty.");
  process.exit(1);
}

const duplicateQuestionKeys = new Set();

payload.forEach((item, index) => {
  const prefix = `items[${index}]`;

  if (!item || typeof item !== "object" || Array.isArray(item)) {
    addError(`${prefix} must be an object.`);
    return;
  }

  if (!["single", "passage_set"].includes(item.record_type)) {
    addError(`${prefix}.record_type must be single or passage_set.`);
    return;
  }

  if (item.record_type === "single") {
    validateSingle(item, index);
    const dedupeKey = `${item.record_type}::${item.major_type}::${item.sub_type}::${String(item.question || "").trim()}`;
    if (duplicateQuestionKeys.has(dedupeKey)) {
      addError(`${prefix} appears duplicated within the batch.`);
    }
    duplicateQuestionKeys.add(dedupeKey);
  }

  if (item.record_type === "passage_set") {
    validatePassageSet(item, index);
    const dedupeKey = `${item.record_type}::${item.major_type}::${item.sub_type}::${String(item.content || "").trim()}`;
    if (duplicateQuestionKeys.has(dedupeKey)) {
      addError(`${prefix} appears duplicated within the batch.`);
    }
    duplicateQuestionKeys.add(dedupeKey);
  }
});

if (errors.length > 0) {
  console.error("N5 batch validation failed:");
  errors.forEach((error) => {
    console.error(`- ${error}`);
  });
  process.exit(1);
}

console.log(`Validation passed: ${absolutePath}`);