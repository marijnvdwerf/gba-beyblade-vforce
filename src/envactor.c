#include "include_asm.h"
#include "memory.h"
#include "ram.h"

extern void sub_8060A94(SpriteEntry*);

INCLUDE_ASM("asm/dump/804a388-tutorial/8054768-initLevelEnvironmentActors.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/8054c9c-renderEnvironmentActors.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/8054eb4-updateEnvirenmentActors.s");

void sub_8054FE0(void)
{
    SpriteEntry* zero;
    s32 actorCount;
    s32 nodeCount;
    EnvironmentActorContainer* actorContainer;
    EnvironmentActorSlot* actor;
    EnvironmentNode* node;
    EnvironmentObject* object;

    actorCount = _gameData->unkC84;
    nodeCount = _gameData->unkC80;
    actorContainer = _gameData->unkC7C;
    node = _gameData->unkC78;
    if (actorCount-- != 0) {
        actor = actorContainer->slots;
        do {
            object = GetStruct4(actor->objectId);
            if (actor->sprite != NULL) {
                sub_8060A94(actor->sprite);
            }
            zero = 0;
            actor->sprite = zero;
            if (object->sprite != NULL) {
                sub_8060A94(object->sprite);
            }
            object->sprite = zero;
            actor++;
        } while (actorCount-- != 0);
    }
    while (nodeCount-- != 0) {
        if (node->sprite != NULL) {
            sub_8060A94(node->sprite);
        }
        node++;
    }
    if (_gameData->unkC74 != NULL) {
        deallocateBlock(_gameData->unkC74);
    }
    _gameData->unkC74 = NULL;
    _gameData->unkC84 = 0;
    _gameData->unkC7C = NULL;
    _gameData->unkC88 = NULL;
    _gameData->unkC8C = 0;
}

INCLUDE_ASM("asm/dump/804a388-tutorial/80550b8.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/80550f4-initProjectileSystem.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/8055274.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/8055288.s");
