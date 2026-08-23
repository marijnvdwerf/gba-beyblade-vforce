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

INCLUDE_ASM("asm/dump/804a388-tutorial/805000c.s");

INCLUDE_ASM("asm/dump/804a388-tutorial/8050050.s");

s32 sub_8050114(RiderState* arg0)
{
    unk32 checksum;
    unk16 flagsWord;
    unk16 flagBits;

    checksum = (s16)(arg0->prefix.words.unk2 ^ arg0->prefix.words.unk4);
    flagsWord = arg0->prefix.words.unk6;
    /* Keep shifts: agbcc emits the target lsl/lsr sequence; masks load literals. */
    checksum ^= (unk32)(flagsWord << 22) >> 22;
    checksum ^= (unk32)(arg0->unkD << 28) >> 28;
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
