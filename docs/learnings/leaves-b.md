# Leaves B

## getBeyBladeActorDataForIndex (0x8057258)

The function remains parked above its assembly include. The dump is intentionally intact.

The semantic draft requires fields not present in the verified shared layouts:

- `BeybladeData` uses a word at offset `0` as the compressed allocation size and a byte at offset `0x31` as the compressed-data flag.
- `BeybladeActorDataTable` is the 0x3C-record actor-data array followed by the flags word at offset `0x1E0`.
- `RiderSpriteSheets` is an indexed pointer table.

Those fields are represented only by the parked draft and this note; they were not added to shared headers.

The final role-swap experiment kept the actor-data record assigned before the sprite-sheet value. The target materializes the record in `r6` and the sheet value in `r5`; the draft materializes the record in `r5` and the sheet value in `r6`. Replacing the sheet value with a pointer-to-entry alias worsened the first divergence from the stable residual at `0x16` to the early literal materialization and did not swap the roles.

| Change | Result |
| --- | --- |
| Baseline typed-table semantic draft | Stable first divergence at `0x16`; record and sheet high-register roles are reversed |
| Sheet represented as an entry sub-object alias | Earlier divergence at the literal/address setup; target register roles remained reversed |
| Shared header table/layout additions removed | Verified ROM baseline remains byte-identical |

## allocateParticleSystem (0x804E468)

The semantic draft is parked above the assembly include. The dump remains intact.

The draft assumes a 0x24-byte particle record with stores at offsets `0x4`, `0x8`, `0xC`, `0x10`, `0x12`, `0x14`, `0x1A`, `0x1C`, `0x1E`, `0x20`, and `0x22`. It also assumes the particle-system sprite-sheet pointer at offset `0`, the particle pointer at offset `8`, and the allocation block at offset `0x30`. These speculative fields were not added to shared headers.

The closest draft matched through initialization and differed in the particle-loop lifetime. The target keeps the original count in `r1`, decrements a separate loop value in `r7`, and emits the loop tail as `mov r0, r7; sub r7, #1; cmp r0, #0`. The draft instead used a separate compiler-selected temporary and emitted a different countdown shape.

## handleEventListeners (0x80542A8)

The semantic draft is parked above the assembly include. The dump remains intact.

The target has a 20-byte local frame, saves geometry at `sp+4`, event ID at `sp+8`, the computed line address at `sp+0xC`, the next listener pointer at `sp+0x10`, and the event pointer at `sp+0`. The closest draft had the same semantic traversal and variable-size event stepping but retained geometry in a register and used a 12-byte frame. Its final tested countdown variant also differed in branch shape.

The draft assumes signed halfwords at metadata-object offsets `8` and `0xA` and a callback table of handlers taking `(geometry, line, lineIndex, metadata)`. These assumptions remain local to the parked draft and this note; no shared union or callback layout was added.

## DMA3Copy (0x8065970)

The direct-register semantic draft is parked above the assembly include. It uses `REG_DMA3SAD`, `REG_DMA3DAD`, `REG_DMA3CNT`, and `REG_DMA3CNT_H` directly and contains no cast-plus-offset access to the DMA registers.

The target still differs after the DMA control write because it carries the DMA control address in a pointer-like register lifetime, increments that address by two, and reads the high halfword through it. The draft uses direct `REG_DMA3CNT_H` access instead, as required by the source-style constraint.
