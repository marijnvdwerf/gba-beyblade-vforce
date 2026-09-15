# handleEventListeners (0x080542A8, src/event.c) — MATCHED

Previously parked (processed/leaves-b.md; HANDOVER opus fail). Final 104/104,
ROM compare passes. No dead code was needed.

| Step | Rows |
| --- | --- |
| Typed draft: `while (count-- != 0)`, nested null ifs, single `listeners++` at bottom | 142 |
| `if (count == 0) return; count--; do { … } while (count-- != 0);` with `s32 count` (`unk32` compares against -1) | 55 |
| `for (i = 0; i < count; i++)` with `listeners[i]` | 64 |
| Failed lookups as `listeners++; continue;`, success increments before the inner loop | 51 |
| … with `next = listeners + 1` before the inner loop, `listeners = next` after | 4 |
| **Success path increments after the inner loop** | **0** |

Why the shape matters (measured with asm-annotated .greg):

- With a single bottom `listeners++`, loop.c moves the biv increment next to the
  load (`ldmia r4!`). Separate increments on each exit path block that.
- The handler call is `_call_via_r4`, so r4 can hold `listeners` only if it is
  not live across the inner loop. The target spills `listeners` to [sp,#16]
  around the inner loop and increments on every path. The nested-if draft gave
  `listeners` refs 19 / live 74 → r8, which pushed `lineIndex` to the stack.
- The failed-lookup exits cross-jump into one block (target L31E). The success
  path's increment and `count - 1` land before the inner-loop test even though
  the source increment follows the loop.

Fold tests: `eventIndex` (31 rows) and `line` (64 rows) are byte-required. Their loads
happen before `getLineMetaAtIndex`, index first. The `eventIndex` load is target `ldsh` at function offset `0x62` (sequence offset `+0x8`).

Types: `geometry` is `LevelGeometryAddresses*` (the prototype already said so);
`listeners` is `unk32*` from `GameData.unkCA4` (`void*`); `eventCount` is `s32` from
`LineMetaSequence.unk2` (ldsh). The handler table `_8078990` is declared in
event.c as `extern const EventHandler _8078990[]`, where `EventHandler` is the
5-argument processMetadata_* signature. The event walk
`(LineMetaObject*)((unk8*)event + event->size)` is a variable-size record walk.

## Review follow-up signedness and folds (2026-09-15)

| Isolated candidate | Result |
| --- | --- |
| `unk32* listeners` | ROM compare passes; use `unk32*`. |
| `unk32 count` | ROM mismatch (`700a17164359b3946638b5e0fd9f15dbc947f309`); retain `s32` for the exact outer post-decrement loop shape. |
| `unk32 lineIndex` | ROM compare passes; use `unk32`. |
| `unk32 eventIndex` | ROM compare passes; use `unk32`; the source field remains `s16`, and target `ldsh` at function offset `0x62` proves the field load's signed extension. |
| Fold `line` into the handler call | ROM mismatch (`1b174d42e3b4525141101fe691fdc8797eb7b193`). |
| Fold `eventIndex` into `getLineMetaAtIndex` | ROM mismatch (`be89949d1d10c463197e817467c350d24c7b9c4d`). |
| Single bottom `listeners++` with nested lookup guards | ROM mismatch (`dfd4fe99933759fddbc6eb8f7ca83d49af252b6f`). |

`count` has no signed load or signed branch evidence; its `s32` declaration is retained only because the tested natural `unk32` form changes the frame/register allocation and ROM bytes. This is flagged as an unresolved source-rule exception.

## Fold-test pass (2026-09-15)

| Candidate | Result | First divergence |
| --- | --- | --- |
| fold `line` into the handler call | kept | `0x278` |
| fold `eventIndex` into `getLineMetaAtIndex` | kept | `0x278` |
| advance `listeners` once with `*listeners++` and remove path increments | kept | `0x278` |

The cached line, signed sequence-index conversion temporary, and path-specific
cursor increments remain byte-required.
