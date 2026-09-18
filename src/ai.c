#include "ai.h"

#include "debug.h"
#include "geometry.h"
#include "include_asm.h"
#include "riderphysics.h"
#include "unsorted.h"

extern const unk8 Unk_874CEBC[];

INCLUDE_ASM("asm/dump/804a388-tutorial/80575f4-initAiManagement.s");

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

INCLUDE_ASM("asm/dump/804a388-tutorial/80577d8.s");

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
