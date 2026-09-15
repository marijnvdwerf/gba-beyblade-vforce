# collision — sub_8056610 (0x08056610), matched 2026-09-13

Unparked from the session-10 `#if 0` draft in `src/collision.c`. Matched on the
first build; no allocation lever was needed.

## The park was caused by a wrong struct, not by register allocation

The parked draft read the two slope bytes from the **line** record:

```
lineValue = line->unkE;    rider->unk30 = line->unkD << 8;
```

The target reads them from the **result** record (`r5`, the 4th parameter):

```
0x0000007e  mov   r0, #13      0x00000116  mov   r2, #14
0x00000080  ldrsb r0, [r5, r0] 0x00000118  ldrsb r2, [r5, r2]
0x0000015c  mov   r0, #13      0x00000164  mov   r0, #14
0x0000015e  ldrsb r0, [r5, r0] 0x00000166  ldrsb r0, [r5, r0]
```

`r5 = arg3 = result`; `r7 = arg1 = line`. Semantics agree: `sub_80567E4`
writes `result->unkD = line->unk18; result->unkE = 0` (and the mirror for the
other axis), so `+0xD`/`+0xE` of the result *are* the per-axis slope bytes that
`sub_8056610` consumes.

Moving those five reads from `line` to `result` is also what fixes the
callee-saved roles that the previous two sessions chased. Ref counts in the
allocator's priority `floor_log2(n_refs) * n_refs / live_length`
(docs/learnings/allocator-priority-2026-09-13.md):

| pseudo | refs with `line->unkD/unkE` | refs with `result->unkD/unkE` |
| --- | --- | --- |
| `result` (r5) | ~9 | ~14 |
| `actor` (r6) | 8 | 8 |
| `line` (r7) | ~11 | 6 |

With the draft's wrong field owner, `line` outranked `actor` and took r6
(`mov r6, r1` at +0x02, the reported first divergence); with the correct owner
`line` drops to 6 refs, falls below `actor`, and the target order
rider(r4) > result(r5) > actor(r6) > line(r7) falls out with no source
gymnastics. The earlier "pure role swap decided by ref/length ratio" reading
was correct about the mechanism but the ratio was being changed by a semantic
bug, not by lifetime shaping.

## Temps

All three probes folded byte-identically and were removed:

| temp | shape | result |
| --- | --- | --- |
| `unk8 flags = result->unkC & 2; if (flags == 0)` | folded to `if ((result->unkC & 2) == 0)` | identical |
| `value = result->unkE` (used twice) | folded to the field read | identical |
| `value = result->unk24; rider->unk3C = value;` | folded | identical |

`s32 direction = -result->unkE;` is kept: it is used twice and folding it
duplicates the negation in source for no byte difference. No byte-required
temporaries in this function.

The `lsl #24 / lsr #24` pair at +0x20 is *not* evidence of a `u8` temporary —
agbcc emits it for `(result->unkC & 2) == 0` on a `unk8` field, while the
neighbouring `(result->unkC & 1) != 0` at +0x74 emits no truncation. The zero
reused by `str r1, [r0]` at +0x2c is cse's `record_jump_equiv` substituting the
just-compared register for the `NULL` constant, not a source-level variable.

## Signedness evidence

- `RiderBase.unk28`, `RiderBase.unk34`: `asr r0, #8` at +0xE4 / +0x132 → `s32`
  (were `unk32`). Only other real user is `sub_804D110` (`src/riderphysics.c`
  873-876), plain loads/adds; rebuilt, ROM unchanged.
- `RiderBase.unk1B4`: `cmp r1, r0; ble` at +0x14/+0x16 → signed `s32`
  (was `unk32`). Other users `src/rider.c` 406/451; rebuilt, ROM unchanged.
- `CollisionResult.unkD`, `.unkE`: `ldrsb` → `s8`.
- `CollisionResult.unk14/18/1C/20/24` and `RiderBase.unk174`: plain `ldr`/`str`
  only → left `unk32`.

## Fields split out of padding (all written/read by this function)

`RiderBase`: `unk94`, `unkE0`, `unkE8`, `unkF0`, `unk174`.
`CollisionResult`: `unkC`, `unkD`, `unkE`, `unk14`, `unk18`, `unk1C`, `unk20`,
`unk24` (struct size stays 0x28; `RiderBase` stays 0x428).
