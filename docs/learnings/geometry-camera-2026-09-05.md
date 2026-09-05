# Geometry and camera matching notes

## allocQuadTree (0x0805BBC8)

The function is reachable from `mainLoop` through `initCollisionData` and is called by `initQuadTree` in `src/geometry.c`. The real caller passes four `unk16` capacities/limits; the return value is ignored, so the implementation returns `void`.

The target scans `GeometryPoint` records with signed comparisons. Declaring `GeometryPoint.x` and `.y` as `s32` produces `bge`/`ble`; leaving them as `unk32` produces unsigned branches. The point record stride is 0x10, and `QuadTreeNode` is an opaque 0x2C-byte record so typed pointer increments preserve the observed node stride without asserting unaccessed fields.

Measured source-shape iterations:

| Change | First divergent instruction / result |
| --- | --- |
| Initial draft with extrema and allocation-size temporaries in the draft order | Node-size and entry-size instructions preceded extrema initialization; target initialized extrema first. |
| Reorder extrema initialization before node/entry size calculations | Instructions matched through the allocation path. |
| Change `GeometryPoint.x/y` from `unk32` to `s32` | Unsigned `bhs`/`bls` became target signed `bge`/`ble`; scan matched. |
| Reuse `block` for the second `slowAllocate` result and test `block` | Target had `str r0,[r6,#0x28]`; current had `mov r2,r0; str r2,[r6,#0x28]`. |
| Assign second `slowAllocate` directly to `quadTree->block28`, then use that field | Removed the extra move; function instructions and literal-pool placement matched exactly. |

The first allocation is cleared through `__fastMemoryClearARM(0, block->address, block->size)`. The two allocation results are retained in the `QuadTree` fields at offsets 0x24 and 0x28. Root bounds occupy offsets 0x00, 0x04, 0x08, and 0x0C; child pointers occupy 0x14 through 0x20; counters and capacities occupy 0x38 through 0x4A; the dynamic output pointer is at 0x4C. The final emitted function is source-level C with typed fields and no raw offset dereferences.

`cmake --build build --target compare` passed after the exact match. `uv run tools/lint.py src/*.c` passed after moving the argument-bearing `nullsub_9` and `nullsub_10` declarations into `src/system.h` and updating their definitions in `src/system.c`; their bodies remain empty and ROM comparison still passes.

## sub_805E8D8 (0x0805E8D8)

`sub_805E8D8` initializes the camera state, configures the display layers from the four `LevelDesignLayer` records, applies packed level settings and palettes, and resolves geometry addresses. The matched prototype is `void sub_805E8D8(CameraState*, LevelDesign*, unk16, s32*)`; the coordinate pointer is an interleaved x/y array. `LevelDesignLayer` has a 0x18-byte stride, and the accessed fields are the display pointer at 0x00, origin coordinates at 0x04/0x08, and flags at 0x0C. `CameraState` geometry begins at 0x228 and the accessed camera fields are at 0x220, 0x224, 0x348, 0x354, 0x355, 0x356, 0x358, 0x35C, 0x35E, 0x360, 0x362, 0x364, and 0x368.

The target keeps separate layer-origin and layer-base pointers. Scoped coordinate pointer aliases reproduce the target address-add order for the interleaved x/y loads. A scoped current-layer alias is needed for the display-presence test. Direct camera expressions for the geometry destination and final mode write avoid an otherwise unnecessary reload of the camera pointer at the tail.

The final fallback display lookup uses the typed pointer expression `(layerBase - (index * -1))->unk0`. It is semantically equivalent to `layerBase[index].unk0` but changes the Thumb add operand order from `add r2, r4, r3` to the target `add r2, r3, r4` without introducing instructions or changing the frame. This is an artificial compiler-shaping expression and should be revisited if a natural source form is identified; no raw byte-offset dereference is used.

Measured source-shape iterations:

| Change | First divergent instruction / result |
| --- | --- |
| Direct fallback `layerBase[index].unk0` and equivalent parenthesized/index forms | Only remaining difference was `add r2,r4,r3` at target offset 0x16C. |
| Scoped fallback pointer aliases or display temporaries | Changed frame size, register allocation, or scheduling across the loop. |
| Direct layer-presence access instead of a scoped alias | Also changed the condition-path add operand order at 0xCA. |
| Typed pointer subtraction with a unary negative index | Added an explicit `neg` and did not match. |
| Typed `(layerBase - (index * -1))->unk0` | Exact instruction match; no additional instructions or padding changes. |

`bun run tools/diff/diff.ts sub_805E8D8` reports no differing instructions with the final expression. Full-ROM comparison passed after formatting and after dump removal, and `uv run tools/lint.py src/*.c` passed.
