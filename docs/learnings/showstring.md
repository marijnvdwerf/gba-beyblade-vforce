# showString decompilation learnings

## Matched function

- `showString` (`0x080614BC`, `src/spritetext.c`) now matches the expected object and ROM.

## Source-shape notes

- The `SpriteEntry` layout is shared in `src/sprite.h`; `showString` accesses typed fields rather than raw offsets.
- `SpriteTextCleanup` embeds its `SpriteTextBlock` list header at offset `0x14`.
- The eight-argument `LoadSpriteSheet` declaration is required to preserve the stack argument layout.
- A signed `s32 offset` temporary for `arg0->unk29` steers agbcc to emit the target `add r0, r5, r0` before narrowing back to the advance value.
- The null and empty-string paths use value-less `return;` statements in this non-void function. agbcc accepts them without warning under the project flags and reaches the epilogue with `r0 == 0`; the allocation-failure path explicitly returns zero.
- The duplicate `child->frame` branches are retained because collapsing them changes register allocation and the generated instruction shape.

## Verification

`cmake --build build --target compare` passed.
