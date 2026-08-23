#include "music.h"

#include "debug.h"
#include "include_asm.h"
#include "ram.h"
#include "sound.h"

INCLUDE_ASM("asm/dump/804a388-tutorial/804abfc.s");

void sub_804ACF0(void)
{
    _unk3000F18 = _currentGameState->unk6E4;
    _unk3000F14 = _currentGameState->unk6E6;
    _unk3000F1C = 0;
}

void sub_804AD28(void)
{
    sub_804AFD4(_unk3000F14);
    _unk3000F1C = 0;
}

void sub_804AD44(void)
{
    _unk3000F1C = 1;
}

void sub_804AD50(void)
{
    _unk3000F1C = -0x18;
}

unk32 sub_804AD60(void)
{
    return _unk3000F1C != 0;
}

void sub_804AD74(void)
{
    s32 upper;
    s32 lower;
    s16 value;

    upper = _currentGameState->unk6E4 + _unk3000F1C;
    lower = _currentGameState->unk6E6 + _unk3000F1C;
    value = _unk3000F1C;
    if (value < 0) {
        if (upper < 0) {
            upper = 0;
        }
        if (lower < 0) {
            lower = 0;
        }
        if (_currentGameState->unk6E6 != 0) {
            sub_804AFD4((u16)lower);
        }
        if (upper == 0 && lower == 0) {
            _unk3000F1C = (s16)lower;
        }
    }
    value = _unk3000F1C;
    if (value > 0) {
        if (upper > _unk3000F18) {
            upper = _unk3000F18;
        }
        if (lower > _unk3000F14) {
            lower = _unk3000F14;
        }
        if (_currentGameState->unk6E6 < _unk3000F14) {
            sub_804AFD4((u16)lower);
        }
        if (upper == _unk3000F18 && lower == _unk3000F14) {
            _unk3000F1C = 0;
        }
    }
}

void nullsub_40(void)
{
}

void sub_804AE34(unk32 arg0, unk32 arg1)
{
    sub_804AE8C();
    if (_currentGameState->unk6E4 != 0) {
        _gameData->unkC24 = arg0;
        _gameData->unkC28 = Sound_8062BFC(arg0, arg1);
        Sound_8062AD4(_gameData->unkC28, _currentGameState->unk6E4);
    }
}

void sub_804AE8C(void)
{
    if ((s16)_gameData->unkC24 != -1) {
        Sound_8062A90(_gameData->unkC28);
    }
    _gameData->unkC24 = -1;
}

void sub_804AECC(unk32 arg0)
{
    if ((s16)_gameData->unkC24 != -1) {
        Sound_8062AF4(_gameData->unkC28, arg0);
    }
}

void sub_804AF04(unk32 arg0)
{
    unk32 index;

    index = arg0;
    sub_804AF5C();
    _gameData->unkC26 = index;
    _gameData->unkC2C = Sound_8062990(_807561C[index].first, _807561C[index].second);
    Sound_8062AD4(_gameData->unkC2C, _currentGameState->unk6E6);
}

void sub_804AF5C(void)
{
    if ((s16)_gameData->unkC26 != -1) {
        Sound_8062A90(_gameData->unkC2C);
    }
    _gameData->unkC26 = -1;
}

void sub_804AF9C(void)
{
    Sound_8062AA4(_gameData->unkC2C);
}

void sub_804AFB8(void)
{
    Sound_8062AB8(_gameData->unkC2C);
}

void sub_804AFD4(u16 arg0)
{
    Sound_8062AD4(_gameData->unkC2C, arg0);
    _currentGameState->unk6E6 = arg0;
}

void sub_804B00C(u16 arg0)
{
    Sound_8062AD4(_gameData->unkC28, arg0);
    _currentGameState->unk6E4 = arg0;
}

void sub_804B044(void)
{
    Sound_8062AA4(_gameData->unkC28);
}

void sub_804B060(void)
{
    Sound_8062AB8(_gameData->unkC28);
}
