import { spawn } from "node:child_process";
import { existsSync } from "node:fs";
import { resolve } from "node:path";

const sqlFile = process.argv[2];

if (!sqlFile) {
  console.error("Usage: node scripts/run-sql-file.mjs <sql-file-path>");
  process.exit(1);
}

const dbUrl = process.env.SUPABASE_DB_URL;

if (!dbUrl) {
  console.error("Missing SUPABASE_DB_URL environment variable.");
  console.error("Example: set SUPABASE_DB_URL=postgresql://... and rerun.");
  process.exit(1);
}

const absoluteSqlFile = resolve(process.cwd(), sqlFile);

const resolvePsqlCommand = () => {
  if (process.env.PSQL_PATH && existsSync(process.env.PSQL_PATH)) {
    return process.env.PSQL_PATH;
  }

  if (process.platform === "win32") {
    const programFiles = process.env.ProgramFiles || "C:\\Program Files";
    const programFilesX86 = process.env["ProgramFiles(x86)"] || "C:\\Program Files (x86)";
    const candidates = [
      resolve(programFiles, "PostgreSQL", "17", "bin", "psql.exe"),
      resolve(programFiles, "PostgreSQL", "16", "bin", "psql.exe"),
      resolve(programFiles, "PostgreSQL", "15", "bin", "psql.exe"),
      resolve(programFilesX86, "PostgreSQL", "17", "bin", "psql.exe"),
      resolve(programFilesX86, "PostgreSQL", "16", "bin", "psql.exe"),
      resolve(programFilesX86, "PostgreSQL", "15", "bin", "psql.exe"),
    ];

    const matched = candidates.find((candidate) => existsSync(candidate));
    if (matched) {
      return matched;
    }

    return "psql.exe";
  }

  return "psql";
};

const psqlCommand = resolvePsqlCommand();

const child = spawn(psqlCommand, [dbUrl, "-v", "ON_ERROR_STOP=1", "-f", absoluteSqlFile], {
  env: {
    ...process.env,
    PGCLIENTENCODING: process.env.PGCLIENTENCODING || "UTF8",
  },
  stdio: "inherit",
});

child.on("exit", (code) => {
  process.exit(code ?? 1);
});

child.on("error", (error) => {
  console.error("Failed to execute psql.");
  console.error("Ensure PostgreSQL client (psql) is installed.");
  console.error("On Windows, you can also set PSQL_PATH=C:\\Program Files\\PostgreSQL\\17\\bin\\psql.exe");
  console.error(`Resolved command: ${psqlCommand}`);
  console.error(error.message);
  process.exit(1);
});
