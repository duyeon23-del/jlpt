import { createClient } from "@supabase/supabase-js";
import dotenv from "dotenv";

dotenv.config();

const supabaseUrl = process.env.SUPABASE_URL;
const supabaseKey = process.env.SUPABASE_ANON_KEY;
const supabase = createClient(supabaseUrl, supabaseKey);

const verifyDb = async () => {
  console.log("=== Verification Report ===\n");

  // 1. Passage count
  const { data: passages } = await supabase
    .from("passages")
    .select("group_id", { count: "exact" });
  console.log(`✓ Passages: ${passages?.length || 0}`);

  // 2. Passage questions count
  const { data: pQuestions } = await supabase
    .from("passage_questions")
    .select("id", { count: "exact" });
  console.log(`✓ Passage questions: ${pQuestions?.length || 0}`);

  // 3. Skill map by question type
  const { data: skillMapByType } = await supabase
    .rpc("get_skill_map_counts");
  if (skillMapByType) {
    console.log("\n✓ Skill map by type:");
    for (const row of skillMapByType) {
      console.log(`  - ${row.question_type}: ${row.mapped_count}/${row.total_count}`);
    }
  }

  // 4. Verify batch_05 reading passages exist
  const { data: batch05Reading } = await supabase
    .from("passages")
    .select("group_id, type, sub_type")
    .ilike("group_id", "n5_reading_%_batch_05%");

  console.log(`\n✓ batch_05 reading passages: ${batch05Reading?.length || 0}`);
  if (batch05Reading) {
    for (const p of batch05Reading) {
      const { data: questions } = await supabase
        .from("passage_questions")
        .select("id", { count: "exact" })
        .eq("group_id", p.group_id);
      console.log(`  - ${p.group_id}: ${p.type}/${p.sub_type} (${questions?.length || 0} Q)`);
    }
  }

  console.log("\nDone.");
};

verifyDb().catch(console.error);
