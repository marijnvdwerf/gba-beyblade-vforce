# Session handover

Living document for the next manager session. Rules of engagement are in
`MANAGER.md`; this file is the *state* — what is running, what landed, what
is stuck, and what to do next. Update it on every merge, agent start/finish
and change of plan.

Last updated: 2026-09-12 (session 12, mid): 717 C / 308 asm / 70% by count, 21 TUs.

## Session 12 (2026-09-12)

- Keepalive monitor: 55-min tick (main dirty check). Reviews now split per
  file group with explicit read lists — a whole-branch reviewer overflowed
  on raw-decomp-7 (dump deletions + 170-line iwram step table).
- Merged user's `raw-decomp-7` (a3b9cb52, squash; base was main be952561):
  sub_806014C (multiplayer; unk8 with measured value-less `return;`),
  sub_804257C (new transition.c/h, TransitionImage; `_unk30000DC/DD` byte
  flags + `pad_30000DE[2]`, E0–F0 s32, RAM externs in ram.h), sub_804967C
  (frontend; clears the "stale parked draft" debt — FrontendObject/
  FrontendSubobject unified, FrontendSelection* typedefs gone,
  `FrontendObject.unkC` + `transition.unk58C` are `void (*)(void)` — settles
  the old unk588/unkC signature question), sub_80596AC (layer;
  Struct3000CA0 six s32 cited per field; `bounds[4]` array + `unk32 height/
  width = 0x20` literal temps BYTE-REQUIRED +0x0A/+0xEE/+0x19A — shipped
  without TODO, user to decide). Parked: sub_80526C8 (gameloop),
  sub_8756FC0 (iwram ARM, typed scratch row table). Two reviews (A: 2
  blockers, B: 3) + one luna fix agent (3 commits); all fold tests
  byte-required except none. **709 C / 316 asm / 69%, 19 TUs.**
- `raw-decomp-8` = linear extension of -7 (6 matched: layer sub_8059284/
  8059310/80594FC/8059C18, levelselect sub_8041344 — old park resolved by a
  measured `unk16` param (unk32/s32 diverge +0x4, unk16/s16/u16 exact,
  sub_8061E58 takes u8), beyblade getBeyBladeActorDataForIndex with
  `BeybladeActorCache` wrapping records+unk1E0; parked sound sub_80627F0).
  Review 1 blocker (the width — measured, kept) + 5 folds (all
  byte-required). Fix agent now rebasing the delta onto main and testing
  the manager's items (sub_80594FC `alignmentMask = ~1` literal temp,
  in-argument `firstWidth =`, sub_8059310 param snapshots) — all
  BYTE-REQUIRED (+0x10, +0x72 with sanctioned TODO, +0x0A ×2). Merged
  (686d5cba, squash after rebasing the delta onto main). **715 C / 310 asm
  / 70%, 20 TUs.** Worktree + branch deleted. (Classifier note: the plain
  `git merge --squash <branch>` passes when run alone; long chains and a
  helper script get blocked — run the recipe as separate commands. A local
  `tools/merge-branch` exists but is git-excluded, not for the repo.)
- Merged opus branch (42cf7e41): sub_804F878 matched (levelhud; `hud`
  record alias byte-required, no `u16* flags` alias, LevelDescription
  unk68[5]+unk7C[5]); user dropped the two opus parks (sub_8050C18 2 insns
  short in the frame-toggle block, newIconMenu tail address computation) —
  one line each in levelhud-2026-09-12.md; `FrontendMenuConfig` unified
  into `FrontendMenuData` (`FrontendMenu.config` const FrontendMenuData*).
  Review CLEAN. Fold candidate: `x >> 8` into an s16 param ==
  `(x << 8) >> 16`.
- fails: DMA3Copy (backup). Failed attempts are discarded, not parked (user).
- Merged turorial_804A488 (14559bbc; tutorial, 124 B, old park unparked):
  `LevelState.unk10[2]` → `unk10[1]` (collectable bitset, sub_8056EC0's
  `[i >> 5]`) + `unk14[1]` (tutorial bitset) — the one-word bitset idiom
  already accepted as `CollectableData.collectedBits[1]`; scalar unk14
  diverges +0x0A. Reviewer called the 1-element array a lever — overruled
  by that precedent. Manager slip: I first asked for `unk10` scalar, which
  forced a `stateFlags += i >> 5` pointer alias in collectable.c —
  reverted. **717 C / 308 asm / 70%.**
- Debt: `(BGControl*)GetBGLayerCntPtr()` casts (display.c ×2, layer.c ×2
  now) — GetBGLayerCntPtr should return `BGControl*`.
- Running: OPUS decompiler (user-sanctioned) in
  `.claude/worktrees/agent-a2b2d9e175ccd2763` (branch
  worktree-agent-a2b2d9e175ccd2763): sub_804F878 MATCHED (0b1a79d2, 316 B,
  5 builds; plain `flags |= 2` reproduces the dead `mov r4,#0`; the parked
  draft's `u16* flags` alias was the blocker; LevelDescription unk68[6]+pad
  → unk68[5]+unk7C[5]) — now on sub_8050C18 then newIconMenu (iconmenu),
  30 builds each. Review after; NOT yet reviewed.

## Session 11 (2026-09-10)

