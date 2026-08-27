# Session handover

Living document for the next manager session. Rules of engagement are in
`MANAGER.md`; this file is the *state* — what is running, what landed, what
is stuck, and what to do next. Update it on every merge, agent start/finish
and change of plan.

Last updated: 2026-08-27, session 4 in progress (3 decomp agents running, monitor on).

## Session 4 (2026-08-27)

- Since session 3 the user merged a type-signedness audit (u32/s32 → unk32,
  then re-signed on evidence) and `fix callgraph` (43c426b); callgraph now
  follows callbacks/handler tables → more reds. It also reports 4-byte
  `.rodata` function-pointer symbols (`__fastMemoryClearARM`, `__oam_8756CC0`,
  `__sound_8757A64`, `__sub_87577B4`) and libgcc `__divsi3` as red
  "functions" — not decomp targets; tool bug to fix.
- Branch `raw-decomp-2` (28 commits off 43c426b; worktree at
  `.claude/worktrees/raw-decomp-2`, ROM matches there) is an Opus agent's
  port of ~19 functions with sloppy integration (13 lint findings: externs in
  .c files; a `#if 0` NONMATCHING sub_80413FC in a new src/levelselect.c).
  Decision: NOT merged — it is a second READ-ONLY draft source ("raw2")
  next to `raw-decomp`; fresh agents redo the functions properly off main.
  Its learnings were folded into the skill and moved to processed/ (4215978).
- Scout report: /tmp/scout-2026-08-27.md — 82 reds, 16 raw2-backed
  (15 matched there), 35 raw1-backed, 31 no draft, 35 parked. Raw2 overrides
  parking for creditsFrontendHandler, sub_804ABFC, sub_80490F8.
- Preamble v2 at /tmp/migrate-preamble.txt: raw2 as primary source with
  "redo integration properly", lint must exit 0 before commit, TYPE FROM THE
  CALL SITE section (scout gives caller → implied signature per function),
  persistence nudge.
- Wave 1 (running, all raw2-backed): A frontend/music/motion (sub_804915C,
  nullsub_33, sub_8049178, sub_80490F8, sub_804ABFC, sub_804967C*,
  sub_805041C*); B gamestate leaves (sub_8051618, sub_80570C0, sub_8050FC8,
  sub_804A0E0, sub_80515E0, sub_80464C0, sub_8051558, sub_8051488,
  sub_806014C*); C credits/levelselect (sub_8061844, creditsFrontendHandler,
  sub_80413FC + levelselect TU split). * = no draft, from asm.
- Wave 2 candidates (no draft, from asm): batch 4 geometry/actor/camera
  (GetLineIndexOfType, actor_805C48C, actor_8057C58, sub_805EB00,
  sub_80526C8, sub_80596AC[raw1]); festate handlers A/B (sub_8045CB4,
  selectBladeFrontendHandler, sub_8046468[raw1], sub_804444C, sub_8047E5C,
  sub_80480EC, sub_8048AE8, sub_8048310, sub_804868C, sub_80448F4,
  sub_8044C48, sub_8044ED4, sub_8045160); sub_80420C4 (dialogue), initRider,
  processRiderMetadata; gameLoop separately.

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

## State

Progress: 9/66 TUs done, 381 C functions, 626 INCLUDE_ASM remaining (38%).
Session 3 merged 97 functions (batches 1–17, all migrated from the
`raw-decomp` worktree — only functions WITH a raw-decomp body are worth
trying; every no-raw attempt so far failed). Session 2 merged 69, session 1 8.

### Session 3 workflow (worked well)

1. Scout agent (luna, read-only): `uv run tools/callgraph.py mainLoop` →
   red list → `uvx mapfile_parser sym_info build/rom.map <sym>` for the
   owning TU → `rg` raw-decomp for a C body → batches of ~8 by TU.
2. 7 decompiler agents (luna, worktree each) migrate; rules in
   /tmp/migrate-preamble.txt (recreate from this list if /tmp is gone):
   copy raw body, adapt to our headers, diff.ts to zero, compare, delete
   dump, commit per function, ≤30 min per function then leave INCLUDE_ASM,
   no `#if 0` parking.
3. Re-run the scout after merges: newly decompiled callers expose new reds
   (78 → 58 → 56 functional reds; 9 new per round so far).
4. Temp-reduction pass over the whole batch (running: pass 7).

Merge-review lessons (all happened today): agents will ship `register`
locals, empty `asm volatile` barriers, `(Type*)arg0` casts on a wrongly
typed parameter, parallel "View" structs overlaying GameData, `.equ` raw
ROM addresses, `(x << 24) != 0` for u8, externs in .c files, and m2c
`var_r6` names. Grep does not catch all of it — READ EVERY FUNCTION IN
FULL before merging. sub_804374C/sub_80434EC (menuobject.c) slipped
through; fixed by temp-reduction-7 (merged 1fa3191; `MenuObject`/`MenuState` typed in menuobject.h).

