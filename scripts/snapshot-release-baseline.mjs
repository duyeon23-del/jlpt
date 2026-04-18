// scripts/snapshot-release-baseline.mjs
// 릴리즈 기준선 스냅샷 자동화 스크립트
import { spawnSync } from "node:child_process";
import { writeFileSync } from "node:fs";
import { format } from "date-fns";

const snapshotDir = "release-snapshots";
const dateStr = format(new Date(), "yyyyMMdd_HHmmss");
const outFile = `${snapshotDir}/baseline_${dateStr}.md`;

const run = (cmd, args) => {
  const result = spawnSync(cmd, args, { encoding: "utf8" });
  if (result.error) throw result.error;
  return result.stdout || result.stderr || "";
};

const lines = [];
lines.push(`# DB Release Baseline - ${dateStr}`);
lines.push("");
lines.push("## Migration History");
lines.push(run("npx", ["supabase", "migration", "list"]));
lines.push("");
lines.push("## Skill Map Integrity");
lines.push(run("npm", ["run", "db:verify:skill-map"]));
lines.push("");
lines.push("## Recommendation Report");
lines.push(run("npm", ["run", "db:report:recommend:export"]));
lines.push("");

writeFileSync(outFile, lines.join("\n"), { encoding: "utf8" });
console.log(`Release baseline snapshot saved: ${outFile}`);
