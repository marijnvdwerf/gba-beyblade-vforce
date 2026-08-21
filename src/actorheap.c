#include <agb/macro.h>

#include "actor.h"
#include "common.h"
#include "include_asm.h"
#include "memory.h"
#include "system.h"

typedef struct ActorBlock ActorBlock;

struct ActorBlock {
    s32 offset;
    s32 size;
    Actor* actor;
    ActorBlock* prev;
    ActorBlock* next;
};

extern const char Str_8755E24[];
extern const char Str_8755E54[];
extern const char Str_8755E8C[];

extern ActorBlock* _actorBlocksHeapPtr;
extern ActorBlock* _unk3005E58;
extern unk32 _unk3005E5C;
extern ActorBlock* _unk3005E60;
extern unk32 _unk3005E64;
extern Actor* _actorsHeapPtr;

void allocateActorHeaps(void);
s32 sub_806306C(s32, ActorBlock*);
void* sub_8062FA8(void);
Actor* sub_8063190(ActorBlock*, s32);

void allocateActorHeaps(void)
{
    AllocatedBlock* actorsBlock;
    AllocatedBlock* actorBlocksBlock;

    _unk3005E64 = 0;
    _unk3005E5C = 0;
    _unk3005E60 = NULL;
    actorsBlock = slowAllocate(0xC400);
    actorBlocksBlock = slowAllocate(0x1400);
    if (actorsBlock == NULL) {
        nullsub_8(Str_8755E24);
    }
    if (actorBlocksBlock == NULL) {
        nullsub_8(Str_8755E54);
    }
    _actorsHeapPtr = actorsBlock->address;
    _actorBlocksHeapPtr = actorBlocksBlock->address;
    _unk3005E58 = NULL;
    DmaClear(3, 0, _actorBlocksHeapPtr, 0x1400, 32);
}

#if 0
void* sub_8062EFC(unk32 arg0)
{
    unk32 newBlock;
    unk32 count;
    s32 startIndex;
    ActorBlock* previous;
    ActorBlock* block;

    newBlock = (count = arg0, 0);
    if (_unk3005E60 == NULL) {
        _unk3005E60 = _actorBlocksHeapPtr;
        _unk3005E64 = 0;
        _unk3005E5C = 0;
    }
    if ((s32)_unk3005E5C > 0xFF) {
        return NULL;
    }
    block = (ActorBlock*)sub_8062FA8();
    if ((s32)(_unk3005E64 + count) > 0x100) {
        newBlock = 1;
        startIndex = sub_806306C(count, block);
        if ((s32)startIndex < 0) {
            return NULL;
        }
    } else {
        startIndex = _unk3005E64;
        previous = _unk3005E58;
        if (previous != NULL) {
            previous->next = block;
            block->prev = previous;
        } else {
            block->prev = (ActorBlock*)newBlock;
        }
        block->next = (ActorBlock*)newBlock;
    }
    block->actor = &_actorsHeapPtr[startIndex];
    block->size = count;
    block->offset = startIndex;
    _unk3005E58 = block;
    if (newBlock == 0) {
        _unk3005E64 += count;
    }
    return block;
}
#else
INCLUDE_ASM("asm/dump/8057b80-debug/8062efc.s");
#endif

void* sub_8062FA8(void)
{
    u16 i;
    ActorBlock* slot;

    i = 0;
    slot = _actorBlocksHeapPtr;
    while (slot->actor != NULL) {
        if (i > 0xFF) {
            nullsub_8(Str_8755E8C);
            return NULL;
        }
        i++;
        slot++;
    }
    return slot;
}

void sub_8062FE0(ActorBlock* arg0)
{
    Actor* actor;
    s32 count;
    ActorBlock* prev;
    ActorBlock* next;

    actor = arg0->actor;
    count = arg0->size;
    prev = arg0->prev;
    next = arg0->next;
    while (count-- != 0) {
        sub_80588A8(actor);
        actor++;
    }
    if (_unk3005E58 == arg0) {
        _unk3005E58 = arg0->prev;
    }
    if (prev == NULL) {
        if (next == NULL) {
            allocateActorHeaps();
        } else {
            _unk3005E60 = next;
            next->prev = prev;
        }
    } else {
        prev->next = next;
        if (next != NULL) {
            next->prev = prev;
        } else {
            _unk3005E64 -= arg0->size;
        }
    }
    arg0->actor = NULL;
}

ActorBlock* sub_8063058(void)
{
    ActorBlock* node;

    node = _unk3005E60;
    while (node != NULL) {
        node = node->next;
    }
    return node;
}

s32 sub_806306C(s32 size, ActorBlock* block)
{
    ActorBlock* cur;
    ActorBlock* next;
    ActorBlock* candidate;
    s32 gap;
    unk32 atHead;

    cur = _unk3005E60;
    atHead = 0;
    gap = cur->offset;
    if (gap >= size) {
        atHead = 1;
    } else {
        next = cur->next;
        if (next != NULL) {
            gap = next->offset - (cur->offset + cur->size);
        }
        if (next == NULL || gap < size) {
            while (1) {
                cur = next;
                if (cur == NULL || gap >= size) {
                    break;
                }
                candidate = cur->next;
                next = candidate;
                if (candidate != NULL) {
                    gap = candidate->offset - (cur->offset + cur->size);
                }
                if (candidate != NULL && gap >= size) {
                    break;
                }
            }
        }
    }
    if (gap >= size && atHead == 0) {
        block->prev = cur;
        block->next = cur->next;
        cur->next->prev = block;
        cur->next = block;
        return cur->offset + cur->size;
    }
    if (atHead == 1) {
        cur->prev = block;
        block->next = cur;
        block->prev = NULL;
        _unk3005E60 = block;
        return 0;
    }
    return -1;
}

void sub_80630F4(ActorBlock* arg0)
{
    s16 i;
    Actor* actor;

    for (i = 0; i < arg0->size; i++) {
        actor = sub_8063190(arg0, i);
        if (actor != NULL) {
            sub_80584B8(actor);
        }
    }
}

void sub_8063128(ActorBlock* arg0)
{
    s16 i;
    Actor* actor;

    for (i = 0; i < arg0->size; i++) {
        actor = sub_8063190(arg0, i);
        if (actor != NULL) {
            renderActor2(actor);
        }
    }
}

void sub_806315C(ActorBlock* arg0)
{
    s16 i;
    Actor* actor;

    for (i = 0; i < arg0->size; i++) {
        actor = sub_8063190(arg0, i);
        if (actor != NULL) {
            sub_80588A8(actor);
        }
    }
}

Actor* sub_8063190(ActorBlock* arg0, s32 arg1)
{
    if (arg1 >= arg0->size) {
        return NULL;
    }
    return &_actorsHeapPtr[arg0->offset + arg1];
}
