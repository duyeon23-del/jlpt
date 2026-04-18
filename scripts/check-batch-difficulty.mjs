import { readFileSync } from "node:fs";
import { resolve } from "node:path";

const files = process.argv.slice(2);

if (files.length === 0) {
  console.error("Usage: node scripts/check-batch-difficulty.mjs <batch-name> [batch-name...]");
  console.error("Example: node scripts/check-batch-difficulty.mjs n5_vocab_kanji_batch_05 n5_vocab_context_batch_05");
  process.exit(1);
}

for (const batchName of files) {
  const filePath = resolve(process.cwd(), `data/n5-batches/${batchName}.json`);
  const payload = JSON.parse(readFileSync(filePath, "utf8"));

  const counts = {};
  for (const item of payload) {
    const difficulty = Number(item.difficulty);
    counts[difficulty] = (counts[difficulty] || 0) + 1;
  }

  console.log(`${batchName} ${JSON.stringify(counts)} has1=${Boolean(counts[1])} has5=${Boolean(counts[5])}`);
}
