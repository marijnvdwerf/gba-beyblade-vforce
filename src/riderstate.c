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

void sub_8050050(RiderState* arg0, RiderState* arg1)
{
    s16 index;
    s16 count;
    unk16 value;
    unk8* gameData;
    unk8* collision;
    unk16* queue;

    queue = (unk16*)_unk3000F20;
    index = _unk3000F44;
    value = queue[index];
    count = _unk3000F40;
    if (count != 0) {
        if (value == arg1->unkA) {
            count--;
            _unk3000F40 = count;
            if (count == 0) {
                value = 0;
            } else {
                index = _unk3000F44 + 1;
                _unk3000F44 = index;
                if (index > 0xF) {
                    index = 0;
                    _unk3000F44 = index;
                }
                value = queue[index];
            }
        }
    }
    arg0->unk8 = value;
    if (arg1->unk8 != arg0->unkA && arg1->unk8 != 0) {
        gameData = (unk8*)_gameData;
        if ((*(unk16*)(gameData + 0x161C) & 1) == 0) {
            collision = (unk8*)_currentGameState;
            if (collision[0x6A4] == 2) {
                SetRiderGlobal(0);
                handleEventListeners((unk32)(gameData + 0x65C), arg1->unk8);
            }
        }
    }
    arg0->unkA = arg1->unk8;
    sub_805024C((unk8*)arg0);
}

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
    if ((arg0->prefix.bytes.unk7 >> 2) == (value & 0x3F)) {
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
