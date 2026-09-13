# allocateParticleSystem 0x804E468

## Pointer types and Particle layout

`LoadSpriteSheet` takes a `const SpriteSheet *` source. `allocateParticleSystem` uses that same type for `arg2`, and `ParticleSystem.unk0` uses the same type. The call to `LoadSpriteSheet` is uncast.

The initialization loop advances the Particle cursor with `add r5, #0x24` at 0xAA, establishing a 0x24-byte record stride. The target stores the sprite result as a word at offset 0x00. It stores the initialization zero as words at offsets 0x04, 0x08, and 0x0C, and as halfwords at offsets 0x10, 0x12, 0x14, 0x1A, 0x1C, 0x1E, 0x20, and 0x22. Offsets 0x16 and 0x18 are not accessed by committed C and remain `unk8 pad16[4]`.

`ParticleSystem` accesses in this function are a pointer at 0x00, a halfword count at 0x04, a halfword current index at 0x06, a Particle pointer at 0x08, word state/auxiliary fields at 0x0C through 0x2C, and an `AllocatedBlock *` at 0x30. The typed Particle definition preserves the original 0x24-byte size.

## Shared-type re-diff results

- `sub_804E530`: exact after the Particle header change. It uses `ldrsh` for the count at offset 0x04, a word load for the Particle pointer at 0x08, and advances the cursor by 0x24.
- `sub_804E560`: exact after the Particle header change. All six state accesses remain word loads/stores at offsets 0x10, 0x14, 0x18, 0x24, 0x28, and 0x2C.
- `sub_804E584`: exact after the Particle header change. All six state assignments remain word stores at offsets 0x10, 0x14, 0x18, 0x24, 0x28, and 0x2C.
- `sub_804EBE8`: exact after the Particle header change. It uses `ldrsh` for the count at offset 0x04, a word load for the allocation block at 0x30, a word load for the Particle pointer at 0x08, and advances the cursor by 0x24.

## Local fold measurements

The retained locals in the matched function are `block`, `particle`, `bytes`, and `count`.

- `block`: retained. Folding allocation directly into `arg0->unk30` first diverged at 0x02 (`mov r7, r9` versus `mov r7, r8`) and produced 24 differing rows.
- `particle`: retained as the moving cursor while `arg0->particles` remains the stored initial pointer. There is no semantics-preserving scalar fold: incrementing `arg0->particles` would change the stored system pointer, while recomputing the cursor would require another index/cursor local.
- `bytes`: retained. Replacing it with repeated `arg1 * 0x24` first diverged at 0x08 (`sub sp, #16` versus `sub sp, #20`) and produced 30 differing rows.
- `count`: retained. Replacing the guard with `if (arg1 != 0)` first diverged at 0x34 because the literal-pool load changed from `ldr r0, [pc, #140]` to `ldr r0, [pc, #136]`; the loop guard also changed at 0x6C. The experiment produced 30 differing rows.
- `sprite`: removed. Replacing the local with direct `particle->sprite` use produced zero differing rows.
- `zero`: removed. Replacing the staged local with literal zero stores produced zero differing rows.

The matching loop keeps `count = arg1`, performs the initial `arg1--` before the entry guard, and uses the bottom-tested post-decrement condition `while (arg1-- != 0)`, producing `mov r0, r7; sub r7, #1; cmp r0, #0`.
