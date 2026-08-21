# agbcc learnings from `SpriteVRamFree`

These are observations from matching `SpriteVRamFree` at `0x08060520`. The existing agbcc skill already covers general liveness, loop-shape, signedness, literal-pool, and expression-shape advice; the rules below record the additional concrete behavior observed here.

- **Do not assume an unused ascending `for` loop will be reversed.**
  - **Asm symptom:** The target used countdown/sentinel loops (`max - 2`, compare against `-1`, decrement), but the natural source variants emitted ordinary ascending loops.
  - **C changes tried:** `s32`/`int` loop counters, unsigned/`unk32` counters, hoisted loop-invariant bounds, and `u32` function parameters with ascending forms such as `for (i = 0; i < max_sprites - 1; i++)` and `for (i = 0; i < 30; i++)`. The compiler continued to emit ascending loops in these tests. The observed ascending drafts were 85.5% with `int` parameters and 88.2% with an unsigned-width counter. Explicit descending forms initially reached 87.9% while argument registers were still wrong.
  - **Why:** The exact loop-reversal preconditions were not isolated by these tests. In this function, source-level type, live-range, and surrounding register-pressure changes did not make agbcc reverse the ascending loops. The matching source therefore retains explicit reversed loops; this is a reproducible workaround, not a claim that every target countdown loop came from an ascending source loop.

- **A single shared `void *prev` can be a register-allocation lever across structurally different loops.**
  - **Asm symptom:** The target kept `r4` as the predecessor in both the sprite and rotation/scale list loops. Separate typed predecessor locals caused the rotation loop to use a different allocation and left an extra mismatch.
  - **C change:** Reuse one `void *prev` for both loops:
    ```c
    rotation->prev = prev;
    prev = rotation;
    ```
    with no casts at those assignments.
  - **Why:** The shared pseudo has one live-range history spanning both loops, allowing agbcc to preserve the same `r4` allocation. Separate typed locals gave the compiler independent pseudos and different allocation decisions. The project’s default unknown/pointer typing rules still apply; this was specifically a codegen observation for compatible pointer fields.

- **The apparently redundant free-list `next` local was required for the target shape.**
  - **Asm symptom:** With an explicit `next` local, the target’s free-list setup matched: the initial free entry remained in `r2`, the mutable cursor used `r0`, and the loop’s computed next pointer used `r2`. Removing `next` made agbcc mutate `free_entry` directly, regressing the register choreography and ROM SHA1.
  - **C change:** Keep the two roles separate:
    ```c
    next = free_entry;
    for (...) {
        next->next = next + 1;
        next = next->next;
    }
    next->next = NULL;
    ```
  - **Why:** The initial pointer and the loop cursor have different live ranges in the target. This is a case where a temporary was not redundant from the compiler’s perspective, even though the C values are semantically interchangeable.

- **Unsigned clamp branches can pin parameter types.**
  - **Asm symptom:** The parameter clamps used `cmp r7, #0x80; bls` and `cmp r0, #0x20; bls`, rather than signed branches.
  - **C change:** Use `u32` parameters in the definition and header, not the pre-existing `int` prototype.
  - **Why:** `bls` is an unsigned conditional branch (`bhi` is the corresponding unsigned-above family). At these call sites and clamps, that is evidence for 32-bit unsigned parameters, not merely an incidental comparison. The earlier `int` version was a dead end.

- **String literals can belong to the function’s trailing pool.**
  - **Asm symptom:** The function referenced three error messages, and the corresponding string addresses were immediately after the function in source/address order.
  - **C change:** Inline the literals at the calls instead of retaining separate `const u8 Str_*[]` definitions.
  - **Why:** agbcc placed the anonymous literal data in the function’s trailing pool, reproducing the neighboring addresses and layout. Keeping standalone definitions changed the source/object layout even when the text was identical.

- **Treat `.word` symbol/name differences in `diff.ts` as relocations until bytes prove otherwise.**
  - **Asm symptom:** The diff displayed expected pool rows as raw numeric addresses and current rows as symbol names, marking them with `!` even though the addresses were equal.
  - **C change:** No source change; verify the actual bytes with the ROM compare.
  - **Why:** `diff.ts` renders relocation information differently for the expected assembly object and the newly compiled C object. The final function diff remained reported as 99.5% because of these rows, while `cmake --build build --target compare` passed with the exact ROM SHA1.

- **Long-lived global-address registers affect ABI argument allocation.**
  - **Asm symptom:** The target kept global addresses live in `r9` and `sl`/`r10` (notably the rotation-scale and VRAM-list globals), while incoming arguments were copied to `r7` and `r8`; zero was kept in `r6`.
  - **C change:** Preserve the natural global accesses and live ranges rather than introducing pointer-to-global temporaries or a `block = &global` indirection dance. Direct deallocation through `_spritesBlock`, `_rotationScaleBlock`, and `_SpriteVramFreeList_block` matched better.
  - **Why:** Callee-saved registers occupied by live global addresses reduce the available allocation choices for parameters and temporaries. The early pointer-to-global dance was not original-looking and added instructions/register pressure rather than reproducing the target.

## Dead ends and cautions

