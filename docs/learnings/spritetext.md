# Sprite text decompilation learnings

## Matched functions

- `showNumber_2` (`0x08061980`, `src/spritetext.c`): a reset wrapper that calls `sub_8061228` and then forwards to `showNumber`.
- `allocFont` (`0x08061190`, `src/spritetext.c`): matched after typing the fixed-size text cleanup object and preserving byte-width fields at offsets `0x0E` and `0x0F`.
- `showNumber` (`0x080618D0`, `src/spritetext.c`): matched with signed negative handling, reverse decimal construction, optional comma grouping, and the existing `Div`/`DivRem` helpers.

## Parked function

`LoadSpriteSheet` (`0x08060B68`, `src/sprite.c`) remains assembly-backed. Its semantic draft is retained under `#if 0` immediately above the restored `INCLUDE_ASM`. The draft matches the metadata reads, flag construction, source-offset fallback, and initialization stores semantically, but not instruction-for-instruction.

The unresolved layout issue is an overlapping interpretation of the sprite entry. The target instruction at the end of `LoadSpriteSheet` is:

```asm
strh r2, [r7, #24]
```

This writes a halfword at `SpriteEntry + 0x18`, with `r2` originating from the normalized eighth parameter (`arg7`, narrowed to the frame value). Existing C sprite routines independently read and write the byte at `SpriteEntry + 0x19`. In particular, `sub_8060B38` reads it with `ldrb r0, [r3, #25]`, and `sub_8061158`/`sub_8061160` write it with byte stores. A non-overlapping C struct cannot represent both the halfword at `0x18` and a separate byte at `0x19` without a policy decision about the original punned field.

The parked draft also differs in the argument-load schedule. The target loads the fifth parameter (`arg5`, stack offset `0x24` after the prologue, shown by the diff as `[sp, #36]`) into the long-lived `r9` path before loading the sixth parameter (`arg6`, `[sp, #40]`). The clean typed draft defers the `arg5` load until the OAM attribute expression, producing the first divergence at the target's `ldr r0, [sp, #36]` / `mov r9, r0` versus the draft's `ldr r4, [sp, #40]`. Attempts to force this with artificial fixed-register locals were not retained in active code.

## General agbcc patterns

- Narrow local values are often normalized with shifts immediately after their stack load; preserving the source width is preferable to spelling out those shifts manually.
- Declaration and expression order can affect which callee-saved register carries a long-lived stack argument, even when the C operations are equivalent.
- Embedded list headers must be modeled as embedded fields when callers pass their address; modeling the header as a pointer changes both cleanup behavior and object layout.
- Field width determines store width. A byte-versus-halfword disagreement at adjacent offsets can indicate a deliberately punned original layout rather than an ordinary independent pair of fields.
