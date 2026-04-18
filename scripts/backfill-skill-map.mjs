import { createClient } from "@supabase/supabase-js";
import dotenv from "dotenv";

dotenv.config({ path: ".env.local" });
dotenv.config();

const supabaseUrl = process.env.SUPABASE_URL || process.env.NEXT_PUBLIC_SUPABASE_URL;
const supabaseKey =
  process.env.SUPABASE_SERVICE_ROLE_KEY ||
  process.env.SUPABASE_ANON_KEY ||
  process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY;

if (!supabaseUrl || !supabaseKey) {
  console.error("Missing SUPABASE_URL or SUPABASE_SERVICE_ROLE_KEY/SUPABASE_ANON_KEY.");
  process.exit(1);
}

if (!process.env.SUPABASE_SERVICE_ROLE_KEY) {
  console.warn(
    "SUPABASE_SERVICE_ROLE_KEY is not set. Inserts may fail due to RLS when using anon key.",
  );
}

const supabase = createClient(supabaseUrl, supabaseKey);

const skillKeys = new Map([
  ["한자 읽기", "vocab_kanji_reading"],
  ["표기", "vocab_notation"],
  ["문맥 규정", "vocab_context_usage"],
  ["판단", "grammar_judgement"],
  ["배열", "grammar_reorder"],
  ["문맥", "grammar_context"],
]);

const readingSkillMap = {
  단문독해: "reading_short",
  중문독해: "reading_medium",
  정보검색: "reading_info_search",
};

const chunk = (arr, size) => {
  const result = [];
  for (let i = 0; i < arr.length; i += size) {
    result.push(arr.slice(i, i + size));
  }
  return result;
};

const upsertSkillMapRows = async (rows) => {
  if (rows.length === 0) {
    return;
  }

  for (const rowsChunk of chunk(rows, 500)) {
    const { error } = await supabase
      .from("question_skill_map")
      .upsert(rowsChunk, { onConflict: "question_type,question_id,skill_key" });

    if (error) {
      throw error;
    }
  }
};

const backfillSkillMap = async () => {
  console.log("Backfilling question_skill_map from source tables...");

  // 1. Single questions 백필
  const { data: singleQuestions, error: singleError } = await supabase
    .from("questions")
    .select("id, type, sub_type");

  if (singleError) {
    console.error("Single questions fetch error:", singleError);
  } else {
    console.log(`Found ${singleQuestions.length} single questions`);
    const singleRows = singleQuestions.map((q) => ({
      question_type: "single",
      question_id: String(q.id),
      major_type: q.type,
      sub_type: q.sub_type,
      skill_key: skillKeys.get(q.sub_type) || "general_misc",
      difficulty: 3,
      recommendation_weight: 1.0,
      is_active: true,
    }));

    await upsertSkillMapRows(singleRows);
    console.log("Single questions skill map backfill complete");
  }

  // 2. Passage questions 백필
  const { data: passageQuestions, error: passageError } = await supabase
    .from("passage_questions")
    .select("id, type, sub_type");

  if (passageError) {
    console.error("Passage questions fetch error:", passageError);
  } else {
    console.log(`Found ${passageQuestions.length} passage questions`);
    const passageRows = passageQuestions.map((pq) => {
      const isReadingQuestion = pq.type === "독해";
      const isGrammarContext = pq.type === "문법" && pq.sub_type === "문맥";
      const skillKey = isReadingQuestion
        ? readingSkillMap[pq.sub_type] || "reading_random"
        : isGrammarContext
          ? "grammar_context"
          : "general_misc";

      return {
        question_type: isGrammarContext ? "grammar_context" : "passage",
        question_id: String(pq.id),
        major_type: pq.type,
        sub_type: pq.sub_type,
        skill_key: skillKey,
        difficulty: 3,
        recommendation_weight: 1.0,
        is_active: true,
      };
    });

    await upsertSkillMapRows(passageRows);
    console.log("Passage questions skill map backfill complete");
  }

  console.log("Done.");
};

backfillSkillMap().catch((error) => {
  console.error("Backfill failed:", error);
  process.exit(1);
});
