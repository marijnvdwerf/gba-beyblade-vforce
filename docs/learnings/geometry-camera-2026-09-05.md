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

`sub_805E8D8` initializes the camera state, configures the display layers from the four `LevelDesignLayer` records, applies packed level settings and palettes, and resolves geometry addresses. The measured prototype is `void sub_805E8D8(CameraState*, LevelDesign*, unk16, s32*)`; the coordinate pointer is an interleaved x/y array. `LevelDesignLayer` has a 0x18-byte stride, and the accessed fields are the display pointer at 0x00, origin coordinates at 0x04/0x08, and flags at 0x0C. `CameraState` geometry begins at 0x228 and the accessed camera fields are at 0x220, 0x224, 0x348, 0x354, 0x355, 0x356, 0x358, 0x35C, 0x35E, 0x360, 0x362, 0x364, and 0x368.

The target keeps separate layer-origin and layer-base pointers. Scoped coordinate pointer aliases reproduce the target address-add order for the interleaved x/y loads. A scoped current-layer alias is needed for the display-presence test. Direct camera expressions for the geometry destination and final mode write avoid an otherwise unnecessary reload of the camera pointer at the tail.

The natural C draft is retained in a bare `#if 0` immediately above the restored `INCLUDE_ASM`. Its fallback display lookup is `layerBase[index].unk0`. With that source form, every instruction except the add at target offset 0x16C matches; the target emits `add r2, r3, r4`, while agbcc emits `add r2, r4, r3`. The typed expression `(layerBase - (index * -1))->unk0` produces a byte-identical function, but it is an artificial compiler-shaping expression and is not retained in source.

Measured source-shape iterations:

| Change | First divergent instruction / result |
| --- | --- |
| Natural fallback `layerBase[index].unk0` and equivalent parenthesized/index forms | Only remaining difference was `add r2,r4,r3` at target offset 0x16C. |
| Index declared `s32` or `unk32` | Changed the frame and loop lowering; no match. |
| Index declared `s16` | Changed the index conversion and register allocation; no match. |
| Scoped fallback pointer aliases or display temporaries | Changed frame size, register allocation, or scheduling across the loop. |
| Direct layer-presence access instead of a scoped alias | Also changed the condition-path add operand order at 0xCA. |
| Typed pointer subtraction with a unary negative index | Added an explicit `neg` and did not match. |
| Typed `(layerBase - (index * -1))->unk0` | Exact instruction match, but rejected as artificial source shaping. |

`sub_805E8D8` is parked with its natural draft and the dump restored. `cmake --build build --target compare` and `uv run tools/lint.py src/*.c` pass with the assembly implementation.

Review follow-up measurements:

- The four `LevelDesign.unk74` shift pairs were tested as four 2-bit fields in a packed `LevelDesignSettings` byte using fields `unk74_0`, `unk74_2`, `unk74_4`, and `unk74_6`. The packed attribute was required because the default old compiler bitfield allocation made the settings type four bytes and changed the `LevelDesign` pointer offsets and ROM. With the packed type, the structure layout and full-ROM comparison were unchanged while the camera assembly implementation remained selected.
- Compiling the parked camera draft with direct bitfield reads did not preserve the near-match: eliminating the scalar `settings` temporary changed the frame from 40 to 36 bytes and caused register/lifetime differences from the prologue onward. The best natural draft therefore retains the scalar shift extraction, while the bitfield representation is not retained.
- Replacing `quadTree->unk30 = (QuadTreeNode*)((unk8*)nodes + nodeBytes)` with `&nodes[arg4]` was first tested with `nodes` as `QuadTreeNode*`; that form changed argument register allocation and introduced a second 0x2C-byte stride computation. Keeping `QuadTreeNode` at its proven 0x2C-byte size while modeling the allocated block as an `unk8*` byte array and storing the computed byte count in `arg4` produces the exact target instruction without raw pointer arithmetic.

Coordinator follow-up typed-node experiments:

- `AllocatedBlock.address` is declared `void*` in `src/common.h` (`struct AllocatedBlock`, offset 0).
- Experiment 1 used `QuadTreeNode* nodes = quadTree->block24->address`, retained `arg4` as the computed byte size for allocation, and used `quadTree->unk2C = nodes`, `quadTree->unk30 = nodes + nodeCount`, and `quadTree->unk14[0] = nodes`. The first divergence was at function offset 0x10: target `ldr r4, [sp, #60]`, current `ldr r0, [sp, #60]`.
- Experiment 2 used the same typed `QuadTreeNode*` local and assignments but `quadTree->unk30 = &nodes[nodeCount]`. The first divergence was again at function offset 0x10: target `ldr r4, [sp, #60]`, current `ldr r0, [sp, #60]`.
- Experiment 3 removed the `arg4` byte-size local and inlined `sizeof(QuadTreeNode) * nodeCount` into `allocationSize`, with the same typed node assignments as experiment 2. The first divergence was at function offset 0x0A: target `sub sp, #28`, current `sub sp, #24`.
- None of the three typed `QuadTreeNode*` forms matched. The matching form retains `unk8* nodes`, the computed byte-size local, `&nodes[arg4]`, and the three explicit `QuadTreeNode*` conversions from the untyped allocation address.
