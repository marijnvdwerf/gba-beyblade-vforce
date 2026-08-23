#include "debug.h"
#include "include_asm.h"
#include "ram.h"
#include "sound.h"

extern unk16 _unk3000F14;
extern unk16 _unk3000F18;
extern s16 _unk3000F1C;

extern const unk32 _807561C[];

void sub_804AE8C(void);
void sub_804AE34(unk32, unk32);
void sub_804AD44(void);
void sub_804AD50(void);
void sub_804AF04(unk32);
void sub_804AFD4(u16);
void sub_804AF5C(void);
s32 Sound_8062990(const unk32*, const unk32*);

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

INCLUDE_ASM("asm/dump/804a388-tutorial/804ad74.s");

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
    const unk8* table;
    const unk32* first;
    const unk32* second;
    unk32 index;

    index = arg0;
    sub_804AF5C();
    _gameData->unkC26 = index;
    table = (const unk8*)_807561C;
    index <<= 3;
    first = *(const unk32**)(table + index);
    table += 4;
    second = *(const unk32**)(table + index);
    _gameData->unkC2C = Sound_8062990(first, second);
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
