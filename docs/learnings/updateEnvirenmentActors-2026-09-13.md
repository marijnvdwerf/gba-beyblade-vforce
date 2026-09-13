## updateEnvirenmentActors (0x08054EB4)

The exact source uses `Actor *actor`, `LevelGeometryAddresses *geometry`, and typed `GeometryLine`/`GeometryPoint` indexing. `geometry` remains live across `GetStruct4` and `sub_8054278`, while `lineIndex` is loaded once from `actor->unkB4.lineIndex` and reused for `GetStruct4` and line indexing. The line and point pointers preserve the target's `lsl #5` and `lsl #4` addressing without raw offset arithmetic.

`EnvironmentObject.unk2C`, `.unk30`, `.unk34`, and `.unk48` are `unk32` fields at their accessed word offsets. `.unk38` and `.unk3C` are `s16`: the target uses `ldrh` at function offsets 0xA0 and 0xC0 for the decrement sources, followed by `ldsh` at 0xA4 and 0xC4 for the signed nonzero tests. These fields replace padding and preserve the existing 0x4C-byte layout. Existing readers and writers of the shared type remained instruction-identical after the extension.

The loop uses an `s32 count`, an initial `count--`, and `do { ... } while (count-- != 0)`. A measured `unk32 count` trial first diverged at the loop tail (target offset 0x104): it emitted `mov r0, #1; neg r0, r0; add r8, r0; cmp r8, r0` and shortened the function by four bytes, whereas the target emits `mov r0, r8; mov r1, #1; neg r1, r1; add r8, r1; cmp r0, #0`. The signed type is therefore byte-required for this post-decrement form.

The first timer trial with `unk16` fields emitted a single `ldrh` for the initial test instead of the target's `ldrh` plus `ldsh` sequence. Changing both timer fields to `s16` produced the target mixed-width accesses. No artificial casts, raw offset accesses, or rule-breaking temporaries are retained.

The `oldX`, `oldY`, and `oldZ` locals are pre-call snapshots consumed by the delta stores after `sub_80584B8(actor)`, which mutates the actor coordinates. They are semantically required snapshots, so no folding test applies.
