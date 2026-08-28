# Gameplay humanization tests

All six functions remain assembly-backed. Each natural rewrite is retained directly above its active `INCLUDE_ASM` in a bare `#if 0` block. Sizes below are target function sizes unless a separate frame or draft delta is stated.

## `sub_806014C` — `0x0806014C`

The semantic packet-comparison rewrite did not match. The first persistent divergence was at offset `0x0E`:

```text
target: mov r6, r1
 draft: mov r8, r1
```

The target keeps the second pointer argument in `r6`, the narrowed byte argument in `r8`, the player byte in `r9`, the multiplayer-state address in `r7`, and the local flag in `sl`. The natural rewrite instead colors these values differently. The target reloads `_unk3005DC4` after the callback; the natural rewrite reproduced that reload only with `volatile`, which is prohibited. The dump remains active.

| Change | First divergence or size result |
| --- | --- |
| Direct typed-field rewrite | `0x0E`: target `mov r6, r1`; draft `mov r8, r1` |
| Reordered local declarations | No change; `0x0E` |
| Widened `player` temporary | No change; `0x0E` |
| Wide formal with a narrow local | No change; `0x0E` |
| Cached second pointer argument | Frame grew by `0x4`; rejected |
| `void*` pointer arguments | No change; `0x0E` |
| Cached `MultiPlayerState*` | No improvement; `0x0E` |
| `volatile` reload experiment | Reproduced a reload but used a prohibited matching lever; rejected |

No function-size delta was retained for the best draft. The target size is `0x29C` bytes.

## `initMultiPlayer` — `0x0805FED0`

The best natural rewrite computes the packet and allocation sizes, initializes the multiplayer state, derives four packet-buffer pointers, clears the packet area, and configures the serial registers. It remains disabled above the active assembly. After the prototype was corrected to use the caller-proven `unk16` serial-mode parameter, the initial frame difference was:

```text
target: sub sp, #4
 draft: sub sp, #8
```

The best reduced-frame draft then first diverged at offset `0x0E`; the target copies the packet-size argument to `r8`, while the draft allocates it in `r5` and retains the normalized serial mode in another register. The target size is `0x137`; the best draft was `+0x2` bytes.

| Change | First divergence or size result |
| --- | --- |
| Humanized rewrite with a base alias | Prologue frame `0x8` instead of target `0x4` |
| Removed the base alias | Frame `0x4`; `0x0E` packet-size register differs (`r5` vs `r8`) |
| Staged `headerSize + 0x44` before block-address use | No improvement to entry allocation |
| Pointer-first declaration order | No improvement to entry allocation |
| Separate `totalSize` and `allocSize` locals | Preserved the frame but did not resolve the register role |
| Original parked temporary source shape | Frame `0x4`; `0x0E` remains; draft `+0x2` bytes |
| Narrowed serial-mode formal to `unk16` | Restored the target halfword normalization, but not the packet-size allocation |
| Narrowed first argument to `unk8` | Added unwanted byte normalization at entry; rejected |

The dump remains active and the natural draft is retained in `src/multiplayer.c`.

## `initEventListeners` — `0x080540EC`

The VLA rewrite has the correct semantic and structural shape. A local `s32 listenerIds[maxListeners]` produces the target split fixed/dynamic frame, and `*listenerPtr++ = i` produces the target moving `stmia` store. The target function size is `0x141`; the best VLA draft has no retained function-size delta, but the count and maximum values are assigned to opposite registers.

The first persistent difference is the register coloring of the count/max pair after the VLA setup: the target keeps listener count in `sl` and the maximum (`0x20`) in `r6`, while the draft keeps count in `r6` and the maximum in `sl`.

| Change | First divergence or size result |
| --- | --- |
| Fixed local listener array | Frame shape wrong: one fixed `0x19C` frame instead of the split VLA frame |
| VLA with moving listener cursor | Frame and `stmia` store match; count/max register roles differ |
| Declaration-order permutations | No register swap without other instruction changes |
| Nested VLA and cursor scopes | Changed liveness or loop shape; no match |
| Guarded `do/while` variants | Changed loop branches; no match |
| Indexed listener stores | Replaced target `stmia` with address arithmetic and `str`; rejected |
| `const s32 maxListeners` | Constant-propagated the maximum and removed the target register comparison |
| Literal `0x20` in the comparison | Produced immediate comparisons instead of the target register comparison |
| Unsigned count/max and increment-order variants | No match without changing other instructions |
| `listenerCount = listenerCount + 1` | Reproduced the target `mov r2, #1; add` shape but not its register assignment |

The `.greg` counts explain the stable allocator choice in the natural draft: listener count has `refs = 14`, `live_length = 184`, while the maximum has `refs = 5`, `live_length = 114`. No speculative header layout was needed.

## `sub_805529C` — `0x0805529C`

