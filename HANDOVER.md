# Session handover

Living document for the next manager session. Rules of engagement are in
`MANAGER.md`; this file is the *state* — what is running, what landed, what
is stuck, and what to do next. Update it whenever something changes.

Last updated: 2026-08-21 (session 2).

## How to work

- You are a manager. Do research/decomp via subagents (`model: gpt-5.6-luna`,
  Agent tool only, every prompt says "Do not spawn subagents"). Decomp agents
  use `subagent_type: decompiler` with `isolation: worktree`, one source file
  per agent. Prompts follow `~/.claude/skills/prompting-codex/SKILL.md`.
- Agent lifecycle: match → opus natural-C review (C diff only, no asm; agent
  retries with that as goal) → my review → merge → debrief → remove worktree.
  Ask for `docs/learnings/<function>.md` before removing a worktree —
  worktree-isolated agents cannot write to the main checkout, so have them
  write it inside their worktree and copy it over; an agent
  whose worktree is gone can be revived by recreating the worktree at the
  same path (`git worktree add .claude/worktrees/agent-<id> -b
  worktree-agent-<id> HEAD`) and sending it a message.
- Merge recipe: `git -C <wt> add -A src asm && git -C <wt> commit`, then
  `git merge <branch>` on main; modify/delete conflicts on dump files → take
  the delete (`git rm`); `cmake --build build --target compare`;
  `tools/update-expected`; commit; later remove worktree + branch.
- Before merging, read the C yourself. "Matches" ≠ done: compiler-shaped code
  (hand-written loop rotation, `block = &global` dances, per-use casts) goes
  back for a cleanup pass. If the natural shape cannot match, the agent must
  show what diverged, and that goes into the learnings file.
- When an agent stalls, read the target dump yourself (`asm/dump/...`, or
  `git show <rev>:asm/dump/...` if already deleted) and send concrete C.
  Things that paid off: reload patterns after `strb` = char-typed fields
  (aliasing), `bls/bhi` = unsigned params, `b .Ltest` at loop start =
  top-tested `while`, `r0 = n; n--; cmp r0` = `while (n-- != 0)`,
  `n-2 … cmp #-1` = `while (n--)`, fresh `mov #0` = literal NULL, `Str_*`
  right after a function = inline literals, independent `cmp #-1` after
  each store = chained/sequential assignments.
- NEVER `git commit -a` from a shell that is cd'd into a worktree: it lands
  on the agent's branch and sweeps its in-progress files into the commit
  (happened in session 2; fixed by exporting patches). Always `cd` back to
  the main checkout first, or use `git -C`.
- Agents occasionally edit the *main* checkout instead of their worktree.
  Check `git status` on main periodically; revert strays, tell the agent to
  `pwd` before every command.
- Status pings: one short SendMessage per agent ("2-3 lines, then continue").
  Cross-agent findings go in a shared file (`docs/learnings/review-<date>.md`)
  and agents get the path + heading, not pasted text.
- Skill hygiene: `.claude/skills/agbcc/SKILL.md` takes only generic,
  repeatable patterns — no function names. Read only the unprocessed top-level
  `docs/learnings/*.md`; `processed/` is history and not required reading.

## Tooling (all on main)

- Build/verify: `cmake --build build --target compare` (SHA1 = truth).
  C is built with `-g` (verified byte-neutral on main and raw-decomp).
- `bun run tools/diff/diff.ts <sym>` — instruction diff with C line numbers;
  no match % any more. `.word` rows differing only in symbol display are
  relocation noise.
- `uv run tools/callgraph.py [root]` — C-only call tree, 🔴 = not in C.
- `uv run tools/asm-annotated.py src/<f>.c <fn> [--all-passes]` — agbcc asm
  + `.lreg`/`.greg` (and `.loop` …) dumps for the current C.
