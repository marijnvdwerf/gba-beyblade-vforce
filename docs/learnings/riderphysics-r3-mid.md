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

## sub_804DFF4 probe table

The parked draft retains the block-local `RiderDFF4Draft` layout. Each probe was rebuilt from the same natural draft, with one source-shape change per build; none improved the target.

| Change | First divergent instruction | Size delta |
| --- | --- | --- |
| `zero = r->unk70; zero = 0;` baseline | `0x00`: target `push {r4,r5,lr}`, draft saves `r6`; target `ldr [r5,#0x70]` at `0x04` is absent | draft code/pool remained `0x00`-aligned with the target-sized `0x98` extent, but the register allocation differed |
| Comparison chain `if (r->unk70 != 0) zero = 0; zero = 0;` | `0x00`: extra saved `r6`; target load appears at `0x04`, draft at `0x06` | draft grew by `0x02` and shifted the following body |
| Aggregate copy followed by overwrite (`copy = *r; copy.unk70 = 0`) | `0x00`: extra saved `r6` and a `0x1C0`-byte `memcpy`-style frame | draft grew by `0x10` at the function extent and introduced the aggregate-copy call/frame |
| Direct helper argument (`sub_804E154(rider, r->unk70, 0)`) | `0x00`: extra saved `r6`; the target load is not emitted until the helper call at `0x4E` | target and draft retained the same `0x98` extent, but the load was in the wrong CFG position |

The comparison-chain probe was the only discarded-load form that emitted a load before the reset stores, but it also changed the prologue and shifted the body. The aggregate-copy and helper-argument forms are not retained.

## sub_804E090 probe table

The parked draft uses the complete block-local `RiderE090Draft` and `RiderE090InnerDraft` overlays. The natural baseline reaches the same control-flow and arithmetic sequence, with the mask allocation as the remaining mismatch.

| Change | First divergent instruction | Size delta |
| --- | --- | --- |
| Natural baseline with staged `value` and reused `angle` | `0x5C`: target `mov r1,#255`, draft uses `r4`; target emits a second `mov r0,#255` at `0x7C` while draft reuses `r4` | draft body is `0x02` shorter (`0x92` versus target `0x94` code extent) |
| Fold single-use `value` into `if (r->unk170 > 0)` | `0x20`: draft delays the `unk170` load until after `UnsetRiderFlag`; target loads it at `0x26` before the call | draft body is `0x02` shorter |
| Separate `preAngle` and `postAngle` locals | unchanged at `0x5C`: allocator still reuses `r4` for the first mask and omits the second materialization | unchanged from baseline (`-0x02`) |
| Explicit function-scope `mask0`/`mask1` temporaries | `0x50`: draft materializes `mov r4,#255` before the angle source address; target begins the angle source sequence with `mov r2,#182` | draft body is `0x02` shorter |
| Explicit narrowly scoped `mask0`/`mask1` temporaries | `0x50`: the scoped first mask is still allocated in `r4`, before the target's `mov r2,#182` | draft body is `0x02` shorter |

Declaration-order, temporary/lifetime, signedness, condition-form, pointer, and mask-scope variants did not produce the target's `r1` first mask and `r0` second mask without an artificial compiler lever. The `s32` declarations for `unk10`, `unk80`, and scratch `unk170` remain supported by the target's arithmetic shift and signed branches.

## sub_804D048 (0x0804D048)

The matched implementation uses the active `RiderBase` fields `unk1FC`, `unk200`, `unk208`, and `unk234`, plus `GameData.unk658` and `GameData.unk65C`. `unk200` is a `GeometryLine*`; its `point0` indexes the fixed-stride `GeometryPoint` array at `LevelGeometryAddresses.unk4`. The actor receives the selected point's x and y shifted left by five, and z shifted left by five plus `0x8000`. The actor and rider motion fields are then cleared, `unk208` is set to `0xC00`, and `unk1FC`/`unk234` are cleared.

Keeping `geometry = &_gameData->unk65C`, `actor = rider->unk0`, and `point = &geometry->unk4[line->point0]` in that order reproduces the target's address materialization and register allocation. Folding the geometry alias changed the first line-pointer load at `0x0A` and introduced a different null-test/address sequence. Replacing the nested game-state condition with one combined Boolean changed the branch layout at `0x18` and removed the target's duplicated `initGameloop2` call arms. The nested condition and aliases are therefore retained.
