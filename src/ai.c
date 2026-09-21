#include "ai.h"

#include <agb/bios.h>

#include "debug.h"
#include "gamestate.h"
#include "geometry.h"
#include "riderphysics.h"
#include "unsorted.h"

extern const unk8 Unk_874CEBC[];

extern LevelDescription LevelDescriptions[];
extern const char Str_872C99C[];
extern const char Str_872C9E4[];
extern const char Str_872CA48[];

unk8 fn_aiStubFunc(Actor*, LevelGeometryAddresses*, GeometryLine*);

// TODO: fakematch?
void initAiManagement(void)
{
    GameData* gameData;
    AiState* ai;
    LevelDescription* level;
    GeometryLine* line;
    s32 i;
    AiState* management;

    gameData = _gameData;
    ai = &gameData->ai;
    level = &LevelDescriptions[getSomeLevelID()];
    ai->table = level->unk38;
    if (ai->table == NULL) {
        printf(Str_872C99C);
        return;
    }
    getLevelGeometryAddresses(&gameData->ai.geometry, ai->table);
    if (level->unk3C != NULL) {
        StoreMetadataAddr(&gameData->ai.geometry, level->unk3C);
    }
    management = ai;
    initQuadTree(&gameData->ai.quadTree, &gameData->ai.geometry, 5, 0xA00, 0x200, 0x20);
    sub_805E50C(&gameData->ai.callbacks, NULL, fn_aiStubFunc, NULL);
    __fastMemoryClearARM(0, gameData->ai.lines, 0x80);
    line = management->geometry.unkC;
    for (i = 0; i < management->geometry.unk0->lineCount; i++) {
        if (line->unkF == 0x93) {
            if ((unk16)line->unk16 > 0x1F) {
                printf(Str_872C9E4, (unk16)line->unk16, 0x20);
            } else if (management->lines[(unk16)line->unk16] != NULL) {
                printf(Str_872CA48, (unk16)line->unk16);
            } else {
                management->lines[(unk16)line->unk16] = line;
            }
        }
        line++;
    }
}

void sub_80576EC(RiderBase* rider)
{
    GameData* gameData;
    AiState* ai;
    LevelGeometryAddresses* geometry;
    Actor* actor;
    QuadTree* quadTree;
    QuadTreeNode* node;
    ActorCollisionFunctions* callbacks;

    gameData = _gameData;
    ai = &gameData->ai;
    quadTree = &gameData->ai.quadTree;
    geometry = &gameData->ai.geometry;
    actor = rider->unk0;
    if (ai->table != NULL) {
        node = GetQuadTreeNodeForPos(quadTree, actor->x >> 5, actor->y >> 5);
        callbacks = actor->callbacks.unk4;
        actor->callbacks.unk4 = &gameData->ai.callbacks;
        if (node != NULL) {
            sub_805C9A4(actor, geometry, NULL, 0, node);
        }
        actor->callbacks.unk4 = callbacks;
        if (RiderHasFlag(rider, 0x02000000) == 0) {
            rider->unk1C3 = sub_80577D8(actor, geometry, gameData->ai.lines[rider->unk1C2]) + 0x40;
        }
    }
}

void deallocateAiManagement(void)
{
    if (_gameData->ai.table == NULL) {
        printf("Unable to deallocate AI collision in deallocateAIManagement, no "
               "collision data was initialised\n");
    } else {
        deallocateQuadTree(&_gameData->ai.quadTree);
    }
}

unk8 fn_aiStubFunc(Actor* actor, LevelGeometryAddresses* geometry, GeometryLine* line)
{
}

unk32 sub_80577D8(Actor* actor, LevelGeometryAddresses* geometry, GeometryLine* line)
{
    s32 midX;
    s32 midY;
    s32 x;
    s32 y;
    unk16 length;
    s32 absY;
    s32 angleValue;
    s16 angle;
    s32 value;
    s32 sign;
    GeometryPoint* point0;
    GeometryPoint* point1;

    point0 = &geometry->unk4[line->point0];
    point1 = &geometry->unk4[line->point1];
    midX = (point0->x + point1->x) << 4;
    midY = (point0->y + point1->y) << 4;
    x = (midX - actor->x) >> 8;
    y = (midY - actor->y) >> 8;
    length = Sqrt(x * x + y * y);
    x = (x << 8) / length;
    y = (y << 8) / length;
    absY = y;
    if (absY < 0) {
        absY = -absY;
    }
    if (absY <= 0x80) {
        angleValue = -(y >> 1);
        sign = x;
    } else {
        angleValue = x >> 1;
        sign = y;
    }
    angle = angleValue;
    value = Unk_874CEBC[angle + 0x80];
    if (sign < 0) {
        value = 0xFF - value;
    }
    if (absY > 0x80) {
        value += 0x40;
        if (value > 0xFF) {
            value -= 0x100;
        }
    }
    return value;
}

unk32 sub_8057878(s32 arg0, s32 arg1)
{
    s32 absArg1;
    s32 angle;
    s32 value;

    absArg1 = arg1;
    if (absArg1 < 0) {
        absArg1 = -absArg1;
    }
    if (absArg1 <= 0x80) {
        angle = -(arg1 >> 1);
    } else {
        angle = arg0 >> 1;
        arg0 = arg1;
    }
    value = Unk_874CEBC[(s16)angle + 0x80];
    if (arg0 < 0) {
        value = 0xFF - value;
    }
    if (absArg1 > 0x80) {
        value += 0x40;
        if (value > 0xFF) {
            value -= 0x100;
        }
    }
    return value;
}