- `uv run tools/worklist.py` — functions called from C but still asm.
- `expected/` is a flat copy of `build/` (`tools/update-expected`).
- `raw-decomp` worktree (`.claude/worktrees/raw-decomp`, 709 C functions vs
  main's ~215) is a read-only reference; never merge it wholesale.

## State at last update

Main: see `git log`; clean; compare passing. Session 1 ended ~06:45.

Merged this session: SpriteVRamFree (sprite.c, loops as `while (n--)`; sprite worktree closed),
sub_806306C (actorheap.c, ActorBlock fields named), sub_805A53C +
getValidAllocatedBlock (memory.c), initGame + initGameLoop + sub_8053B94 +
closeGame (gameinit.c, with large GameData/CurrentGameState upgrades in ram.h;
music.c keeps `(s16)` casts on unkC24/unkC26 — s16 field broke initGameLoop).

Active agents (session 2, all gpt-5.6-luna decompiler, worktree-isolated,
keepalive Monitor running). Red-function→TU map for the mainLoop graph is in
the session-2 transcript; regenerate with `tools/callgraph.py mainLoop` +
grep INCLUDE_ASM.

| scope | functions | status |
|---|---|---|
| gamestate.c | 10 leaves + sub_80510FC | 10 MERGED e5a2582 (applied as patch; worktree removed); sub_80510FC parked (table scan becomes pointer-increment — see gamestate.md); style debt (offset arithmetic on LevelDescriptions, unk4 byte-indexing) handed to temp-reduction agent |
| gameinit.c | sub_80538C0, sub_8053F0C, initRiders | 2/3 MERGED da06486 (unk42C = RiderBlock* of 0x428-byte elems; sub_8053F0C needs case-scoped GameData*); initRiders in progress |
| frontend.c | sub_8049264, sub_8049458 | 0/2; review-frontend.md sent (single `offset` local; use FrontendState fields) |
| event.c | deallocEventListeners, initEventListeners | dealloc MERGED 1c97097; initEventListeners PARKED (#if 0 draft in event.c; VLA proven; count/max register swap: agbcc priority ≈ refs/live-length, count 14/184 vs max 5/114 — see event.md); worktree removed |
| small leaves | sub_8061204, sub_805BA3C, deallocateQuadTree, sub_804A72C, emptyBeybladeActorData, deallocBeybladeActorData, sub_8055CB8, sub_804F800, sub_804FEE8 | 9/9 MERGED c1313c1 (QuadTree @0x7A4 = 0x58 bytes; sub_804F800/sub_804FEE8 need a `GameData* base` local — see small-leaves.md); worktree removed |
| temp-reduction | 11 merged fns | MERGED (sub_8053F0C direct `_gameData->` per case, sub_8055CB8 no fn-ptr casts, sub_804FEE8 no status alias; 8 already minimal — see temp-reduction.md); worktree removed |
| leaves-round2 | 5 leaves | 5/5 MERGED 3c82864 (RiderBase now 0x428, replaces RiderBlock); worktree removed |
| init-functions | initCollectables, initTutorialManagement, initMultiPlayer | running |
| skill distill (gpt-5.6-sol) | SKILL.md rewritten + committed; now moving processed learnings to docs/learnings/processed/ |
| review-round3 (opus) | done → docs/learnings/review-round3.md; canonical LevelGeometryAddresses added to common.h (3c82864); follow-ups sent to all agents |
| gamestate-cleanup | 10 gamestate.c fns | MERGED 02ed7cf (typed LevelDescription[] 0xD0, LevelState unk4[0x38], s8 unk0, no union); worktree removed |
| leaves-round3 | 4 leaves (actor/animevent/particle) | 4/4 MERGED; worktree removed |
| hud-sprite | sub_8060CDC (sprite.c), LoadHUD (hud.c) | running |

Deferred: gameLoop (930 lines), envactor.c (initLevelEnvironmentActors 656 +
sub_8054FE0), sub_8062C24 (sound), LoadHUD, sub_8060CDC. Red set after the
round-2 merges: 22 functions / 4,193 lines (gameLoop 930, envactor 772,
sub_8062C24 310 are the big unassigned ones).

Skipped (no C caller): sub_8062EFC (actorheap.c).

Parked (attempted, not matched — see docs/learnings/): sub_8060E8C and
freeSpriteVramLocation (sprite.c; the agent's earlier "match" relied on
register pinning and was discarded), sub_8057A7C (system.c orphan), updateKeyState (keystate.c; body and
invariant set identical to target, only the hard-reg assignment of the
base+4/base+8 invariants differs — see docs/learnings/updateKeyState.md).

## Next candidates

Direct `mainLoop` callees still in asm (types pinned by C call sites):
gameLoop (927 lines), initGameLoop, updateKeyState, sub_8049458,
sub_8053B94 ✅, initMultiPlayer, sub_8049264, initGame ✅, initGameLoop ✅, closeGame ✅,
sub_8055CB8. Full reachable-graph report was only in an agent transcript;
regenerate with `tools/callgraph.py mainLoop` + `tools/worklist.py`.

## Header conventions decided this session

- `LevelGeometryAddresses`/`LevelGeometryTable` (common.h) are canonical; `getLevelGeometryAddresses(LevelGeometryAddresses*, void*)`.
- `RiderBase` (0x428) is the rider layout; GameData begins with it; `GameData.unk42C` is `RiderBase*`.
- `LevelDescription` is 0xD0 and indexed (`LevelDescriptions[i]`); ActiveLevelDescription no longer exists.
- No unions; no casts on field reads (`(s8)p->f` ⇒ field is s8).

## Open questions for the user

- ASM_ZEROPAD: 7 mid-TU uses are no-ops (agbcc pre-aligns each function with zero fill); only the 2 EOF uses (sound.c, libc.c) matter. Not TU-split evidence. Cleanup offered, not yet approved.

## Session housekeeping

- (Session 1's keepalive Monitor was stopped at wind-down.) A persistent
  55-minute keepalive Monitor ticks while agents run (keeps the
  prompt cache warm). Stop it with TaskStop once all agents are done and the
  session winds down. Each tick: check `git status` on main for stray agent
  edits, update this file if anything changed.
