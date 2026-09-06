# Rider physics R3 mid

## sub_804DFF4 (0x0804DFF4)

Parked. The semantic draft matches the reset and conditional-call behavior, but the target begins with `ldr r0, [r5, #0x70]` whose value is discarded. A natural C read is rejected as a no-effect statement, and assigning it to a temporary lets agbcc optimize the load away. Reproducing it would require a prohibited volatile or inline-assembly construct. The draft remains in `src/riderphysics.c` inside `#if 0` and uses a scratch layout local to that block.

## sub_804E090 (0x0804E090)

Parked after the natural lifetime and type probes. The active semantic draft in `src/riderphysics.c` is inside `#if 0`; its fields are represented by the shared typed `RiderBase` and `RiderECData` layouts.

The draft matches the target through the complete control-flow and arithmetic shape except for allocator selection around the two `0xFF` masks. The target materializes the first mask in `r1` and the second in `r0`:

```
mov r1, #255
and r0, r1
...
mov r0, #255
and r1, r0
```

The natural draft instead reuses `r4`, which holds the earlier value loaded from `RiderBase.unk170`, for both masks. Consequently the draft is two bytes shorter and all following branch displacements move by two bytes. The target's first divergence is at function offset `0x5C` (`mov r1, #255` versus `mov r4, #255`); the second is at `0x7C` (`mov r0, #255` versus reuse of `r4`). Declaration-order, temporary/lifetime, signedness, condition-form, and pointer-type probes did not produce the target allocation without prohibited compiler levers. `unk10` and `unk80` are signed by their arithmetic shift and signed comparison respectively; `RiderBase.unkEC` is typed as `RiderECData*` for the byte access at `+0xF`.
