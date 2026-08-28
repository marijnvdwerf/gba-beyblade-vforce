#include "riderstate.h"

#include "event.h"
#include "gameinit.h"
#include "include_asm.h"
#include "ram.h"
#include "unsorted.h"

void sub_804FF5C(void* arg0)
{
    __fastMemoryClearARM(0, arg0, 0x10);
    _unk3000F44 = 0;
    _unk3000F40 = 0;
}

INCLUDE_ASM("asm/dump/804a388-tutorial/804ff88.s");

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
    const unk32 mask = 0x3FF;
    const unk32 clear_mask = 0xFFFFFC00;

    arg0->prefix.words.unk0 = arg1->unk0->x >> 8;
    arg0->prefix.words.unk2 = arg1->unk0->y >> 8;
    arg0->prefix.words.unk4 = arg1->unk0->z >> 8;
    value = arg1->unk0->unk22;
    current = value & mask;
    old = arg0->prefix.words.unk6;
    old &= clear_mask;
    old |= current;
    arg0->prefix.words.unk6 = old;
    arg0->unkC = arg1->unk4->unk3CC;
    sub_805024C(arg0);
}

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

void sub_8050184(RiderState* arg0, u8 arg1)
{
    unk8 temp_r3;
    unk32 temp_r2;
    unk32 temp_r1;

    temp_r3 = arg0->unkD;
    temp_r2 = ((unk32)(temp_r3 << 28) >> 28) | arg1;
    temp_r2 &= 0xF;
    temp_r1 = (unk32)(-(s32)(unk8)0x10);
    temp_r1 &= temp_r3;
    temp_r1 |= temp_r2;
    arg0->unkD = (unk8)temp_r1;
    sub_805024C(arg0);
}

INCLUDE_ASM("asm/dump/804a388-tutorial/80501a8.s");

u8 sub_80501C8(RiderState* arg0, u8 arg1)
{
    if ((_gameData->unk161C & 1) != 0) {
        return 0;
    }
    return (u8)(((u32)(arg0->unkD << 28) >> 28) & arg1);
}

INCLUDE_ASM("asm/dump/804a388-tutorial/80501f8.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/805024c.s");
