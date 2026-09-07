#include "tutorial.h"

#include <agb/types.h>

#include "effects.h"
#include "gamestate.h"
#include "geometry.h"
#include "include_asm.h"
#include "keystate.h"
#include "music.h"
#include "sprite.h"
#include "spritetext.h"
#include "unsorted.h"

INCLUDE_ASM("asm/dump/8040d18/804a2f0.s");
INCLUDE_ASM("asm/dump/8040d18/804a300.s");

void sub_804A310(void)
{
    sub_804AE34(0, 0x3C);
}

INCLUDE_ASM("asm/dump/8040d18/804a320.s");
INCLUDE_ASM("asm/dump/8040d18/804a330.s");
INCLUDE_ASM("asm/dump/8040d18/804a33c.s");
INCLUDE_ASM("asm/dump/8040d18/804a348.s");

void StoreLevelVar14(unk32 arg0)
{
    _unk3000C00 = arg0;
}

INCLUDE_ASM("asm/dump/8040d18/804a364.s");
INCLUDE_ASM("asm/dump/8040d18/804a378.s");
extern const unk8 Str_87233E8[];
extern const unk8 SpriteSheet_82B05EC[];
extern const unk8 ShadowFontMeta[];
extern const unk8 SpriteSheet_821CCC8[];
extern const unk8 SpriteSheet_821CB80[];
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
                printf(Str_87233E8);
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
        allocFont(&data->fontData, SpriteSheet_82B05EC, ShadowFontMeta, 0x24, 0x73, 0xBA, 0);
        data->unk138 = 0;
        data->unk13C = 0;
    }
}

INCLUDE_ASM("asm/dump/804a388-tutorial/804a488-turorial_804A488.s");

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
            LoadSpriteSheet(tutorial->unk13C, SpriteSheet_821CCC8, 0x200, 0x6600, 0, 0, 0, 0);
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
                        tutorial->unk138, SpriteSheet_821CB80, 0xDE00, 0x6E00, 0, 0, 0, 0);
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

INCLUDE_ASM("asm/dump/804a388-tutorial/804a744.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/804a7e8.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/804a7f8.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/804a820-nullsub_32.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/804a824.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/804a830.s");
