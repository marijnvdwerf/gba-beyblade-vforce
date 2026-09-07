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
