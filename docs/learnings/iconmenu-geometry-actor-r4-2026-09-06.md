# iconmenu, geometry, actor r4

## sub_8050DF8 (0x08050DF8)

Matched exactly as a typed `FrontendMenu` selection refresh. The function takes a menu pointer and a signed index, computes the current item from `selection`, validates the requested index and transition flag, updates the selected/current sprites and positions, then refreshes the menu text. Existing `FrontendMenu`, `FrontendMenuItem`, and `FrontendMenuItemData` fields provided all accessed offsets; no new layout fields were needed. `bun run tools/diff/diff.ts sub_8050DF8` showed no instruction differences, and the full ROM compare passed.

The three source call sites in parked `festate.c` drafts pass only the menu pointer because those callers remain assembly inclusions; the function's assembly and raw semantic draft prove the second ABI argument is the requested index. The public prototype was added as `void sub_8050DF8(FrontendMenu*, s32);`.

## sub_805BF18 (0x0805BF18)

Matched exactly as an eight-argument signed rectangle-overlap test. The two endpoint pairs are ordered first, then a two-bit flag records x and y boundary intersections; containment checks promote the flag to `3`, and the function returns `1` only when both dimensions overlap. All eight parameters are `s32`, as proven by the signed comparison branches. A local `unk16 flags` reproduces the target's halfword normalization after the y-bit updates. `bun run tools/diff/diff.ts sub_805BF18` showed no instruction differences, and the full ROM compare passed.