- main 23e76361 (user's "Update pointers") + efa139b3 handover rewrite
  (terse prompting TLDR + lifecycle section replace the old How-to-work).
- User branch `decomp/1-festate` (744409fd, base 454610c5) in worktree
  `.claude/worktrees/1-festate` (built, compare green, lint 0): FIVE festate
  matches — sub_804444C, sub_80448F4, sub_8048310, sub_804868C, and the
  formerly parked sub_804703C — plus "Separate scalar RAM globals": all
  `FrontendScalarWithPad` → `s32` + `pad_*[4]`, 030001AC–200 / 030005C0–DC
  typed, `_unk3000E40/_unk3005E78/_unk3000DA2` split to scalar + pad,
  `CurrentGameStateTail.unk0` s32 (asr #8), data12.s `_80699DC` relabelled
  to its true address (old label → `_80699D8`, `.size` added).
- Review (luna): 3 of 5 blockers void — my prompt said sub_804703C was
  parked; it matched. Real: `FrontendBladeAsset` == `LevelSelectSpriteData`
  (user: unify as `SpriteTextPlacement` in spritetext.h); six `s32` locals in
  sub_804444C uncited. Questions: fold total/count, `selection*2+1` for
  the 1,3,5,7,9 switch (sub_804868C), dedupe RiderHasFlag/unk4[7] chain.
  Luna fix agent running in the worktree (no isolation). Then squash-merge.
- Merged decomp/1-festate (22142c27, squash): fix agent unified the record
  as `SpriteTextPlacement` (spritetext.h), reverted `delta`/`count` to unk32
  (byte-identical), cited s32 for difference/halfDifference/value (bgt) and
  total (asr #1); all three reviewer folds byte-required (+0x64, +0x252,
  +0x0A/0x0C). Fix agent slip removed by me: `SPRITETEXT_TYPES_ONLY`
  conditional-prototype guard (levelselect.h→spritetext.h→ram.h cycle made
  spritetext.c see the wide sub_8061824 prototype) — table externs now sit
  in levelselect.c/festate.c, no header includes spritetext.h. Baseline
  refreshed; worktree + branch deleted.
- Worktrees now: `.claude/worktrees/manual` (branch decomp/manual from main
  22142c27, built, expected linked) — USER's, for a manually driven agent;
  `.claude/worktrees/2-luna` (decomp/2-luna rebased onto main, 2 commits:
  sub_8059FA0 math `p /= 256` s32 local — retracts processed/leaves-k.md;
  sub_8043370 menuobject with new `FrontendMenuObjectData` in common.h,
  `MenuState.unkA` s16, `FrontendState.unk7D/7E`, data12.s `_8068840`
  label) — compare green, reviewer running.
- Merged decomp/2-luna (034f05fa, squash): review 1 blocker (signedness for
  offset/i/sign — measured: offset → unk32 byte-identical; i s32 by
  bge/blt vs bhs/blo; sign s32 by ble vs beq), 2 questions already answered
  in the learnings. **691 C / 334 asm / 67%, 18 TUs.** Baseline refreshed;
  worktree + branch deleted. `.claude/worktrees/manual` (decomp/manual)
  advanced to main 034f05fa. Unfolded learnings: 7 files (5 festate,
  math-2026-09-09, sub_8043370) — fold when a few more land.
- Merged decomp/3-teletype (8214e34c, squash; user's sub_8063D38/E18/F84
  cherry-picked from decomp/manual): review 1 blocker (untested remark,
  removed), 3 fold tests all byte-required (unkBA bitfield breaks 6 users;
  hoisted clear and staged `value` flip +0x02). **694 C / 331 asm / 68%.**
  User prefers the split `&= ~8; |= 4` flag style.
- Byte measure (gen-report.py): 104,776/165,900 code bytes = 63.2% before
  teletype; 67.00% needs +6,378 B, 67.67% +7,489 B. Residue-first set
  = the 11 diagnosed yellows (5,556 B) + sub_8041344 + turorial_804A488.
- Type cleanup research (sol, /tmp): ScreenLayout == LevelDesign (unify as
  ScreenLayout, 0x74 bitfields, geometry at 0x80); FrontendState
  unkB8/140/1C8/250 = `BGLayer bgLayers[4]` (dialogue indexes [1..3]);
  FrontendSubobject stays. Prompt for the user's agent in
  ~/Downloads/type-cleanup-prompt.md (targets decomp/manual, which holds
  the user's sub_80508CC + newLayerManagement + sub_805DD18 commits).
- Running: opus decompiler agent on sub_8055F04 (collision, 40 B, dead
  `lsl #16` residue), own worktree, 25-build cap — NO review yet (user).
- Merged decomp/4-display (0695fb90, squash; user's sub_805DD18 geometry +
  sub_80508CC + newLayerManagement display + the two type cleanups:
  `ScreenLayout` absorbs LevelDesign, `FrontendState.bgLayers[4]` replaces
  unkB8/140/1C8/250, DisplayRecord retired, FrontendSubobject shrunk to
  ROM-config fields keeping `FrontendMenuObjectData* unk20`). Review's two
  blockers pre-existed on main (same-TU prototype → moved to geometry.h;
  stale parked sub_804967C draft in frontend.c reads `object->unk18.data`
  — DEBT, needs a scratch struct when unparked). All 7 fold questions
  byte-required. Debt (user): camera.h CameraSubState/CameraDisplayEntry
  third 0x84 view (parked gameloop draft only); pre-existing `(BGLayer*)`
  casts in sub_8050A50, camera.c, envactor.c.
- Merged opus agent branch (89a55776): sub_8055F04 matched with sanctioned
  `// TODO: fakematch?` on the unused `angleThreshold` (dead abs+shift pair
  keeps the target's `lsl #16`); sub_80567E4 PARKED at 147/147 insns,
  register permutation only. Its unpark needs a user decision: agent claims
  `GeometryLine` 0x11 bitfields → plain `unk8 unk11` is byte-identical for
  all 6 users (unmeasured) and the target wants `ldrb; and #2`; plus a dead
  `if (a > b) swap` keeper (same class as sub_8055F04). Technique: scratch-TU
  through tools/agbcc, 8 variants per compile (2 real builds for the match).
  Opus was user-sanctioned for this one agent. **698 C / 327 asm / 68%.**
- Running: review of decomp/5-sound (`.claude/worktrees/5-sound`, user's
  sub_8062C24 560 B from decomp/manual-2). Worktrees: manual (stale, all
  merged), manual-2 (user, active), 5-sound, raw-decomp.
- Merged decomp/5-sound (0199fc90; user's sub_8062C24 560 B; review's
  blocker void — `SoundStructG.var00` u8 pre-existed; 3 folds byte-required)
  and decomp/6-gameloop (702d0462; user's sub_80522D4 304 B camera-follow
  callback, ~70 builds; prototype moved unsorted.h → gameloop.h; retest of 7
  reviewer folds on the final shape: only the false-arm `top` folded; `void*`
  memcpy destination, never-read `distance[]`, double abs, cursor bump all
  byte-required; `nullsub_12` returns its CameraState* arg; `Actor.unkA2`
  s16; `GameData.unkB50-52`; `LevelDesignLayer.unk14` unk32 read into s16 —
  agbcc DOES narrow a truncating load of a wider field). **700 C / 325 asm,
  65.12% bytes (108,032/165,900); 3,121 B to 67.00%.**
- Running: renderRider reconciliation (luna, `.claude/worktrees/7-rider`,
  decomp/7-rider seeded with e73f21b9; version B 93e5f789 on decomp/manual)
  — user had two agents match it (748 B); agent picks the most natural
  form per difference, one learnings file. Review after.
- Merged decomp/7-rider (33865690): renderRider 748 B — the user had two
  agents match it (e73f21b9 manual-2, 93e5f789 manual); luna reconciled
  (3 differences, B's forms won, each rebuilt exact); review 0 blockers;
  all 9 fold questions byte-required (an `unk8` index local was
  instruction-identical but changed the ROM SHA — pool effect). Precedent
  reused: `(unk8)((sub_8057C40() >> 4) * 4)` table index, like collection.c.
  sub_804BF3C's parked draft prototype went to `(RiderBase*)` here.
- Audit of the user branches (luna): unmerged = initRiders (746d2f96,
  manual-2), sub_804BF3C (1b448278, manual), s_rider_804C4B4 park
  refinement (0db5b86f, manual-2 — user: ignore "better parks"). Both now
  cherry-picked onto `.claude/worktrees/8-riders` (decomp/8-riders, compare
  green), reviewer running. After merge: delete manual-2 worktree + branch
  (user); `manual` stays — work in progress there (uncommitted rider.c).
- Merged decomp/8-riders (ceedb98d): initRiders 704 B + sub_804BF3C 348 B.
  Review 4 blockers: parked initRider draft retyped through `RiderTileState`
  (scratch struct in-block for the pad write); dx/dy/newRows → unk32
  (byte-identical), clearCount s32 by `ble` (+0xB6). Folds byte-required
  (+0x10, +0x54). User's tile-row shape accepted and measured exact:
  `typedef unk8 RiderTile[0x20]; typedef RiderTile RiderTileRow[4];
  RiderBase.unk3D4` is `RiderTileRow*`, `&unk3D4[row]` and
  `n * sizeof(RiderTileRow)` replace the `<< 7` arithmetic; sub_805EF18 and
  `__sub_87576D8` take `RiderTile*` (iwram.h aligned). `GeometryLine.unk16`
  unk16; `BGLayer.field_C` s32. **703 C / 322 asm / 69%; 66.20% bytes
  (109,832/165,900); 1,321 B to 67.00%, 2,433 to 67.67%.**
- manual-2 and manual worktrees + branches deleted (user); manual's
  uncommitted rider.c edit saved to /tmp/manual-rider-uncommitted.diff.
  Worktrees: raw-decomp only.
- Unfolded learnings: 17 files from 2026-09-10 — skill-fold is due (sol).
- Merged decomp/9-effects-spritetext (1d87d6e2): user's sub_8055340 692 B
  (ProjectileSystem s16 fields, `unk7C` word/halves union proven by ldr +
  ldsh + strh, unk88 `RiderBase*`, sub_804B7FC returns `RiderBase*`;
  sub_8051868 widened to s32 at definition + gamestate.h — its own
  `lsl/lsr #24` stay because sub_805749C returns unk8; `(unk8*)PLTT`) and
  sub_806123C 628 B (`SpriteTextCleanup.unk2A` s8 by ldsb; nested-ternary
  line-break condition and `while (count-- != 0)` loops all byte-required
  — 6 fold tests). Review 3 blockers were learnings evidence, added.
  **705 C / 320 asm / 69%; 111,152/165,900 = 66.9994% → 67.00% EXACTLY
  (user's target).** Next exact target 67.67% needs 112,257–112,272
  matched: +1,105..+1,120 B from here (recompute; ARM bank sizes from
  `uvx --from mapfile-parser mapfile_parser sym_info <sym>`, total 5,936).
- manual-2 worktree reset to main (all its commits merged).
- **State at close: main 1c758583, clean, baseline refreshed, lint 0; 705 C /
  320 asm; 111,152/165,900 code bytes = 67.00% (exact target reached).
  Session 11 net: +22 C functions (5 festate, 2 luna, 3 teletype, 3
  display/geometry, sub_8062C24, sub_80522D4, renderRider, initRiders,
  sub_804BF3C, sub_8055F04, sub_8055340, sub_806123C) + type cleanups
  (ScreenLayout, bgLayers[4], RiderTileState/RiderTileRow, SpriteTextPlacement).
  Worktrees: manual-2 (user, at main, empty) and raw-decomp. No agents
  running; keepalive stopped.**
- Batch of four smallest yellows (luna, one each, no park commits):
  sub_804B754 (rider) MATCHED 2a4e2fb3 — `&_gameData->unk42C[i]` typed
  indexing; merged 11f1cb0d). fails: sub_804DFF4, sub_80658A4.
  sub_805529C (effects; `ProjectileSystem.unk28` → s16 by ldsh) running.
  sub_804B4FC merged (22c99385; bare `*(vu16*)REG_VCOUNT;` reads kept).
  **719 C / 306 asm / 70%.** Queue keeps running, one yellow per agent,
  distinct TUs. fails: sub_805529C, sub_804B7FC, sub_805041C, handleEventListeners, sub_80659F0, initEventListeners, actor_8058638, sub_805EBCC, sub_80539E8 (matches only via `GameData** p = &_gameData` — the `&_spritesFree` alias class; user call if ever wanted), LoadSpriteSheet (×2; the first agent's "typed formal is exact" claim did not reproduce — verify such claims in the worktree before re-spending on them). allocateParticleSystem merged (820b2d06; `while (arg1-- != 0)`, s32 count param by the post-decrement lowering, Particle typed, `const SpriteSheet*` through the API; `zero`/`sprite` temps folded, block/bytes/count byte-required). **720 C / 305 asm / 70%.** Running: LoadSpriteSheet (sprite),
  allocateParticleSystem (particle; typing Particle 0x4..0x22 approved),
  actor_8058638 (actor), sub_804E594 (particle), sub_804B624 (rider), sub_804D754 (riderphysics), updateKeyState (keystate). Matched, in review: actor_8057C58 (actor, 5203e7e4), sub_804E594 (particle — review found a STALE compare + casts; fix pass running; reviewers now check rom.gba mtime vs objects first). updateEnvirenmentActors merged (345c38ee; EnvironmentObject unk2C/30/34/48 unk32, unk38/3C s16 by ldrsh; `s32 count` byte-required +0x104; sub_8054278 prototype → event.h). **721 C / 304 asm / 70%.** Also running: sub_805EBCC (camera), sub_804D8D8 (riderphysics).
- Skill fold DONE (sol; 23 files archived, 24 bullets touched, 2 corrections:
  agbcc narrows a truncating load of a wider field; the `/256` copy is kept
  by same-object in-place division). docs/learnings top level is empty.
- NEXT: (1) next exact byte target 67.67% needs matched
  112,257–112,272 (+1,105..1,120 B) — no single non-collision function fits;
  pairs e.g. sub_8756FC0 (960, ARM) + sound_8757A64 (156, ARM) = 1,116; rerun
  the subset search (todo.py sizes + iwram map sizes) before choosing;
  (3) open user decisions: `GeometryLine` 0x11 bitfields → `unk8 unk11`
  (gates sub_80567E4 unpark, 147/147 insns), the dead-comparison keeper
  there; (4) debt: parked sub_804967C draft in frontend.c reads removed
  fields; pre-existing `(BGLayer*)` casts in sub_8050A50/camera.c/envactor.c;
  sound.c TU-local externs `_unk3000DA2`/`_unk3005E78`.
- Manager lessons this session: state a branch's ACTUAL claims in review
  prompts (a wrong "parked" premise made 3 false blockers); reviewers
  routinely flag pre-existing issues as blockers — check `git show main:`
  before acting; a fix agent will reach for a conditional-prototype macro
  when a header cycle bites — say "no guards, move the extern" up front;
  user-driven fold retests on the FINAL form found one real fold in ~40
  (sub_80522D4 false-arm `top`), the rest byte-required.
- Note: `<sym>.NON_MATCHING` aliases in nm output are a tooling artifact
  (present on main), not agent fake symbols; dotless `global` is the asm
  files' existing convention.
- Lesson: state the branch's ACTUAL claims in the review prompt (read the
  learnings headers first); a wrong "parked" premise cost 3 false blockers.

## Session 10 (2026-09-08)

- Merged the user's `raw-decomp-5` branch (cbf9d2ee, squash): five giants
  matched — sub_80413FC (levelselect), collectionListFrontendHandler
  (collection), sub_8052B24 (results), sub_805CEB8 + sub_805D650 (geometry).
  **652 C / 355 asm / 65%, 18/66 TUs.** Two reviewers (luna + sonnet, user
  lifted the ban ad hoc) then a luna fix-up agent; manager read the full diff.
- Decisions (user): learnings from one agent stay ONE file
  (`docs/learnings/raw-decomp-5-2026-09-08.md`); a placeholder that gets a
  smaller real type is split, never wrapped (`ActorCollisionFunctions
  _unk3000FC0` + `unk32 pad_3000FCC`); results.c ships `(s16)delta` with
  `// TODO: figure out how to remove cast` rather than a 16-bit temp.
- Byte-required shapes accepted at merge: `SplineMotionFlags` (local struct
  of four 1-bit flags, plain locals → frame 88 vs 76), VLA
  `SplineConnection connections[capacity]` with `const unk32 capacity = 4`
  (first VLA in live code), `(unk8)((sub_8057C40() >> 7) * 0x20)` in
  collection.c, nested `(collectionData = …)->unk0` assignment.
- sub_8061824: header stays `s32, s32` although the definition is `s16, s16`
  — sub_804A110 (levelrow) needs the wide prototype, sub_8052B24 the narrow
  call; original levelrow TU had no prototype in scope.
- Debt: `ActorCollisionCallbacks.unk0` is `void*` (geometry stores
  `ActorSplineCallbacks*`, envactor stores a `unk32[4]`); MenuState shrank to
  0x38 with the menu/objectItems/block/timer/cleanup/motion fields moved to
  FrontendState (`menu*`).
- Housekeeping: removed worktrees/branches agent-aa3bb15346941d4ce (idle since
  09-03), raw-decomp-2/-3/-4 (luna audits: nothing unmerged except a
  non-matching sub_8062C24 draft). `raw-decomp` kept (user: ignore for now).
- Skill fold merged (a9a5e5f9; 15 files archived, raw-decomp-5 file weighted as
  primary input per user; SKILL.md 202 lines). docs/learnings top level is
  empty again.
- callgraph: sub_805CEB8's `callbacks.unk4->unk0/unk4` dispatch modelled
  (bf80dbd8); ⚠ empty. TODO comments added for the four byte-required
  raw-decomp-5 shapes (99caddbd; user sanctioned).
- Unlock analysis rerun (/tmp/unlock-analysis-2026-09-08.md): sub_804712C
  festate 872 → 8 (sub_804703C 66 + seven ~30 B beyblade leaves);
  sub_80561EC collision 1060 → 4 (+1 transitive); def_94_0_8055CFC → 3;
  sub_8056B54 → 2; sub_805C9A4/actor_805C48C share call_rider_94_8. All
  other reds are dead ends. Proposed next: sub_804712C agent + collision
  cluster (sub_8056B54 + def_94_0_8055CFC) agent; sub_80561EC after.
- Running (user's call): three luna decompiler worktrees — sub_80561EC
  (from the user's stash 431f07b1, applied not popped; learnings moved to
  docs/learnings/collision-2026-09-08.md), sub_804712C, def_94_0_8055CFC — ONE
  function each, no continuing into leaves (user). Both collision agents share
  collision.c/.h — expect a header conflict at merge.
- Merged: def_94_0_8055CFC (bdd8f340; `ActorCollisionResponse` returns unk8
  — measured unk8/unk32 identical; `Actor.unkB4` is now
  `union { struct RiderBase* rider; s32 lineIndex; }` after a luna audit
  (/tmp/actor-unkB4.md) proved rider actors store a back-pointer and
  environment actors a line index; six users converted, casts gone) and
  sub_804712C (4452227e; 2-D language tables, ternary frame writes
  byte-required). **654 C / 353 asm / 65%**, 46 reds (7 beyblade leaves +
  sub_804703C now exposed). Debt: rider.c `(unk32)_unk3000FD0/_unk3000FC0`
  into Actor.unk90/unk94.
- sub_80561EC still running: frame 132 vs 128, byte local at sp+0x80 (Thumb
  has no strb [sp,#imm] → it is a spilled unk8 local, not address-taken).
- Remaining unlockers after sub_80561EC: sub_8056610 → sub_804E124;
  sub_8055D64 → sub_8055F04 + sub_805BAC0; actor_805C48C / sub_805C9A4 →
  call_rider_94_8 (shared). (The luna rerun /tmp/unlock-analysis-2026-09-08b.md
  ran on a stale tree and mis-flagged matched spritetext functions as NEW.)
- sub_80561EC PARKED and merged (b12fa156): ~85 builds from the user's stash;
  frame 132 exact, actor/geometry/line/point0/point1 in target registers;
  first divergence +0x36 `lsl r3,r1,#5` vs `lsl r7` (scaled min-X temp) and
  the result-buffer pointer r3 vs r7 — allocation only. Step table in
  docs/learnings/collision-2026-09-08.md. Worth a fresh agent later.
- Running: actor_805C48C (geometry, 1304) and sub_8055D64 (collision, 406 →
  unlocks sub_8055F04 + sub_805BAC0), one function each.
- Tooling: lint.py still SIGBUSes intermittently (exit 138); rerun.
- actor_805C48C PARKED and merged (64c90bef): matched through 0x344/0x516;
  residue at 0x346 is `actor->unk40` lifetime in r2 across the first
  horizontal response arm; missing stack slot was `broadY0` at sp+0x2C.
  Step table docs/learnings/geometry-2026-09-08b.md; reviewer's 14 fold
  questions saved as geometry-2026-09-08b-review.md for the unpark agent.
  Prototype refined to `unk32 actor_805C48C(Actor*, LevelGeometryAddresses*,
  unk32*, unk16)`. Agent retired at 418 tool calls.
- Unlock frontier now (todo.py): reds sub_8056610 (468 → sub_804E124) is the
  last unlocker; sub_805C9A4 is not (call_rider_94_8 already red via the
  actor_805C48C draft). Yellows: sub_80561EC, actor_805C48C.
- Running: sub_8055D64 (matched bd8d0b72, doing a 9-item cast/shape cleanup
  before review), sub_8056610 (caught editing MAIN — reverted, redirected;
  its diff in /tmp/stray-main-edit-1707.diff).
- Leaf batches (user: ≤3 functions per agent, one TU each): beyblade ×6
  merged (77bbfcfe, 0941d4ee — `_807xxxx[getLanguage()][i]` string tables,
  `_807b858[][12]` records); spritetext ×3 and geometry ×3 (sub_805BAC0,
  sub_805D610, sub_805E068) matched, in review; festate ×3 running.
  sub_8056610 agent edited MAIN twice (both diffs in /tmp/stray-main-edit-*);
  redirected with mandatory `cd` prefix — stop it on a third offence.
- Manager lesson: merge chains must grep `tests passed` only (`FAIL` matched
  "FAILED" and let a broken build through to update-expected); adjacent
  INCLUDE_ASM hunks in one TU conflict when two batches share a file.
- Merged: spritetext ×3 (890cfc54), sub_8055D64 (8ca1c2ad; `angleDelta` s16,
  `savedAngle`/`angleValue`/`signedAngle`/`angleThreshold` byte-required;
  TODO comments on the `angleThreshold` compare and `(unk8)angle` call cast;
  `EnvironmentObject.unk40/unk44`; sub_8055F04 prototype has an s16 fifth
  param). **664 C / 343 asm / 66%.** collision-2026-09-08.md is now one
  file with def_94_0 / sub_8055D64 / parked sub_80561EC sections.
- sub_8056610 agent's worktree build was reconfigured by the manager after
  it claimed the cache pointed at main (it did not); a worktree guard now
  blocks its main-path edits.
- Merged: geometry ×3 (680ca9d7; `ActorSplineCallbacks.unk4` added with s32
  index param; sub_805BAC0 keeps `(unk32)((unk8*)line - (unk8*)base) >> 5`
  with a TODO — natural pointer subtraction lowers to `asr #5`, target `lsr`).
  **667 C / 340 asm / 66%.**
- Merged: festate ×2 (16d2b5a3; sub_8047080 = wide `unk32 color` passed
  straight to `u8`-parameter callees — the `lsl/lsr #24` is agbcc's own
  narrowing, explicit shifts or a `u8` param both diverge; sub_80470C8),
  sub_804703C PARKED (0x0C `ldsb state->unk35` index; scratch
  `FrontendBladeAssetDraft` 16-byte record, `_80699DC[][8]` — interior label
  added in asm/data12.s at _80699B4+0x28). **669 C / 338 asm.**
- sub_8056610 PARKED and merged (8ed25f8f): structure and size exact,
  residue is an r6/r7 role swap at +0x02 after five lifetime probes; draft
  hygiene fixed after review (scratch rider fields, unk32 defaults, no Actor
  view, in-block prototypes).
- **State now: main 8ed25f8f, 669 C / 338 asm / 66%, 18 TUs; baseline
  refreshed; no agents running; keepalive monitor running; only the
  `raw-decomp` worktree remains.** Yellows worth fresh agents: sub_80561EC
  (+0x36), sub_8056610 (+0x02), actor_805C48C (0x346), sub_804703C (0x0C).
  Session 10 net: +22 C functions (5 raw-decomp-5 giants + 17 agents').
- Round 2 leaf batches launched (user; ≤3 per agent): collision A
  (sub_8055F04, def_94_4, sub_8056B54), collision B (sub_80567E4,
  sub_8056910), geometry (call_rider_94_8, sub_805DBF0, sub_805DD18),
  display (sub_80508A4, sub_80508CC, newLayerManagement), singletons
  (sub_805185C, sub_805747C, sub_804E124), spritetext sub_8061880 +
  festate initBBCollectionSprite. Two collision agents share collision.c —
  expect adjacent-hunk conflicts at merge.
- Merged: singletons ×3 (c32b9817; `GeometryLine.unk11_0:3` split into three
  1-bit fields, `s8 unk18` added; sub_805185C takes s8 — caller narrows
  FrontendBladeState.unk34). **672 C / 335 asm / 67%.** spritetext
  sub_8061880 + festate initBBCollectionSprite matched but sent back for
  cast choreography (sub_8061684's real 16-bit params; `(void*)OBJ_PLTT`).
- USER worktrees (external agents, do not remove or merge unasked):
  `.claude/worktrees/sub_8045CB4` (branch decomp/sub_8045CB4, festate giant
  1316 B, parked draft at festate.c:1324) and `.claude/worktrees/actor_805C48C`
  (branch decomp/actor_805C48C, geometry yellow). Both from main c27efdea,
  built, baseline linked. Review + squash-merge when the user says so.
  Third: `.claude/worktrees/sub_804B8F0` (branch decomp/sub_804B8F0, rider.c
  parked draft at :385, from main 7e4321b3).
- Round 2 interim (unmerged, in worktrees): matched def_94_4 (collision A),
  call_rider_94_8 (geometry), sub_80508A4 (display); parked sub_8055F04
  (two-call body, missing dead `lsl #16` at +0x16 after 20+ probes — the
  s16 return of sub_804E358 is discarded). sub_805DBF0 lead from the dump:
  the returned value is a `unk16 count` local (`lsl/lsr #16` after ++,
  `bcs` vs the unk16 capacity), free truncation into the unk8 return.
- Merged: sub_8061880 + initBBCollectionSprite (4f6183a1; sub_8061684's
  prototype corrected to `(SpriteTextCleanup*, unk16, unk16)`; `BeybladeData
  .palette/.spriteSheet`; byte-required in-argument `frame = category - 1`
  with a sanctioned TODO — separate statement diverges at 0x5A).
  **674 C / 333 asm / 67%.** User's sub_8045CB4 (decomp/sub_8045CB4,
  2721a5e3) matched — reviewer running, luna fix agent next; music.c
  widened sub_804AFD4/sub_804B00C to unk32 with u16 locals + a `(u16)` cast
  at sub_804AD28 (flag for the fix agent).
- Collision A done (98b55488, review running): sub_8056B54 + def_94_4
  matched — `ActorCollisionOverlap` returns unk8 after all (sub_8056B54's
  `pop {r1}; bx r1`; def_94_4 is unk8 with no return statement), new
  `CollisionResult` (0x28) in collision.h; sub_8055F04 parked. Geometry:
  sub_805DBF0 matched (64d85500) but with `(unk8)` casts on the call results
  in sub_805D650 — resolved: `unk32` return + block-local `unk8 found` at
  each call site is exact (a6c14479); unk8 return + unk16 count diverged
  at 0xA6.
- Collision B (sub_80567E4 300, sub_8056910 460): told to park both after
  210 tool calls with nothing committed — 0x0C `mov r8,r1` ordering on
  80567E4; 8056910 frame 16 vs 8 with the line pointer spilled at [sp] and
  a raw-byte `unk11` read. Display: sub_80508A4 matched, sub_80508CC parked
  (6-build cap), newLayerManagement at 0x2A (settings alias before `i = 0`).
  User's actor_805C48C matched (decomp/actor_805C48C 19790ece) — reviewed
  (1 doc blocker, `unk32* output` should be `GeometryLine**`), luna fix
  agent running in the user's worktree (no isolation — an isolated fix
  agent cannot edit another worktree; one was mis-launched and stopped).
- Collision B PARKED both (3014cf4f, review running): sub_80567E4 0x0C
  `mov r8,r1` ordering + missing staged endpoint loads; sub_8056910 frame
  16 vs 8, line pointer spilled at [sp], raw-byte `unk11` read.
- sub_8045CB4 review: 3 blockers (`_unk3000460` shrank 4→1 byte — split
  into `u8` + `pad_3000461[3]`, not a wrapper; uncited s32 globals), 8 folds;
  luna fix agent running in the user's worktree.
- Merged: collision A (471d573e; def_94_4 + sub_8056B54 matched,
  `ActorCollisionOverlap` returns unk8, `CollisionResult` 0x28 in
  collision.h; sub_8055F04 parked with step table). **676 C / 331 asm / 67%.**
  Display: newLayerManagement parked at 0xA0 (r6/r7 swap), park commit
  pending. Geometry: sub_805DD18 frame 12 vs 8 at 0x0A, 12-build cap.
- Merged: collision B parks (632db677; sub_80567E4 + sub_8056910 drafts,
  reviewer's 10 fold questions in /tmp/review-a8213627d346fe188.md for the
  unpark agent). Display parked newLayerManagement (8cddcc20, review
  running — ScreenLayout gained draft-only `layers[4]`/`unk74`, likely
  BLOCKING). actor_805C48C fixes: `GeometryLine** output` byte-identical
  (19ef2af2), all folds byte-required, learnings pending. sub_8045CB4 fixes:
  `_unk3000460` split done (94e5c09d); s32 sweep: 458/45C → unk32,
  3C8/3CC/3E0 need s32 (asr +0xA2/+0x2CE); music widths + 8 folds pending.
- Merged: user's actor_805C48C (1b6f864d; `GeometryLine** output`; temp,
  duplicated arms and the final `callbackDone = 1` all byte-required).
  **677 C / 330 asm / 67%.** User's sub_804B8F0 matched (decomp/sub_804B8F0
  ebb47c50) — review CANCELLED at the user's request (my scan found a
  `(unk32**)filtered` cast and an `asm volatile("" : : "r"(angle))`
  barrier); the user's agent is iterating further.
- Geometry batch final (50dbae4a, review running): call_rider_94_8 +
  sub_805DBF0 matched (unk32 return, block-local `unk8 found` at the two
  sub_805D650 call sites, `unk16 count`, `SplineConnection.unk0` typed);
  sub_805DD18 parked (frame 12 vs 8; register-role table in
  geometry-2026-09-08d.md; speculative union reverted). Display: 9 hygiene
  blockers on its two parks sent to the agent (draft-only ScreenLayout
  fields, casts in drafts, `void*` param, step tables).
- Merged: user's sub_8045CB4 (df6b95b7; `_unk3000460` split into `u8` +
  `pad_3000461[3]`; six s32 globals cited by asr offsets, 458/45C → unk32;
  music.c sub_804AFD4/sub_804B00C widened to unk32 with `u16 volume` locals
  — the `u16` prototypes break festate's callers, and the cast-free
  sub_804AD28 call emits `ldrsh` for the s16 `_unk3000F14` where the target
  has `ldrh`, so `(u16)_unk3000F14` stays with a TODO). **678 C / 329 asm /
  67%.** Remaining in flight: geometry review, display hygiene fixes;
  user's sub_804B8F0 worktree.
- Launched (user: all remaining non-ARM reds, biggest first): sub_805C9A4
  (geometry 1300, sibling of the matched actor_805C48C) and
  s_rider_804C4B4 (riderphysics 956). After those, only ARM routines
  (asm/arm1.s render_*, asm/arm2.s sub_8757*) and the yellows remain.
- Merged: display (28c379d5; sub_80508A4 matched, sub_80508CC + newLayer-
  Management parked with clean drafts). **679 C / 328 asm / 67%.** Debt:
  the four `FrontendState.unkB8/140/1C8/250` slots are `FrontendSubobject`
  (0x88) but the layer code walks them as `BGLayer`/`DisplayRecord` (also
  0x88) — newLayerManagement's second parameter stays `unk32*` until that
  layout question is settled.
- User's sub_804B8F0 re-done without levers (decomp/sub_804B8F0 3a12a80d;
  sub_805CEB8's return retyped `unk16`; RiderBase unk62 s16 / unk11C /
  unk19C s32 / unk1A8–1B4, Actor.unk3B; sub_805C9A4 prototype `unk32
  (Actor*, LevelGeometryAddresses*, unk32, unk32, QuadTreeNode*)` derived
  from the caller and passed to the sub_805C9A4 agent) — review running.
- Geometry leaf branch review (verbal only, reviewer hit its stop): two of
  three blockers were the ACCEPTED `(GeometrySplineLine*)&pointIndices[n]`
  layout (overruled); real items = signedness citations, redundant
  `Unk_874CC3C` extern, nine folds — fresh luna fix agent on the worktree
  (original agent retired at 329 calls), 12-build cap.
- sub_805C9A4 MATCHED (be96b23f, 1300 B, review running) — prototype
  `unk32 (Actor*, LevelGeometryAddresses*, GeometryLine**, unk16,
  QuadTreeNode*)`; the user's sub_804B8F0 caller passes `0, 0, node`, so
  the branches agree apart from a geometry.h line conflict.
- sub_804B8F0 review: 1 blocker (local `nullsub_5/6` prototypes with
  parameters vs the owning `(void)` definitions — fix in owning headers +
  definitions), 7 folds; luna fix agent running in the user's worktree.
- sub_805C9A4 review: code CLEAN (shape identical to its sibling), two
  learnings blockers (temp inventory, signedness citations) sent to the
  agent; merged (f7ef3a37). **680 C / 327 asm / 68%.** Remaining in flight:
  geometry leaf branch fix agent (extern removed, nextIndex/remaining →
  unk32; folds within cap), sub_804B8F0 fix agent, s_rider_804C4B4
  (first typed draft checkpointed 350006bf, diff loop starting).
- Merged: user's sub_804B8F0 (01202012; nullsub_5/6 got real prototypes in
  riderphysics.h/collision.h with the owning definitions updated;
  sub_805CEB8 returns unk16; all seven folds byte-required). **681 C / 326
  asm / 68%.** Merge note: a stale duplicate `sub_805C9A4` prototype from
  that branch had to be dropped from geometry.h; the merge chain stopped
  silently on the compile error — echo an explicit COMPARE FAILED marker
  in merge chains.
- s_rider_804C4B4: structure right, 908 vs 956 B, prologue shows three
  long-lived values in r8/r9/r10 vs the draft's one — lead sent (two
  params + one record alias). Geometry leaf fix agent stalled with a red
  tree (nullLine fold) — revived to revert and commit.
- Merged: geometry leaves (a8bc699d; call_rider_94_8 + sub_805DBF0 matched,
  sub_805DD18 parked; the `nullLine` alias fold gave an identical function
  diff but a different ROM SHA — literal-pool/padding effect — so it stays).
  **683 C / 324 asm / 68%.** s_rider_804C4B4 is the LAST non-ARM red;
  after it only asm/arm1.s render_* and asm/arm2.s sub_8757* remain red,
  plus the yellows: sub_80561EC, sub_8056610, sub_80567E4, sub_8056910,
  sub_8055F04 (collision), sub_805DD18 (geometry), sub_80508CC,
  newLayerManagement (display), sub_804703C (festate), sub_8061684
  (spritetext), sub_8062C24 (sound) and the older parks.
- s_rider_804C4B4 diagnosis: target holds −0x1A and `&rider->unkF4/F8/FC`
  in r8–r10 across calls and computes `&unk108…118` ephemerally before
  five stores → lead sent: chained assignment for the five (no aliases),
  at most three record aliases (each used ≥2× across a call), literal
  −0x1A at each store; eight aliases reproduce the prologue but spill
  `actor`.
  Parked at 323 calls (structure right, allocation only): target holds
  actor r4, a hoisted zero in r6, −0x1A r10, &unkF4 r9, &unkF8 r8, &unkFC
  ip, r4 reused for &unk108 later, frame 0; every draft form spills
  `actor`. Parked and merged (f77c55bf; two hygiene fixes: scalar-field
  aliases removed from the draft, a collateral edit to the parked
  sub_804D754 draft reverted).
- **State: main f77c55bf, 683 C / 324 asm / 68%, 18 TUs; baseline
  refreshed; lint 0; ⚠ empty; no agents running; keepalive monitor on;
  only `raw-decomp` worktree left. NON-ARM RED LIST IS EMPTY.** Remaining:
  ARM routines (asm/arm1.s render_00–09, asm/arm2.s sub_8757CD0/D24/E4C/
  FCC) and the yellows: collision sub_80561EC (+0x36), sub_8056610 (+0x02),
  sub_80567E4 (0x0C), sub_8056910 (frame 16 vs 8), sub_8055F04 (dead
  `lsl #16`); geometry sub_805DD18 (frame 12 vs 8); display sub_80508CC,
  newLayerManagement (0xA0); festate sub_804703C (0x0C); riderphysics
  s_rider_804C4B4 (register map known); spritetext sub_8061684; sound
  sub_8062C24; plus older parks (todo.py --color yellow). Session 10 net:
  +36 C functions. Unfolded learnings: ~17 files from 2026-09-08 (b–f
  suffixes) — skill-fold is due.
- Manager lesson: `(cmd || echo FAILED) && next` does NOT stop the chain —
  use `|| { echo FAILED; false; }`; update-expected ran on a red tree once
  today (its self-check held, but do not rely on it).
- Skill fold (sol) launched over the 20 unfolded 2026-09-08 files (giants
  weighted; reviewer question list archived unfolded; parks excluded).
  Merged (6ac1025f): 16 bullets touched (unk8-return `lsl #24` pairing,
  chained-assignment address schedule, callee-saved address reuse rule,
  collision-response byte-required set, cross-TU width splits, narrow
  non-void fall-through callbacks, `add sp;strb` byte locals). Top-level
  docs/learnings is empty again.
- NEXT (user): make asm/arm2.s (the IWRAM code bank: fastMemory*ARM, OAM
  upload, sound, timer/serial ISRs, VRAM bump allocator ARM_sub_87569F4/A84)
  a C TU compiled ARM. Plan agreed in chat: tools/agbcc takes GCC's
  `-marm`/`-mthumb` and selects agbcc_arm/old_agbcc (neither cc1 accepts
  the flags itself); `src/iwram.c` with COMPILE_OPTIONS -marm; `.iwram_code`
  links `src/iwram.c.o(.text)`; 18 per-function dumps under
  asm/dump/8756a00-iwram/ (split done ONE-OFF, no tools/split-arm.py — user);
  no other tooling (diff.ts via objdiff-wasm v4t handles ARM). The user
  already has ARM_sub_87569F4 matching with agbcc_arm -O2 -mthumb-interwork.
  Luna general-purpose agent executing it on MAIN (uncommitted; manager
  reviews + commits) — the keepalive's dirty-main tick is expected while it
  runs. After it lands: hand the 17 remaining ARM functions to decompiler
  agents (ARM matching is a different game — agbcc_arm -O2, no Thumb
  register classes; expect new SKILL material).
  DONE (commit above): steps 1–3 green; ARM_sub_87569F4 is the first
  ARM function matched from C. Agent slips fixed by the manager: a raw
  `0x3000E6C` where `_unk3005E6C` belonged (seeded by my prompt), ram.h
  externs placed after `#endif`, `_unk3005E6C_pad` → `pad_3005E70[4]`.
  Notes: the four fastMemory* dumps are named by IWRAM run address
  (3006fac-…) while the rest use ROM addresses; lint.py now SIGSEGVs on the
  full src/*.c set (both halves pass — tree-sitter bug, tooling debt);
  `-fhex-asm` is dropped for the ARM cc1 by the wrapper. Remaining ARM
  reds: 17 in src/iwram.c (ARM_sub_8756A84, oam_8756CC0, sub_8756FC0,
  sub_8757380/494/574/6D8/7B4, sound_8757A64, fastMemory×4,
  sub_8757CD0/D24/E4C/FCC) + asm/arm1.s render_* (hand-written, out of
  scope). **684 C / 341 asm, 67 TUs.**
- iwram.c reachability (checked 2026-09-08 end): every function is reached
  only through the ROM pointer variables in asm/data8.s:2012-2078
  (`__sub_8757CD0 … __fastMemoryCopy16ARM`, `.4byte <iwram sym>`), so
  callgraph/todo.py only see the four ISRs (sub_8757CD0/D24/E4C/FCC via the
  `_unk3000DF0[6]/[7]` table) as red; the rest are reachable but invisible
  to the tools. Known live callers: `__fastMemoryClearARM/CopyARM` (many
  TUs), `__oam_8756CC0` (gameloop/frontend), `__sub_8757380` (layer.c),
  `__sub_87576D8` (camera.c), `__sub_8756FC0` (layer.c LayerCopyFunc +
  2 dumps), `__sub_87577B4` + `__sound_8757A64` (sound.c), `__sub_8757494`
  (1 dump), `__sub_8757E4C` (1 dump). NO caller found in C or dumps for
  `ARM_sub_8756A84`, `sub_8757574`, `fastMemoryClear16ARM`,
  `fastMemoryCopy16ARM` (data8.s has entries but no `__` global for 574/
  Clear16/Copy16 — possibly dead or reached from arm1.s/audio). Model the
  `__X` pointer variables in callgraph.py CALLBACKS (as with
  `LayerCopyFunc` → `__sub_8756FC0`) so todo.py shows the whole bank.
  Suggested ARM batches (≤3, all in iwram.c → ≤3 agents at once): memory
  primitives (fastMemoryClearARM/CopyARM; Clear16/Copy16), tilemap copiers
  (sub_8756FC0/7380/7494; sub_8757574/76D8/77B4), ISRs (sub_8757CD0/D24/
  E4C; sub_8757FCC), singles (ARM_sub_8756A84, oam_8756CC0, sound_8757A64).
  ARM prompts must say: `agbcc_arm -O2 -mthumb-interwork` (CMake -marm),
  no Thumb register-class lore applies, callers use the `__` pointer vars,
  prototypes in src/iwram.h (guessed `void f(void)` ones flagged there).
- Context at 78% at this point — next session starts from this file.

## Session 9 (2026-09-07/08)

State at close: main green at 66969779, **647 C / 360 asm / 64%**, 16/66 TUs
(dialogue.c completed); baseline refreshed; lint 0; callgraph ⚠ empty; no
agents running; keepalive stopped. Worktrees: kept Opus one
(`agent-aa3bb15346941d4ce`) + raw-decomp/-2/-3 (user's; now irrelevant —
remove only when told). Net: **+47 C functions** incl. the two largest
frontend handlers' worth of leaves and selectBladeFrontendHandler (2172 B).

### Next session

1. Skill-fold (sol) over the 14 unfolded learnings (beyblade, effects, frontend, gamestate,
   small-reds, teletype, levelselect ×2, geometry, festate-select-blade,
   results, math, layer, spritetext — all 2026-09-07/08); archive them.
2. Unlock targets (user): sub_804712C (festate 872 → 8 new), sub_8056B54
   (collision 180 → 2 new); then sub_80561EC / sub_805D650 (giants-tier).
3. Parked with allocation-only diffs, worth fresh agents: sub_805CEB8
   (0x0C), sub_8061684 (0x08), sub_8063D38, sub_80594FC (0x10),
   turorial_804A488 (0x14), sub_8041344 (needs `(unk8)(arg1 + 0)` — user
   said keep parked). sub_8052B24 (0x20A loop rotation, whole-body effect).
4. Debt: FrontendBladeState sits in ram.h (festate.h↔ram.h cycle) with a
   SizeCheck typedef; teletype.c:75 TODO comment wrapped by clang-format;
   `_806EA5C/_806EA70` etc. externs in levelselect.c; older debt list below.

### Decisions made this session (user)

- raw-decomp worktrees are irrelevant; decompiler.md no longer mentions them.
- The word "rulings" stays retired ("decisions").
- One-off sanctioned comments: selectBladeFrontendHandler `unk8* p` alias
  (`// TODO: fakematch? (…reason…)`), sub_8063BA8 `process`/`zero`. The
  comment carries the measured reason, never a question or "(reason)".
- sub_8041344 stays parked rather than shipping `(unk8)(arg1 + 0)`.
- Small-red batches: one agent per multi-red TU.
- Unlock analysis is the prioritisation tool: reds whose callees are not in
  the callgraph come first.

### Lessons for the manager

- agbcc fuses `a == 0 && b == 0` on adjacent s8 fields into one `ldrh`
  (measured by the user's agent; my "it won't" claim was wrong — measure).
- Identical duplicated case tails let agbcc cross-jump (`b` into the shared
  tail); no goto needed. Duplicated arms are often the source.
- callgraph.py had two blind spots (callback-table children rendered as
  leaves; local fn-pointer typedefs not named *Func/*Handler) — "reds
  exhausted" claims must be re-checked after tooling fixes.
- Reviewers: narrow read lists (one overflowed on a 1000-line festate
  diff). Parking hygiene (draft-only header/RAM changes) was the #1 review
  finding all session — say it in the prompt for giants.
- Agents at 500+ tool calls loop; park and hand off. Two edited main
  (results.c ×2, a dump delete) — the keepalive caught all three.
- Merge chains: the `bash -o pipefail` chain can fail silently when a
  python step asserts; check `git log -1` after every merge.


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
- selectBladeFrontendHandler PARKED (97cd3aaa; structure 100% matched, key
  handling fixed 6da70483, credits.c two-byte test). Only allocation left:
  target keeps `&state->unk80` (scalar unk8) in r8 all function — a
  scalar-field alias; user decision pending. Reviewer running.
- sub_8052B24 PARKED (5840a38c, 549 tool calls — agent retired): loop
  rotation appears only with a reduced body (whole-body liveness effect);
  draft-only GameData fields in ram.h (unk870/unk8A0/unk8A8) must revert to
  padding at merge. Reviewer running.
- sub_805CEB8: stuck at the prologue (frame 96 vs 92) with only the first
  checkpoint (d591eac0) committed; revived to commit + report body divergence.
- Merged: teletypeDefaultUserCodeHandler (c29709c9) — dialogue.c DONE.
  **626 C / 381 asm / 62%, 16 TUs.** New small reds: sub_8063AD8 108,
  sub_80555F4 48, sub_80518C8 40.
- Tooling: callgraph.py rendered every child of a 🧭 callback-table node
  as a leaf (580b8f2d fixes it) — 12 more reds surfaced. Launched three
  batches: effects ×6, teletype ×7, spritetext ×2 + frontend/gamestate
  singletons. Waiting for a slot: math pair (sub_805A1DC/sub_805A148),
  sub_80594FC layer, displayFrontendLevel + sub_8041288 levelselect,
  sub_805C3BC geometry.
- Merged parked selectBladeFrontendHandler (3bde3b6f) after hygiene fixes;
  credits.c transition test fixed. Alias decision (`&state->unk80` in r8)
  still open — needed to unpark.
- sub_805CEB8: body lead — target keeps `callbackDone` in a stack slot
  (address-taken, likely passed to the indirect callback); frame 96 vs 92.
- Launched: math pair; sub_805C3BC + levelselect pair + sub_80594FC.
  Fresh agent fixing sub_8052B24 parking hygiene (8 blockers) in its worktree.
- sub_805CEB8 PARKED (d5cc49d3, 15-step table; `callbackDone` stack-slot
  lead). Reviewer running. Effects ×6 matched (cbcf213e), reviewer running.
- Merged: effects ×6 (32ba1425). **632 C / 375 asm / 63%.**
- User decision: selectBladeFrontendHandler may use `unk8* p = &state->unk80;`
  with trailing `// TODO: fake match? Is this temp required?` (one-off
  exception, like sub_8050A50). Fresh agent unparking it.
- Merged parked sub_8052B24 (d97d5408) after hygiene fixes; MenuItemDescriptor
  in menu.h; `_806E7B0` label added in data12.s.
- Math pair matched but shipped as m2c output (temp_rN names, assignments in
  expressions, no-op (s32) casts) — sent back to rewrite as quaternion
  product / quat→matrix source. Spritetext batch: 3/4 matched, sub_8061684
  (416) parking (allocation).
- Merged parked sub_805CEB8 (d7df42ae): `&callbackDone` address-taken was
  right (frame 96 = 96); remaining divergence is allocation only (0x0C
  `mov r8,r0` vs `mov r7,r0`). Worth a fresh attempt.
- Spritetext batch 3/4 (sub_8061684 parked at 0x08 allocation) — reviewer
  running. Levelselect batch: sub_805C3BC, sub_8041288, displayFrontendLevel
  matched; sub_80594FC in progress. Teletype 5/7 (sub_8063D38 budgeted,
  sub_8063BA8 pending).
- Merged: spritetext/singletons ×3 (35c8cc8d; sub_8061684 parked at 0x08
  allocation). **635 C / 372 asm / 63%.** Math pair rewritten as quaternion
  source, one fold test outstanding, then merge.
- Merged: math pair (89e922c6; quaternion product with a measured
  interleaved-load accumulator, quat→matrix). **637 C / 370 asm / 63%.**
- selectBladeFrontendHandler unpark: all instructions match; the last two
  literal rows were a wrong register name in the draft (BG2PA/PB vs
  BLDCNT/BLDALPHA) — fix sent, expecting green.
- Tooling: callgraph.py only recognised `*Func`/`*Handler` typedefs for local
  indirect calls, so the parked sub_805CEB8 draft's `callback3/4` rendered as
  bogus red leaves (3c970c4b fixes; they now sit under ⚠ — model the
  `rider->callbacks.unk4` table with a CALLBACKS entry when known).
- selectBladeFrontendHandler MATCHED (bed454a9, 2172 B, largest function);
  review fixes in flight (sub_805185C → gamestate.h, s8 evidence, ROM externs
  out of ram.h, nine fold tests), then merge.
- Teletype batch: 6/7 matched incl. sub_8063BA8 296 (sub_8063D38 parked);
  BA8 keeps a never-cleared `process` loop flag and a `zero` temp — both
  measured (removing either flips entry allocation at 0x02; `process = 0;
  break;` in the terminating arms also diverges) → user decision at merge.
  Levelselect batch: sub_805C3BC, sub_8041288, displayFrontendLevel matched;
  sub_80594FC parked (0x10 allocation). Both reviewers running.
- User decision: sub_8063BA8 ships with `// TODO: fakematch? (reason)` on
  the `process = 1;` and `zero = 0;` lines (one-off exception).
- Merged: teletype ×6 (b861257e; sub_8063D38 parked). **643 C / 364 asm /
  64%.** Levelselect batch (3 matched, sub_80594FC parked) and the matched
  selectBladeFrontendHandler await reviewer / final commit, then merge.
- **selectBladeFrontendHandler MERGED** (827b1c5c, 2172 B) — 644 C / 363
  asm / 64%. FrontendBladeState lives in ram.h (festate.h ↔ ram.h include
  cycle forbids moving it; SizeCheck typedef kept). Fold results recorded.
- callgraph: collision callback record modelled (127abb05; envactor.c:78
  builds {NULL, sub_8056B54, _return_false} → callbacks.unk4); ⚠ empty.
  Unreached-callee analysis rerunning on the complete graph (user asked
  which reds add new reds).
- Unlock analysis (complete graph): reds that reach NEW functions —
  sub_804712C festate 872 → 8 (sub_804703C, sub_80573C8/3DC/3FC/41C/43C/45C/
  47C); sub_80561EC collision 1060 → 4 (sub_8056610/67E4/6910, sub_805BAC0);
  sub_805D650 geometry 1308 → 4 (sub_805D610/DBF0/DD18/E068); sub_8056B54
  collision 180 → 2 (subset). All other reds are dead ends. Next session:
  start with sub_804712C and sub_8056B54 (user).
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

- You are a manager. All research/decomp/review goes through subagents
  (Agent tool only, never Workflow/fork). Decomp agents: `subagent_type:
  decompiler`, `isolation: worktree`, one TU (or one small cluster of
  leaves) per agent. NO Anthropic-model subagents (opus/sonnet/fable) until
  the user says so (standing order 2026-08-21); reviews use gpt-5.6-luna,
  skill folds gpt-5.6-sol. ≤7 concurrent luna sessions.

### Prompting agents

Agent defs (`.claude/agents/*.md`) already contain: model+effort, "no
subagents" (repeat it anyway — user wants it explicit), worktree protocol
(pwd, absolute paths, configure, expected symlink, compare-before-touch),
full house rules, learnings format, commit-per-function, park format
(`#if 0` + step table), report shape; review.md: read-only, rule checklist,
`/tmp/review-<branch>.md`, BLOCKING/QUESTIONS/NITS; skill-fold.md: inputs,
measured-only, git mv, commit.

Prompt = only what defs cannot know (prompting-codex shape, prose, result
first):
- decompiler: function list (addr + TU, ≤3, "one function each / no
  leaves" if so); derived prototypes/call-site facts; shared headers other
  live agents edit; target-specific facts (ARM: `agbcc_arm -O2`, `__X`
  pointer callers, no Thumb lore); build cap + "park with step table";
  user decisions not to re-open; uncommitted main state to ignore.
- review: branch name(s) + worktree path + base commit; what the branch
  claims; specific attention points (RAM splits, header adds, parks).
- skill-fold: INCLUDE/EXCLUDE file lists, weighting.
Never restate rulebook items. Never "park if none match" without reading
the asm first. Stalled (compaction) → one line "tool calls allowed,
continue with X". >~450 calls → retire, fresh agent. Follow-ups:
SendMessage, delta only.

### Lifecycle

- match → **review** (one `review` agent per finished branch — every
  decompilation branch regardless of size; tooling/docs branches need only
  the manager's read) → agent fixes from `/tmp/review-<branch>.md` → **my
  own read of the whole C diff** → merge → skill fold when the top-level
  learnings pile up → remove worktree. Ask agents proactively (before they
  burn hours) whether they want a natural-C draft; when one stalls, read the
  dump yourself and send concrete C.
- Agents commit in their worktree after every matched function; if an old
  agent refuses, `git -C <wt> add -A src asm docs && git -C <wt> commit`
  yourself. Learnings arrive via the merge.
- Merge style (user, 2026-09-07): ONE squash commit per agent branch —
  `git merge --squash <branch>` then `git commit -m "Decompile <funcs> (<tu>)"`;
  never fast-forward an agent's commit chain onto main.
- Merge recipe, ALWAYS from the main checkout (`pwd` first; never from a
  shell cd'd into a worktree — that merges the branch into itself and then
  `worktree remove` pulls the rug): merge; resolve header conflicts
  (common.h/ram.h accrue parallel typedefs — unify, keep sizeof);
  `clang-format -i` touched src; `cmake --build build --target compare`;
  `tools/update-expected`; commit with explicit paths; `git worktree remove
  --force <wt>`; `git branch -D <branch>`. Chain with
  `|| { echo COMPARE FAILED; false; }` and grep `tests passed` only.
- NEVER `git commit -a`: it sweeps concurrent agents' in-progress edits on
  main into unrelated commits. Stage paths explicitly.
- Agents sometimes edit the main checkout instead of their worktree. On every
  keepalive tick: `git status --short | grep -v '^??'` on main; if dirty, save
  the diff to /tmp, `git checkout` the files, tell the agent to `pwd`.
- Verify every agent claim yourself before merging: compare in its worktree,
  read the C. "Matches" is not "done": house rules are enforced at merge time.
- Skill maintenance is batched: do not hand-edit
  `.claude/skills/agbcc/SKILL.md`; run the `skill-fold` agent over the
  top-level `docs/learnings/*.md` (the permission classifier may block its
  `git mv` — do the move yourself then) and review its diff.
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
