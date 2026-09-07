# Session handover

Living document for the next manager session. Rules of engagement are in
`MANAGER.md`; this file is the *state* — what is running, what landed, what
is stuck, and what to do next. Update it on every merge, agent start/finish
and change of plan.

Last updated: 2026-09-07, session 8 close (600 C / 407 asm / 60%, 15 TUs).

## Session 9 (2026-09-07)

- Skill fold over the eleven 2026-09-07 learnings merged (2262baff, 6 bullets,
  SKILL.md 200 lines); docs/learnings top level is empty again.
- Running: two luna decompiler agents on the giants (user's call) —
  `selectBladeFrontendHandler` (festate, 2172) and `sub_8052B24` (results,
  1940), checkpoint-then-iterate, park with step table on failure.
- `todo.py --color red` shows ~20 small reds again (teletype sub_8063DAC/DF0/
  CD0/8064140 + nullsub_16/21/22, levelselect sub_8041078/1324/1344/1364,
  beyblade sub_8057068/94/703C, effects ×4, gamestate sub_80517E8, math
  sub_8059FF8, spritetext sub_8062318, geometry GetPointAtSplineIndex) —
  exposed by session 8's indirect-call modelling; proposed as the next batch.
- Small-red batch launched (user: one agent per multi-red TU): teletype ×7,
  levelselect ×4, beyblade ×3, effects ×4, singletons (gamestate/math/
  spritetext/geometry) ×4. 7 luna sessions running — at the limit.
- Merged: beyblade ×3 (905f357d). Review found missing header prototypes +
  no learnings file (fixed before merge).
- Effects 4/4 matched (`_unk3000140` → `DecompressorState` in place); two
  casts the agent called "not rule-breaking" folded away byte-identically
  (`(unk8)side` → `unk8` param; `(void*)source` → non-const `unk8*`).
  Teletype 7/7 matched; sent back for draft-copied header fields and a
  transcribed countdown loop. Both awaiting reviewer + merge.
- Merged: effects ×4 (e63035f2). Singletons ×4 (gamestate/math/spritetext/
  geometry) matched, reviewed; one wide-formal test outstanding. Teletype
  awaiting two user decisions: sub_8063DAC count/temp loop (three natural
  forms diverge at 0x02 on state→r3 vs r4) and whether TeletypeConfig.unk0's
  pointee (+4/+5 bytes) becomes a typed record.
- Merged: singletons ×4 (5e21138e). Levelselect 4/4 matched but
  sub_8041344 ships `(unk8)(arg1 + 0)` (lever; A/B/C forms requested, park
  if none) and headers need an own levelselect.h + `_3000038` placeholder
  upgrade (requested). asm/data12.s `_8068710` rewritten field-wise (user).
  Luna research agent on TeletypeConfig.unk0's pointee running.
- Merged: levelselect ×3 (ac25ec27); sub_8041344 parked by user decision —
  only `(unk8)(arg1 + 0)` matches (target narrows after the first row load,
  narrowed value reused in r4; unk8 formal / unk32 formal / u8 local all
  diverge; step table in the learnings). New src/levelselect.h;
  `_3000038` upgraded in place to LevelSelectState (32 bytes, pad1C).
- Teletype: research proved TeletypeConfig is the 12-byte `FontStyle`
  record (asm/data12.s FontStyle_80688B8 = sheet, ShadowFontMeta, .2byte 0,15)
  whose first word is a sprite sheet; agent is applying `SpriteSheet`
  (sprite.h, proven bytes +4/+5) + `FontStyle`. Then merge.
- Merged: teletype ×7 (47c3021c) with `SpriteSheet` (sprite.h, bytes +4/+5
  proven) and `FontStyle` (12 bytes) — small-red batch complete: +21 C,
  **621 C / 386 asm / 62%**. sub_8063DAC ships the count/temp countdown
  (all natural forms measured, allocation-only divergence at 0x02).
- Running: giants selectBladeFrontendHandler, sub_8052B24 (status checks
  sent), plus sub_805CEB8 geometry 1352 (user, new agent).
- User: the raw-decomp reference worktrees are now fully irrelevant — do not
  point agents or analyses at them (decompiler.md still mentions them).
- Luna analysis running: every red function's `bl` callees classified
  MATCHED / DRAFT / NONE → /tmp/red-callees.md + "all callees matched" list.
- Unlock analysis (user): red functions whose callees are not yet reached
  (`callgraph.py` does not follow `bl` inside asm-only functions, so
  "reds exhausted" was a blind spot). Ranked: sub_8052B24 9, teletypeDefault
  UserCodeHandler 8, sub_805D650 4–6, selectBladeFrontendHandler 5,
  sub_80561EC 4; small: sub_8063B44/turorial_804A488/sub_805DFD4/sub_8041188
  1 each.
- Launched (user agreed): teletypeDefaultUserCodeHandler agent; one agent
  for the four small unlockers. 5 luna running.
- selectBladeFrontendHandler: instruction-exact but ROM SHA fails — agent had
  added a transition union (rejected shape); told to revert and locate the
  diff with mapfile_parser first_diff. sub_805CEB8 checkpointed d591eac0.
- **Measured (user's other agent)**: agbcc fuses `a == 0 && b == 0` on two
  adjacent `s8` fields into one `ldrh; cmp #0` — the transition halfword
  doubt is resolved: no union, no cast; credits.c:45 gets the two-byte test.
  selectBladeFrontendHandler unparked on that shape (its draft tested only
  `value`); the manager's "agbcc will not fuse" claim was wrong.
- sub_8052B24: checkpoint 0a238fa8, first structural divergence ~0x20A
  (rotated while-loop entry), revived with: bottom-tested `while (done == 0
  || x != target)`, callback stored through a function-pointer typedef (no
  +1), direct `_gameData->` in the loop. Branch upgrades GameData in ram.h
  (unk870/unk8A0/unk8A8 SpriteTextCleanup + u16) — audit all users at merge.
- Merged: small unlockers ×4 (84980420: sub_8063B44, GetPointAtIndex,
  sub_805DFD4, sub_8041188; turorial_804A488 parked — only a byte-offset
  form matches; `LevelGeometryTable.pointCount` is `s32` by `blt`).
  **625 C / 382 asm / 62%.**
- teletypeDefaultUserCodeHandler MATCHED (df33f84d + cleanup 8dd2a233):
  identical duplicated case tails let agbcc cross-jump (`b` into the shared
  tail) — a goto is never needed; `<< 24` truth test was the callee's unk8
  return. Reviewer running; then merge (unlocks 8 leaves).
- selectBladeFrontendHandler: structure fully matched (checkpoints 8609a50f…
  2b2e9bab; credits.c:45 fixed to the two-byte test), only allocation left
  (state r7 / index r6 / state+0x80 in r8; 12 bytes short). Revived with a
  record alias for +0x80, 12-build budget, then park.
- Keepalive monitor (main-checkout dirty check, 2 min) running.

## Session 8 (2026-09-07)

State at close: main green at the commit above, **600 C / 407 asm / 60%**,
15/66 TUs done (collectable.c completed); baseline refreshed; lint 0;
callgraph ⚠ section empty; no agents running; keepalive monitor stopped.
Worktrees: kept Opus one (`agent-aa3bb15346941d4ce`) + raw-decomp,
raw-decomp-2, raw-decomp-3 references (user's; remove only when told).
Net: +55 C functions. Prompt archive: this session's prompts were short —
see "How to work" below for the shape that worked.

### What landed (in order)

- **Round 5-A/B** — the user's `raw-decomp-3` branch (8 matched functions)
  re-derived in house style; unkC24/unkC26/unkC6C/unkC6E are `s16` with
  `|= -1` init (target ldrh/orr/strh); LevelState.unk10[2]; MenuState unk names.
- **Cast-removal pass** — every `(s|u|unk)(8|16|32)` cast in live C either
  absorbed into a declaration or kept with the instruction it preserves
  (`lsr #31/#30`, `lsl #16;asr #16`, byte masks); learnings archived.
- **raw-decomp-4** (user's 12 commits) rebased, reviewed, merged: gameLoop,
  dialogue sub_80420C4, initLevelEnvironmentActors, quadtree init/alloc,
  GetLineIndexOfType, sub_804CB08/D110/DAA0/E090. Decisions: `Packet` is a
  union of the wire bytes and the rider-state fields (`typedef Packet
  RiderState`); `LineMetaObjectValue` union carries typed payload members;
  GameData.unk434 is `CameraState`; Actor.unkB0 is `ActorPositionFunc`.
- **Round 6** (reds <100 bytes, then 100–700): teletype ×6, event.c ×17
  (all `_8078990` handlers incl. processMetadata_1/2/4/5), actor/beyblade/
  display/effects/layer/tutorial/levelhud/ai leaves, sub_8056E2C,
  sub_8055914, sub_805599C, **RiderAI_804C8F0 (536 bytes matched)**.
- **Parked** (typed `#if 0` drafts, dumps kept, step tables in learnings):
  sub_80413FC levelselect (+0xBA r3/r5), collectionListFrontendHandler
  (init-loop base pointer r7 vs r8, +4 bytes), sub_8063E18 teletype
  constructor (entry mov r4/r5 rank), sub_8063F84 (r8/r9 save mask),
  sub_804D8D8 and sub_804DDF8 riderphysics (allocator rank).
- **Tooling**: `tools/todo.py` replaces worklist.py (`--color red|yellow`);
  `callgraph.py` prints `⚠ unresolved indirect calls` and every site is now
  modelled (event handler table `_8078990`, teletype/actor/layer callbacks);
  `lint.py` no longer crashes (py-tree-sitter Node use-after-free: walks are
  iterative, trees retained, declarations materialised);
  `ASM_ZEROPAD` everywhere instead of raw `asm(".align 2, 0")`;
  `_unk3000C10` is a scalar `RiderBase*` (+4 bytes `// padding`);
  homedir paths scrubbed (ASMLIFT_DIR must be set); "pun" jargon rewritten
  in plain words (archives untouched).
- Skill fold done mid-session (0424b186); the Round 6 learnings
  (event/teletype/effects/collection/riderphysics/levelselect/…-2026-09-07.md)
  are NOT folded yet — first task next session.

### Decisions made this session (user)

- A `+1` on a function pointer or a `.word sym` vs `sym+1` diff row is never
  source arithmetic: it is a wrong declaration or relocation-display noise.
- A sparse literal compare chain is a `switch`; `cmp/beq; cmp/bcc` means the
  operand is unsigned. A search loop whose target tests the element before
  the bound is `while (elem != x && i < n)`.
- Literal-valued temps (`zero`, `vramN`) are levers — write literals; flat
  `unkNN` fields stay flat without stride evidence; `(unk32)(x + K) > L` is the
  accepted unsigned range-check idiom on a signed value.
- sub_8050A50 keeps its byte-offset shape with `// TODO: fakematch?`;
  actor_80580C0 carries `// TODO: reduce casts` (both user exceptions to the
  no-comments rule). A compiler diagnostic is never evidence for a cast.
- Agents get NO prior-history pointers (no processed/ files) in prompts.
- Reviewer on every decompilation branch (not on tooling/docs branches);
  one squash commit per branch, never fast-forward.
- The word "rulings" is retired — say "decisions".
- Open doubt (user): `credits.c:45` `*(unk16*)&state->transition` is NOT
  believed to be the source shape — some other form reproduces the `ldrh`;
  a union is not the answer. Not for now, but do not build on that cast.

### Lessons for the manager

- Luna agents stop at context compaction ("text-only") roughly every 60–100
  tool calls on long grinds; a one-line "tool calls are allowed — continue
  with X" revives them. Past ~450–600 calls they loop: park and stop.
- Reviewers overflow ("prompt too long") on big diffs or a 1000-line
  learnings file: give an explicit read list, split by file group, forbid
  processed/ and SKILL.md.
- Three agents edited the MAIN checkout despite the worktree rule (their
  worktree `git status` stays clean — that is the tell). Keepalive tick
  checks it; save the diff to /tmp, `git checkout` the files, redirect.
- `cmd | tail -1` masks failures: use `bash -o pipefail -c '… && …'` for
  merge chains, and never chain `git branch -D` behind a step that can fail
  (two branches were deleted after a failed ff; recovered from the reflog).
- Prompts: result first, only the context that changes the outcome, no
  checklists; put the shared rules in `.claude/agents/decompiler.md` (done:
  "Working in a worktree (manager protocol)") so a prompt is the function
  list. Do not hand agents a "park if none match" fallback without reading
  the asm yourself first.
- Parked branches must not leave draft-only header/global changes (levelselect
  and collection both needed a revert pass).

### Next session

1. Skill-fold (sol) over the unfolded 2026-09-07 learnings; archive them.
2. Reds ≤700 bytes are exhausted except ARM routines (`asm/arm*.s`). The next
   tier is giants: `s_rider_804C4B4` 956, `sub_80561EC` 1060 (collision),
   geometry ×4 ~1300, `sub_8052B24` 1940, `selectBladeFrontendHandler` 2172.
   Historical yield is near zero; RiderAI at 536 did match. Attempt only with
   checkpoint-then-iterate and a build budget.
3. Retry parked drafts with fresh agents (`todo.py --color yellow`): the
   teletype pair, riderphysics pair, festate ×5 (852–1316), renderRider.
4. Debt carried: BGLayer/Struct3000CA0 `var00`/`field_C` rename; `&_spritesFree`;
   frontend unk588/unkC callback signature; `tools/unused-fields.py`;
   DisplayRecord/BGLayer TODO; the transition halfword shape (above);
   `docs/learnings/processed/` still contains the word "pun".

## Session 7 (2026-09-06)

State at close: main green, **545 C / 462 asm / 54%**, 14/66 TUs done;
baseline refreshed; no agents running; no monitors running. Worktrees: only
the kept Opus one (`agent-aa3bb15346941d4ce`) + raw-decomp references.
Net: +40 C functions over two rounds.

- **Round 3** (29 draft-less reds, 6 luna agents): 23 matched, 6 parked
  (sub_804DFF4 discarded load, sub_804E090 second mask register,
  sub_80658A4, sub_8056EC0 base+4 cursor, sub_804A908 r7/r8/r9 prologue;
  sub_805DCFC unparked under an accepted layout).
- **Round 4** (18 reds, 6 agents): 16 matched — trail ×3 + projectile
  (R4-1), packet checksum/beyblade/riderphysics/gameinit/levelhud (R4-2),
  riderphysics 2/3 (R4-3), iconmenu + geometry (R4-4), 3 tiny leaves (R4-6);
  parked: sub_804D754 (16-byte target-only `cmp #1/bls; cmp #0x400/bne;
  r0=-1` block with a dead result), renderActor (entry `mov r5,r0` vs
  `mov r4,r0` allocator rank), sub_80420C4 dialogue giant (R4-5: first
  divergence moved 0x1D8 → 0x226 in ~50 builds; best draft parked, worth a
  fresh agent).
- **Process.** One `review` agent per finished branch, prompt = branch +
  assignment list, findings in `/tmp/review-<branch>.md`; the decomp agent
  fixes from that file; then the manager reads the whole diff. Reviewers
  missed real levers four times ((s32) casts before `>> 5`, `(s16)` on a
  local, `__attribute__((packed))` in a draft, draft-only typedefs in
  common.h) and the user caught two fakematches in progress (sub_804E154
  `zero` temp + field-alias pointer; `<< 24` truth tests in dialogue) — read
  in-progress worktrees, not just finished ones. Learnings files are dated
  `<scope>-<date>.md`; parked drafts must be house-style too (real types,
  scratch structs/`extern`s inside the `#if 0`, no Thumb-bit arithmetic).
- **Types decided.** `Packet` (packet.h, 16 bytes, `s8 unk4[12]` payload,
  `unk2_0/unk2_4` nibbles, `unk3` checksum) at `GameData.unk15C4` /
  `unk15D4[4]`; `FrontendState.unkB8/unk140` are 0x88 display records (not
  packets — the union that conflated them was rejected). `ProjectileTemplate`
  (0x30), `SpriteTrailSheet/Frame`, `GeometrySplineLine` (0x10, accepted
  overlay), `CameraState.unk364/unk368` pointer tables, `RiderTemp.unk3C4`
  `SpriteEntry*`, `s16 RiderBase.unk1EE/unk1F2/unk424`, `Actor* GameData.unk658`.
- sub_804A504 kept as `((0 - v) | v) >> 31` with `// TODO: fakematch???`
  (user, one-off). sub_804C3D4 needs sub_804AB50's parameter `unk16` with a
  `u8` local (caller must not narrow; original likely had no prototype).
- Luna agents hit the compaction stop ~10 times; a one-line revive always
  worked. R4-3/R4-4/R4-5 each ran 350–400 tool calls before parking.

### Next session

1. **Round 5 pool** — 15 draft-less leaves exposed by Round 4's parked
   drafts (callgraph follows `#if 0` calls): teletype sub_8063F5C 5,
   sub_806417C 8, sub_8064188 8, sub_806415C 15, sub_8063F64 15,
   sub_8063E18 138, sub_8063F84 170; effects sub_8055C30 14, sub_8055914 63,
   sub_805599C 199; beyblade GetTalkingHead 9, tutorial sub_804A364 8,
   display sub_8050894 10, layer sub_8059CB4 11, actor sub_8058390 38.
   Matching sub_8063F5C/806417C/8064188/8059CB4/8058390 also unblocks the
   parked dialogue and renderActor drafts — retry those after.
2. riderphysics large (sub_804D8D8 173, sub_804DDF8 189, RiderAI_804C8F0
   228) still deferred by the user; riderphysics/geometry/collision have too
   many parked drafts to keep piling on.
3. Giants (≥440, 11): dialogue sub_80420C4 is the only one attempted (parked
   at 0x226). Others untried.
4. Debt carried: BGLayer/Struct3000CA0 `var00`/`field_C` rename; `&_spritesFree`
   decision; frontend unk588/unkC callback signature; `tools/unused-fields.py`
   decision; DisplayRecord/BGLayer TODO in layer.h.

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
5. Carried: `&_spritesFree` scalar-alias decision; frontend unk588/unkC
   callback signature; `out.json` on main.

Prompt archives: /tmp/agent-prompts-2026-09-05.md (this session's 40
Agent prompts), /tmp/learnings-prompts.md (72 fold/learnings prompts across
134 sessions). Round brief: /tmp/brief-2026-09-05.md.

## Standing decisions (all sessions, consolidated)

- A user instruction is a decision for that case, not a rule. Do not
  generalise one-off calls into standing decisions; only add one here
  when the user explicitly says it is one.
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
  `unk<BYTEHEX>_<BITDEC>` directly in the struct; unions only when assembly proves that the same storage is accessed at different widths.
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
  sub_805DCFC reaches the line records after `GeometrySpline.pointIndices[count]`
  via `(GeometrySplineLine*)&spline->pointIndices[count]` (user, 2026-09-06);
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
- Reviewer on every DECOMPILATION branch, regardless of size (user,
  2026-09-07) — the manager read comes after the review. Mechanical tooling/
  docs branches (macro sweeps, callgraph entries, lint fixes) need only the
  manager's read.
- Merge style (user, 2026-09-07): ONE squash commit per agent branch —
  `git merge --squash <branch>` then `git commit -m "Decompile <funcs> (<tu>)"`;
  never fast-forward an agent's commit chain onto main.
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
- `uv run tools/todo.py [--color red|yellow]` — functions reachable from mainLoop still not matched, with sizes.
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
- Unions only when asm proves different-width accesses to the same bytes
  (`strh`/`ldrb`), with a comment citing both instructions. No casts on field reads. Raw-offset blobs
  with offset tables may use `(unk8*)base + offset`; fixed-stride tables are
  arrays. Variable-size records advance a byte cursor.

## Open questions for the user

- `&_spritesFree` scalar alias (resizeSpriteBlock) — keep open.
- Frontend `unk588` / `unkB4->unkC` callback signature conflict.
- `tools/unused-fields.py` (libclang) — build it?
- ASM_ZEROPAD mid-TU no-op cleanup — offered, not approved.

Older session logs (3–5, verbatim): docs/handover-archive/sessions-3-5.md.
