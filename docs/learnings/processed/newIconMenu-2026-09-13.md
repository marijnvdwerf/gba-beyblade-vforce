# newIconMenu (0x08050A7C)

Matched in src/iconmenu.c; ROM SHA1 cd527c8c24e20e33913fc45199e64b3e6138a6e5.

## Proven layout

Expanded the existing FrontendMenuData, FrontendMenuItemData, FrontendMenuBlockData, and FrontendMenuItem declarations instead of retaining the disabled draft's duplicate font descriptor type.

- FrontendMenuData +4 is a signed item count (__divsi3 and signed loop bound); +8 is a signed scale (multiply and ASR #8); +C/+10 are coordinate bases; +14/+18 are signed font coordinates (LSL #8, ASR #16); +1C is the item-data array pointer. The descriptor remains 0x24 bytes.
- FrontendMenuItemData +0 is the sprite-sheet pointer, +18/+1C are coordinate values loaded and copied as words. The item-data stride is 0x30.
- FrontendMenuBlockData +0/+4 are sprite-sheet/font pointers and +8 is a halfword. The existing +A byte is read for the text call.
- FrontendMenuItem +18 is written with STRH. The item stride remains 0x1C.

The +28 item-data field remains a word, preserving sub_8050C18. A local unk16 assigned inside the last LoadSpriteSheet argument supplies the target LDRH at newIconMenu +0x11A. Initializing that local before the call instead moves the load to the start of the success arm, adds a register move through r12, and changes allocation as early as +0x38. The assignment inside the argument is byte-required and avoids a cast on a field read or a union.

## Source shape and folding

- Allocation size uses itemCount * sizeof(FrontendMenuItem). The local size, offsetX, and offsetY are byte-required: folding each separately changes ROM bytes.
- Initialize the target scale before the current scale, and use the per-item selection ternary before copying coordinates. The angular step is 0x10000 / itemCount.
- Font coordinates use >> 8; allocFont's s16 parameters provide the target narrowing shifts.
- A selected-record pointer local changes the final address calculation. Direct array-member indexing in the text-call argument restores the target multiplication and register reuse.
- Removed the cached font descriptor, sprite result, final configuration pointer, selection index, and item-array base after individual ROM checks. Some aliases folded only after other aliases were removed.
- Removed the old disabled draft and its duplicate font descriptor typedef. No field casts, raw offset dereferences, unions, or rule-breaking matching shapes remain.

## Verification

newIconMenu and sub_8050C18 have zero differing instruction rows. Full ROM SHA1 passes after the shared header expansion and temporary reductions.
