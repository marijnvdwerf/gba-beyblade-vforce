#include "beyblade.h"

#include <agb/memory_map.h>

#include "include_asm.h"
#include "ram.h"
#include "unsorted.h"

extern const unk8 byte_807D7C0[];

INCLUDE_ASM("asm/dump/804a388-tutorial/805703c.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/8057048.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/8057068.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/8057094.s");

const ItemDescriptionEntry* sub_80570C0(unk32 index)
{
    return &ItemDescription[index];
}

unk8 sub_80570D4(s32 arg0)
{
    if ((_currentGameState->unk594[arg0 >> 5] & (1 << (arg0 & 0x1F))) != 0) {
        return 1;
    }
    return 0;
}

#if 0
void sub_8057104(s32 arg0, unk32 arg1)
{
    unk32* data;
    unk32 value;

    if ((arg1 << 24) != 0) {
        data = &_currentGameState->unk594[0];
        data = (unk32*)((unk8*)data + ((arg0 >> 5) << 2));
        value = *data | (1 << (arg0 & 0x1F));
    } else {
        data = &_currentGameState->unk594[0];
        data = (unk32*)((unk8*)data + ((arg0 >> 5) << 2));
        value = *data & ~(1 << (arg0 & 0x1F));
    }
    *data = value;
}
#endif
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

#if 0
void* getBeyBladeActorDataForIndex(s32 index)
{
    GameData* gameData;
    BeybladeActorData* record;
    const BeybladeData* data;
    AllocatedBlock* block;
    void* spriteSheet;
    unk8* result;
    s32 flags;
    s32 bit;
    unk32 value;

    gameData = _gameData;
    record = &gameData->actorData[index];
    data = getBeybladeData0(index);
    spriteSheet = RiderSpriteSheets[index];
    if (index > 0x3B) {
        printf((const unk8*)Str_872AE20, index, 0x3C);
        return NULL;
    }
    if (*(const unk8*)((const unk8*)data + 0x31) != 0) {
        block = record->block;
        if (block != NULL) {
            result = block->address;
        } else {
            block = slowAllocate(data->compressedSize >> 8);
            record->block = block;
            if (block == NULL) {
                printf((const unk8*)Str_872AE64);
            }
            result = record->block->address;
        }
        LZ77UnCompWram(spriteSheet, result);
        bit = 0;
        flags = *(unk16*)((unk8*)gameData + 0x12F0);
        if ((flags & 1) != 0) {
            value = 1;
            do {
                bit++;
                value = (flags >> bit) & 1;
            } while (value != 0 && bit <= 0xF);
        }
        if (bit <= 0xF) {
            record->unk4 = bit;
            *(unk16*)((unk8*)gameData + 0x12F0) |= 1 << bit;
        } else {
            printf((const unk8*)Str_872AEC0);
        }
    } else {
        result = (unk8*)spriteSheet;
    }
    return result;
}
#endif
INCLUDE_ASM("asm/dump/804a388-tutorial/8057258-getBeyBladeActorDataForIndex.s");

const BeybladeData* getBeybladeData0(unk32 arg0)
{
    return &_807ac28[arg0];
}

BeybladeActorData* getBeybladeActorData(unk32 arg0)
{
    BeybladeActorData* data;

    data = _gameData->actorData;
    return &data[arg0];
}

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

unk8 sub_805749C(unk32 arg0)
{
    return byte_807D7C0[arg0];
}
