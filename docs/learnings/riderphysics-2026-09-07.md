# sub_804D8D8 parked matching notes

Function `sub_804D8D8` at `0x0804D8D8` remains assembly-backed. The semantic draft is retained in `#if 0` immediately above the unchanged `INCLUDE_ASM` line in `src/riderphysics.c`. The draft uses a local `RiderBaseDraft` layout because the fields used only by this parked function are not part of the shared `RiderBase` definition.

## First divergence

The best ordinary cached draft had the correct semantics and operation widths but a stable register-allocation residual. Its first divergence was the initial threshold staging. The target sequence is:

```asm
mov   r5, #0
ldrsh r4, [r0, r5]
add   r0, #4
mov   r5, #0
ldrsh r3, [r0, r5]
mov   sl, r3
```

The ordinary draft instead began the same staging with:

```asm
mov   r3, #0
ldrsh r4, [r0, r3]
mov   sl, r4
add   r0, #4
mov   r3, #0
ldrsh r4, [r0, r3]
```

The target therefore keeps the maximum-X threshold in `r4` and the initial secondary threshold in `sl`; the ordinary draft reverses those two roles. The target later reloads `unk40` and `unk44` before normalization, while the ordinary draft retains the post-step `x` and `y` locals. Direct reload experiments changed the earlier allocation before improving that tail, so the function was parked rather than forced with artificial aliases or register controls.

## Allocation residual

| Value or role | Target register | Ordinary cached draft | Observed variants |
| --- | --- | --- | --- |
| maximum-X threshold | `r4` | `sl` | rotated with `r4`/`sl` |
| initial secondary threshold from `unk58` | `sl` | `r4` | rotated with `r4`/`r9` |
| X direction delta | `r9` | `r9` in the baseline | rotated with `r8`/`r9` |
| Y direction delta | `r8` | `r8` in the baseline | rotated with `r4`/`r8` |

The prologue and scratch-draft field widths were otherwise justified. The parked-only ranges at `0x54` through `0x60`, `0x64` through `0x6B`, and `0x8C` remain padding in `RiderBase` and are represented only by the scratch layout inside the excluded draft.

The shared-header signedness checkpoint was subsequently audited against committed C users. No committed user supplied a signed-load or signed-branch proof for these seven fields; the signed declarations were removed, restoring the prior `unk32`/`unk16`/padding layout without changing storage size. Each committed user below was re-diffed while the signed declarations were present and matched exactly.

| Field | Committed matched user(s) re-diffed | Signed target instruction | Result |
| --- | --- | --- | --- |
| `unk40` | `sub_804CB08`, `sub_804D048`, `rider_vs_rider_collision_804DB94` | None; target users use word loads/stores and arithmetic | Restored `unk32` |
| `unk44` | `sub_804CB08`, `sub_804D048`, `rider_vs_rider_collision_804DB94` | None; target users use word loads/stores and arithmetic | Restored `unk32` |
| `unk48` | `sub_804D104` | None; target is `ldr`/`str` copy only | Restored `unk32` |
| `unk4C` | `sub_804D104` | None; target is `ldr`/`str` copy only | Restored `unk32` |
| `unk50` | `processRiderMetadata`, `sub_804CB08`, `sub_804D110` | None; target users write `strh` timer values only | Restored `unk16` |
| `unk52` | `processRiderMetadata`, `sub_804CB08`, `sub_804D110` | None; target users write `strh` timer values only | Restored `unk16` |
| `unk62` | No committed matched user; all source references are in excluded drafts | None | Restored padding; retained in `RiderBaseDraft` only |

## Lifetime and source-shape experiments

The count is the number of `!` instruction-diff lines reported for the experiment. “Initial threshold staging” means the target-versus-draft sequence shown above remained the first divergence.

