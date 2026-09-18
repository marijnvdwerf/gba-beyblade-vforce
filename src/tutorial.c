#include "tutorial.h"

#include <agb/memory_map.h>
#include <agb/types.h>

#include "effects.h"
#include "gamestate.h"
#include "geometry.h"
#include "include_asm.h"
#include "keystate.h"
#include "layer.h"
#include "music.h"
#include "sprite.h"
#include "spritetext.h"
#include "text.h"
#include "unsorted.h"

extern const unk8* const* _806A77C[];

typedef struct BackgroundAsset {
    BGLayer layer;
    TilemapTextRenderer renderer;
} BackgroundAsset;

void sub_804A2F0(void)
{
    sub_804AE34(0, 0x3C);
}

void sub_804A300(void)
{
    sub_804AE34(0, 0x3C);
}

void sub_804A310(void)
{
    sub_804AE34(0, 0x3C);
}

void sub_804A320(void)
{
    sub_804AE34(0, 0x3C);
}

void sub_804A330(unk32 arg0)
{
    _unk3000650.unk81 = arg0;
}

unk8 sub_804A33C(void)
{
    return _unk3000650.unk81;
}

void sub_804A348(void)
{
    sub_804AE34(0, 0x3C);
}

void StoreLevelVar14(unk32 arg0)
{
    _unk3000C00 = arg0;
}

const unk8* const* sub_804A364(void)
{
    return sub_804A378(_unk3000C00);
}

const unk8* const* sub_804A378(unk32 arg0)
{
    return _806A77C[arg0];
}

extern const SpriteSheet SpriteSheet_82B05EC;
extern const unk8 ShadowFontMeta[];
extern const SpriteSheet SpriteSheet_821CCC8;
extern const SpriteSheet SpriteSheet_821CB80;
extern TutorialPage TutorialPages[];
extern void (*__oam_8756CC0)(void);

void initTutorialManagement(u16 levelId)
{
    LevelGeometryAddresses geometry;
    TutorialData* data;
    TutorialEntry* entry;
    LevelGeometryTable* geometryData;
    LineMetadata** metadata;
    LineMetadata* lineMetadata;
    LineMetaObject* metaobject;
    s32 count;
    s32 line;

    data = &_gameData->tutorial;
    entry = data->entries;
    geometryData = loadLevelGeometry(levelId);
    metadata = getLevelMetadata(levelId);
    sub_8051734();
    count = 0;
    __fastMemoryClearARM(0, data, sizeof(TutorialData));
    if (metadata != NULL && geometryData != NULL) {
        getLevelGeometryAddresses(&geometry, geometryData);
        StoreMetadataAddr(&geometry, metadata);
        line = 0;
        while (line < geometry.unk0->lineCount) {
            lineMetadata = GetLineMetaData(&geometry, line);
            if (count > 0x1F) {
                printf("unable to add Tutorial Triggers in initTutorialManagement()\n");
                break;
            }
            line++;
            if (lineMetadata != 0) {
                metaobject = getLineMetaobjectByTypeAndId(&geometry, lineMetadata, 1, 0x8CEC);
                if (metaobject != NULL) {
                    entry->line = line;
                    entry->sprite = &TutorialPages[metaobject->unk8.word];
                    count++;
                    entry++;
                }
            }
        }
        data->unk104 = 0;
        data->count = count;
        allocFont(&data->fontData, &SpriteSheet_82B05EC, ShadowFontMeta, 0x24, 0x73, 0xBA, 0);
        data->unk138 = 0;
        data->unk13C = 0;
    }
}

void turorial_804A488(unk32 arg0)
{
    s32 index;
    s32 count;
    LevelState* levelState;
    TutorialData* tutorial;
    TutorialEntry* entry;

    tutorial = &_gameData->tutorial;
    entry = tutorial->entries;
    levelState = sub_8051734();
    index = 0;
    if (entry->line - 1 != arg0) {
        count = tutorial->count;
        if (index < count) {
            do {
                index++;
                entry++;
            } while (entry->line - 1 != arg0 && index < count);
        }
    }
    if (index != tutorial->count && entry->line != 0) {
        if ((levelState->unk14[index >> 5] & (1 << (index & 0x1F))) == 0) {
            sub_80555F4();
            tutorial->unk104 = entry;
            levelState->unk14[index >> 5] |= 1 << (index & 0x1F);
        }
    }
}

unk32 sub_804A504(void)
{
    unk32 value;

    value = (unk32)_gameData->tutorial.unk104;
    return ((0 - value) | value) >> 31;
}

