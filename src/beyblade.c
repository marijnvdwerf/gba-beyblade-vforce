#include "include_asm.h"
#include "ram.h"

void allocateBeyBladeActorPalette(unk32, unk32);

INCLUDE_ASM("asm/dump/804a388-tutorial/805703c.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/8057048.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/8057068.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/8057094.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/80570c0.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/80570d4.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/8057104.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/8057158.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/8057164.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/80571d0.s");
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
INCLUDE_ASM("asm/dump/804a388-tutorial/8057338-getBeybladeData0.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/8057348-getBeybladeActorData.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/8057360-allocateBeyBladeActorPalette.s");

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
