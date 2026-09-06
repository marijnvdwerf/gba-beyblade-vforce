# Matching learnings

## sub_80513AC (0x080513AC)

The checksum pass matches when `_currentGameState` is referenced directly throughout the function. Caching that global changed the saved-register set and the checksum loop. The save pointer is taken from `&_currentGameState->unk6FC`; the checksum walks 335 words from `block0.magic` through the save area and stores the XOR in `checksum`. The dump was replaced and removed after an exact match.

## sub_804423C (0x0804423C)

The eight alternating sprite updates and the final two updates must spell `arg1 >> 8` directly at each call site. Caching the shifted argument changes normalization and instruction order. The final sprite is reused for the blinking-frame update. The dump was replaced and removed after an exact match.

## sub_8044314 (0x08044314)

The dispatch value is split into `scale = value >> 5` and `count = (value & 0x1F) + 1`. The stage-zero arithmetic must load `unk6A7`, then form `unk6A6 - unk6A8 - value` in that order. Stage one uses `_currentGameState->unk6A8` directly, and stage two keeps a separate `stage2` temporary. The 0x6A5 byte is a real field rather than padding. The dump was replaced and removed after an exact match.

## sub_804A908 (0x0804A908)

The function remains in assembly. The best semantic draft is parked immediately above the original `INCLUDE_ASM`; its scratch layouts are confined to the `#if 0` block because the shared `SpriteTrailEntry` and `UnkTrail` declarations do not yet establish all fields used by the draft.

### Step table

| Change | Result |
| --- | --- |
| Function-scope `remaining`, `count`, `index`, and `scale` locals | Preserved the required long-lived loop values but did not move the trail pointer to the target register. |
| `remaining = trail->unk2; index = trail->unk4; count = remaining; remaining--;` | Restored the target entry `mov`/`neg`/`add` countdown construction. |
| Reused the function-scope `x` local for the post-loop y/delta value | Moved the trail pointer to the target saved register and produced the target active-index/countdown roles. |
| Wide delay accumulator plus separate `nextDelay` | Matched the target load, add, and halfword-store shape for the animation delay update. |
| Separate `previous` loop value before decrementing `remaining` | Matched the target loop-bottom decrement and compare shape. |
| Explicit `dxSquared` and `dySquared` temporaries | Built successfully but did not resolve the post-loop arithmetic divergence or threshold construction. |

### First divergence

The best draft matches the prologue and active trail-update loop through the loop-bottom countdown. The first remaining divergence is in the post-loop distance test at function offset `0x10C`. The target adds the two squared terms into `r4`, then constructs the threshold with `0xD0 << 4`, copies that value, multiplies it by itself, and compares the sum against the result. The draft instead allows the squared threshold to fold and reaches the compare with a different register/value shape. Later ratio, ring-entry, coordinate, camera, and sprite-update differences are downstream of this divergence.

The parked draft still contains an unproven mixed-width access for the delay field and the post-loop signed countdown-field consumer. These are not promoted into the shared header; the dump is retained for future matching work.
