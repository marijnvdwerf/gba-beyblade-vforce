# sub_805EBCC at 0x0805EBCC

The function remains in assembly. A typed semantic draft was retained under `#if 0` immediately above the `INCLUDE_ASM` line in `src/camera.c`; the ROM uses the original dump.

The draft recovered the camera-pointer lifetime, signedness and most control flow. `nullsub_12` returns its argument, the original camera argument remains separate from the returned state pointer, and `Actor.unkA2` is signed because the target uses `ldsh`. `DisplayRecord.unk0` and `unk4` are signed because the target uses signed upper-bound branches. The local coordinate buffer has three words so the compiler reserves the target's 12-byte stack frame.

The best draft's first meaningful divergence after the matched setup is the actor width byte: the target loads it into r3 while this draft loads it into r2. The main structural divergence is in the loop's scale access. The target computes the scale address as base + 0x28 + index*0x18 using separate additions, loads with `ldrh`, and sign-extends with `lsl/asr`; the typed field expression is folded into an `ldrh` with an immediate offset and allocates the value in the table-base register. The target then preserves the table base and uses r3 for the scale while this draft uses the inverse allocation. The typed rewrite also differs in upper-bound constant materialization and literal-pool placement, including whether `0xFFFF6000` is pooled.

Near-miss experiments:

| Change | Result |
| --- | --- |
| Direct typed draft with signed coordinate locals and 12-byte buffer | Matched prologue, nullsub call, coordinate calculations, signed branch conditions and most loop body, but not exact. |
| `CameraDisplayEntry.unk14` as `unk16` | Produced the target's `ldrh` plus sign-extension shape, but not the target's separate scale-address additions or register allocation. |
| Reordered scale load before current-record pointer | Moved the scale load earlier but compiler still folded the field offset into the load and swapped the scale/current-record registers. |
| Explicit typed pointer to the scale field | Compiler continued folding the field address and added spills when an entries alias was also introduced. |
| Reassociated upper-bound assignments | Changed constant folding to a different literal-pool sequence and was discarded. |

The remaining scale-address shape appears to originate from pointer arithmetic over the packed table rather than a normal typed field access. Replacing it with raw offset dereferences or a duplicate view struct would violate the source constraints, so the draft is parked rather than shipped as active C.
