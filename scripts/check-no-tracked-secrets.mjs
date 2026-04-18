import { execSync } from "node:child_process";

const trackedFiles = execSync("git ls-files", { encoding: "utf8" })
  .split(/\r?\n/)
  .map((line) => line.trim())
  .filter(Boolean);

const forbiddenTrackedEnv = trackedFiles.filter((file) => {
  if (!file.startsWith(".env")) {
    return false;
  }

  return file !== ".env.example";
});

if (forbiddenTrackedEnv.length > 0) {
  console.error("Blocked: tracked env files detected.");
  for (const file of forbiddenTrackedEnv) {
    console.error(` - ${file}`);
  }
  process.exit(1);
}

console.log("Secret tracking check: ok (no tracked env secrets)");
