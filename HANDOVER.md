# Session handover

Living document for the next manager session. Rules of engagement are in
`MANAGER.md`; this file is the *state* — what is running, what landed, what
is stuck, and what to do next. Update it on every merge, agent start/finish
and change of plan.

Last updated: 2026-09-06, session 6 close (round 2 merged, skill folded; monitor left on).

## Session 6 (2026-09-05/06)

State at close: main green, **505 C / 502 asm / 50%**, 13/66 TUs done;
baseline refreshed; no agents running; keepalive monitor left ON (user).
Worktrees: only the kept Opus one (`agent-aa3bb15346941d4ce`) + raw-decomp
references. Net: +45 C functions, 0 levers merged, `docs/learnings/` folded
(top level = README + processed/).

### What happened

- **Bitfields.** User's branch `decomp/sub_8050050` matched three parked
  riderstate functions with C bitfields; a luna cleanup made the layout
  cast/attribute-free. The skill's "shift pair IS the source" line was wrong
  and is rewritten with the measured lowering table (reads, writes, `|=`/`&=`,
  `mov #16; neg` preserve mask, `s16 : 4; s16 x : 12` ↔ `lsl #16; asr #20`).
  Naming `unk<BYTEHEX>_<BITDEC>`; bitfields go directly in the struct (a
  wrapper union is 4 bytes). riderstate.c DONE.
- **Round 1** (7 luna agents on the 30 draft-less reds): 11 matched — A
  tutorial/hud 3/3, B festate 5/5 (best festate yield ever), C allocQuadTree,
  F rider_vs_rider_collision; D/E/G 0 (parked drafts). Then A round 2: hud
  helpers 3/3; B round 2 on festate 329–463: 0/4 (as history predicts).
- **Round 2** (40 new reds exposed by the merges, avg 123 insns, 10 agents):
  22 matched — R2-1 5/5, R2-2 4/6, R2-3 4/4, R2-4 4/4, R2-5 2/2, R2-6 2/4,
  R2-7 2/3, R2-8 3/3, R2-9 3/4, R2-10 0/5 (geometry). Leaves ≤130 insns
  remain the ~80% band; 300+ stays ~0.
- **Process changes.** `review` agent (`.claude/agents/review.md`): read-only
  luna reviewer, writes `/tmp/review-<branch>.md`, one-line report; flags
  levers, header pollution, foldable temps, `REG_x + N`. Manager reads every C
  diff in full before merging (drifted mid-session, corrected). `skill-fold`
  agent (`.claude/agents/skill-fold.md`, sol) does the bible update; first run
  merged fb8919a8 (7 added / 14 revised, 19 files archived). Attribution
  trailers off (`attribution` block, project + global settings).
  `decompiler.md`: effort high; named registers only; fold byte-identical
  temps; no draft-only header fields — a parked draft declares a scratch
  struct inside its own `#if 0`.
- **Tooling fixes.** diff.ts scanned `expected/` from the repo root and
  `Bun.Glob` does not descend into symlinks → broken in every worktree
  (c64911dc). `tools/update-expected` is a no-op when `expected` is a symlink
  (0b4b41a9). Agents still rm/replace/delete the symlink by hand — the
  keepalive relinks; watch it.

### Lessons

- Luna agents stop at context compaction ("text-only restriction") — every
  long grind needs a revive message; after ~450 tool calls they loop
  (B, R2-2) → retire and hand the branch to a fresh agent.
- >7 concurrent luna sessions → provider 429s (two outages; resume via
  SendMessage, no work lost).
