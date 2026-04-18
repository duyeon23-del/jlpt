import dotenv from "dotenv";
import { resolve } from "node:path";

dotenv.config({ path: resolve(process.cwd(), ".env.local"), override: true });
dotenv.config({ path: resolve(process.cwd(), ".env"), override: true });

const enabled = process.env.ADMIN_DB_OPS === "1";

if (!enabled) {
  console.error("Blocked: set ADMIN_DB_OPS=1 for admin DB operations.");
  process.exit(1);
}

if (!process.env.SUPABASE_SERVICE_ROLE_KEY) {
  console.error("Blocked: SUPABASE_SERVICE_ROLE_KEY is required for admin DB operations.");
  process.exit(1);
}

console.log("Admin DB guard: ok");