Layout decisions this session: `GameData` now begins with an embedded
`RiderBase base` (0x428); `RiderBase` has typed fields through 0xB8 +
unk234; `RiderState` unified (checksum prefix union at 0, unk54);
`EnvironmentActorSlot` stride 0xC4 proven; `ProjectileSystem` at
GameData+0x1084 (0x8C); `MotionGroup`/`UnkMotion` unified; `MusicTrack`
table `_807561C`; `_LevelRowMusicTable` label exposed in asm/data12.s;
`GameData.unkC26` stays u16 (s16 shrinks initGameLoop by 12 bytes —
sub_804A280 needs an ldrsh from it and is parked because of that).

### Agents running at last update

| worktree | scope | status |
|---|---|---|
| (none) | temp-reduction-7/8/9 + skill pass (f6db672) merged; all learnings processed | — |

### Next steps (user direction, 2026-08-23)

- Scout at a19ffa3 found 98 unique reds reachable from mainLoop: after this
  session ~27 raw-backed remain but are all PARKED (see list below), 33 have
  no raw body. So the raw-decomp copy-over well is dry; next sources of drafts
  are asmlift (below) and writing C from asm (batch 10/13 agents did that fine
  for festate handlers when told typing is part of the job).
- `selectBladeFrontendHandler` (no raw body) was started and dropped — first
  candidate for an asmlift/from-asm attempt.

- **asmlift**: `git stash list` has `asmlift` (decomp.yaml + docs/asmlift.md;
  docs hardcode /Users/marijn/Projects/asmlift — make that an env var before
  committing). `bunx @asmlift/cli asm/dump/8040d18/8040d18-creditsFrontendHandler.s`
  produces C from a dump; some functions throw. Next decomp step: measure the
  success rate over asm/dump and use it as the draft source for reds WITHOUT
  a raw-decomp body.
- **Callbacks — RESOLVED**: `_LevelRowMusicTable` (asm/data12.s, MISNAMED — it's
  the 43×0x18 frontend-screen table; +8/+C/+10/+14 = FrontendObject
  unk8/unkC/unk10/unk14) feeds ~40 handlers; `FrontendState.unkB4` is set by
  `sub_804967C`, `unk588` by `StoreFunction` (proven target sub_8049DE0);
  gameloop `transition` == sub_8052978 (which stores another callback in
  `_unk3000C0C`, unresolved). `tools/callgraph.py` now follows the table
  from build/rom.elf (`HANDLER_TABLES`, one line per table; 🧭 nodes) — true
  reachable red count is ~106. Unresolved: other `unk588` writers,
  `_unk3000C0C`, RenderCode consumers, the exact `unkC` call site.
- **Open design question**: `FrontendState` (common.h) and `MenuObject`
  (menuobject.h) both describe `_unk3000650`; `MenuState` at 0x478 was
  unified and flattened (70a5dde); asm proves itemCount +0x14 and objectCount
  +0x18 are distinct. MenuObject and FrontendState are the same object — user
  doubts MenuState is really one struct; layout table in /tmp/menustate-layout.html.
- `Unk_8755B90` = MIDI note frequency table, 16.16 Hz (entry 69 = 440.0);
  migrated to src/sound.c (1d67430). `Sound_80623A8` builds per-note
  resampling steps (`hz*11025<<12/261/rate`).
- Switch lowering lesson: agbcc emits the compare-tree (cmp/beq, cmp/bhi,
  cmp/bne) for `switch` only with enough cases — an empty `case 4: break;`
  + `default` made sub_8049F58 match (c958651).
- Merged+pruned: `MenuObject` is gone, one `FrontendState` (3edd000); fields exist
  only when committed C accesses them (rule now in decompiler.md).
  `FrontendTransition` at +0x584; `MidiNoteFrequencies` with FIXED_16_16(hz)
  (ae355b7); `_LevelRowMusicTable` has `.size` (43 records).
- sub_8052978 matched: `_unk3000C0C` is a `void(*)(void)` callback set via
  case 5 — next table/setter to trace.
- Parked today (natural C diverges on regalloc): sub_8044054, sub_804257C,
  sub_8049FF8, sub_805AFBC, sub_8063220, sub_80491E0, sub_8057104,
  sub_8046A0C, creditsFrontendHandler, collectionListFrontendHandler,
  newIconMenu, sub_8050C18, sub_8050E80, sub_8050F0C.
