# iconmenu, geometry, actor r4

## sub_8050DF8 (0x08050DF8)

Matched exactly as a typed `FrontendMenu` selection refresh. The function takes a menu pointer and a signed index, computes the current item from `selection`, validates the requested index and transition flag, updates the selected/current sprites and positions, then refreshes the menu text. Existing `FrontendMenu`, `FrontendMenuItem`, and `FrontendMenuItemData` fields provided all accessed offsets; no new layout fields were needed. `bun run tools/diff/diff.ts sub_8050DF8` showed no instruction differences, and the full ROM compare passed.

The three source call sites in parked `festate.c` drafts pass only the menu pointer because those callers remain assembly inclusions; the function's assembly and raw semantic draft prove the second ABI argument is the requested index. The public prototype was added as `void sub_8050DF8(FrontendMenu*, s32);`.
