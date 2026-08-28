# Leaves N2

## sub_8043604 (0x08043604)

Implemented in `src/menuobject.c` and matched against the original dump. The callback receives `(UnkMenuItem *oldItem, s32 old, UnkMenuItem *item, s32 current)` from `MenuState.callback` dispatch. The callback uses the frontend timer, cleanup block, motion state, and the motion constants at `_8068890`. A label was added at the existing data address `0x08068890`; no data bytes were added or moved.

The final C emits the same instructions and the full ROM compare passes. The table pointer must be initialized before calling `sub_8048FCC()` to preserve the target register allocation.

## sub_805AD24 (0x0805AD24)

The constructor remains parked under `#if 0` immediately above its `INCLUDE_ASM` in `src/menu.c`. The best typed semantic draft writes the fields at offsets `0x00`, `0x04`, `0x08`, `0x09`, `0x0A`, `0x0C`, `0x10`, `0x14`, `0x18`, `0x1C`, `0x20`, `0x24`, `0x28`, `0x2C`-`0x2F`, `0x30`, and `0x34` through the typed `MenuState` layout in `src/common.h`.

The draft is not an exact match. The tested parameter-width changes showed that `arg5` must remain `unk32` rather than `unk16`, and the final language argument must remain `unk32`; narrowing either changes stack loads and normalization. The callback parameter also remains `unk32` in the public prototype and is cast only when stored into the typed callback field. The remaining divergence is in the constructor's stack-load and register/lifetime shape, not its recovered field semantics. No artificial asm or volatile/register workaround was used.

The residual-analysis note referenced by the workflow, `docs/learnings/residual-analysis-2026-08-28.md`, was not present in this checkout when the near-miss work was performed.
