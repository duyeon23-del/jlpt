import { spawn } from "node:child_process";
import { resolve } from "node:path";
import dotenv from "dotenv";

dotenv.config({ path: resolve(process.cwd(), ".env.local"), override: true });
dotenv.config({ path: resolve(process.cwd(), ".env"), override: true });

const filesToApply = [
  "supabase/imports/n5_vocab_kanji_batch_01.sql",
  "supabase/imports/n5_vocab_notation_batch_01.sql",
  "supabase/imports/n5_vocab_context_batch_01.sql",
  "supabase/imports/n5_grammar_judgement_batch_01.sql",
  "supabase/imports/n5_grammar_reorder_batch_01.sql",
  "supabase/imports/n5_grammar_context_batch_01.sql",
  "supabase/verify_skill_map_after_load.sql",
];

if (!process.env.SUPABASE_DB_URL) {
  console.error("Missing SUPABASE_DB_URL environment variable.");
  console.error("Set the database URL in your current shell, then rerun this command.");
  process.exit(1);
}

const runFile = (filePath) =>
  new Promise((resolvePromise, rejectPromise) => {
    const child = spawn(process.execPath, ["scripts/run-sql-file.mjs", filePath], {
      cwd: process.cwd(),
      stdio: "inherit",
      env: process.env,
    });

    child.on("exit", (code) => {
      if (code === 0) {
        resolvePromise();
        return;
      }

      rejectPromise(new Error(`Failed while applying ${filePath} (exit code ${code ?? 1}).`));
    });

    child.on("error", (error) => {
      rejectPromise(error);
    });
  });

for (const filePath of filesToApply) {
  const absolutePath = resolve(process.cwd(), filePath);
  console.log(`\n==> Applying ${absolutePath}`);
  await runFile(filePath);
}

console.log("\nN5 phase 1 imports applied successfully.");