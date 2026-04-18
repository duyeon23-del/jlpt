import { spawn } from "node:child_process";

const wrapCommand = (command) => {
  if (process.platform === "win32") {
    return {
      command: "cmd.exe",
      args: ["/d", "/s", "/c", command],
    };
  }

  return {
    command: "sh",
    args: ["-lc", command],
  };
};

const steps = [
  {
    label: "tracked secrets check",
    ...wrapCommand("npm run db:check:secrets-tracked"),
  },
  {
    label: "admin guard",
    ...wrapCommand("npm run db:guard:admin"),
  },
  {
    label: "skill map verification",
    ...wrapCommand("npm run db:verify:skill-map"),
  },
  {
    label: "dashboard reset verification",
    ...wrapCommand("npm run db:verify:dashboard-reset"),
  },
  {
    label: "recommendation report",
    ...wrapCommand("npm run db:report:recommend"),
  },
];

const runStep = (step) =>
  new Promise((resolve, reject) => {
    console.log(`\n==> Running ${step.label}`);

    const child = spawn(step.command, step.args, {
      stdio: "inherit",
      env: process.env,
    });

    child.on("error", (error) => {
      reject(new Error(`${step.label} failed to start: ${error.message}`));
    });

    child.on("exit", (code) => {
      if (code === 0) {
        resolve();
        return;
      }

      reject(new Error(`${step.label} failed with exit code ${code ?? 1}`));
    });
  });

const main = async () => {
  for (const step of steps) {
    await runStep(step);
  }

  console.log("\nRelease DB gate: all checks passed.");
};

main().catch((error) => {
  console.error(`\nRelease DB gate failed: ${error.message}`);
  process.exit(1);
});