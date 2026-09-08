# Singleton leaf matching notes

## sub_805185C (0x0805185C)

Matched in `src/gamestate.c`. The target loads `_currentGameState` and stores the
`s8` parameter as a byte at offset `0x2`; `_currentGameState->unk2 = value`
produces the exact `ldr`, `ldr`, `strb`, and `bx lr` sequence. The `s8`
parameter is proven by the two `festate.c` call sites: each narrows
`FrontendBladeState.unk34` with `ldrb; lsl #24; asr #24` before
`bl sub_805185C`; the existing `src/gamestate.h:25` prototype agrees.
`CurrentGameState.unk2` remains `u8`; its byte store does not prove parameter
signedness. No temporary is byte-required, and no signedness change, cast, raw
offset, or artificial shape was needed.

`cmake --build build --target compare` passed and the assembly dump was removed.

## sub_805747C (0x0805747C)

Matched in `src/beyblade.c`. The target is the sixth language-row getter: the
literal `_807D7AC` points to five language rows (`_807D2FC` through `_807D6BC`),
and `_807D7AC[getLanguage()][arg0]` reproduces the exact indexed pointer loads.
The existing `const unk8*` return type and `unk32` index are sufficient; no
local, cast, or signedness change is byte-required.

`cmake --build build --target compare` passed and the assembly dump was removed.

## sub_804E124 (0x0804E124)

Matched in `src/riderphysics.c` with `void sub_804E124(RiderBase*, GeometryLine*)`.
The parked collision caller and the target body prove the second argument is a
`GeometryLine*`, not a `LevelGeometryAddresses*`. The target tests bit 1 of the
byte at `GeometryLine + 0x11` with a raw `ldrb` and `and #2`, then subtracts
or adds `(s8)line->unk18 * 5 >> 3` to `RiderBase->unk40` or `unk44`.

The previous speculative `unk11_0 : 3` field generated normalization shifts for
this use. Splitting the allocation unit into `unk11_0 : 1`, `unk11_1 : 1`,
`unk11_2 : 1`, `unk11_3 : 1`, and `unk11_4 : 4`, then testing `unk11_1`, emits
the target raw byte mask. Existing users of `unk11_3` remained instruction-
identical after the layout correction: `sub_8055D64`,
`allocateDynamicBoundingAreas`, and `initQuadTreeNode` all still diff exactly.
`unk18` is `s8`, proven by the target `ldsb`; the fixed `GeometryLine` size
remains 0x20 bytes.

No temporary, cast, raw offset, or artificial shape is byte-required. The
prototype was added to `src/riderphysics.h`, and `cmake --build build --target
compare` passed after the dump was removed.
