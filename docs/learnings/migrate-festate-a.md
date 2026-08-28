# festate migration notes

## `sub_8047E5C` draft

The current semantic draft before abandoning the match attempt was:

```c
void sub_8047E5C(FrontendState* state, u32 arg1)
{
    SpriteEntry* sprite;
    s32 delta;

    switch (arg1) {
    case 0: {
        GameData* gameData;
        s32 initialPosition;

        sub_8049168();
        state->unk7F = 0;
        gameData = _gameData;
        gameData->unk1618 = 0;
        gameData->unk1619 = 0;
        gameData->unk161A = 0;
        sub_80600B4();
        sprite = allocSprite(0);
        _unk3000568 = sprite;
        sprite = allocSprite(0);
        _unk300056C = sprite;
        sprite = allocSprite(0);
        _unk3000570 = sprite;
        _unk3000574 = 0x1400;
        LoadSpriteSheet(_unk3000568, SpriteSheet_8251F40,
            (initialPosition = 0x10000), 0x3600, 0, 0, 0, 0);
        LoadSpriteSheet(_unk300056C, SpriteSheet_8251F40, 0x18000, 0x3600, 0, 0, 0, 0);
        LoadSpriteSheet(_unk3000570, SpriteSheet_8252994, 0x14000, 0x4000, 0, 0, 0, 0);
        _unk3000570->frame.value = 8;
        _unk3000578 = 0;
        _unk300057C = initialPosition;
        sub_80596AC(&state->unk250, -initialPosition, 0);
        allocFont(&_unk3000580, SpriteSheet_82B05EC, ShadowFontMeta, 0x100, 0x69, 0xC8, 2);
        sub_8061660(&_unk3000580, _806E3B0[getLanguage()], 0xF);
        break;
    }
    default:
        break;
    case 1:
        sub_80439A0(&state->unk140);
        sub_8061844(&_unk3000580,
            ((_unk3000580.x + ((_unk3000574 - _unk3000580.x) >> 2)) << 8) >> 16, 0x69);
        _unk3000568->x += ((_unk3000574 - _unk3000568->x) + 0x400) >> 2;
        _unk300056C->x += ((_unk3000574 - _unk300056C->x) + 0x8400) >> 2;
        _unk3000570->x += ((_unk3000574 - _unk3000570->x) + 0x4400) >> 2;
        delta = (_unk3000578 - _unk300057C) >> 2;
        sub_80596AC(&state->unk250, -delta, 0);
        _unk300057C += delta;
        if (((sub_8057C40() >> 4) & 0xF) == 0) {
            _unk3000570->frame.value++;
            if (_unk3000570->frame.value > 0xA) {
                _unk3000570->frame.value = 8;
            }
        }
        break;
    case 7:
        if (_unk3000568 != NULL) {
            sub_8060A94(_unk3000568);
        }
        if (_unk300056C != NULL) {
            sub_8060A94(_unk300056C);
        }
        if (_unk3000570 != NULL) {
            sub_8060A94(_unk3000570);
        }
        sub_8061204(&_unk3000580);
        break;
    case 2:
        if (_unk3005DA0 == 1) {
            _unk3000574 = 0x10000;
            _unk3000578 = 0x10000;
            sub_80490F8(0xA);
        }
        break;
    }
}
```

The first substantive divergence was in the case-1 prologue. The target retains the address of `_unk3000580` in `r5`, its current `x` value in `r4`, and the address of `_unk3000574` in `r6`:

```asm
ldr r5, [pc, ...]       ; &_unk3000580
ldr r4, [r5]            ; _unk3000580.x
...
ldr r6, [pc, ...]       ; &_unk3000574
ldr r0, [r6]            ; _unk3000574
sub r0, r0, r4
asr r0, #2
add r4, r4, r0
...
mov r0, r5
mov r1, r4
mov r2, #105
bl sub_8061844
```

The C draft instead allocated these values differently, so the first differing instructions appeared while loading and computing the font position. The later branch offsets and case bodies were downstream effects.

## Experiments

- Used an explicit `case 0` plus a separate empty `default` to reproduce the target dispatch ladder and preserve the target case-body order.
- Kept initialization-local `initialPosition` scoped to case 0.
- Embedded `(initialPosition = 0x10000)` in the first `LoadSpriteSheet` call to preserve the target literal lifetime and initialization sequence.
- Tried direct global accesses, local aliases, reused sprite temporaries, different switch ordering, conditional ladders, and alternate expression staging. None reproduced the case-1 register/lifetime shape without an artificial source construct.
- A packed `SpriteFrame` union was temporarily introduced to model the proven width pun at `SpriteEntry + 0x18`: `strh`/`ldrh` occur in `sub_8047E5C`, while `ldrb`/`strb` occur in existing sprite and sprite-text code. The union was rejected as unsuitable C90 style and is being removed with the abandoned source changes.