| Experiment | Source change | `!` count | First divergent shape |
| --- | --- | ---: | --- |
| exp001 | Swapped `maxY`/`maxX` declaration order | 34 | Initial threshold staging |
| exp002 | Restored target-compatible second-flag branch polarity | 31 | Initial threshold staging after the branch was corrected |
| exp003 | Restored original threshold declaration order | 31 | Initial threshold staging |
| exp004 | Narrow `s16` threshold locals | 20 | First threshold loads became `ldrh` plus sign-normalization, not the target `ldrsh` shape |
| exp005 | Added a separate `z` local | 42 | Prologue/register pressure introduced a stack spill |
| exp006 | Used a conditional expression for the `maxX` update | 31 | Initial threshold staging |
| exp007 | Scoped the initial secondary threshold locally | 32 | Initial threshold staging |
| exp008 | Reversed threshold staging order | 39 | Threshold pointer walk changed to `add #6; sub #4` instead of `add #2; add #4` |
| exp009 | Used separate phase-scoped `maxY` locals | 32 | Initial threshold staging |
| exp010 | Used direct speed-field expressions | 40 | Speed/threshold entry loads no longer matched the target staging |
| exp011 | Used unsigned direction temporaries | 31 | Initial threshold staging remained unchanged |
| exp012 | Reloaded coordinates directly for normalization | 60 | Early coordinate/threshold register staging reshuffled before the tail reloads |
| exp013 | Used unsigned `length` | 33 | Normalization selected `__udivsi3` rather than the target signed division |
| exp014 | Swapped threshold variable roles | 31 | Initial threshold staging |
| exp015 | Used direct `speedY` with cached `speedX` | 31 | Initial threshold staging |
| exp016 | Used direct `speedX` with cached `speedY` | 31 | Initial threshold staging |
| exp017 | Used unsigned thresholds with signed comparison casts | 31 | Initial threshold staging |
| exp018 | Shared the flag constant through a temporary | 49 | Prologue/register pressure introduced a stack spill |
| exp019 | Added explicit flag-result shifts | 31 | Initial threshold staging |
| exp020 | Added an explicit X-threshold check temporary | 31 | Initial threshold staging |
| exp021 | Added an explicit Y-threshold check temporary | 31 | Initial threshold staging |
| exp022 | Added explicit absolute-value temporaries | 31 | Initial threshold staging |
| exp023 | Changed `speedX` and `speedY` locals from `s32` to `s16` | 41 | Speed-field staging gained extra loads and diverged before the threshold residual |

The final parked draft is the typed checkpoint form, not exp023. No `volatile`, register pinning, inline assembly, fake symbol, or artificial matching guard was used.

# sub_804DDF8 parked matching notes

Function `sub_804DDF8` at `0x0804DDF8` remains assembly-backed. The best ordinary source draft is retained in a `#if 0` block immediately above the unchanged `INCLUDE_ASM` line in `src/riderphysics.c`. Its draft-only `RiderDDF8Draft` layout is confined to that block; the shared `RiderBase` definition was restored because no committed user proved the parked fields.

## First divergence

The best staged-initialization draft has the reconstructed vector and matrix semantics, the target 112-byte local frame, and the target helper argument ordering. Its first residual is the early sine-table allocation. The target begins:

```asm
mov   r1, #255
ldr   r4, [pc, ...]
mov   r2, #182
lsl   r2, #1
add   r0, r7, r2
ldr   r3, [r0]
```

The best draft instead begins its differing sequence with the table literal in `r3` and the `unk16C` load in `r4`:

```asm
mov   r1, #255
ldr   r3, [pc, ...]
mov   r2, #182
lsl   r2, #1
add   r0, r7, r2
ldr   r4, [r0]
```

The first divergent instruction is therefore offset `0x12`, target `ldr r4, [pc, ...]` versus draft `ldr r3, [pc, ...]`; the following offset `0x1A` load is the corresponding `r3` versus `r4` swap. The best draft is four bytes larger than the target (`0x190` versus `0x18C`). The declaration-initializer experiment was worse: it moved the first divergence to offset `0x10` and added the table load before `mov r1, #255`.

## Lifetime and source-shape experiments

The table covers 28 measured probes, exp017 through exp044. Each row records the first differing instruction from the complete function diff.

