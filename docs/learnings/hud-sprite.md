# HUD and sprite cleanup matching notes

## LoadHUD

`LoadHUD` matched with a typed `GameData` layout rather than offset casts. The
HUD fields from `0x1044` through `0x1080` need their actual widths: the fields
at `0x1054` through `0x105E` are halfwords, the sprite handles are pointers,
and `0x107C` and `0x107D` are bytes. Extending the existing struct while
preserving the padding keeps the later `actorData` offset unchanged.

The compiler emitted the expected calls once the resource arguments were
fully prototyped as pointers. Empty-parentheses declarations were insufficient
for this old compiler: `allocFont` has seven arguments and `LoadSpriteSheet`
has eight. `LevelDescription.unk1` is a byte at offset `0x01`; adding that
field directly preserves the structure size and gives the call site a typed
read.

## sub_8060CDC

The final source uses only the natural list locals (`n`, `first`, `last`,
`prev`, `next`, and `cur`). The initial zero test, counter update, and loop
counter read the block size directly; assigning `n` immediately before
`while (n--)` preserves the compiler's countdown shape without a named
sentinel or separate count. The unlink and free-list operations use the
actual globals directly, and the compiler forwards the new head in the
`prev == NULL` branch to produce the target `ldr; str; mov` sequence.

The pinned `_spritesFree` global is declared as `u32` in `src/ram3.c` and in
its extern declaration. The final implementation uses no raw offset
dereferences or pointer-storage temporaries.
