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

Not started in this pass.