| Experiment | Source change | First divergence |
| --- | --- | --- |
| exp017 | Reused one mutable angle index | Major allocation drift before the stable early residual; frame grew by approximately eight bytes |
| exp018 | Restored separate angle indices | `0x12`: target table `ldr` in `r4`, draft in `r3` |
| exp019 | Used direct global sine-table expressions | `0x10`: target `mov r1, #255`, draft `mov r2, #255` |
| exp020 | Restored local table pointer | `0x12`: target table `ldr` in `r4`, draft in `r3` |
| exp021 | Added a cached raw-angle local | `0x12`: target table `ldr` in `r4`, draft in `r3` |
| exp022 | Removed the cached raw-angle local | `0x12`: target table `ldr` in `r4`, draft in `r3` |
| exp023 | Moved table declaration after the lookup locals | `0x12`: target table `ldr` in `r4`, draft in `r3` |
| exp024 | Changed `unk16C` declaration to `s32` | `0x12`: target table `ldr` in `r4`, draft in `r3` |
| exp025 | Swapped initial mask/table assignments | `0x10`: target `mov r1, #255`, draft table `ldr` in `r3` |
| exp026 | Restored mask-before-table assignment order | `0x12`: target table `ldr` in `r4`, draft in `r3` |
| exp027 | Swapped `q0`/`q1` declaration order | `0x12`: target table `ldr` in `r4`, draft in `r3` |
| exp028 | Restored `q0`/`q1` declaration order | `0x12`: target table `ldr` in `r4`, draft in `r3` |
| exp029 | Reordered matrix/vector declarations | `0x0A`: target `sub sp, #112`, draft `sub sp, #108` |
| exp030 | Restored matrix-first declaration order | `0x12`: target table `ldr` in `r4`, draft in `r3` |
| exp031 | Removed the mask local and used literal `0xFF` | `0x10`: target `mov r1, #255`, draft table `ldr` in `r3` |
| exp032 | Restored the mask but left table assignment before it | `0x10`: target `mov r1, #255`, draft table `ldr` in `r3` |
| exp033 | Restored mask-before-table order | `0x12`: target table `ldr` in `r4`, draft in `r3` |
| exp034 | Changed `q0` to `unk32` | `0x12`: target table `ldr` in `r4`, draft in `r3` |
| exp035 | Restored `q0` to `s32` | `0x12`: target table `ldr` in `r4`, draft in `r3` |
| exp036 | Changed `q0` to `s16` | `0x10`: target `mov r1, #255`, draft `mov r2, #255` |
| exp037 | Restored `q0` to `s32` | `0x12`: target table `ldr` in `r4`, draft in `r3` |
| exp038 | Changed `q1` to `s16` | `0x10`: target `mov r1, #255`, draft `mov r2, #255` |
| exp039 | Restored `q1` to `s32` | `0x12`: target table `ldr` in `r4`, draft in `r3` |
| exp040 | Moved `q0`–`q5` declarations before angle declarations | `0x12`: target table `ldr` in `r4`, draft in `r3` |
| exp041 | Restored angle-before-lookup declaration order | `0x12`: target table `ldr` in `r4`, draft in `r3` |
| exp042 | Added and assigned a signed raw-angle local | `0x12`: target table `ldr` in `r4`, draft in `r3` |
| exp043 | Removed the raw-angle local | `0x12`: target table `ldr` in `r4`, draft in `r3` |
| exp044 | Initialized the table pointer at declaration | `0x10`: target `mov r1, #255`, draft table `ldr` in `r3`; size remained `0x190` versus target `0x18C` |

The stable residual survived separate angle lifetimes, table-pointer staging, signedness probes, declaration-order probes, raw-angle caching, and mask-lifetime probes. The natural source forms tested did not produce the target's simultaneous table-in-`r4`, raw-`unk16C`-in-`r3`, and scaled offset in `r2`. The function is parked rather than forced with register controls, `volatile`, artificial aliases, or inline assembly.

# RiderAI_804C8F0 matched notes