void sub_804A51C(void)
{
    GameData* data;
    TutorialEntry** slot;

    data = _gameData;
    slot = &data->tutorial.unk104;
    if (*slot != NULL && sub_80556DC(1) != 0) {
        sub_804A550(*slot);
        *slot = NULL;
        sub_8055624();
    }
}

void sub_804A550(TutorialEntry* arg0)
{
    GameData* gameData;
    TutorialData* tutorial;
    s32 timer;
    s32 index;
    unk32 done;
    unk32 counter;

    gameData = _gameData;
    tutorial = &gameData->tutorial;
    timer = 30;
    index = 0;
    done = 0;
    counter = 0;
    sub_8061660(&tutorial->fontData, arg0->sprite->languageStrings[0].strings[getLanguage()], 0xF);
    if (tutorial->unk13C == NULL) {
        tutorial->unk13C = allocSprite(0);
        if (tutorial->unk13C != NULL) {
            LoadSpriteSheet(tutorial->unk13C, &SpriteSheet_821CCC8, 0x200, 0x6600, 0, 0, 0, 0);
        }
    }
    while (done == 0) {
        VBlankIntrWait();
        sub_80627F0();
        updateKeyState();
        timer--;
        if (timer <= 0) {
            if (tutorial->unk138 == NULL) {
                tutorial->unk138 = allocSprite(0);
                if (tutorial->unk138 != NULL) {
                    LoadSpriteSheet(
                        tutorial->unk138, &SpriteSheet_821CB80, 0xDE00, 0x6E00, 0, 0, 0, 0);
                }
            }
            if ((_unk3005DA0 & 1) != 0 || timer < -200) {
                index++;
                timer = 15;
                if (index < arg0->sprite->languageCount[getLanguage()]) {
                    sub_8061660(&tutorial->fontData,
                        arg0->sprite->languageStrings[index].strings[getLanguage()], 0xF);
                } else {
                    done = 1;
                }
                if (tutorial->unk138 != NULL) {
                    sub_8060A94(tutorial->unk138);
                    tutorial->unk138 = NULL;
                }
            }
        }
        if (tutorial->unk138 != NULL && (counter & 0xF) == 0) {
            unk16 frame;

            frame = 0;
            if (tutorial->unk138->frame.word == 0) {
                frame = 1;
            }
            tutorial->unk138->frame.word = frame;
        }
        if ((_unk3005DA0 & 8) != 0) {
            done = 1;
        }
        __oam_8756CC0();
        counter++;
    }
    if (tutorial->unk138 != NULL) {
        sub_8060A94(tutorial->unk138);
        tutorial->unk138 = NULL;
    }
    if (tutorial->unk13C != NULL) {
        sub_8060A94(tutorial->unk13C);
        tutorial->unk13C = NULL;
    }
    sub_8061228(&tutorial->fontData);
}

void sub_804A72C(void)
{
    _gameData->tutorial.count = 0;
}

unk32 unref_804A744(BackgroundAsset* arg0, unk8 arg1, unk8 arg2, FrontendFontData* arg3)
{
    unk16* dest;
    unk16 value;
    s32 i;

    value = arg3->unkA << 12;
    unref_8058C74(&arg0->layer, arg1, 0x400, 0);
    sub_805B244(&arg0->renderer, &arg0->layer, arg3->unk0, arg3->unk4, arg3->unkA);
    dest = (unk16*)(VRAM + (arg0->layer.screenBaseBlock << 11));
    for (i = 0; i <= 0x3FF; i++) {
        *dest = (i & 0x3FF) | value;
        dest++;
    }
    __fastMemoryClearARM(
        0, (void*)(VRAM + (arg0->renderer.layer->characterBaseBlock << 14)), 0x8000);
    sub_8059CC8(arg1, arg2);
    ToggleLayerVisibility(arg1, 1);
}

void sub_804A7E8(BGLayer* arg0)
{
    ToggleLayerVisibility(arg0->layerIndex, 0);
}

void sub_804A7F8(BackgroundAsset* arg0)
{
    __fastMemoryClearARM(
        0, (void*)(VRAM + (arg0->renderer.layer->characterBaseBlock << 14)), 0x8000);
}

void nullsub_32(void)
{
}

void sub_804A824(FrontendState* arg0, unk32 arg1, unk32 arg2)
{
    arg0->unk9C += arg2;
}

void sub_804A830(FrontendState* arg0, unk32 arg1, unk32 arg2)
{
    arg0->unk9C = arg2;
}

ASM_ZEROPAD
