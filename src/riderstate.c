#include "include_asm.h"
#include "ram.h"
#include "unsorted.h"

void SetRiderGlobal(unk32 arg0);
void handleEventListeners(unk32 arg0, unk16 arg1);
void sub_805024C(unk8* arg0);

void sub_804FF5C(s32 arg0)
{
    __fastMemoryClearARM(0, (void*)arg0, 0x10);
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

INCLUDE_ASM("asm/dump/804a388-tutorial/805000c.s");

INCLUDE_ASM("asm/dump/804a388-tutorial/8050050.s");

s32 sub_8050114(RiderState* arg0)
{
    unk32 value;
    unk16 temp_r3;

    value = (s16)(arg0->prefix.words.unk2 ^ arg0->prefix.words.unk4);
    temp_r3 = arg0->prefix.words.unk6;
    value ^= (unk32)(temp_r3 << 22) >> 22;
    value ^= (unk32)(arg0->unkD << 28) >> 28;
    value ^= arg0->unk8;
    temp_r3 = arg0->unkC;
    value ^= temp_r3;
    value ^= arg0->unkA;
    value &= 0x3F;
    temp_r3 = arg0->prefix.bytes.unk7 >> 2;
    if (temp_r3 == value) {
        _gameData->unk161C &= 0xFFFE;
        return 1;
    }
    _gameData->unk161C |= 1;
    return 0;
}

INCLUDE_ASM("asm/dump/804a388-tutorial/8050184.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/80501a8.s");

unk8 sub_80501C8(RiderState* arg0, unk8 arg1)
{
    if ((_gameData->unk161C & 1) != 0) {
        return 0;
    }
    return (unk8)(((unk32)(arg0->unkD << 28) >> 28) & arg1);
}

INCLUDE_ASM("asm/dump/804a388-tutorial/80501f8.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/805024c.s");
