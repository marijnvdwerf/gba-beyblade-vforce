# Session 8 learnings

## Hoisted common code prevents branch duplication

When the target duplicates address computation or field access in each branch of an `if/else`, the source must duplicate it too. Hoisting into a shared local before the branch lets the compiler factor it out, producing a single computation before the branch instead of one per arm. Write the repeated expression inline in each arm (`array[i] |= mask` / `array[i] &= ~mask`) rather than caching the pointer or mask.

**Measured:** sub_8057104 — hoisted `word` and `mask` locals produced a single pre-branch computation with `push {r4, lr}`. Inlining `_currentGameState->unk594[arg0 >> 5] |= ...` in each arm produced duplicated per-branch computation matching the target (leaf function, `bx lr`).

## Removing a cached-pointer local can fix register allocation AND instruction ordering simultaneously

A local that caches a global field address (e.g. `s16* field = &_gameData->unkC26`) adds pseudo pressure that can shift the arg0 copy register (r2 vs r3), change load ordering, and prevent the compiler's `sub #N` CSE trick for nearby struct field offsets. Accessing the global directly each time can fix all three issues at once.

**Measured:** sub_804A280 — `s16* field = &_gameData->unkC26` caused arg0 → r2 (target: r3), wrong load order (field before entry->data), and two pool constants for offsets 0x584/0x586. Removing the local and using `_gameData->unkC26` directly fixed all three: arg0 → r3, correct load order, and `sub r2, #2` CSE for the related offsets.

## The `sub #N` / `add #N` CSE for nearby struct field offsets

When two struct fields are at offsets differing by a small constant (≤255), agbcc can load one offset from the pool and derive the other via `sub`/`add` on the offset register. This CSE fires when the compiler computes both offsets from the same base in the same expression context. It does NOT fire when:
- A cached local pointer introduces independent address computations
- The fields are accessed through a nested sub-struct pointer (separate `offsetof` computations)

**Measured:** sub_804A280 — `arg0->transition.unk586` (0x586) and `arg0->transition.value` (0x584) with direct `arg0->transition.field` access: compiler loaded 0x586, then `sub r2, #2` for 0x584. But `FrontendTransition* t = &arg0->transition; t->unk586 / t->value` used `ldrb [r0, #2]` / `ldrb [r0, #0]` instead (different codegen, shorter but wrong).

## Staging all coordinate components forces simultaneous register pressure

When a target loads all N components from two structs before doing pairwise operations, the source must stage each component into a named local. Without staging, the compiler interleaves load-then-operate per component, using fewer registers and changing the push mask.

**Measured:** sub_804DA48 — `(pos1->x - pos0->x) >> 8` interleaved loads and subtracts, producing `push {r4, r5, r6, lr}`. Staging `x0 = pos0->x; y0 = pos0->y; z0 = pos0->z; x1 = pos1->x; y1 = pos1->y; z1 = pos1->z;` then `x = (x1 - x0) >> 8` forced all 6 loads first, producing `push {r4, r5, r6, r7, lr}` matching target.

## Field type vs per-use cast for signed/unsigned loads

When a field is accessed with both `ldrh` (unsigned) and `ldrsh` (signed) across different functions, keep the declaration that matches the majority/established users and add a per-use cast where needed. Changing the declaration type can break other matched functions.

**Measured:** `_gameData->unkC26` (u16) — sub_804A280 needed `ldrsh` (signed load), but changing the field to `s16` broke `initGame` which used `|= 0xFFFF` (compiler simplified the read-modify-write to a direct store). Solution: keep `u16` declaration, cast `(s16)_gameData->unkC26` at use sites that need signed access.

## Parameter width controls stack-param preloading in many-parameter functions

In functions with many stack parameters (>4 args), the declared width of late parameters controls whether the compiler pre-loads them into registers at the prologue or defers loading until use. A wider type (`unk32`) for a parameter stored to a narrow field (`strb`/`strh`) can cause the compiler to defer the load (producing a late `ldrb` from stack), while narrowing the parameter type (`unk8`) can force the compiler to pre-load it alongside other stack params.

Conversely, a `unk16` parameter for a field stored with `strh` can cause the compiler to pre-load it as a word, while declaring it `unk32` makes the compiler load it at use via `mov r, sp; ldrh r, [r, #N]` — matching the target's halfword stack read.

**Measured:** sub_805AD24 (14 params) — `unk32 argD` produced late `add r4, sp, #68; ldrb r4, [r4]` (2 extra instructions, wrong scratch regs throughout). `unk8 argD` forced early `ldr r6, [sp, #68]` preload matching target. Meanwhile `unk16 arg6` caused early word preload into r6, but `unk32 arg6` produced the target's `mov r2, sp; ldrh r2, [r2, #40]` halfword stack read.

## MenuState struct field mapping (sub_805AD24)

Exposed fields in MenuState from pad regions:
- 0x00: `spriteSheet` (unk32), 0x04: `font` (unk32)
- 0x0A: `unkA` (unk16, line spacing multiplier)
- 0x1C: `unk1C` (unk32, x position), 0x20: `unk20` (unk32, y offset)
- 0x28: `tileCount` (unk32)
- 0x2C: `unk2C` (unk8), 0x2D: `unk2D` (unk8)
- 0x34: `valueCallback` (MenuStateValueCallback)
