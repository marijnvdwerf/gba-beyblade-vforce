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

The list unlink/free logic matched using typed `SpriteEntry` fields. The
remaining allocation-sensitive branch required retaining the address of
`_unk3005DE4` after the store. A separate pointer local for the storage
location naturally produces the target sequence `ldr; str; mov`, while the
common branch keeps the head-pointer local for the final consistency check.

The global counter can remain directly typed (`_spritesFree += size`); a cast
is not needed to obtain the expected width. The final implementation uses no
raw offset dereferences.
