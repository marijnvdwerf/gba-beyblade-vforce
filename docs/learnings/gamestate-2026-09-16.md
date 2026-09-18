# gamestate 2026-09-16

## sub_8051694 (0x08051694)

- The function has no C callers; its return is an `unk8*` pointing into `_807582c`, and the index comes from `sub_80516B0()` through an `unk32` prototype declared in `gamestate.h`.
- `_807582c` is a fixed-stride ten-row byte table declared as `unk8[][0x50]`, preserving the table's existing size and address. `_807582c[sub_80516B0()]` emits the target `lsl #2`, add, `lsl #4`, and table literal load.
- Folding the single-use index local into the typed-record expression was byte-identical; no temporary is required.
- `bun run tools/diff/diff.ts sub_8051694` reports every instruction equal.

## sub_80516B0 (0x080516B0)

- The target loads `_currentGameState->unk1` as a byte and sign-extends it; an `s8 value` local followed by the existing `unk32` return type emits the exact `ldrb`, `lsl #24`, and `asr #24` sequence.
- Folding the single-use `value` local removed the target `lsl #24`/`asr #24` pair and failed the ROM compare; the local is byte-required.
- `bun run tools/diff/diff.ts sub_80516B0` reports every instruction equal; the prototype is declared in `gamestate.h` before the caller.

## sub_80516C0 (0x080516C0)

- The no-caller accessor takes an `unk32 index` and returns an `unk8*` into `_807582c`; `_807582c[index].data` emits the target `mov`, `lsl #2`, add, and `lsl #4` sequence.
- The two-dimensional byte-table indexing form is byte-identical to the prior fixed-stride expression, so the raw `index * 5 << 4` choreography is folded away.
- `bun run tools/diff/diff.ts sub_80516C0` reports every instruction equal.

## sub_80516D4 (0x080516D4)

- The function takes an `unk8 value` and stores it directly to `_currentGameState->unk1`; the existing `unk8` field produces the target byte store.
- `bun run tools/diff/diff.ts sub_80516D4` reports every instruction equal.

## sub_8051804 (0x08051804)

- The no-caller predicate takes an `unk32 index`, checks `sub_8051720(index)->unk0 & 4`, and returns `unk32` values 0 or 1; the direct if/return form emits the target branch and epilogue.
- `bun run tools/diff/diff.ts sub_8051804` reports every instruction equal.

## sub_805187C (0x0805187C)

- The `LevelEffectDescriptor*` transfer has source `ldr`/destination `str` word pairs at offsets `+4` and `+0`, followed by `ldrh`/`strh` pairs at `+8`, `+A`, `+C`, and `+E`; these store to `_currentGameState` offsets `0x6C0`, `0x6BC`, `0x6C4`, `0x6C6`, `0x6C8`, and `0x6CA`.
- `LevelEffectDescriptor.unk0` is modeled as `void*` from the destination's pointer use, but the target proves only a 32-bit word transfer. `CurrentGameState.unk6C8` and `.unk6CA` replace equal-sized padding.
- `bun run tools/diff/diff.ts sub_805187C` is instruction-perfect; US compare passes with SHA1 `cd527c8c24e20e33913fc45199e64b3e6138a6e5`.
