#include "tutorial.h"

#include <agb/types.h>

#include "effects.h"
#include "gamestate.h"
#include "geometry.h"
#include "include_asm.h"
#include "spritetext.h"
#include "unsorted.h"

INCLUDE_ASM("asm/dump/8040d18/804a2f0.s");
INCLUDE_ASM("asm/dump/8040d18/804a300.s");
INCLUDE_ASM("asm/dump/8040d18/804a310.s");
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
extern const char Str_87233E8[];
extern const u8 SpriteSheet_82B05EC[];
extern const u8 ShadowFontMeta[];
extern TutorialPage TutorialPages[];

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
                    entry->sprite = &TutorialPages[metaobject->unk8];
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
INCLUDE_ASM("asm/dump/804a388-tutorial/804a504.s");

void sub_804A51C(void)
{
    GameData* data;
    unk8** slot;

    data = _gameData;
    slot = &data->tutorial.unk104;
    if (*slot != NULL && sub_80556DC(1) != 0) {
        sub_804A550(*slot);
        *slot = NULL;
        sub_8055624();
    }
}

INCLUDE_ASM("asm/dump/804a388-tutorial/804a550.s");

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
