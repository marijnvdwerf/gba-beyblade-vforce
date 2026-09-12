#include "beyblade.h"

#include <agb/bios.h>
#include <agb/memory_map.h>

#include "debug.h"
#include "include_asm.h"
#include "memory.h"
#include "ram.h"
#include "unsorted.h"

extern const unk8 byte_807D7C0[];
extern const unk8** ItemNames[];
extern const unk8** _807C960[];
extern const unk8** _807CE24[];
extern const unk8** _807D2E8[];
extern const unk8** _807D7AC[];
extern const unk8 _807a53c[];
extern const unk8 _807b858[][12];
extern const unk8** _807BFD8[];
extern const unk8** _807C49C[];
extern const unk8 Pal_836067C[];
extern unk8 SpriteSheet_836087C[];
extern const unk8* CollectionPalettes[];
extern unk8* CollectionSpriteSheets[];

unk8 sub_805703C(unk32 arg0)
{
    return _807a53c[arg0];
}

const unk8* sub_8057048(unk32 arg0)
{
    unk32 language;

    language = getLanguage();
    return ItemNames[language][arg0];
}

const unk8* sub_8057068(unk32 arg0)
{
    if (sub_80570D4(arg0) != 0) {
        return CollectionPalettes[arg0];
    }
    return Pal_836067C;
}

unk8* sub_8057094(unk32 arg0)
{
    if (sub_80570D4(arg0) != 0) {
        return CollectionSpriteSheets[arg0];
    }
    return SpriteSheet_836087C;
}

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

void sub_8057104(s32 arg0, unk8 arg1)
{
    if (arg1) {
        _currentGameState->unk594[arg0 >> 5] |= 1 << (arg0 & 0x1F);
    } else {
        _currentGameState->unk594[arg0 >> 5] &= ~(1 << (arg0 & 0x1F));
    }
}

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

TalkingHead* GetTalkingHead(s32 index)
{
    return &TalkingHeads[index];
}

void emptyBeybladeActorData(void)
{
    BeybladeActorData* record;
    s32 i;

    record = _gameData->actorData.records;
    _gameData->actorData.unk1E0 = 0xE;
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

    record = _gameData->actorData.records;
    for (i = 0; i < 0x3C; i++) {
        if (record->block != NULL) {
            deallocateBlock(record->block);
            record->block = NULL;
        }
        record++;
    }
}

extern unk32* RiderSpriteSheets[];
extern const unk8 Str_872AE20[];
extern const unk8 Str_872AE64[];
extern const unk8 Str_872AEC0[];

void* getBeyBladeActorDataForIndex(s32 index)
{
    GameData* gameData;
    BeybladeActorCache* cache;
    BeybladeActorData* record;
    const BeybladeData* data;
    unk32* spriteSheet;
    void* result;
    s32 bit;

    gameData = _gameData;
    cache = &gameData->actorData;
    record = &cache->records[index];
    data = getBeybladeData0(index);
    spriteSheet = RiderSpriteSheets[index];
    if (index > 0x3B) {
        printf(Str_872AE20, index, 0x3C);
        return NULL;
    }
    if (data->unk31 != 0) {
        if (record->block != NULL) {
            result = record->block->address;
        } else {
            record->block = slowAllocate(*spriteSheet >> 8);
            if (record->block == NULL) {
                printf(Str_872AE64);
            }
            result = record->block->address;
            LZ77UnCompWram(spriteSheet, result);
            bit = 0;
            while (((gameData->actorData.unk1E0 >> bit) & 1) != 0 && bit <= 0xF) {
                bit++;
            }
            if (bit <= 0xF) {
                record->unk4 = bit;
                cache->unk1E0 |= 1 << bit;
            } else {
                printf(Str_872AEC0);
            }
        }
    } else {
        result = spriteSheet;
    }
    return result;
}

const BeybladeData* getBeybladeData0(unk32 arg0)
{
    return &_807ac28[arg0];
}

BeybladeActorData* getBeybladeActorData(unk32 arg0)
{
    BeybladeActorData* data;

    data = _gameData->actorData.records;
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

    records = _gameData->actorData.records;
    index = 0;
    do {
        if (records->block != NULL) {
            allocateBeyBladeActorPalette(index, records->unk4);
        }
        records++;
        index++;
    } while (index <= 0x3B);
}

const unk8* sub_80573C8(unk32 arg0)
{
    return _807b858[arg0];
}

const unk8* sub_80573DC(unk32 arg0)
{
    return _807BFD8[getLanguage()][arg0];
}

const unk8* sub_80573FC(unk32 arg0)
{
    return _807C49C[getLanguage()][arg0];
}

const unk8* sub_805741C(unk32 arg0)
{
    return _807C960[getLanguage()][arg0];
}

const unk8* sub_805743C(unk32 arg0)
{
    return _807CE24[getLanguage()][arg0];
}

const unk8* sub_805745C(unk32 arg0)
{
    return _807D2E8[getLanguage()][arg0];
}

const unk8* sub_805747C(unk32 arg0)
{
    return _807D7AC[getLanguage()][arg0];
}

unk8 sub_805749C(unk32 arg0)
{
    return byte_807D7C0[arg0];
}