- `git worktree remove --force` on a live worktree discards uncommitted
  work (R2-2's partial fixes) — check status first.
- Two rules that conflicted (typed drafts vs no speculative fields) were
  resolved by the in-block scratch struct.
- Leads not yet acted on: `isMultiplayer()` may return a halfword (target
  normalizes 16 bits in sub_804868C); `Actor+0xA0` ActorRenderState,
  DisplayRecord 0x40/0x44, nullsub_12 returning its arg (E's evidence, in
  processed/envactor-gameloop-effects-2026-09-05.md).

### Next session

1. **Round 3 pool (14 reds, 13 ≤123 insns)** — three batches: projectile
   (sub_804C34C 6, sub_804C354 6, sub_804C3D4 72) + beyblade sub_805749C 6 +
   packet (sub_8043960 9, sub_8043970 24); spritetext printTime 27 + actor
   renderActor 27 + backup sub_80658A4 55 + iconmenu sub_8050DF8 63;
   gamestate sub_80513AC 87 + festate (sub_804423C 97, sub_8044314 123) +
   trail sub_804A908 272. Re-run the callgraph after merging — each merge
   exposes more leaves.
2. Debt: BGLayer/Struct3000CA0 legacy `var00`/`field_C` names (176 hits in
   layer.c) → rename pass to `unk<HEX>`; DisplayRecord/BGLayer TODO.
3. Proposed `tools/unused-fields.py` (libclang over compile_commands.json;
   must treat `#if 0` scratch structs as legitimate) — user undecided.
4. Giants (≥440, 8 of them) still unassigned; historical yield ~0.
5. Carried: `&_spritesFree` scalar-alias ruling; frontend unk588/unkC
   callback signature; `out.json` on main.

Prompt archives: /tmp/agent-prompts-2026-09-05.md (this session's 40
Agent prompts), /tmp/learnings-prompts.md (72 fold/learnings prompts across
134 sessions). Round brief: /tmp/brief-2026-09-05.md.

## Standing rulings (all sessions, consolidated)

- Bytes are the only truth: `compare` after every change; never
  `update-expected` on a red tree; merges from the main checkout only.
- Levers are rejected even when they match: `volatile`/`register`/`asm`,
  attributes (sole exception: `__attribute__((packed))` on the SpriteEntry
  +0x18 `frame` union — measured required), cast-and-offset, casts on field
  reads/writes, View/overlay structs, scalar-global alias pointers, `.word`
  edits, raw addresses / `REG_x + N` (use SDK names), `(unk32)nullptr` args.
- Record aliases (`&_table[i]`, `&_big.sub`) are source; scalar-global aliases
  are not (`&_spritesFree` still open).
- Types: `unk8/16/32` default; sign only on evidence (asr/ldrsh/ldrsb/signed
  branch/call site); widths decided by matched callers too; bitfields
  `unk<BYTEHEX>_<BITDEC>` directly in the struct; unions only for proven puns.
- Headers: one typedef per layout, in the owning TU's header; fields exist
  only when committed C accesses them; a parked draft declares any extra
  layout as a scratch struct INSIDE its `#if 0`; RAM decls live in ram.h,
  placeholders upgraded in place (same size/address).
- Source: no comments except `/* 0xNN */`; temps that fold byte-identically
  are removed; write literals, not shift-spelled constants; case bodies in
  asm block order.
- Parked functions: never discarded; best draft as bare `#if 0` above the
  untouched `INCLUDE_ASM`, house-style with proper record types; dump kept.
  No learnings for failures (one-line first divergence).
- Accepted layouts: allocQuadTree carves a raw block with `unk8*` + casts;
  `typedef BGLayer DisplayRecord` (TODO in layer.h); CurrentGameSave starts
  with `BackupBlock block0`; GameData.levelHud is a nested LevelHudData;
  FrontendState through 0x5AC (no `_unk3000BE0` split).
- Agents: luna for decomp/review, sol for skill folds, haiku for lookups;
  Opus ban stands (lifted only ad hoc by the user); ≤7 concurrent luna
  sessions (429s beyond); every prompt says "Do not spawn subagents".

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
- Temp-reduction pass after every merged batch (done: passes 1–5;
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
- `uv run tools/lint.py src/*.c` — lint (first check: prototypes for functions
  defined in another TU → belong in that TU's header); exit 1 on findings.
  Header pass (c5146ca..bac86d6) done: lint exits 0; every cross-TU prototype
  lives in the defining TU's header (new: display/levelrow/menuobject/
  multiplayer/riderphysics/particle/animevent/camera/frontend/... .h).
  Rules: no conditional-prototype macros; the *definition's* signature wins;
  fix callers by typing their variables/fields, never by casting. Side-fixes
  found: sub_8060CDC/resizeSpriteBlock take `SpriteTextBlock*`; RiderBase has
  `Actor unk238/unk2FC`, `SpriteEntry* unk3C4`, `ParticleSystem unk3EC`.
- `expected/` is a flat copy of `build/` (`tools/update-expected`).
- `raw-decomp` worktree (`.claude/worktrees/raw-decomp`, ~700 C functions) is
  a read-only reference with different headers; never merge it wholesale.

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

- `&_spritesFree` scalar alias (resizeSpriteBlock) — keep open.
- Frontend `unk588` / `unkB4->unkC` callback signature conflict.
- `tools/unused-fields.py` (libclang) — build it?
- ASM_ZEROPAD mid-TU no-op cleanup — offered, not approved.

Older session logs (3–5, verbatim): docs/handover-archive/sessions-3-5.md.
