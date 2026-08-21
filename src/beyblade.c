#include "include_asm.h"
#include "ram.h"

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
    s32 count;
    unk32 zero;

    record = _gameData->actorData;
    _gameData->unk12F0 = 0xE;
    zero = 0;
    count = 0x3B;
    do {
        record->block = zero;
        record->unk4 = zero;
        record += 1;
        count--;
    } while (count >= 0);
}
void deallocBeybladeActorData(void)
{
    BeybladeActorData* record;
    s32 count;
    unk32 zero;

    record = _gameData->actorData;
    zero = 0;
    count = 0x3B;
    do {
        if (record->block != 0) {
            deallocateBlock((AllocatedBlock*)record->block);
            record->block = zero;
        }
        record += 1;
        count--;
    } while (count >= 0);
}
INCLUDE_ASM("asm/dump/804a388-tutorial/8057258-getBeyBladeActorDataForIndex.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/8057338-getBeybladeData0.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/8057348-getBeybladeActorData.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/8057360-allocateBeyBladeActorPalette.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/8057398-allocateBeybladeObjectPalettes.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/80573c8.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/80573dc.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/80573fc.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/805741c.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/805743c.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/805745c.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/805747c.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/805749c.s");
