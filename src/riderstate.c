#include "riderstate.h"

#include "event.h"
#include "gameinit.h"
#include "include_asm.h"
#include "ram.h"
#include "unsorted.h"

extern const unk8 Str_872704C[];

void sub_804FF5C(void* arg0)
{
    __fastMemoryClearARM(0, arg0, 0x10);
    _unk3000F44 = 0;
    _unk3000F40 = 0;
}

void sub_804FF88(unk16 arg0)
{
    s32 index;

    if (_unk3000F40 > 0xF) {
        printf(Str_872704C);
    }
    index = _unk3000F44;
    index += _unk3000F40;
    if (index > 0xF) {
        index -= 0x10;
    }
    _unk3000F20[index] = arg0;
    _unk3000F40++;
}

void sub_804FFD4(void)
{
    __fastMemoryClearARM(0, _gameData->unk15D4, 0x40);
    _unk3000F44 = 0;
    _unk3000F40 = 0;
}

void sub_805000C(RiderState* arg0, RiderBase* arg1)
{
    unk16 value;
    unk32 current;
    unk32 old;

    arg0->prefix.words.unk0 = arg1->unk0->x >> 8;
    arg0->prefix.words.unk2 = arg1->unk0->y >> 8;
    arg0->prefix.words.unk4 = arg1->unk0->z >> 8;
    value = arg1->unk0->unk22;
    current = value & 0x3FF;
    old = arg0->prefix.words.unk6;
    old &= 0xFFFFFC00;
    old |= current;
    arg0->prefix.words.unk6 = old;
    arg0->unkC = arg1->unk4->unk3CC;
    sub_805024C(arg0);
}

#if 0
void sub_8050050(RiderState* state, RiderState* other)
{
    unk16 value;
    unk16 otherValue;
    CurrentGameState* currentState;

    value = _unk3000F20[_unk3000F44];
    if (_unk3000F40 != 0) {
        otherValue = other->unkA;
        if (value == otherValue) {
            _unk3000F40--;
            if (_unk3000F40 != 0) {
                _unk3000F44++;
                if (_unk3000F44 > 0xF)
                    _unk3000F44 = 0;
                value = _unk3000F20[_unk3000F44];
            } else {
                value = 0;
            }
        }
    }
    state->unk8 = value;
    otherValue = other->unk8;
    if (state->unkA != otherValue && otherValue != 0) {
        if ((_gameData->unk161C & 1) == 0) {
            currentState = _currentGameState;
            if (currentState->unk6A4 == 2) {
                SetRiderGlobal(0);
                handleEventListeners(&_gameData->unk65C, otherValue);
            }
        }
    }
    state->unkA = otherValue;
    sub_805024C(state);
}
#endif
INCLUDE_ASM("asm/dump/804a388-tutorial/8050050.s");

s32 sub_8050114(RiderState* arg0)
{
    unk32 checksum;
    u32 flagsWord;
    u32 flagBits;

    checksum = (s16)(arg0->prefix.words.unk2 ^ arg0->prefix.words.unk4);
    flagsWord = arg0->prefix.words.unk6;
    checksum ^= (u32)(flagsWord << 22) >> 22;
    checksum ^= (u32)(arg0->unkD << 28) >> 28;
    checksum ^= arg0->unk8;
    flagBits = arg0->unkC;
    checksum ^= flagBits;
    checksum ^= arg0->unkA;
    checksum &= 0x3F;
    flagBits = arg0->prefix.bytes.unk7 >> 2;
    if (flagBits == checksum) {
        _gameData->unk161C &= 0xFFFE;
        return 1;
    }
    _gameData->unk161C |= 1;
    return 0;
}

#if 0
void sub_8050184(RiderState* arg0, u8 arg1)
{
    unk8 flags;
    s32 preserved;
    unk32 selected;

    flags = arg0->unkD;
    selected = (flags << 28 >> 28) | arg1;
    selected &= 0xF;
    preserved = 0x10;
    preserved = 0 - preserved;
    preserved &= flags;
    preserved |= selected;
    arg0->unkD = preserved;
    sub_805024C(arg0);
}
#endif
INCLUDE_ASM("asm/dump/804a388-tutorial/8050184.s");

INCLUDE_ASM("asm/dump/804a388-tutorial/80501a8.s");

u8 sub_80501C8(RiderState* arg0, u8 arg1)
{
    if ((_gameData->unk161C & 1) != 0) {
        return 0;
    }
    return (u8)(((u32)(arg0->unkD << 28) >> 28) & arg1);
}

void sub_80501F8(RiderState* state, RiderBase* riders)
{
    Actor* actor;
    unk32 x;
    unk32 y;
    unk32 z;
    unk32 value;

    actor = &riders->unk238;
    x = state->prefix.words.unk0 << 8;
    y = state->prefix.words.unk2 << 8;
    z = state->prefix.words.unk4 << 8;
    actor->unk40 = x - actor->x;
    actor->unk44 = y - actor->y;
    actor->unk48 = z - actor->z;
    actor->x = x;
    actor->y = y;
    actor->z = z;
    value = state->prefix.words.unk6;
    value <<= 22;
    value >>= 22;
    actor->unk22 = value;
    value = state->unkC & 8;
    riders->unk3CC = value;
}

void sub_805024C(RiderState* arg0)
{
    unk32 checksum;
    unk32 flags;

    checksum = arg0->prefix.words.unk2 ^ arg0->prefix.words.unk4;
    checksum ^= (u32)(arg0->prefix.words.unk6 << 22) >> 22;
    checksum ^= (u32)(arg0->unkD << 28) >> 28;
    checksum ^= arg0->unk8;
    checksum ^= arg0->unkC;
    checksum ^= arg0->unkA;
    checksum &= 0x3F;
    checksum <<= 2;
    flags = arg0->prefix.bytes.unk7 & 3;
    arg0->prefix.bytes.unk7 = flags | checksum;
}
