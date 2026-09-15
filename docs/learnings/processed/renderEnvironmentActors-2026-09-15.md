# renderEnvironmentActors (0x08054C9C, src/envactor.c) — MATCHED

Previously parked twice (processed/envactor-gameloop-effects-2026-09-05.md, HANDOVER
luna fails). Final: 250/250, ROM compare passes.

## Shape recovered (diff rows after each step)

| Step | Rows |
| --- | --- |
| Draft from old parked C, current field names | 149 |
| `actor++; continue;` / `effect++; continue;` early exits (both loops duplicate the pointer increment before jumping to the test) + effect coords as `x = ex - ey; y = …; x -= cam40; y -= cam44; x -= 0x400;` | 134 |
| Load x/y before saving: `x = … - actor->unkA0; y = … - actor->unkA2; savedX = actor->unkA0; …` (`unk32` saved; `s16` saved adds ldrh+ldsh) | 119 |
| Effect arms as cull / `sprite != NULL && unk70 == 0` free / `sprite == NULL` alloc / else alive (target block order: free, alloc, alive last) + `continue` in cull | 8 |
| Declare `scrollX, scrollY` before `camera` (stack slots 0x18/0x1C swap) | 3 |
| `effect++; continue;` in the free arm too | 108 (!) |
| + redundant `if (effect->sprite != NULL)` around the free arm's `sub_8060A94` | **0** |

## The allocator flip (measured with asm-annotated .greg)

x and y are shared by both loops (separate effect-loop locals: 96–108 rows).
With continue in both arms, `effect` (pseudo 25) has refs 40 / live 178 → priority
5·40/178 = 1123, just above `y` (refs 30 / live 107 → 4·30/107 = 1121), so `effect`
takes r7 and `y` drops to r3. The target has `y` r7, `effect` r8.

Every effect-loop memory access in the target maps 1:1 onto our RTL mentions of
`effect` and `y`, so refs are fixed; the difference is live length. One more
RTL insn where `effect` is live and `y` is dead flips it (confirmed:
`if (actorCount-- == 0) return;` → effect live 179, allocation correct, but that
spelling moves the decrement).

A call that ends an `if` body leaves a `(use (const_int 0))` insn after it
(seen after the cull arm's `sub_8060A94` and after `LoadSpriteSheet`). The free
arm repeats the cull arm's release idiom, `if (effect->sprite != NULL)
sub_8060A94(effect->sprite);`, even though the chain condition already proved
it non-null. Jump threading removes the test, but the `use` insn survives flow
and adds exactly that one insn. That is the debugging/copy-paste leftover.

Things that did NOT change allocation (still 108): nested/guard_swap effect
guard, top-tested `while (count-- != 0)` for either loop, `gameData` local,
`camera = &…unk434; state = nullsub_12(camera)`, embedded `(savedX = …)`
assignments, separate `spriteY` temp, `(unk32)(y+0x4000) > 0xE000` spelled as
`y < -0x4000 || y > 0xA000` (tree-folded), and alternative `&&` chains
(`and_chain`, separate ifs). Staging `y = …; y <<= 8` / `y -= unkA2` also flips
the allocation (y refs 32), but it leaves a visible intermediate (2 rows).

## Fold tests

- `sprite = effect->sprite;` in the alive arm is required (3 rows): the target
  copies `mov r4, r5` before the stores.
- `else` after the `continue` arms is cosmetic (0 rows), so it was dropped.
- `savedX`/`savedY` as `s16`: 116–135 rows; `unk32` is byte-identical and is used.
- `unk32` counts: 112–117 rows; `s32` (old-value post-decrement compare).

## Header/type changes

- `EnvironmentNode`: `unk4/unk8/unkC` → `s32 x/y/z` (`asr #1` on the sum),
  `unk14` → `const SpriteSheet* spriteSheet` (passed to LoadSpriteSheet; rider.c
  already declares `SpriteSheet_86FAEAC` as `const SpriteSheet`). envactor.c's
  extern changed to match and `initLevelEnvironmentActors` stores
  `&SpriteSheet_86FAEAC` (still 0 rows).
- envactor.h: prototypes for `sub_8055274`/`sub_8055288` (`unk32 (void)`).

## Review follow-up signedness and folds (2026-09-15)

| Isolated candidate | Result |
| --- | --- |
| `unk32 actorCount` | ROM mismatch (`f78a38e31cf1bb828f0a138c8e78f43c478fbe87`); retain `s32` for the matched decrement/loop shape. |
| `unk32 effectCount` | ROM mismatch (`f339640ce2ea9ab0b46aade19ef1ca2f1e1a24c3`); retain `s32` for the matched decrement/loop shape. |
| `unk32 savedX` | ROM compare passes; use `unk32`. |
| `unk32 savedY` | ROM compare passes; use `unk32`. |
| Fold `savedX` into `actor->unkA0 -= scrollX` restore | ROM mismatch (`30e1c0173e1dc3a73914a22b0d89328ce2c5c77f`). |
| Fold `savedY` into `actor->unkA2 -= scrollY` restore | ROM mismatch (`8e928b9bbe23d6bbd6010887a332435bcb763606`). |
| Combine actor `object == NULL` and `object->sprite == NULL` guards | ROM mismatch (`c21e908993a0ec15be4b055d13efe895306073ad`). |
| Combine cull and release conditions | ROM mismatch (`d304dbcfb9b1c04095bbffc5f26299e5750449c2`). |
| Remove redundant release-arm `effect->sprite != NULL` guard | ROM mismatch (`faf4b0ad1bd191322dc495b112592cfbe498e530`). |
| Fold alive-arm `sprite = effect->sprite` alias | ROM mismatch (`7e7ae966ff0770624608d26036ba1d7c9039b241`). |

The two count locals have no sign-extending load or signed branch in the target; the exact target requires the signed compiler shape for the post-decrement loops. This remains a source-rule exception to flag for review rather than semantic signedness evidence.

## Fold-test pass (2026-09-15)

| Candidate | Result | First divergence |
| --- | --- | --- |
| fold `savedX` into `actor->unkA0 -= scrollX` | kept | `0x278` |
| fold `savedY` into `actor->unkA2 -= scrollY` | kept | `0x278` |
| combine `object == NULL` and `object->sprite == NULL` guards | kept | `0x278` |
| combine cull and release conditions/body | kept | `0x278` |
| remove nested release-arm `effect->sprite != NULL` guard | kept | `0x278` |
| fold alive-arm `sprite = effect->sprite` alias | kept | `0x278` |

All six current source shapes remain byte-required.
