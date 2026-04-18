import { mkdirSync, readFileSync, writeFileSync } from "node:fs";
import { dirname, resolve } from "node:path";

const inputPath = process.argv[2];
const outputPath = process.argv[3];

if (!inputPath || !outputPath) {
  console.error("Usage: node scripts/generate-n5-sql.mjs <batch-json-path> <output-sql-path>");
  process.exit(1);
}

const absoluteInputPath = resolve(process.cwd(), inputPath);
const absoluteOutputPath = resolve(process.cwd(), outputPath);

const payload = JSON.parse(readFileSync(absoluteInputPath, "utf8"));

if (!Array.isArray(payload) || payload.length === 0) {
  console.error("Input JSON must be a non-empty array.");
  process.exit(1);
}

const sqlValue = (value) => {
  if (value === null || value === undefined) {
    return "null";
  }

  if (typeof value === "number") {
    return String(value);
  }

  if (typeof value === "boolean") {
    return value ? "true" : "false";
  }

  return `'${String(value).replace(/'/g, "''")}'`;
};

const lines = [];

lines.push("begin;");
lines.push("");
lines.push(`-- generated from ${inputPath}`);
lines.push(`-- generated at ${new Date().toISOString()}`);
lines.push("");

payload.forEach((item, index) => {
  if (item.record_type === "single") {
    lines.push(`-- single item ${index + 1}`);
    lines.push("insert into public.questions (");
    lines.push("  level,");
    lines.push("  type,");
    lines.push("  sub_type,");
    lines.push("  question,");
    lines.push("  option1,");
    lines.push("  option2,");
    lines.push("  option3,");
    lines.push("  option4,");
    lines.push("  answer,");
    lines.push("  explanation,");
    lines.push("  difficulty,");
    lines.push("  recommendation_weight");
    lines.push(")");
    lines.push("select");
    lines.push(`  ${sqlValue(item.level)},`);
    lines.push(`  ${sqlValue(item.major_type)},`);
    lines.push(`  ${sqlValue(item.sub_type)},`);
    lines.push(`  ${sqlValue(item.question)},`);
    lines.push(`  ${sqlValue(item.option1)},`);
    lines.push(`  ${sqlValue(item.option2)},`);
    lines.push(`  ${sqlValue(item.option3)},`);
    lines.push(`  ${sqlValue(item.option4)},`);
    lines.push(`  ${sqlValue(item.answer)},`);
    lines.push(`  ${sqlValue(item.explanation)},`);
    lines.push(`  ${sqlValue(item.difficulty ?? 3)},`);
    lines.push(`  ${sqlValue(item.recommendation_weight ?? 1.0)}`);
    lines.push("where not exists (");
    lines.push("  select 1");
    lines.push("  from public.questions q");
    lines.push(`  where q.level = ${sqlValue(item.level)}`);
    lines.push(`    and q.type = ${sqlValue(item.major_type)}`);
    lines.push(`    and q.sub_type = ${sqlValue(item.sub_type)}`);
    lines.push(`    and q.question = ${sqlValue(item.question)}`);
    lines.push(");");
    lines.push("");
    return;
  }

  if (item.record_type === "passage_set") {
    lines.push(`-- passage set ${index + 1}`);
    lines.push("insert into public.passages (");
    lines.push("  group_id,");
    lines.push("  content,");
    lines.push("  level,");
    lines.push("  type,");
    lines.push("  sub_type");
    lines.push(")");
    lines.push("values (");
    lines.push(`  ${sqlValue(item.group_key)},`);
    lines.push(`  ${sqlValue(item.content)},`);
    lines.push(`  ${sqlValue(item.level)},`);
    lines.push(`  ${sqlValue(item.major_type)},`);
    lines.push(`  ${sqlValue(item.sub_type)}`);
    lines.push(")");
    lines.push("on conflict (group_id) do nothing;");
    lines.push("");

    (item.questions || []).forEach((question, questionIndex) => {
      lines.push(`-- passage question ${index + 1}.${questionIndex + 1}`);
      lines.push("insert into public.passage_questions (");
      lines.push("  group_id,");
      lines.push("  type,");
      lines.push("  sub_type,");
      lines.push("  question,");
      lines.push("  blank_number,");
      lines.push("  option1,");
      lines.push("  option2,");
      lines.push("  option3,");
      lines.push("  option4,");
      lines.push("  answer,");
      lines.push("  explanation,");
      lines.push("  difficulty,");
      lines.push("  recommendation_weight");
      lines.push(")");
      lines.push("values (");
      lines.push(`  ${sqlValue(item.group_key)},`);
      lines.push(`  ${sqlValue(item.major_type)},`);
      lines.push(`  ${sqlValue(item.sub_type)},`);
      lines.push(`  ${sqlValue(question.question)},`);
      lines.push(`  ${sqlValue(question.blank_number)},`);
      lines.push(`  ${sqlValue(question.option1)},`);
      lines.push(`  ${sqlValue(question.option2)},`);
      lines.push(`  ${sqlValue(question.option3)},`);
      lines.push(`  ${sqlValue(question.option4)},`);
      lines.push(`  ${sqlValue(question.answer)},`);
      lines.push(`  ${sqlValue(question.explanation)},`);
      lines.push(`  ${sqlValue(question.difficulty ?? item.difficulty ?? 3)},`);
      lines.push(`  ${sqlValue(question.recommendation_weight ?? item.recommendation_weight ?? 1.0)}`);
      lines.push(")");
      lines.push("on conflict (group_id, blank_number, question) do nothing;");
      lines.push("");
    });
  }
});

lines.push("commit;");
lines.push("");

mkdirSync(dirname(absoluteOutputPath), { recursive: true });
writeFileSync(absoluteOutputPath, `${lines.join("\n")}`, "utf8");
console.log(`SQL generated: ${absoluteOutputPath}`);
