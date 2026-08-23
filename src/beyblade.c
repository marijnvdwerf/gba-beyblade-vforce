#include "beyblade.h"

#include <agb/memory_map.h>

#include "include_asm.h"
#include "ram.h"
#include "unsorted.h"

INCLUDE_ASM("asm/dump/804a388-tutorial/805703c.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/8057048.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/8057068.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/8057094.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/80570c0.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/80570d4.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/8057104.s");

void sub_8057158(FrontendResource* arg0, const InputSequence* arg1)
{
    arg0->state = 0;
    arg0->data = arg1;
    arg0->timer = 0;
}

void sub_8057164(FrontendResource* arg0)
{
    const u16* values;

    values = arg0->data->keys;
    if (arg0->state == arg0->data->count) {
        arg0->state = -1;
    } else if (arg0->state != -1) {
        if (arg0->timer == 0) {
            if (arg0->state != 0) {
                return;
            }
        } else {
            arg0->timer--;
        }
        if (_unk3005DA0 == values[arg0->state]) {
            arg0->timer = 0x3C;
            arg0->state++;
        } else if (_unk3005DA0 != 0) {
            arg0->timer = 0;
            arg0->state = 0;
        }
    }
}

unk8 sub_80571D0(FrontendResource* arg0)
{
    return arg0->state == arg0->data->count;
}

INCLUDE_ASM("asm/dump/804a388-tutorial/80571e4-GetTalkingHead.s");

void emptyBeybladeActorData(void)
{
    BeybladeActorData* record;
    s32 i;

    record = _gameData->actorData;
    _gameData->unk12F0 = 0xE;
    for (i = 0; i < 0x3C; i++) {
        record->block = NULL;
        record->unk4 = 0;
        record++;
    }
}

void deallocBeybladeActorData(void)
{
    BeybladeActorData* record;
    s32 i;

    record = _gameData->actorData;
    for (i = 0; i < 0x3C; i++) {
        if (record->block != NULL) {
            deallocateBlock(record->block);
            record->block = NULL;
        }
        record++;
    }
}

INCLUDE_ASM("asm/dump/804a388-tutorial/8057258-getBeyBladeActorDataForIndex.s");

const BeybladeData* getBeybladeData0(unk32 arg0)
{
    return &_807ac28[arg0];
}

INCLUDE_ASM("asm/dump/804a388-tutorial/8057348-getBeybladeActorData.s");

void allocateBeyBladeActorPalette(unk32 arg0, unk32 arg1)
{
    CopyFn** copy;
    void* destination;
    void* source;

    getBeybladeData0(arg0);
    source = RiderPalettes[arg0];
    copy = &__fastMemoryCopyARM;
    arg1 <<= 5;
    destination = (void*)OBJ_PLTT;
    destination += arg1;
    (*copy)(source, destination, 0x20);
}

void allocateBeybladeObjectPalettes(void)
{
    BeybladeActorData* records;
    s32 index;

    records = _gameData->actorData;
    index = 0;
    do {
        if (records->block != NULL) {
            allocateBeyBladeActorPalette(index, records->unk4);
        }
        records++;
        index++;
    } while (index <= 0x3B);
}

INCLUDE_ASM("asm/dump/804a388-tutorial/80573c8.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/80573dc.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/80573fc.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/805741c.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/805743c.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/805745c.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/805747c.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/805749c.s");
