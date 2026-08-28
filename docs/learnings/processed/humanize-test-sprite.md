# Humanized rewrite tests

## freeSpriteVramLocation

The humanized linked-list rewrite first diverged at `0x2`: the target moves `r10` into `r7`, while the draft moves `r9` into `r7`. The target also has a larger saved-register set and a longer body. The draft was left parked and the assembly include restored. No header changes.

## sub_8060C1C

The humanized allocation and relinking rewrite first diverged at `0x10`: the target keeps the `_spritesFree` address in `r2` and the loaded count in `r1`, while the draft uses different registers. A direct global access was tested after the original cached-count form and did not improve the allocation. The draft was left parked and the assembly include restored. The forward declaration was corrected to `SpriteTextBlock *` to match the established function signature. No header changes.

Controlled follow-up experiments (2026-08-28):

| Change | First divergence / result |
| --- | --- |
| Reordered `first` and `previous` declarations | No allocation change; first divergence remained `0x10`. |
| Cached `_spritesFree` through `free_ptr` and `sprites_free` | Target global roles were still not reproduced; first divergence remained `0x10`. |
| Kept a stable `first` and separate moving `last` cursor | Changed normalized-size allocation to `r6` and introduced extra loop arithmetic; worse than the moving-cursor form. |
| Restored moving `first` cursor and retained cached free-count locals | Returned normalized size to `r5`; global roles and list roles still diverged at `0x10` and `0x32`. |
| Moved free-count declarations before pointer locals | No code-generation improvement. |

The best source draft remains parked above the assembly include. The target roles requested for this pass (`r8=block`, `r5=size`, `r7=var22`, `r6=first`, `r4=tail`, `r2=insertion`) were not achieved by these source-shape changes.

## resizeSpriteBlock

The humanized resize rewrite first diverged at `0x2`: the target's saved-register and argument setup differs from the draft. A cached pointer to `_spritesFree` was tested but did not resolve the allocation register setup. The draft was left parked and the assembly include restored. No header changes.

## LoadSpriteSheet

The humanized loader first diverged at `0x2`: the target saves `r10`/`r9`/`r8` in the expected roles, while the draft saves a different register set. The draft also differs in argument normalization, field-store widths, and the literal-pool tail. The draft was left parked and the assembly include restored. A local `SpriteSheet` layout was used only by the parked draft; no shared header changes.

## sub_806123C

The humanized text-layout rewrite first diverged at `0xA`: the target allocates a 44-byte stack frame, while the draft allocates 32 bytes. The target spills the initial `SpriteEntry *` and reuses a stack slot; the draft keeps it in a register. The draft was left parked and the assembly include restored. No header changes.

## sub_80627F0

The humanized mixer rewrite first diverged at `0xA` due to global-pointer register allocation. The target also retains the dead alignment arithmetic at `0x2A`-`0x32`, which the draft's unused alignment value allowed the compiler to remove. The draft was left parked and the assembly include restored. No header changes.

## sub_8062C24

The humanized event-parser draft did not compile. It references fields absent from the current `SoundStructG`, passes an integer where `Sound_80629F0` expects a pointer, uses an undeclared string symbol, and assigns a pointer to an integer field. The draft was left parked and the assembly include restored. No header changes.