The natural effects-layer rewrite is semantically complete but does not match. The first persistent difference is in the prologue at offset `0x0`. The target is `0x32` bytes longer than the natural draft. The target size is `0x69` bytes; the best draft is therefore `0x37` bytes.

| Change | First divergence or size result |
| --- | --- |
| m2c semantic draft with raw offset accesses | Prologue divergence at `0x0`; draft `0x32` bytes shorter |
| Typed `ProjectileSystem*` and typed layer fields | Prologue divergence unchanged; no size recovery |
| Signed countdown index | Removed an unconditional-loop artifact; prologue still diverged |
| Cached `GameData*` and `ProjectileSystem*` | Retained extra long-lived values; no improvement |
| Direct `_gameData` projectile updates | No improvement; prologue still diverged |
| Layer pointer cursor over the three effect layers | Preserved semantics but did not recover target saved-register allocation |
| `volatile` experiments | Not used; prohibited as a matching lever |

The dump remains active. The natural draft's direct typed fields are retained only inside `#if 0`.

## `initRiders` — `0x08053600`

The corrected natural rewrite preserves the successful `loadLevelGeometry` result, uses the geometry line's two point indices, and keeps the multiplayer-line handling semantically separate. The target frame is `0x134`; every tested natural draft uses `0x138`, a `+0x4` frame delta associated with one extra long-lived geometry/local value. The target size is `0x349` bytes.

The best semantically corrected draft first diverges immediately after initializing `initialized`:

```text
target: mov r9, r0
 draft: mov r8, r0
```

This is the initial zero value for `riderIndex`. The target then keeps rider index in `r9`, the primary line index in `sl`, the current line in `r8`, and coordinates in `r7`, `r6`, and `r4`.

| Change | First divergence or size result |
| --- | --- |
| Initial raw m2c-style line/point accesses | Failed to compile because the draft used a nonexistent line field |
| Typed `GeometryLine` point fields | Recovered the correct semantic point loads; frame remained `0x138` |
| Cached ordinary line and point pointers | Added an extra live geometry value; frame `0x138` |
| Rematerialized line/point addresses at use sites | Reduced explicit aliases but still frame `0x138`; coordinate/offset spill remained |
| Scoped coordinate and line-type locals | Changed stack-slot placement; no frame reduction |
| Reordered scalar declarations | Changed local coloring in variants but not the target allocation |
| Multiplayer line represented by an index | Corrected sentinel semantics but introduced another spill; frame `0x138` |
| Multiplayer line represented by a scoped pointer | Better optional-line stack behavior; rider-index coloring still differs |
| Passed successful geometry load result to address setup | Removed an incorrect zero argument; register allocation still differs |
| Recomputed selected-line address instead of retaining a pointer | Best lifetime reduction candidate; target frame still `0x134` vs draft `0x138` |

The dump remains active and the draft is retained without promoting its speculative `RiderBase` fields into canonical headers.

## `initLevelEnvironmentActors` — `0x08054768`

The large natural rewrite models the metadata scan, contiguous allocation, point table, actor/effect initialization, sprite loading, transforms, and line-object geometry. The target frame is `0x268`; the best draft is `0x26C`, a `+0x4` frame delta caused by one extra long-lived actor-loop value. The target size is `0x656` bytes.

The first unresolved difference is in the point-initialization loop's register/lifetime setup. The target keeps the geometry-address pointer in `r6` and the computed line in `r4`; the draft assigns these roles differently before the same point-table stores. The actor-loop then retains an extra selected-line/sprite/state value in the draft.

| Change | First divergence or size result |
| --- | --- |
| Typed semantic draft with speculative environment types | Did not compile until confined to `#if 0`; target frame `0x268`, draft frame `0x26C` |
| Recovered `u16` level signature | Correct caller ABI; frame remained `0x26C` |
| Corrected actor position stores to `+4`, `+8`, `+C` | Improved field widths and stores; frame remained `0x26C` |
| Typed point table with 8-byte entries | Recovered point/line indexing semantics; point-loop register roles still differ |
| Actor-config cursor versus indexed selected-line storage | Changed metadata-scan order by two instructions; no exact match |
| Guarded pre-test plus bottom-tested `do/while` point loop | Recovered loop branch shape but not `r4`/`r6` allocation |
| Separate point-geometry alias | Reproduced target point-loop roles but introduced an extra local/slot |
| Selected-line pointers and direct line-object indexing | No removal of actor-loop extra slot |
| Nested locals and declaration-order permutations | Changed individual slots/registers; frame remained `0x26C` |
| `spriteId` counter reduction and computed priority | Did not recover the complete target actor-loop sequence |
| `volatile` storage experiments | Not used; prohibited as a matching lever |

The speculative allocation/configuration/state/meta structures were not added to canonical headers. The dump remains active and the best draft is retained in `src/envactor.c`.
