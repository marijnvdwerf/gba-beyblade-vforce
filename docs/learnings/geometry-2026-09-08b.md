# Geometry matching notes

## actor_805C48C (0x805C48C)

- The parked draft agrees with the target through relative offset `0x344` (`beq` at the end of the vertical response path). The first remaining divergence is at relative offset `0x346`.
- At `0x346`, the target loads the `actor->unkAC` address into `r3`, uses `r1` for the zero index, and preserves the horizontal extent value in `r2` across the first positive-width horizontal response. The draft loads `actor->unkAC` into `r2`, uses `r3` for the zero index, and then uses `r2`/`r3` for `responseFlags |= 2`, clobbering the extent and forcing a later reload. This is a lifetime/allocation residue; no semantic correction was established.
- The initial rectangle-bound draft was missing a distinct four-byte local slot. The coalesced value was `broadY0`, which had been treated as `rectMaxY`; the target has both values live at distinct stack locations (`rectMaxY` at `sp+0x28` and `broadY0` at `sp+0x2c`). Restoring direct branch-local assignments for both values produced the target 84-byte frame and shifted the later locals to their target offsets.

### Step table

| Change | Measured result |
| --- | --- |
| Initial staged rectangle-bound form | Coalesced `broadY0` with `rectMaxY`; frame was four bytes short and later stack locals were displaced. |
| Separate `broadY0` with direct branch-local rectangle expressions | Restored the 84-byte frame and moved the first remaining divergence to the horizontal response tail at `0x346`; all preceding instructions matched. |
| Explicit `height` temporary | Did not reproduce the target allocation and was discarded. |
| Declaration-order, offset-order, loop-count, and signedness probes | No variant improved the first remaining horizontal lifetime divergence; the matched prefix was preserved. |
| Horizontal response expression/order probes | The target-only property remained: `actor->unk40` stays in `r2` while `responseFlags |= 2` uses `r0`/`r1`. The draft was parked rather than forcing allocation with forbidden constructs. |
