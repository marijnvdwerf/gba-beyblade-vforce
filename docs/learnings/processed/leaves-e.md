# Leaves E

## sub_804DA48 (0x804DA48)

The function remains parked above its assembly include. The dump remains intact.

The closest semantic draft uses the shared `RiderBase` and `Actor` layouts without cast-and-offset access. It treats the first two arguments as opaque rider pointers because the parked caller passes the game-data base and rider-array entries through byte-pointer expressions, reads the actor pointers from offset zero, rejects riders with flag 2, computes the three signed fixed-point coordinate deltas shifted right by 8, and compares their squared distance with the squared radius. The result is a byte-sized 0/1 value.

The target keeps the radius in `r7`, the first actor pointer in `r5`, and the second actor pointer in `r6`, saving `r4`-`r7`. Natural typed drafts consistently allocate the three long-lived values one register lower and omit `r7` from the push mask. The closest draft is retained in the source for semantic reference; no speculative shared fields were added.

| Change | First divergence / result |
| --- | --- |
| Direct typed `RiderBase*` pointers, three delta locals, radius expression | `0x2`; target pushes `r4-r7`, draft pushes `r4-r6`; current body was four bytes shorter |
| Stage base and other coordinates in six signed locals | `0x2`; target register roles and `r7` save unchanged; current body remained four bytes shorter |
| Three signed coordinate locals reused after loading base coordinates | `0x2`; target register roles unchanged; branch signedness matched after making radius signed |
| Raw-draft lifetime shape with `temp_r7`, separate `distance`, and `radius_squared`, using typed `Actor` fields | `0x2`; body length matched, but target still saved `r7` and draft used `r4-r6` |
| Opaque byte-pointer arguments with explicit actor-pointer casts | Same stable `0x2` residual; no instruction improvement over typed-pointer variants |

The target's `asr` coordinate normalization and signed `blt` prove signed arithmetic for the coordinate expressions and squared comparison. The parameter remains wide in the header because the call site passes a wide constant and the target performs no entry narrowing; the local squared-radius value is signed in the parked draft to preserve the target comparison. The pointer reinterpretation is limited to the first field of the established `RiderBase` layout and does not define a second view struct.
