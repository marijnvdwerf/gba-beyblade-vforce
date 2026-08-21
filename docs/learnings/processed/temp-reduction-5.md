# Temporary reduction round 5

All attempted edits were built with `cmake --build build --target compare` and checked with the per-symbol diff. Two source cleanups were byte-identical and were committed separately; the remaining locals are retained because their live ranges or operation order are visible in the target assembly.

## `src/gameinit.c`

- `GetStruct4`: no temporary was present to remove. The typed array access is required by the target's `mov #76; mul` stride sequence.
- `sub_8053920`: no temporary was present to remove. The direct global increment/clamp and call already match.
- `sub_8053954`: no temporary was present to remove. The direct global store and call already match.
- `sub_80540C8`: `result` is required: the target copies the original `arg0` to `r1`, transforms the magnitude in `r0`, then tests `r1` for the final sign. `arg1` remains an unused ABI parameter.

## `src/spritestring.c`

- `sub_8064F38`: `c` is required because the target loads one byte once and tests that value both for NUL termination and for space; dereferencing `*str` at both tests changes the load/register shape.
- `sub_8064F50`: `previousGroup` is required by the target's `mov r0, r4; sub r4, #1; cmp r0, #0` pre-decrement sequence. Replacing it with `group-- == 0` adds a saved register and a `-1` comparison.
- `sub_8064F84`: `c` is required by the target's initial byte test and do/while loop byte test. A direct indexed `while` moves the length initialization and changes the loop increment shape.
- `sub_8064F9C`: removed `zero`; direct zero stores still produce the target's shared zero register and exact bytes. Removed `negativeOne`; `string->timer = -1` produces the same `mov #1; neg` sequence. `mask` remains required for the two distinct negated masks, and `scale` remains required for the `0x80 << 1` stores.
- `SpriteString_8064FE8`: `state`, `i`, and `actor` remain required. In particular, `actor` preserves the pointer across the two calls; recomputing `&state->actors[i]` changes the allocator and inserts another address calculation.
- `sub_8065088`: `zero` remains required: the target materializes zero before the scale value and reuses it across all clear stores. `scale` remains required for the shared `0x80 << 1` value.
- `sub_80650E0`: no temporary was present to remove; the two field updates already match.
- `sub_80650F8`: no temporary was present to remove; the direct text assignment already matches.
- `sub_80650FC`: no temporary was present to remove; the three direct field updates already match.
- `sub_806530C`: `i` is required for the narrowed induction variable and fixed-stride actor address calculation.
- `sub_80653B0`: `i` is required for the narrowed induction variable and fixed-stride actor address calculation.
- `sub_80656B8`: `count`, `character`, `text`, and `actor` remain required. The target loads `character` once before the frame call and keeps both text and actor cursors live across it.
- `sub_806570C`: `offset` is required because the target keeps the accumulated offset in `r6` across the call and adds it to the stack argument; `i` is required for the narrowed actor-index induction.
- `sub_8065760`: `count` is required for the narrowed `maxCount` value and clamp; `offset` is required across each call; `i` is required for the narrowed induction variable.
- `sub_80657C4`: `i` is required for the narrowed actor-index induction and fixed-stride address calculation.
- `sub_80657EC`: `flags`, `mask`, and `low` remain required to preserve the target's independent low-nibble computation and the subsequent negated-mask operation order. Folding them into one expression changes the immediate/register order.

The constructor `SpriteString_8064FE8` was inspected as well even though the requested count refers to the 15 `sub_806...` functions; no cleanup matched there.
