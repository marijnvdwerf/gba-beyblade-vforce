# updateKeyState

## Matched

`updateKeyState` at `0x0805A6B8` now matches the expected object and ROM.

## Measured source shapes

- `s32 mask` is required for the target signed `ble` tests at loop offsets `0xBE`, `0x140`, and `0x16C`.
- The loop timer must be read directly as `_unk3000E30[0]` in the first pressed-key path and the held-key path. A function-scope `timer` local changed address lifetimes and produced an uninitialized-use shape on the held-key path.
- The release arm needs a block-local `unk32 timer` and the chained assignment `_unk3005CB0[i].var04 = timer = _unk3000E30[0]`. Separating the timer assignment inserted an extra timer load before the index calculation; repeating `_unk3000E30[0]` for `var08` inserted a second timer load after the `var04` store.
- The recording write must use `*_keyRecordingData++ = keyState`; separating the store and pointer increment emitted an extra pointer reload.
- `_unk3005DAC = _unk3005DAC | mask` preserves the target address lifetime and read-modify-write sequence.

No header changes were required.
## Review measurements

- Folding the recording `count` temporary to direct `_unk3005DB4` testing and decrement was byte-identical. The `count` declaration is not required.
- Folding the release-arm `timer` temporary to a second direct `_unk3000E30[0]` read was not byte-identical. The first allocation divergence was at function offset `0xA8` (`add r4, r6, #4` in the target versus `add r0, r6, #4` in the candidate), and the candidate added a timer reload around offset `0x182`. The block-local `unk32 timer` and chained assignment remain required.
- Replacing `_unk3005DAC = _unk3005DAC | mask` with `_unk3005DAC |= mask` was byte-identical. The compound assignment is retained.
