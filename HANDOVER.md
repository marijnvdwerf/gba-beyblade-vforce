# Session handover

Living document for the next manager session. Rules of engagement are in
`MANAGER.md`; this file is the *state* — what is running, what landed, what
is stuck, and what to do next. Update it on every merge, agent start/finish
and change of plan.

Last updated: 2026-08-21, end of session 2 (round 6: six luna agents running; keepalive task blcgq1v47; shared prompt preamble in /tmp/preamble.txt).

## How to work

- You are a manager. All research/decomp goes through subagents
  (`model: gpt-5.6-luna`, Agent tool only, every prompt says "Do not spawn
  subagents"). Decomp agents: `subagent_type: decompiler`,
  `isolation: worktree`, one TU (or one small cluster of leaves) per agent.
  Prompts follow `~/.claude/skills/prompting-codex/SKILL.md`.
- NO Anthropic-model subagents (opus/sonnet/fable) until the user says so
  (standing order from 2026-08-21); use gpt-5.6-luna for reviews.
- Lifecycle: match → **bulk review** (one reviewer per round — luna for now
  over all current worktrees' C diffs; C only, no asm; shape + field types
  only, no renames; any layout claim is a hypothesis the agent verifies
  against asm) → agent simplifies → **my own read of the diff** → merge →
  temp-reduction pass over the batch → sol skill pass → remove worktree.
  Ask agents proactively (before they burn hours) whether they want a
  natural-C draft; when one stalls, read the dump yourself and send concrete
  C — this resolved most stalls this session.
- Agents must commit in their worktree after every matched function (rule
  is in `.claude/agents/decompiler.md`; older agents may still refuse — then
  `git -C <wt> add -A src asm docs && git -C <wt> commit` yourself).
  Learnings (`docs/learnings/<scope>.md`) are written inside the worktree and
  arrive via the merge.
- Merge recipe, ALWAYS from the main checkout (`pwd` first; never from a
  shell cd'd into a worktree — that merges the branch into itself and then
  `worktree remove` pulls the rug): `git merge <branch>`; resolve header
  conflicts (common.h/ram.h accrue parallel typedefs — unify, keep sizeof);
  `clang-format -i` touched src; `cmake --build build --target compare`;
  `tools/update-expected`; commit with explicit paths; `git worktree remove
  --force <wt>`; `git branch -D <branch>`.
- NEVER `git commit -a`: it sweeps concurrent agents' in-progress edits on
  main (tool files, skill) into unrelated commits. Stage paths explicitly.
- Agents sometimes edit the main checkout instead of their worktree. On every
  keepalive tick: `git status --short | grep -v '^??'` on main; if dirty, save
  the diff to /tmp, `git checkout` the files, tell the agent to `pwd`.
- Verify every agent claim yourself before merging: compare in its worktree,
  read the C. "Matches" is not "done": house rules (typed fields, no
  cast-and-offset, no casts on field reads, no m2c names, no raw ROM
  addresses, full prototypes) are enforced at merge time.
- Skill maintenance is batched: do not hand-edit
  `.claude/skills/agbcc/SKILL.md`. Periodically run a **gpt-5.6-sol** agent
  that folds the top-level `docs/learnings/*.md` into the skill and `git mv`s
  them to `docs/learnings/processed/` (the permission classifier may block
  `git mv` for agents — do the move yourself then). Review its diff.
- Temp-reduction pass after every merged batch (done: passes 1–4;
  all notes archived; docs/learnings top level is empty except README).
- Tool-building agents (`general-purpose`, luna) work on main and don't
  commit; review and commit their files explicitly.

## Tooling (all on main)

- `cmake --build build --target compare` — SHA1 is the only truth. C is built
  with `-g` (byte-neutral).
- `bun run tools/diff/diff.ts <sym>` — instruction diff with C line numbers.
  `.word` rows differing only in symbol display are relocation noise. The
  hook forbids piping its output through grep/head.
- `uv run tools/callgraph.py [root]` — tree-sitter C call tree; 🔴 = not in
  C; `#if 0` drafts count as not decompiled; `asm()` is not a call.
- `uv run tools/tu-progress.py [--asm-lines] [--all]` — per-TU INCLUDE_ASM
  remaining vs C count, done TUs green, totals line.
- `uv run tools/asm-annotated.py src/<f>.c <fn> [--all-passes]` — agbcc asm
  plus `.lreg`/`.greg` dumps for the current C (allocator priority ≈
  refs / live_length is readable there).
- `uv run tools/worklist.py` — functions called from C but still asm.
- `expected/` is a flat copy of `build/` (`tools/update-expected`).
- `raw-decomp` worktree (`.claude/worktrees/raw-decomp`, ~700 C functions) is
  a read-only reference with different headers; never merge it wholesale.

## State

Progress: 9/66 TUs done, 264 C functions, 743 INCLUDE_ASM remaining (26%)
after the envactor + leaves-round4 + showString merges. Session 2 merged 50
functions; session 1 merged 8.

### Agents running at last update

| worktree | scope | status |
|---|---|---|
| envactor-init | envactor.c initLevelEnvironmentActors (656) | running (round 6) |
| spritetext-2 | spritetext.c sub_806123C (356), then sub_80614B0 | running |
| sprite-resize | sprite.c resizeSpriteBlock (134) | running |
| gameinit-leaves | gameinit.c GetStruct4 (28) + up to 3 small leaves | running |
| sound-2 | sound.c sub_80627F0 (145), maybe sub_8062C24 | running |
| spritestring | spritestring.c sub_8064F38 + small leaves in order | running |

### Parked (attempted, not matched)

| function | lines | draft | why / notes |
|---|---:|---|---|
| initEventListeners (event.c) | 141 | `#if 0` | VLA proven (`s32 ids[max]`); count/max land in swapped regs: agbcc priority ≈ refs/live_length (count 14/184 vs max 5/114); all permutations tried — processed/event.md |
| sub_8049458 (frontend.c) | 166 | `#if 0` | only the final `unk584 == unk586` block's temps permute; odd early `mov r4,#0` across a call — processed/frontend.md |
| initRiders (gameinit.c) | 349 | `#if 0` | frame 0x138 vs 0x134 (one extra spilled local); riderIndex r8 vs r9 — processed/initriders.md |
| initMultiPlayer (multiplayer.c) | 137 | `#if 0` | arg regs r8/r5 + normalization sequence — processed/init-functions.md |
| LoadSpriteSheet (sprite.c) | 99 | `#if 0` | proven pun at SpriteEntry+0x18 (strh) / +0x19 (ldrb); user approved a documented 2-byte union, which reproduces both in isolation, but the function still diverges on stack-arg scheduling ([sp,#36] must load before [sp,#40]) — u16-byte-narrowing.md; next attempt: union sized exactly 2 bytes + consume 5th param first |
| sub_80627F0 (sound.c) | 145 | `#if 0` BELOW its INCLUDE_ASM (pre-session raw-decomp draft) | never attempted this session |
| sub_8062C24 (sound.c) | 310 | `#if 0` | envactor-sound agent draft; byte-cursor sequencer — envactor-sound.md |
| initLevelEnvironmentActors (envactor.c) | 656 | none | unassigned after sub_8054FE0 landed (merged 18a1525) |
| sub_80510FC (gamestate.c) | 208 | none | final table scan compiles to pointer-increment instead of indexed — processed/gamestate.md |
| updateKeyState (keystate.c) | 226 | none | body identical; only hard-reg choice for base+4/base+8 invariants differs — processed/updateKeyState.md |
| freeSpriteVramLocation (sprite.c) | 121 | none | earlier "match" used register pinning, discarded — processed/sprite-vram.md |
| sub_8057A7C (system.c) | — | none | orphan, no C caller — processed/sub_8057A7C.md |

Skipped (no C caller): sub_8062EFC (actorheap.c).

### Unassigned red functions

gameLoop (gameloop.c, 930 lines) — the last big one reachable from mainLoop.
Regenerate the full picture with `uv run tools/callgraph.py mainLoop` and
`uv run tools/tu-progress.py`; after the round-5 merges the reachable red set
should be gameLoop + the parked list above.

### Header conventions decided in session 2

- `LevelGeometryAddresses`/`LevelGeometryTable` (common.h) + `src/geometry.h`
  prototypes are canonical; fully typed (GeometryPoint s32 x/y/z, GeometryLine
  0x20, GeometrySpline, LineMetadata/LineMetaObject, LevelDesign[]).
- `RiderBase` (0x428) is the rider layout; GameData begins with it;
  `GameData.unk42C` is `RiderBase*`.
- `LevelDescription` is 0xD0 and indexed (`LevelDescriptions[i]`), has
  `LineMetadata** metadata` at 0x2C; ActiveLevelDescription no longer exists.
- `SpriteEntry` layout lives in src/sprite.h (shared by sprite.c and
  spritetext.c). showString keeps value-less `return;` for the NULL/empty
  paths (asm falls through with r0 = tested value) and a duplicated if/else
  (collapsing diverges).
- `CurrentGameState`: `s8 unk0`, `LevelState unk4[0x38]`, bytes unk6E8/unk6E9.
- `GameData` sub-structs: collectables (0x12F4), tutorial, levelHud0–3 +
  motions, PolyTable unkB88, unkCA0/CA4/CA8 event listeners.
- `LevelGeometryTable.count` is a documented union (s16 splineCount /
  unk32 splineCountWord): ldrsh in getLevelGeometryAddresses, ldr in
  GetSplineAtIndex.
- Unions only for asm-proven width puns (strh/ldrb on the same bytes), with a
  comment citing both instructions. No casts on field reads. Raw-offset blobs
  with offset tables may use `(unk8*)base + offset`; fixed-stride tables are
  arrays. Variable-size records advance a byte cursor.

## Open questions for the user

- ASM_ZEROPAD: 7 mid-TU uses are no-ops; only the 2 EOF uses matter; not
  TU-split evidence (processed/asm-zeropad.md). Cleanup offered, not approved.

## Session housekeeping

- A persistent 55-minute keepalive Monitor runs while agents are active
  (task id in the session; stop it with TaskStop once all agents are done
  and the session winds down). Each tick: check `git status` on main for stray
  agent edits, update this file if anything changed.
- Wind-down checklist: merge or park every worktree, run a temp-reduction
  pass and a sol skill pass on the batch, update this file, stop the monitor.