- `int` parameters followed the old header but produced the wrong argument/register behavior; the clamp branches justified `u32`.
- Natural ascending loops, including signed and unsigned counter variants, did not reverse in these experiments.
- Early explicit descending loops reproduced part of the target but initially scored only 87.9% because the surrounding source still allocated arguments incorrectly.
- Using a `block` pointer to the address of each block global added unnecessary indirection; direct global tests and calls were the matching shape.
- Separate typed predecessor variables (`previous`/`prevRot`) did not preserve the target’s shared `r4` allocation.
- Removing the free-list `next` temporary regressed the exact loop register choreography.
- Retyping the eight-byte `_unk3005DF8` placeholder as a single four-byte pointer shifted fixed IWRAM layout. Splitting it into adjacent four-byte globals preserved the layout and allowed plain pointer syntax.

## Match timeline

| Attempt | Source/codegen change | Reported match |
|---|---|---:|
| 1 | Natural ascending loops, `int` parameters | 85.5% |
| 2 | Unsigned-width (`unk32`) loop counter, still ascending | 88.2% |
| 3 | Explicit descending loops, before argument allocation was fixed | 87.9% |
| 4 | Reversed sprite/rotation loops and initial list-shape fixes | 96.5% |
| 5 | Reversed free-list loop | 97.3% |
| 6 | One shared typed predecessor pseudo | 97.7% |
| 7 | Separate initial free pointer and mutable `next` cursor | 98.8% |
| 8 | Assign `_unk3005DD8` before computing the local free pointer | 99.5% |
| Final | Instruction bytes matched; relocation-only `.word` display differences remained in `diff.ts` | ROM compare passed |

## Proposed `agbcc` skill patch

```diff
*** Begin Patch
*** Update File: .claude/skills/agbcc/SKILL.md
@@
 ## Control flow
@@
 - `*out++ = v` can select `stmia`; separated store + increment selects `str` + `add`.
+- Do not infer that an unused ascending `for` loop will reverse: in SpriteVRamFree,
+  `int`/signed counters, unsigned-width counters, hoisted invariant bounds, and
+  `u32` parameters still emitted ascending loops. If the target countdown shape is
+  required, retain the explicit reversed sentinel form and document why.
@@
 ## Register allocation = liveness
@@
 - Read the prologue first: a wrong push mask means the lifetime set is wrong — fix that before anything downstream.
+- One shared `void *` predecessor across compatible pointer loops can preserve one
+  callee-saved pseudo/register across both loops; separate typed predecessor locals
+  may split the allocation. Conversely, a seemingly redundant cursor temporary can
+  be required when the target keeps an initial pointer and a mutable loop cursor live
+  in different registers.
@@
 ## Globals & literal pools
@@
 - Calls through a function-pointer lvalue emit load + `_call_via_rN`; direct calls emit `bl`. Match the indirection level.
+- Error strings written as inline literals may be emitted in the function's trailing
+  literal pool, especially when the source definitions otherwise appear immediately
+  after the function. Keep those literals inline when address order points there.
+- `diff.ts` may print expected pool words numerically and current pool words by symbol
+  name. Treat equal resolved addresses as relocation-display noise and use the ROM
+  byte/SHA1 comparison as the authority.
*** End Patch
```

## Loop reversal experiment

The temporary-source experiments used `tools/asm-annotated.py --all-passes` on
copies of the first sprite-list loop. `bun run tools/diff/diff.ts` was not used:
the copies have no corresponding object in the repository's expected/build
layout, so the comparison here is an assembly eyeball against the original
reversed output.

| spelling | `.loop` says `Reversed loop` | first-loop final assembly |
|---|---:|---|
| `int i; for (i = 0; i < (int)max_sprites - 1; i++)` | yes | countdown, signed zero test (`sub`, then `cmp #0`/`bne`) |
| `u32 i; for (i = 0; i != max_sprites - 1; i++)` | no | ascending (`i++`, `cmp` bound, `bne`) |
| `int i; for (i = 0; i != (int)max_sprites - 1; i++)` | no | ascending (`i++`, `cmp` bound, `bne`) |
| `int n; n = (int)max_sprites - 1; for (i = 0; i < n; i++)` | yes | countdown, signed zero test (`sub`, then `cmp #0`/`bne`) |
| `u32 n; n = max_sprites - 1; while (n--)` | no reversal needed | countdown sentinel; `sub rN, r7, #2`, compare against `-1`, then decrement |
| `u32 n; n = max_sprites - 1; do { ... } while (--n)` | no reversal needed | countdown, but `sub rN, r7, #1` and compare against zero |
| `int i; for (i = 1; i < (int)max_sprites; i++)` | yes | countdown, signed zero test (`sub`, then `cmp #0`/`bne`) |

The important distinction is between the two `.loop` messages. The broad
eligibility gate at `/tmp/agbcc/gcc/loop.c:7310-7323` prints `Can reverse loop`,
but that is not success. The actual reversal path only accepts `LT` (or the
special `LE` case) at `/tmp/agbcc/gcc/loop.c:7334-7338`; an unsigned `LTU`
comparison and both `NE` spellings therefore reach the later return without
printing the success message. The successful path prints
`Reversed loop and added reg_nonneg` at `/tmp/agbcc/gcc/loop.c:7602-7608`.
For nonconstant bounds, the alternate `add_val == 1`/`loop_info->vtop` and
counting-only conditions at `/tmp/agbcc/gcc/loop.c:7419-7427` explain why the
signed and hoisted-bound forms can still reverse.

The `while (n--)` spelling is the useful natural source form: its first-loop
assembly visibly reproduces the target's `sub r1, r7, #2` plus compare-against-
`-1` shape (with different register numbers in the standalone experiment).
It is therefore a better source candidate than an explicit reversed `for`,
subject to restoring the surrounding register allocation in the matched
function.

