# Leaves round three

## Functions

- `sub_80588A8` (`src/actor.c`) matched exactly after replacing the assembly with a typed cleanup implementation. `Actor` now models the accessed fields at offsets `0x74`, `0x78`, `0x7C`, and `0xB8` while preserving its `0xC4` size. The target's trailing zero padding remained unchanged.
- `sub_805FA4C` (`src/animevent.c`) matched exactly with typed `PolyTable` allocation fields, two `deallocateBlock` calls, and two null stores.
- `sub_805FA68` (`src/animevent.c`) matched exactly using the existing `__fastMemoryClearARM` callback declaration and the `AllocatedBlock.size` field. The narrow halfword table field naturally produced the target halfword store.
- `sub_804EBE8` (`src/particle.c`) matched exactly after adding fixed-layout `Particle` and `ParticleSystem` types. A signed 32-bit loop counter was required to preserve the target's signed halfword load and simple post-decrement loop. Because this function is at the end of the translation unit, a file-scope `.align 2, 0` was required to preserve zero padding rather than compiler NOP padding.

## Generic agbcc patterns

- Accesses at fixed offsets should be represented by typed structure fields with explicit padding; equal total size preserves unrelated users and link layout.
- A signed narrow field loaded into a wide loop counter can produce a direct sign-extending load, while keeping the loop counter narrow may introduce normalization shifts and extra saved registers.
- A post-decrement loop written directly as `while (count-- != 0)` can preserve the target's entry test, body placement, and countdown register lifetime.
- Callback declarations must match the indirect-call ABI: a typed global function-pointer declaration can reproduce the literal load and `_call_via_rN` sequence without inline assembly.
- End-of-translation-unit assembly dumps may contain an explicit zero-fill alignment directive; preserve it with a file-scope alignment directive when replacing the final inclusion with C.