Function `RiderAI_804C8F0` at `0x0804C8F0` has a direct typed C implementation in `src/riderphysics.c`. The assembly dump was removed after the exact object match. The final object diff has zero differing instruction rows after formatting, and the full-ROM compare passes.

## Final shape and measured evidence

The target has a 24-byte local frame and keeps the rider pointer in `r7`, direction in `r6`, saved buttons in `r8`, and target deltas in `r4`/`r5`. The six-word result array is required for the target frame even though `sub_805DFD4` writes five words. The helper result pointer is `s32*`: its other callers pass signed coordinate buffers, and the helper writes signed interpolated coordinates with plain word stores. The result array remains `s32[6]` because changing it to `unk32[6]` changed the target coordinate operations from `asr` to `lsr` at `0x15E` and `0x168`.

### Signedness evidence

| Declaration | Final type | Exact evidence | Independent flip result |
| --- | --- | --- | --- |
| `sub_805DFD4` result pointer | `s32*` | Other callers use the five-word buffer as signed coordinates, and the helper writes interpolated signed coordinates with word stores. | `unk32*` to `s32*`: 0 RiderAI diff rows; other helper callers remain exact |
| `dx` | `s32` | Target tracking normalization uses `asr` at `0xBE`; signed direction tests use `ble` at `0xE4` and `bge` at `0xEC`. | `unk32 dx`: 33 diff rows, first at `0x08` |
| `dy` | `s32` | Target tracking normalization uses `asr` at `0xCA`; signed direction tests use `ble` at `0xF2` and `bge` at `0xFC`. | `unk32 dy`: 29 diff rows, first at `0x08` |
| `targetX` | `s32` | Target spline threshold tests use signed `ble` at `0x170` and `bge` at `0x184`. | `unk32 targetX`: 3 diff rows, first at `0x170` became `bls` |
| `targetY` | `s32` | Target spline threshold tests use signed `ble` at `0x194` and `bge` at `0x1A4`. | `unk32 targetY`: 3 diff rows, first at `0x194` became `bls` |
| `result[6]` elements | `s32` | Target coordinate normalization uses arithmetic `asr` at `0x15E` and `0x168`. | `unk32 result[6]`: 2 diff rows, first at `0x15E` became `lsr` |

`unk1C3` is used by the matched switch-index expression `((unk32)((rider->unk1C3 + 0x10) & 0xFF) >> 5)`. The field is `unk8` because target offset `0x2A` performs `ldrb` from rider offset `0x1C3`; folding the index temporary was independently byte-neutral. `unk1C6` is used by the matched final assignment `rider->unk1C6 = buttons & ~rider->unk1C4`. The field is `unk16` because target offset `0x1FC` performs `strh` to rider offset `0x1C6`. Both fields are accessed by the matched C and are not padding.

The large AI flag is `0x2000000`; its construction is `mov #128; lsl #18`. The dispatch index is an unsigned five-bit extraction, represented as `(unk32)((rider->unk1C3 + 0x10) & 0xFF) >> 5`, producing the target `lsr`. Cases `0` through `7` map to `0x20`, `0x60`, `0x40`, `0x50`, `0x10`, `0x90`, `0x80`, and `0xA0`; values above `7` leave direction unchanged.

The tracking branch combines the flag test with the target-pointer test, so a null target falls through to spline processing. Its timer decrement is unconditional within the non-null tracking branch. The final masks are inverse masks: `direction & ~buttons` and `buttons & ~rider->unk1C4`, producing the target `bic` instructions. Separate `targetX` and `targetY` locals preserve the target spline calculation order and register allocation. The coordinate shifts are combined in their assignments, and the signed result array preserves the target `asr` operations.

