# Round 2 mixed notes

## sub_80510FC (0x080510FC)

This function remains assembly-backed; the following layout observations came from a typed parked draft and were reverted from headers because no matched committed function currently depends on them.

- `CurrentGameState` offsets `0x5A4`, `0x5E4`, `0x624`, and `0x664` are each copied as 0x40-byte regions.
- Initialization clears byte storage at `0x6A4` through `0x6A9`, in descending order in the target instruction stream.
- Offset `0x6E8` is written as a halfword by `sub_80510FC` but read as a byte by `sub_805176C`; this is a proven storage-width pun. A packed overlay was used experimentally, then reverted from the shared header while the function remains unmatched.
- The LevelDescription table regions used by `sub_804F878` were experimentally typed as pointer arrays at offsets `0x94` (five entries) and `0xA8` (six entries), but those fields remain padding until a matching committed function proves them.

The best natural draft matched semantics and preserved the ROM when parked, but differed in register/lifetime shaping. The first stable divergences were the global/current-state register allocation in initialization, the LevelState pointer register in the first loop, and the sentinel scan's cursor/index representation.

## sub_804F878 (0x0804F878)

A typed semantic draft was parked in `src/levelhud.c`. Its LevelDescription table accesses are not promoted into shared headers because the function is not matched and committed.

## updateKeyState (0x0805A6B8)

The natural typed draft remains parked in `src/keystate.c`. It was compiled with the original assembly inclusion restored. The first stable divergence was in the recording-count test: the target copies the loaded count with `mov r0, r2` before `cmp r0, #0`, while the draft compares the count register directly. Later differences include the key-state loop's saved-register allocation and cursor/base lifetimes.

Step table:

- Natural typed state machine: first divergence at the recording-count compare (`mov r0, r2` versus direct `cmp`); later loop allocation differed.
- Removing key-state initialization: removed an extra `movs r5, #0`, but did not remove the first compare divergence.
- Introducing a separate recording-count local: preserved count lifetime but still produced direct comparison and later register differences.
- Reordering loop aliases and timer loads: changed later instruction placement only; no exact match.

## newIconMenu (0x08050A7C)

A signature-correct empty semantic draft is parked in `src/iconmenu.c`; the m2c output contained no recoverable body. The function remains assembly-backed. First divergence for the attempted C replacement is the function body itself: the target has a non-empty prologue and initialization sequence while the draft emits only the empty-body return.

## sub_804A550 (0x0804A550)

A signature-correct empty semantic draft is parked in `src/tutorial.c`. The raw semantic draft was not suitable as final source because it used speculative fixed offsets and artificial register/goto constructs. First divergence is the target prologue versus the empty-body return.

## sub_804257C (0x0804257C)

A signature-correct empty semantic draft is parked in `src/transition.c`. The m2c draft established a dispatch over states 0, 1, 2, and 8, but its hardware/global types and table layout were not proven sufficiently for a natural matching implementation in this pass. First divergence is the target dispatch/prologue versus the empty-body return.

## sub_804EE54 (0x0804EE54)

A signature-correct empty semantic draft is parked in `src/hud.c`. The target is a substantial HUD update routine; no final typed layout was proven during this pass. First divergence is the target prologue versus the empty-body return.

## sub_8063220 (0x08063220)

A signature-correct empty semantic draft is parked in `src/palette.c`. The semantic draft indicates packed 5-bit RGB interpolation over palette rows, with separate zero-target and nonzero-target paths, but the exact source layout and register lifetimes were not established. First divergence is the target prologue versus the empty-body return.
