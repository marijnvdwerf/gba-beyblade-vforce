# Sprite VRAM matching notes

## `freeSpriteVramLocation`

The free-list routine remains in assembly for now. Its verified target body is
`asm/dump/8057b80-debug/8060808-freeSpriteVramLocation.s`; leaving the
`INCLUDE_ASM` in `src/sprite.c` gives an exact instruction match and preserves
the ROM compare.

The important target shape, useful for a future natural-C attempt, is:

- save `r8` and `r9`, then keep the addresses of `_unk3005DC8` and
  `_unk3005DD8` in those registers;
- keep the requested start in `r7`, size in `r5`, current free-list entry in
  `r2`, free-list entry in `r4`, and previous entry in `r6`;
- cache `start + size` in `r12` before traversing the list;
- use halfword accesses for the `var00` and `var02` fields;
- perform the insertion/extension pass first and the adjacent-entry coalescing
  pass second.

A natural raw-decomp-shaped implementation reached the correct semantics but
not the target allocation. The first prologue divergence was `mov r6, r0`
where the target has `mov r7, r0`; pointer-to-pointer aliases similarly moved
the global-list addresses and changed the callee-saved register layout. Adding
`start`/`end` temporaries got the saved-register prologue closer but still put
`start`, `end`, and `previous` in the wrong registers. A direct-global `goto`
variant improved literal-pool placement and control-flow shape, but its first
register divergence was `mov r5, r0` / `mov r6, r1` instead of the target's
`mov r7, r0` / `mov r5, r1`. Changing the size parameter to `s16` was also
wrong: agbcc inserted `lsl r1, #16` and `lsr r6, r1, #16`, which are absent
from the target. The parameter must remain `s32` in the current caller-backed
interface.

## `sub_8060E8C`

`sub_8060E8C` is also intentionally left as:

```c
INCLUDE_ASM("asm/dump/8057b80-debug/8060e8c.s");
```

The best natural body reached about 67% and captured the sprite-reuse,
special-case removal, table arithmetic, and packed halfword stores, but it was
not suitable to activate. The first prologue divergence across the natural
variants was in the argument/pointer allocation: variants placed the sprite
pointer or table temporaries in different registers before the first table
lookup. The required roles established from the target are:

- sprite pointer: `r5`
- first argument: `r7`
- second argument: `r8`
- frame argument: `r6`
- first signed table result: `r4`

The target also normalizes the two `u16` arguments and the `u8` frame with the
corresponding shift pairs. The next natural attempt should first make those
argument types and lifetimes explicit, then preserve the first signed table
result across the subsequent table lookup and stores. It should avoid register
pinning and inline assembly; the remaining problem is source shape and
liveness, not semantics.