## `sub_804444C` abandoned draft

The semantic draft followed the m2c control flow: selector 0 initializes the multiplayer frontend state and ten text entries, selector 1 updates the selected record and scroll position, and selector 2 advances animation and triggers the result transition. The draft used `FrontendSelectionRecord`, `FrontendTextTable`, and a width-punned `CurrentGameStateTailWord` to represent accesses proven by `ldsh`/`ldsb` at offsets 2/3 of the same word.

The first divergent instruction after the prologue was at the source initialization path. Target:

```asm
str r0, [sp]
mov r4, r1
bl isMultiplayer
lsl r0, r0, #16
lsr r0, r0, #16
mov r1, #1
mov sl, r1
...
```

The draft instead retained the state argument in `r10`, loaded `_gameData` before the target sequence, and emitted byte normalization from `isMultiplayer`:

```asm
mov r10, r0
mov r4, r1
ldr r0, [pc, ...]
ldr r7, [r0]
bl isMultiplayer
lsl r0, r0, #24
lsr r0, r0, #24
```

Attempts included typed aliases for the game-data records and current-state tail, explicit switch arms, and source-local temporaries. These changed parameter/global lifetimes and did not recover the target stack spill or register allocation. The function was parked rather than forced with artificial constructs.

## `sub_8045CB4` parked draft

The semantic m2c draft initializes four sprites, two large-font text objects, horizontal and vertical target positions, and frame counters in selector 0; selector 1 interpolates both fonts and sprites; selector 2 handles the transition, animation controls, and sprite-frame changes; selector 7 frees the four sprites and both text objects.

A concise source draft shape was:

```c
void sub_8045CB4(FrontendState* state, unk32 arg1)
{
    switch (arg1) {
    case 0:
        _unk30003C8 = 0;
        _unk30003CC = 0x10000;
        sub_80596AC(&state->unk250, -0x10000, 0);
        _unk3000460 = 0;
        /* Allocate/load _unk30003D0, _unk30003D4, _unk30003D8, and _unk30003DC. */
        _unk30003E0 = 0x1900;
        _unk30003E4 = 0xC700;
        _unk30003EC = 0x7800;
        _unk30003F0 = 0x2900;
        _unk30003E8 = 0x3000;
        /* Initialize the two large-font SpriteTextCleanup objects. */
        break;
    case 1:
        /* Interpolate the two fonts, scroll position, and four sprite positions. */
        break;
    case 2:
        /* Handle state transitions and left/right frame changes. */
        break;
    case 7:
        /* Free the four sprites and clear both fonts. */
        break;
    default:
        break;
    }
}
```

The first unresolved layout issue is a proven halfword access to `SpriteEntry + 0x18` (`ldrh`/`strh`) while the established `SpriteEntry` layout exposes byte-oriented frame users at that location. Modeling the pun would require the packed union rejected during the `sub_8047E5C` attempt; retaining the existing byte field cannot emit the target halfword stores. Because the function also has a long, high-pressure body, it was parked rather than changing a shared matched layout or forcing casts/raw offsets.

## `selectBladeFrontendHandler` parked draft

The semantic m2c draft shows a frontend handler with selectors 0, 1, 2, 7, and 8. Selector 0 scans for an available blade, allocates and loads six sprites, initializes eight font/text entries, and resets the handler state. Selector 1 updates the hardware blend registers, collection sprite, three visible sprites, and scrolling position. Selector 2 handles input-driven transitions and frame changes. Selector 7 frees all allocated sprites and text resources. Selector 8 records a callback argument only when it equals one.

The source-level draft shape was:

```c
void selectBladeFrontendHandler(FrontendState* state, unk32 arg1, unk8 arg2)
{
    switch (arg1) {
    case 0:
        /* Find an available blade, allocate/load six sprites, initialize text. */
        /* Reset positions, state bytes, and scroll target. */
        break;
    case 1:
        /* Update blend registers, collection sprite, visible sprites, and scroll. */
        break;
    case 2:
        /* Process input transitions and update the selected frame. */
        break;
    case 7:
        /* Free the six sprites and release collection resources. */
        break;
    case 8:
        if (arg2 == 1)
            /* Record the callback state. */
            ;
        break;
    }
}
```

No C replacement was attempted because the dump contains a large, tightly coupled handler with multiple opaque fixed-layout objects and hardware-register accesses. The first unresolved source-layout issue is the handler storage object at `_unk30004F0`: the dump accesses fields through offsets `0x00` through `0x38`, while the current source exposes it as an opaque byte array. Typing that object and the associated resource pointers would require a broad layout change before a meaningful instruction diff could be obtained. The function remains `INCLUDE_ASM` with its dump intact.
