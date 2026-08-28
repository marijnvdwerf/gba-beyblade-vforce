# agbcc: `&global.member` folds into one literal; a member load does not

Proven on sub_8048FFC (frontend.c) and background.c, 2026-08-28.

- `p = &_unk3000650.transition.unk590;` compiles to a single literal-pool word
  `_unk3000650+0x590` (R_ARM_ABS32 with addend). Every background.c function
  that matched uses this address-of form for the 0x590 sub-object.
- `_unk3000650.transition.unk590.var0C->unkEC` (a member LOAD at a large
  offset, no address taken) compiles to `ldr =_unk3000650; ldr =0x59C; add`
  — base plus a second literal — and does not match a target that has the
  direct literal.
- Small offsets (< 0x80 for word loads) from a base register use the
  immediate form either way; the difference only shows for large offsets.

Consequence: a target with a direct literal to an interior address of a big
global is NOT evidence of a separate object. Write the sub-object alias
(`T* x = &big.sub;`) and use it — that is how these authors wrote it.
Corollary for parked drafts: sub_804967C's `_unk3000A78` literal is the same
idiom for `&_unk3000650.unk428`-style sub-objects.