| Experiment | Source change | `!` count | First divergent instruction or shape |
| --- | --- | ---: | --- |
| exp003 | Initial direct semantic draft with five-word result array | 86 | `0x06`: target `sub sp, #24`, draft `sub sp, #20` |
| exp004 | Corrected large-flag probe | 74 | `0x06`: frame remained 20 bytes |
| exp005 | Corrected large flag and added explicit case 7 | 71 | `0x06`: frame remained 20 bytes |
| exp006 | Removed invented nonzero timer guard | 70 | `0x06`: frame remained 20 bytes |
| exp007 | Changed result array to six words | 68 | `0x08`: target `mov r7, r0`, draft `mov r6, r0` |
| exp008 | Moved timer update into the non-null target branch | 68 | `0x08`: rider remained in `r6` |
| exp009 | Combined tracking flags and target-pointer check | 21 | `0x32`: target `lsr r0, #5`, draft used the wrong index register |
| exp010 | Added a separate switch-index local | 64 | `0x08`: rider/direction allocation reshuffled; extraction was `asr` |
| exp011 | Added the measured unsigned cast to the switch index | 63 | `0x08`: switch extraction matched, rider remained in `r6` |
| exp012 | Target-pointer local experiment | 65 | `0x08`: rider remained in `r6`; branch layout also worsened |
| exp013 | Declaration-order experiment | 63 | `0x08`: rider remained in `r6` |
| exp014 | Target-local branch-shape experiment | 65 | `0x08`: rider remained in `r6` |
| exp015 | Corrected both final masks to inverse masks | 7 | `0x15C`: target delta subtraction used `r0`, draft used `r4`; rider/direction roles became `r7`/`r6` |
| exp016 | Added separate spline `targetX` and `targetY` locals | 3 | `0x15C`: target subtraction used `r0`, draft used `r3` |
| exp017 | Combined each coordinate's shift into its assignment | 2 | `0x15E`: target `asr`, draft `lsr` |
| exp018 | Changed helper output prototype and result array to `s32*`/`s32[6]` | 0 | Exact instruction match |

The following fold and source-shape probes were run one at a time against the complete function diff. Only the index fold was retained; every other single-use fold or condition cache changed bytes and the original source shape was kept.

| Probe | Function | `!` count | First divergent instruction or shape |
| --- | --- | ---: | --- |
| Fold `index` into `switch` | RiderAI | 0 | Exact match; retained folded expression |
| Fold `geometry` into helper call | RiderAI | 11 | `0x12C`: target `mov r3, #133`, draft `mov r1, #133` |
| Fold `mask` into angle expression | DDF8 draft | 84 | `0x0A`: target frame `112`, draft frame `116` |
| Fold `q0` lookup into first helper call | DDF8 draft | 74 | `0x0A`: target frame `112`, draft frame `116` |
| Fold `q1` lookup into first helper call | DDF8 draft | 77 | `0x0A`: target frame `112`, draft frame `116` |
| Fold `q2` lookup into second helper call | DDF8 draft | 69 | `0x0A`: target frame `112`, draft frame `116` |
| Fold `q3` lookup into second helper call | DDF8 draft | 80 | `0x0A`: target frame `112`, draft frame `120` |
| Fold `q4` lookup into third helper call | DDF8 draft | 70 | `0x0A`: target frame `112`, draft frame `116` |
| Fold `q5` lookup into third helper call | DDF8 draft | 84 | `0x0A`: target frame `112`, draft frame `120` |
| Fold `x` into matrix expression | DDF8 draft | 88 | `0x0A`: target frame `112`, draft frame `120` |
| Fold `y` into matrix expression | DDF8 draft | 89 | `0x0A`: target frame `112`, draft frame `120` |
| Cache repeated `RiderHasFlag(rider, 2)` result | DDF8 draft | 77 | `0x12`: target table `ldr` in `r4`, draft in `r3` |

The geometry alias, mask, six sine-table values, x/y staging, and separate RiderHasFlag calls are byte-required in the retained parked draft. The index local was removed because its direct folded expression remained byte-identical. A checkpoint's global replacement of the AI flag also changed the already matched `sub_804D110` flag from `0x200000` to `0x2000000`, causing one pre-fix ROM byte divergence at `0x0804D553` (`lsl #18` instead of `lsl #14`). Restoring that unrelated caller use to `0x200000` returned the full ROM to the expected SHA1.
