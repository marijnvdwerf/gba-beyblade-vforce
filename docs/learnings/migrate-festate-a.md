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
