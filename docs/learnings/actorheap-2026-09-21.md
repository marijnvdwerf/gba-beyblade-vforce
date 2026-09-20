# actorheap — 2026-09-21

## sub_8062EFC (0x08062EFC, `src/actorheap.c`) — MATCHED

Allocates an `ActorBlock` for `count` actors: either appends at the tail of the
address-ordered list (`_unk3005E64` = high-water offset) or, when the tail would
overflow 0x100 actors, asks `sub_806306C` to splice the block into a gap.

### Signature / signedness evidence

- `count` is `s32`: `add r1, r2, r6` / `cmp r1, r0` / **`ble`** at 0x34 — the sum
  `_unk3005E64 + count` is compared signed, so neither operand may be unsigned
  (`unk32` would give `bls`). The declaration is `ActorBlock* sub_8062EFC(s32)`;
  the only caller (`SpriteString_8064FE8`, `src/spritestring.c`) passes a `u16`,
  so its object is byte-identical.
- `_unk3005E5C` is `s32`: `cmp r0, #0xff` / **`bgt`** at 0x20.
- `_unk3005E64` is `s32`: same signed compare via the sum above.
- `sub_806306C`'s result is `s32`: `cmp r3, #0` / **`bge`** at 0x44.
- The `inserted` flag is only equality-tested (`cmp r5, #0`), so it stays
  `unk32`.

### What made it match (the whole difficulty was register allocation)

Every semantically obvious shape produced the 68 target instructions with `r5`
and `r6` swapped: the target keeps `count` in r6 and the flag in r5, i.e. the
flag's allocno is allocated *before* the parameter's.

agbcc's `global_alloc` sorts allocnos by
`pri = floor_log2(n_refs) * n_refs * size / live_length * 10000`, descending,
then hands out the first free hard reg (r4 first for call-crossing allocnos).
Measured with `uv run tools/asm-annotated.py src/actorheap.c sub_8062EFC`
(`Register N used R times across L insns`):

| shape | count (param) | flag | who gets r5 |
| --- | --- | --- | --- |
| shared `block->next = NULL` after the if/else | refs 5, len 57, pri 1754 | refs 7, len 104, pri 1346 | count (wrong) |
| `block->next = NULL` duplicated into both arms | refs 5, len 58, pri 1724 | refs 8, len 106, pri **2264** | flag (match) |

Duplicating the `next` store in both arms of the `_unk3005E58 != NULL` test
raises the flag's reference count from 7 to 8, and `floor_log2` jumps 2 → 3,
which is the whole difference (1346 → 2264). agbcc then cross-jumps the two
identical `str r5, [r4, #0x10]` stores back into one shared instruction at
0x72, so the emitted code is unchanged — only the allocation order flips.
This is the byte-required shape; folding the two stores back into one statement
after the if/else reproduces all 68 instructions with r5/r6 swapped (12 rows).

Both field stores in the else arm are written as plain `NULL`; agbcc's CSE
rewrites them to reuse the flag pseudo (which holds 0 on that path), which is
why the flag's refs count them at all, and why the two `_unk3005E64 = 0` /
`_unk3005E5C = 0` stores at 0x18/0x1a also come out as `str r5`. A pointer-typed
sentinel flag (`newBlock = (ActorBlock*)1`) matches identically — the int flag
was preferred because it needs no cast.

### Things that provably do *not* move the allocation (each rebuilt and measured)

Local declaration order; copying the parameter into a local (`count = arg0`,
fully coalesced, still 1 set / len 57); `_unk3005E64 += count` vs
`_unk3005E64 = _unk3005E64 + count`; `count + _unk3005E64` operand order;
`>= 0x100` vs `> 0xFF`; `if (!inserted)` vs `== 0`; early-return-then-fallthrough
vs if-body at the tail; declaration initialisers; caching `_unk3005E58` or
`_unk3005E64` in a local (both fold away byte-identically); assignment inside the
`if ((startIndex = sub_806306C(...)) < 0)` condition; `&_actorsHeapPtr[i]` vs
`_actorsHeapPtr + i`; dead stores (removed before the counts are taken);
declaring the flag `s32` vs `unk32` vs a pointer.

Moving the flag's initialisation below the `_unk3005E60 == NULL` block *does*
shorten its live range (len 104 → 80/74/70) but then the two global zero stores
lose their source register and the code changes (22–26 differing rows): in that
form agbcc reuses the already-loaded `_unk3005E60` value (known 0 on that path)
as the zero instead.

### Byte-required temporaries

`block`, `startIndex`, `inserted` — all three are genuine values. No alias temps
survive: locals added for `_unk3005E58` / `_unk3005E64` compiled byte-identically
and were removed.

## ActorBlock canonicalization and RAM declarations

- Moved the five-field actor-heap block layout into `src/actorheap.h` as the
  canonical `ActorBlock`; removed the duplicate `SpriteStringActorBlock` from
  `src/common.h` and updated `SpriteString_8064FE8` to use `actor`/`size`.
- Retyping `sub_8062EFC` and `sub_8062FA8` from `void*` to `ActorBlock*` produced
  byte-identical functions; `SpriteString_8064FE8` also remained identical.
- Upgraded the `ram3.c` definitions and `ram.h` declarations for
  `_actorBlocksHeapPtr`, `_unk3005E58`, `_unk3005E60`, `_actorsHeapPtr` to their
  pointer types, and `_unk3005E5C`/`_unk3005E64` to `s32`, preserving their
  fixed addresses and initializers. US and EU full-ROM compares both passed.
