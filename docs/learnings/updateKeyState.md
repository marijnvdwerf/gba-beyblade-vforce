# updateKeyState

## Status

`updateKeyState` remains in assembly. The C implementation was tested but did not
match the target. The assembly include was restored, and the ROM compare passes.

## Best C candidate

The best source-natural candidate used the typed `KeyState` layout in
`src/keystate.h`, with `u16 input`, a `u16` loop counter, and signed `s32 bit`
to produce the target signed `ble` tests:

```c
void updateKeyState(void)
{
    u16 input;

    if (_isKeyRecording == 2) {
        if (_unk3005DB4 != 0) {
            input = *_keyRecordingData;
            _keyRecordingData += 1;
            _unk3005DB4 -= 1;
        } else {
            _isKeyRecording = 0;
        }
        _unk3005DA8 = (void*)_unk3000E30[0];
    }

    if (_isKeyRecording != 2) {
        input = ~*(vu16*)REG_KEYINPUT;
        if ((input & 0x3FF) != 0) {
            _unk3005DA8 = (void*)_unk3000E30[0];
        }
        if (_isKeyRecording == 1 && _unk3005DB4 != 0) {
            *_keyRecordingData++ = input;
            _unk3005DB4 -= 1;
        }
    }

    _unk3005DA0 = input & ~_keyInput;
    _unk3005DAC = 0;
    _unk3005DA4 = _keyInput;
    _keyInput = input;

    {
        u16 i;
        s32 bit;

        for (i = 0; i < 10; i++) {
            if (((1 << i) & _unk3005DA0) > 0) {
                if (_unk3000E30[0] >
                    _unk3005CB0[i].var04 + _unk3005CB0[i].var0C) {
                    _unk3005CB0[i].var10 = 1;
                } else {
                    _unk3005CB0[i].var10++;
                }
                _unk3005CB0[i].var14 = _unk3005CB0[i].var00;
                _unk3005CB0[i].var00 = _unk3000E30[0];
            }

            bit = 1 << i;

            if ((bit & _keyInput) > 0) {
                _unk3005CB0[i].var08 =
                    _unk3000E30[0] - _unk3005CB0[i].var00;
            }

            if (((_keyInput >> i) & 1) == 0 &&
                (bit & _unk3005DA4) > 0) {
                _unk3005CB0[i].var04 = _unk3000E30[0];
                _unk3005CB0[i].var08 =
                    _unk3000E30[0] - _unk3005CB0[i].var00;
                _unk3005DAC |= bit;
            }
        }
    }
}
```

The `_keyRecordingData` declaration was independently corrected from `void *`
to `u16 *`; the untouched translation unit with that fix still matches when the
function itself remains included assembly.

## Exact remaining divergence

The direct typed-struct candidate matched the function through the loop setup
except for register allocation beginning at offset `0xA8`. Target:

```asm
0x000000a8  add r4, r6, #4
0x000000aa  mov r8, r4
0x000000ac  mov r0, #8
0x000000ae  add r0, r6
0x000000b0  mov r12, r0
```

Best C output:

```asm
0x000000a8  add r0, r6, #4
0x000000aa  mov r8, r0
0x000000ac  mov r1, #8
0x000000ae  add r1, r6
0x000000b0  mov r12, r1
```

The later consequences were also register-allocation differences, notably the
release block using `r1` where the target uses `r4`, and a target `ldr r1, [r7]`
being scheduled one instruction earlier than the current candidate. All tested
variants remained source-natural; no inline assembly, register pinning, raw
offset arithmetic, or fake symbols were used.

## Register-allocation notes

The final `.greg` disposition showed the current invariant pseudos as follows:

- `_unk3005DAC` address hoisted in `sl`.
- Constant `1` hoisted in `r9`.
- `_unk3000E30` address hoisted in `r7`.
- `_unk3005CB0` base hoisted in `r6`.
- Loop index in `r5`.
- Base plus four was allocated through a temporary in `r0`, then copied to
  `r8`.
- Base plus eight was allocated through a temporary in `r1`, then copied to
  `ip`.

The relevant `.greg` RTL was:

```text
insn 552 ... (reg:SI 0 r0)
    (plus:SI (reg:SI 6 r6) (const_int 4))
insn 588 ... (reg:SI 8 r8)
    (reg:SI 0 r0)
insn 591 ... (reg:SI 1 r1)
    (const_int 8)
insn 554 ... (reg:SI 1 r1)
    (plus:SI (reg:SI 1 r1) (reg:SI 6 r6))
insn 594 ... (reg:SI 12 ip)
    (reg:SI 1 r1)
```

The target implies that the base-plus-four pseudo landed directly in `r4` and
base-plus-eight directly in `r0`, likely because the original source had a
different priority/live-range ordering. Experiments included declaration-order
changes, signed and unsigned field variants, pointer aliases, per-iteration
pointers, a base pointer, temporary values, loop-shape changes, and source-natural
reuse of `bit`; none produced the target allocation. The base-pointer experiment
was worse and was discarded.

## Possible next attempts

- Compare full `.greg` register-priority and live-range tables against a matching
  neighboring function or recover the original source shape from another game
  version.
- Try source forms that preserve a longer lifetime for the target's low-register
  pseudos without introducing pointer aliases or extra stack variables.
- Revisit the exact lexical/control-flow shape around the first pressed-key
  condition and the release block, especially whether the original source kept
  one pointer expression live across both paths.