- Scout rescan at a19ffa3: 98 unique reds, 65 raw-backed, 33 without raw body
  (skip by policy), 27 parked. After this round ~40 raw-backed remain parked.
- Agents: stopping mid-list is normal — compare every completion against the
  assigned list and revive until exhausted. Agents must never SendMessage.
- temp-reduction-8 merged (5fc4268): RAM decls centralised in ram.h. Open:
  `_unk3000650` is defined in ram.c as a size-pinning placeholder type while
  consumers use `FrontendState` — make the definition `FrontendState` (sizeof
  is known); `sub_8061824`'s header decl is incompatible with its caller shape
  (see spritetext.c local prototype of sub_806123C).
- ASM_ZEROPAD is the fix for a TU whose .text tail pads 00 00 vs nop (iconmenu).
- NEVER `git worktree remove -f -f` a locked worktree: the lock means the
  agent is alive; I did it once and lost its uncommitted work.
- Preamble lesson: "layout incomplete" was being used as a skip reason;
  typing the layout from the asm IS the job (preamble updated; batch 10 did
  11/12 with that mindset, batch 11 did 3/17 without it).
- Other stashes: `globals` (tools/globals.py survey: 59 of 2878 globals
  have conflicting declarations, 40 are `void*` def vs typed extern —
  promotion pass offered, not approved) and `ram comments` (per-global
  referencing-TU comments in ram.c/ram2.c).

### Not matched this session (raw-decomp body exists; natural C diverges)

sub_804ABFC (music), sub_805000C/sub_8050050/sub_8050184 (riderstate),
sub_805529C/sub_8055340 (effects), updateEnvirenmentActors/
renderEnvironmentActors (envactor), sub_8056FAC (collectable),
sub_804B4FC/sub_804B5C0/renderRider (rider), sub_8060C1C (sprite),
sub_80539E8 (gameinit), sub_80490F8 (frontend), sub_8050A50 (display),
sub_804A550 (tutorial), sub_804A280 (levelrow, unkC26 signedness),
sub_804F878/sub_804EE54 (levelhud/hud), sub_8052B24 (results, 272 lines,
never attempted). All still INCLUDE_ASM, no drafts parked.

### Parked (attempted, not matched)

| function | lines | draft | why / notes |
|---|---:|---|---|
| initEventListeners (event.c) | 141 | `#if 0` | VLA proven (`s32 ids[max]`); count/max land in swapped regs: agbcc priority ≈ refs/live_length (count 14/184 vs max 5/114); all permutations tried — processed/event.md |
| sub_8049458 (frontend.c) | 166 | `#if 0` | only the final `unk584 == unk586` block's temps permute; odd early `mov r4,#0` across a call — processed/frontend.md |
| initRiders (gameinit.c) | 349 | `#if 0` | frame 0x138 vs 0x134 (one extra spilled local); riderIndex r8 vs r9 — processed/initriders.md |
| initMultiPlayer (multiplayer.c) | 137 | `#if 0` | arg regs r8/r5 + normalization sequence — processed/init-functions.md |
| LoadSpriteSheet (sprite.c) | 99 | `#if 0` | proven pun at SpriteEntry+0x18 (strh) / +0x19 (ldrb); user approved a documented 2-byte union, which reproduces both in isolation, but the function still diverges on stack-arg scheduling ([sp,#36] must load before [sp,#40]) — u16-byte-narrowing.md; next attempt: union sized exactly 2 bytes + consume 5th param first |
| sub_80627F0 (sound.c) | 145 | `#if 0` | genuinely dead `(var08+1)&-2` retained by target (shared -2 in r5); agbcc DCEs it — sound-2.md |
| sub_806123C (spritetext.c) | 356 | `#if 0` | push mask/frame/slots match; early register roles + spills differ — spritetext-2.md |
| resizeSpriteBlock (sprite.c) | 134 | `#if 0` | register allocation of normalized args/list nodes — sprite-resize.md |
| sub_80655C0, sub_8065508 (spritestring.c) | — | `#if 0` | register/stack shape diverged |
| sub_8065334 (spritestring.c) | — | `#if 0` | target reloads `string->actors` each iteration with no call/aliasing store; only `volatile` reproduces it (rejected) — spritestring.md |
| sub_8062C24 (sound.c) | 310 | `#if 0` | envactor-sound agent draft; byte-cursor sequencer — envactor-sound.md |
| initLevelEnvironmentActors (envactor.c) | 656 | `#if 0` | push mask/hi-regs/slots match; frame 0x26C vs 0x268 (one extra local); point-init loop allocation — envactor-init.md (speculative layouts live in the draft, not headers) |
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
