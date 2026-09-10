# initRiders — 2026-09-10

Matched `initRiders` at `0x08053600` (0x2C0 bytes) in `src/gameinit.c`.
Reachability is confirmed by the mainLoop callgraph. Both C callers invoke it without arguments; the public void signature is retained.

## Source and layout

Added `GeometryLine.unk16` as an unk16 at offset 0x16, replacing two bytes of padding. The target uses `ldrh` at this offset, first at 0x08053694 and again for the secondary rider initialization. The line remains 0x20 bytes. Existing point coordinates are signed words, matching the three arithmetic shifts by 3. No shared signedness changes were needed.

Corrected the parked draft's control flow and parameters:

- Missing starting points still reach the final rider-count store.
- Exhausted rider slots break out of the search loop after printing the diagnostic.
- The primary rider pointer is captured before the multiplayer calls.
- Multiplayer fallback offsets use the start line's angle, not the multiplayer flag.
- The extra multiplayer rider is initialized at zero coordinates with the current rider index and the existing signed halfword GameData.unk15C0; it does not receive metadata processing.
- Non-primary lines create riders only outside multiplayer mode.

## Measured steps

| Change | Result |
| --- | --- |
| Activate corrected typed C with a point alias and primary/non-primary loop branches | Only three differing instructions, at +0x10E through +0x112 |
| Use `(table[angle] * 0x20) >> 8` for the fallback X offset | Exact match and full ROM SHA1 pass |
| Fold GameData pointer alias into `_gameData` | Exact; alias removed |
| Fold the point alias into repeated indexed member reads | 23 differing diff rows; first is an earlier `ldrh` of line +0x16 at +0x8A |
| Replace the two multiplayer-line assignment arms with a ternary | 34 differing rows; first at +0x104, with changed pool placement |
| Spell the fallback Y scale with multiplication by 0x20 instead of left shift by 5 | Exact |

The direct `table[angle] >> 3` form emits `ldrh; lsl #16; asr #19`. The retained scale-then-shift expression emits the target's `mov r3, #0; ldsh; asr #3`. It also expresses the same fixed-point scale used for the Y offset. Negation precedes the final Y arithmetic shift, preserving rounding for negative values.

Retained dataflow: the point alias fixes point-address formation before the line-type load; the line, rider, and description pointers are used across multiple accesses or calls. The lineType snapshot supplies the primary initRider argument, while the secondary path reloads line->unk16 as in the target. Signed line indices and riderIndex are required by negative tests and the signed slot-limit comparison; initialized and lineType use unk32.

No casts, raw offset accesses, forced registers, volatile, assembly barriers, or goto were introduced. The final formatted C and removed assembly dump pass `cmake --build build --target compare`.

## Review measurements (2026-09-10)

- Folding `levelDescription` into
  `StoreMetadataAddr(&geometry, getLevelDescription2()->metadata)` was not
  retained. The first divergence was at `initRiders+0x10`: the target calls
  `getLevelDescription2` and moves its result into `r4`, while the folded
  candidate proceeds directly to initialization.
- Reusing `lineType - 1` for the secondary rider path was not retained. The
  first divergence was at `initRiders+0x54`: the target moves the new line index
  into `r10`, while the folded candidate spills it to the stack. The target's
  secondary path reloads `line->unk16 - 1` and that spelling remains.
