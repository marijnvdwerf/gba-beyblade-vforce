# Small leaf matching notes

These caller-backed leaf functions matched with natural C and the final ROM compare passed.

## Functions

- `sub_8061204`: A shared cleanup layout needs a typed object with the nested region represented as an array field and the trailing sprite pointer as a word pointer. Passing the array field directly forms the `+0x14` address, while a direct pointer field reproduces the load, null test, two cleanup calls, and final clear.
- `sub_805BA3C`: A small typed layout with the owned block at offset `0x10` reproduces the conditional deallocation and unconditional nulling. The function must remain in source order after the two preceding assembly functions.
- `deallocateQuadTree`: Two typed `AllocatedBlock*` fields at offsets `0x24` and `0x28` allow direct null checks, deallocation calls, and clears; the natural pointer form still matches exactly.
- `sub_804A72C`: Splitting a fixed-layout padding range to expose a word field at `GameData` offset `0x13FC` produces the same address calculation and store without raw offset dereference.
- `emptyBeybladeActorData`: The `0x1110` region is naturally a 60-element array of eight-byte records (`AllocatedBlock*` at offset zero and a byte at offset four). A plain ascending `for` loop with a signed `s32` index matches the target.
- `deallocBeybladeActorData`: Reusing the same typed record array and a plain ascending `for` loop, deallocating only non-null blocks and then clearing them, matches exactly.
- `sub_8055CB8`: Fixed globals retain their existing addresses when their declarations are upgraded to their actual word width. Passing the callback function names directly as `void*` (without explicit `+ 1` Thumb-bit arithmetic) still matches exactly.
- `sub_804F800`: A local copy of `_gameData` must be initialized before the signed clamp so the target loads the global pointer before the comparisons. The destination remains an `unk8` field, despite the `s32` argument.
- `sub_804FEE8`: Four contiguous sprite-text cleanup objects, two `UnkMotion` fields, and a word status field preserve the fixed layout. The global base, first HUD object, and status address must remain separate locals to reproduce the conditional reset followed by four cleanup calls.

## Repeatable agbcc patterns

- **Preserve source order around address materialization.** If the target loads a global pointer before a clamp or computes two derived addresses before the first store, initialize the corresponding local pointers in that order. Moving a direct global field access later can change the first instruction even when the final store is equivalent.
- **Use typed padding splits for fixed layouts.** Replace only the necessary padding span with a shared struct or field, then restore the exact following offset with explicit padding. Check every downstream field and object address after the change.
- **Represent repeated fixed-size records as arrays.** When a loop advances by a constant record size and accesses fields at fixed offsets, a shared record struct plus an array gives natural pointer increments and correct access widths. A signed `s32` counter with an explicit decrement-before-test can reproduce `sub`, `cmp #0`, and `bge`.
- **Use arrays for address-only subregions.** An array field decays to the address of its first byte without introducing a scalar load; this is the honest typed replacement for passing an opaque subregion to a cleanup routine.
- **Model fixed-width globals at their accessed width.** If the target emits a word store to a fixed global, declare the symbol as a word-sized object (or word array) while preserving its total byte extent. This avoids per-use casts and lets the compiler emit the target store directly.
- **Treat function placement as part of matching.** Replace an `INCLUDE_ASM` in exactly its original position. Adding a C definition at the top of a translation unit moves every following function and invalidates the ROM even when the new function's own instructions match.
- **A shared zero local can control reuse.** When two cleanup passes use the same zero register in the target, one zero local whose lifetime spans both passes can reproduce the allocation; direct `NULL` stores are preferable when the target materializes a fresh zero at each use.

## Cleanup pass results

- The `deallocateQuadTree` cleanup from integer temporaries and `(AllocatedBlock*)` casts to direct typed-pointer checks and calls passed `cmake --build build --target compare`.
- The actor-data cleanup passed: `BeybladeActorData.block` is an `AllocatedBlock*`, and both signed countdown loops were replaced by plain ascending `for` loops without changing the ROM.
- The `sub_8055CB8` cleanup passed. `withBoundingAreaCount` is now a single `unk32` field, with `_unk3000C1C[4]` retaining the unused four-byte portion of the original fixed span. Direct callback names cast to `void*` matched the prior explicit `(unk32)fn + 1` form.
- The proposed direct-global form of `sub_804F800` did not match. Replacing the early `GameData* base = _gameData` local with `_gameData->unk107C` after the clamps changed the ROM SHA1 from `cd527c8c24e20e33913fc45199e64b3e6138a6e5` to `086ebb078f3c454a03c0cd25fe7683f76992d7f0`. The closest natural matching form retains the local base initialized before the clamps, because agbcc must materialize `_gameData` before the signed comparisons.
- The proposed direct-global form of `sub_804FEE8` did not match. Replacing the `base`, `hud`, and `status` locals with repeated `_gameData` expressions changed the ROM SHA1 from `cd527c8c24e20e33913fc45199e64b3e6138a6e5` to `82b4f52d8aac3616875f1515c39f1ee0417ccc6d`. The closest natural matching form retains all three locals; their lifetimes and address materialization order reproduce the target register allocation and loads.
- Correcting `QuadTree` to end at `0x7FC` (`pad2C[0x2C]`) and adding `GameData.pad7FC[0x14]` preserved `unk810` while exposing the proven fields at `0x7FC..0x80B`; the full ROM compare passed.
