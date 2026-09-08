# actor_805C48C temporary folds — 2026-09-08

The matching C symbol is 0x516 (1302) bytes, followed by two alignment bytes. Every trial used the skill's `try_fold.py` and `cmake --build build --target compare`; the expected baseline was never refreshed. Rejected candidates were restored. Size deltas below exclude alignment padding.

Accepted: reuse `rectMinX` for the initial minimum X bound, removing the `initialMinX` declaration. Its initial uses end before the later assignment; no callback intervenes in the initial uses. Symbol size delta: 0; instruction diff: none; full ROM SHA1 passes.

All direct folds were retested after this accepted lifetime change. Each retained alias below is required by this tested form, not proven impossible to remove.

| Local | Tested replacement | Size delta (bytes) | First divergent instruction (function offset) |
| --- | --- | ---: | --- |
| `point0X` | `point0->x << 5` | -14 | Target `719  0x0000000a    sub       sp, #84`; candidate `724  0x0000000a    sub       sp, #80` |
| `point0Y` | `point0->y << 5` | -10 | Target `719  0x0000000a    sub       sp, #84`; candidate `724  0x0000000a    sub       sp, #80` |
| `point1X` | `point1->x << 5` | -14 | Target `719  0x0000000a    sub       sp, #84`; candidate `724  0x0000000a    sub       sp, #80` |
| `point1Y` | `point1->y << 5` | -16 | Target `719  0x0000000a    sub       sp, #84`; candidate `724  0x0000000a    sub       sp, #80` |
| `point0` | `&geometry->unk4[line->point0]` | -6 | Target `719  0x0000000a    sub       sp, #84`; candidate `724  0x0000000a    sub       sp, #80` |
| `point1` | `&geometry->unk4[line->point1]` | -6 | Target `719  0x0000000a    sub       sp, #84`; candidate `724  0x0000000a    sub       sp, #80` |
| `yNegativeOffset` | `actor->unkAA << 8` | -6 | Target `719  0x0000000a    sub       sp, #84`; candidate `724  0x0000000a    sub       sp, #88` |
| `yPositiveOffset` | `actor->unkAE << 8` | +0 | Target `719  0x0000000a    sub       sp, #84`; candidate `724  0x0000000a    sub       sp, #88` |
| `actorY` | `actor->y` | -14 | Target `719  0x0000000c    mov       r7, r0`; candidate `724  0x0000000c    mov       r6, r0` |
| `yMargin` | `actor->unk50` | -14 | Target `719  0x0000000c    mov       r7, r0`; candidate `724  0x0000000c    mov       r6, r0` |
| `initialMaxX` | `actor->x + (actor->unkAC << 8)` | +10 | Target `719  0x0000000c    mov       r7, r0`; candidate `724  0x0000000c    mov       r6, r0` |
| `initialMaxX` | Reuse `rectMaxX` | -2 | +0x2a: target `ldr r5, [sp, #16]`; candidate `ldr r4, [sp, #16]` |

The original direct `initialMinX` expansion changed symbol size by +12 bytes and first diverged at +0x0a (`sub sp, #80` instead of `sub sp, #84`). Reusing the existing local succeeded instead.

Other locals carry mutable state or values reused across branches/callbacks: line and rectangle bounds, masks, response flags, count, loop index, callback state, and restitution `temp`. These were not blindly expanded. In particular, recomputing `line` from geometry after callbacks could change the selected pointer; narrow masks/count preserve truncation; `temp` is conditionally zeroed before negation. There is no redundant loop counter. The final `callbackDone = 1` remains as established during matching. No new casts or rule exceptions were introduced.

## Review closure and source-shape probes — 2026-09-08

The earlier horizontal lifetime residue at relative offset `+0x346` was closed by
retaining the final horizontal callback guard's `callbackDone = 1` assignment.
With that assignment present, the target keeps the `actor->unkAC` address in `r3`,
uses `r1` for the zero index, and preserves the horizontal extent in `r2` across
the first positive-width horizontal response. Removing the assignment first
diverged at `+0x3B4` (`mov r5, r9` in the target versus `mov r1, r9` in the
candidate), so the assignment is byte-required for this matched source shape.

The initial rectangle setup also requires distinct stack slots for `rectMaxY`
and `broadY0`: the target stores `rectMaxY` at `sp+0x28` and `broadY0` at
`sp+0x2C`. Restoring direct branch-local assignments for both values produced
the target 84-byte frame and moved the remaining divergence to the horizontal
response tail at `+0x346`; coalescing them was four bytes short.

Each probe below was made from the matching source, built with
`cmake --build build --target compare`, and restored after the failed compare.

| Probe | Result / first divergence |
| --- | --- |
| Fold vertical restitution `temp` into `actor->unk44` without duplicating the multiply | Failed; first divergence at `+0x0C`: target `mov r7, r0`, candidate `mov r6, r0`. `temp` retained. |
| Fold horizontal restitution `temp` into `actor->unk40` without duplicating the multiply | Failed; first divergence at `+0x0C`: target `mov r7, r0`, candidate `mov r6, r0`. `temp` retained. |
| Share the two vertical endpoint-response arms with one endpoint loop | Failed; first divergence at `+0x0A`: target frame `84` bytes, candidate frame `96` bytes. Explicit vertical arms retained. |
| Share the two horizontal endpoint-response arms with one endpoint loop | Failed; first divergence at `+0x0A`: target frame `84` bytes, candidate frame `88` bytes. Explicit horizontal arms retained. |
| Remove the final horizontal `callbackDone = 1` assignment | Failed; first divergence at `+0x3B4`: target `mov r5, r9`, candidate `mov r1, r9`. Assignment retained. |

The typed `GeometryLine** output` parameter and `output[count] = line` store were
also tested independently and are byte-identical; the null output call in
`initLevelEnvironmentActors` remains unchanged.
