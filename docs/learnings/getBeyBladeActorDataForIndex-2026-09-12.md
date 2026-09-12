# getBeyBladeActorDataForIndex

Matched at 0x08057258 in src/beyblade.c. Reachable from mainLoop through
initRider. The disabled initRider C draft and active assembly caller pass
the returned data to actor_8057C58. The function returns either a cached
allocation address, newly decompressed data, or the uncompressed ROM data.

The prior draft incorrectly read compressedSize from BeybladeData and
repeated decompression/palette allocation for a cache hit. Target +0x60
loads the compression header from the sprite sheet; allocation uses that
word shifted right by eight. A non-null cached block skips decompression
and palette selection. The target still dereferences the allocation after
printing an allocation-failure diagnostic; this behavior is preserved.

## Types and layout

- Signed index is proven by BLE against 0x3B. Palette bit iteration uses
  signed BLE/BGT, with halfword integer promotion producing ASR.
- BeybladeData offset 0x31 is accessed with LDRB; added unk31 within the
  existing padding. Size remains 0x34.
- RiderSpriteSheets is declared in its sole active consumer as an array of
  word pointers, matching the compression-header read. The returned data
  keeps a void pointer interface for compressed/uncompressed alternatives.
- GameData's actorData array and following mask now form BeybladeActorCache:
  records[0x3C], unk1E0, two bytes of padding. This keeps the target's cache
  base in r8 through the call and uses cache+0x1E0 for the mask update.
  The initial mask read remains through gameData->actorData.unk1E0.

Actual agbcc compile-time assertions verified cache size 0x1E4, mask offset
0x1E0, GameData cache offset 0x1110, following collectables offset 0x12F4,
BeybladeData size 0x34 and unk31 offset 0x31.

## Temporary reduction

- block removed: direct record->block reads/assignment match the ROM.
- flags removed: the direct halfword expression promotes to signed int and
  produces the required arithmetic shift byte-identically.
- record retained: folding first changes the literal load at +0x8 and
  removes the early indexed-record lifetime.
- cache retained: folding first differs at +0x2 and removes the r8 save.
- gameData retained: folding first changes the literal load at +0x8 and
  subsequent global reloads.
- data retained: folding `getBeybladeData0(index)->unk31` first differs at +0x6,
  adding the call before the sprite-sheet setup and changing register allocation.

No casts on struct fields, raw offsets, invented control flow, or register
hacks remain. The data lookup is deliberately before the range check, as in
the assembly; moving it into its sole later use would change that behavior.

After clang-format, instruction diffs are exact for this function and all
four other cache users: emptyBeybladeActorData, deallocBeybladeActorData,
getBeybladeActorData and allocateBeybladeObjectPalettes. Full ROM compare
passes SHA1 cd527c8c24e20e33913fc45199e64b3e6138a6e5.
