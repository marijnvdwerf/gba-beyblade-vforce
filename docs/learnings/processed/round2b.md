# Round 2b notes

## newIconMenu (0x08050A7C)

The function remains assembly-backed. A complete typed draft was tried in `src/iconmenu.c`, but no header layout is retained because the function did not match.

The draft temporarily described the menu configuration as follows:

- `FrontendMenuData` began with a font/configuration pointer at `0x00`, an item count at `0x04`, scale at `0x08`, base X/Y at `0x0C`/`0x10`, and an item-data pointer at `0x1C`.
- Each item-data record was treated as a 0x30-byte record: sprite-sheet pointer at `0x00`, four language label pointers at `0x04`, item coordinates at `0x18`/`0x1C`, next/previous positions at `0x20`/`0x24`, and tile count at `0x28`.
- Each allocated menu item was treated as a 0x1C-byte record with data and sprite pointers at `0x00`/`0x04`, coordinates at `0x08`/`0x0C`, transition position at `0x10`, current position at `0x14`, and a halfword cleared at `0x18`.
- The menu initialization wrote additional values at `0x08`, `0x18`, `0x1C`, `0x20`, `0x24`, `0x34`, and `0x38`.
- The font/configuration record was temporarily treated as pointers at `0x00`/`0x04`, a tile count at `0x08`, and a mode byte at `0x0A`.

These observations are based on the target loads/stores and are not promoted to shared types while the function is unmatched.

Step table:

| Change | Result |
| --- | --- |
| Empty typed body | Diverged at the target prologue; target is a substantial menu allocator/initializer. |
| Typed menu and item layouts, direct loop implementation | Correct semantic regions and 0x24-byte frame, but diverged in loop register allocation and local lifetimes. |
| Added explicit menu fields at `0x08`, `0x34`, and `0x38` | Initialization stores aligned semantically, but did not resolve register allocation. |
| Added item coordinates, transition field, and cleared halfword | Added the target item stores, but the loop still differed in register assignment and instruction ordering. |
| Used signed scale and a two-element offset array | Shift widths improved, but the compiler expanded the frame to 0x28 and moved the target stack slots. |
| Restored assembly inclusion | ROM returned to the verified baseline. |

The first stable instruction divergence in the best natural draft was the loop setup: the target keeps the angular accumulator at `sp+0x1C` and the two computed offsets at `sp+0x14`/`sp+0x18`, while the draft assigned different stack slots and callee-saved registers. Later divergences were the item-data cursor and final label-pointer lifetime.

## sub_8063220 (0x08063220)

The function remains assembly-backed. A complete typed draft was tried in `src/palette.c`, but no header changes are retained because the function did not match.

The draft established the following palette layout already represented by `Palette`:

- `source` at `0x00`.
- Source palette start index at `0x04`.
- Palette width at `0x06`.
- Row count/height at `0x08`.
- Destination buffer union at `0x0C`.
- Allocation block at `0x10`.

The draft used a word cursor over packed pairs of 15-bit colors, interpolating six 5-bit channels. It had separate zero-target and nonzero-target paths and ended by invoking the fast clear routine with the remaining destination range.

Step table:

| Change | Result |
| --- | --- |
| Empty typed body | Diverged at the target prologue; target performs packed RGB processing. |
| Natural typed packed-color implementation with `s32` temporaries | Semantic structure was close, but packed-color shifts and cursor setup differed. |
| Changed packed color temporary to `unk32` | Corrected logical packed-color shifts, but the initial register/lifetime allocation still differed. |
| Changed source cursor to an `unk16`-based offset before the word cast | Corrected the source-byte offset shape, but did not produce the target stack/register layout. |
| Changed row count temporary to `s16` | Introduced extra sign-normalization instructions and worsened the match. |
| Restored the original assembly inclusion | ROM returned to the verified baseline. |

The first stable divergence in the best natural draft was at the initial metadata setup after the height load. The target keeps the sign-extended height in `r5`, keeps the width in `sl`, and places source/destination cursors at `sp+0x10`/`sp+0x14`; the draft selected different registers and stack slots. Later differences were loop-counter lifetimes and packed-channel temporaries.

## updateEnvirenmentActors (0x08054EB4)

The function remains assembly-backed. A complete exploratory draft was tried in `src/envactor.c`; it follows the endpoint updates, timer countdowns, callback, and movement-delta stores. The draft currently remains immediately above the assembly inclusion under `#if 0` and uses raw offsets only as an exploratory record; it is not suitable as final source until the accessed layouts are promoted to shared typed structures.

Step table:

| Change | Result |
| --- | --- |
| Natural raw-pointer draft with top-tested loop | Endpoint and timer regions were semantically aligned, but the target uses an entry guard followed by a pre-decremented do/while countdown. |
| Entry guard plus explicit pre-decrement | Matched the target loop control-flow and all timer instruction shapes, including paired `ldrh`/`ldsh`; register roles still differed in the guard and metadata-base setup. |
| Added a separate remaining-count temporary | Optimized away and did not change the first divergence. |
| Restored assembly inclusion | Preserves the verified ROM while the draft remains parked. |

The first stable instruction divergence in the best natural draft is the guard setup: the target copies the count from `r8` to `r1`, tests `r1`, then materializes decrement `-1` in `r2`; the draft tests `r0` and materializes `-1` in `r1`. The next stable divergence is metadata-base register assignment (`r1` in the target versus `r2` in the draft). The draft also assumes unpromoted actor and object layouts at offsets `0x04`, `0x08`, `0x0C`, `0x40`, `0x44`, `0x48`, `0xB4`, and object fields through `0x48`.
