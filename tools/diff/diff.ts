import { resolve, relative } from "node:path";
import { init, diff, display } from "objdiff-wasm";

const repoRoot = resolve(import.meta.dir, "../..");
const expectedRoot = resolve(repoRoot, "expected");
const baseRoot = resolve(repoRoot, "build");
const symbolName = Bun.argv[2];

if (!symbolName || Bun.argv.length !== 3) {
  console.error("Usage: bun run tools/diff/diff.ts <symbolName>");
  process.exit(2);
}

// The repository's objdiff.json uses this exact architecture setting.
init("warn");
const config = new diff.DiffConfig();
config.setProperty("arm.archVersion", "v4t");

const mappings = { mappings: [] as Array<[string, string]> };
const displayConfig = {
  showHiddenSymbols: true,
  showMappedSymbols: true,
  reverseFnOrder: false,
};

type ObjectMatch = {
  expectedPath: string;
  basePath: string;
  expectedObject: diff.Object;
  expectedSymbol: diff.SymbolInfo;
};

async function parseObject(path: string, side: "target" | "base") {
  const bytes = new Uint8Array(await Bun.file(path).arrayBuffer());
  return diff.Object.parse(bytes, config, side);
}

function listSymbols(objectDiff: diff.ObjectDiff): display.SymbolDisplay[] {
  return display
    .displaySections(objectDiff, {}, displayConfig)
    .flatMap((section) => Array.from(section.symbols))
    .map((id) => display.displaySymbol(objectDiff, id));
}

async function findExpectedObjects(): Promise<ObjectMatch[]> {
  const matches: ObjectMatch[] = [];
  const expectedGlob = new Bun.Glob("expected/CMakeFiles/rom.dir/src/*.c.o");

  for await (const relativeExpectedPath of expectedGlob.scan({ cwd: repoRoot })) {
    const expectedPath = resolve(repoRoot, relativeExpectedPath);
    const expectedObject = await parseObject(expectedPath, "target");
    const expectedOnly = diff.runDiff(expectedObject, undefined, config, mappings);
    const expectedDiff = expectedOnly.left;
    if (!expectedDiff) continue;

    const expectedSymbol = listSymbols(expectedDiff).find(
      (symbol) =>
        symbol.info.kind === "function" && symbol.info.name === symbolName,
    )?.info;
    if (!expectedSymbol) continue;

    const basePath = resolve(baseRoot, relative(expectedRoot, expectedPath));
    matches.push({ expectedPath, basePath, expectedObject, expectedSymbol });
  }

  return matches;
}

function renderText(text: display.DiffText): string {
  switch (text.tag) {
    case "basic":
    case "opaque":
      return text.val;
    case "address":
    case "branch-dest":
      return `0x${text.val.toString(16).padStart(8, "0")}`;
    case "opcode":
      return text.val.mnemonic;
    case "signed":
    case "unsigned":
    case "addend":
      return text.val.toString();
    case "symbol":
      return text.val.demangledName ?? text.val.name;
    case "spacing":
      return " ".repeat(text.val);
    case "branch-arrow":
      return text.val < 0 ? "<-" : "->";
    case "line":
      return `${text.val}`;
    case "eol":
      return "";
  }
}

function renderRow(row: display.InstructionDiffRow | undefined): string {
  if (!row) return "";
  return row.segments
    .map((segment) => {
      const text = renderText(segment.text);
      return text + " ".repeat(Math.max(0, segment.padTo - text.length));
    })
    .join("")
    .trimEnd();
}

function statusFor(
  targetRow: display.InstructionDiffRow | undefined,
  baseRow: display.InstructionDiffRow | undefined,
): string {
  const kind = targetRow?.diffKind ?? baseRow?.diffKind ?? "none";
  switch (kind) {
    case "none":
      return "=";
    case "insert":
      return "+";
    case "delete":
      return "-";
    case "op-mismatch":
    case "arg-mismatch":
    case "replace":
      return "!";
  }
}

function colorStatus(status: string): string {
  if (!process.stdout.isTTY) return status;
  const color = status === "=" ? "32" : status === "+" ? "34" : status === "-" ? "31" : "33";
  return `\x1b[${color}m${status}\x1b[0m`;
}

const matches = await findExpectedObjects();
if (matches.length === 0) {
  console.error(`Could not find function ${JSON.stringify(symbolName)} in expected/CMakeFiles/rom.dir/src/*.c.o`);
  process.exit(1);
}
if (matches.length > 1) {
  console.error(`Function ${JSON.stringify(symbolName)} occurs in multiple expected objects:`);
  for (const match of matches) console.error(`  ${relative(repoRoot, match.expectedPath)}`);
  process.exit(1);
}

const match = matches[0];
const expectedObject = match.expectedObject;

let baseObject: diff.Object | undefined;
if (await Bun.file(match.basePath).exists()) {
  baseObject = await parseObject(match.basePath, "base");
}

const result = diff.runDiff(baseObject, expectedObject, config, mappings);
const baseDiff = result.left;
const targetDiff = result.right;
const targetSymbol = targetDiff?.findSymbol(symbolName, match.expectedSymbol.sectionName);
const baseSymbol = baseDiff?.findSymbol(symbolName, match.expectedSymbol.sectionName);
const targetDisplay = targetDiff && targetSymbol ? display.displaySymbol(targetDiff, targetSymbol.id) : undefined;
const baseDisplay = baseDiff && baseSymbol ? display.displaySymbol(baseDiff, baseSymbol.id) : undefined;

console.log(`Symbol: ${symbolName}`);
console.log(`Expected: ${relative(repoRoot, match.expectedPath)}`);
console.log(`Base:     ${relative(repoRoot, match.basePath)}${baseObject ? "" : " (missing)"}`);
if (targetDisplay?.matchPercent !== undefined) {
  console.log(`Match:    ${targetDisplay.matchPercent.toFixed(1)}%`);
}
console.log("");
const targetRows = targetDiff && targetSymbol
  ? Array.from({ length: targetDisplay?.rowCount ?? 0 }, (_, row) =>
      display.displayInstructionRow(targetDiff, targetSymbol.id, row, config),
    )
  : [];
const baseRows = baseDiff && baseSymbol
  ? Array.from({ length: baseDisplay?.rowCount ?? 0 }, (_, row) =>
      display.displayInstructionRow(baseDiff, baseSymbol.id, row, config),
    )
  : [];
const renderedTargetRows = targetRows.map(renderRow);
const renderedBaseRows = baseRows.map(renderRow);
const targetWidth = Math.max(42, ...renderedTargetRows.map((row) => row.length));
const baseWidth = Math.max(41, ...renderedBaseRows.map((row) => row.length));
console.log(`${"TARGET (expected)".padEnd(targetWidth)} | ${"BASE (current)".padEnd(baseWidth)} | status`);
console.log(`${"-".repeat(targetWidth)}-+-${"-".repeat(baseWidth)}-+-------`);

const rowCount = Math.max(targetRows.length, baseRows.length);
for (let index = 0; index < rowCount; index++) {
  const targetText = renderedTargetRows[index] ?? "";
  const baseText = renderedBaseRows[index] ?? "";
  console.log(`${targetText.padEnd(targetWidth)} | ${baseText.padEnd(baseWidth)} | ${colorStatus(statusFor(targetRows[index], baseRows[index]))}`);
}
