#include "common.h"
#include "include_asm.h"
#include "system.h"

typedef struct ActorHeapNode ActorHeapNode;

struct ActorHeapNode {
    unk32 unk0;
    s32 unk4;
    unk32 unk8;
    ActorHeapNode* unkC;
    ActorHeapNode* unk10;
};

extern const char Str_8755E8C[];

extern ActorHeapNode* _actorBlocksHeapPtr;
extern ActorHeapNode* _unk3005E58;
extern ActorHeapNode* _unk3005E60;
extern unk32 _unk3005E64;
extern unk8* _actorsHeapPtr;

void allocateActorHeaps(void);
void sub_80588A8(unk8*);
void sub_80584B8(unk8*);
void renderActor2(unk8*);

INCLUDE_ASM("asm/dump/8057b80-debug/8062e70-allocateActorHeaps.s");

INCLUDE_ASM("asm/dump/8057b80-debug/8062efc.s");

void* sub_8062FA8(void)
{
    u16 i;
    ActorHeapNode* slot;

    i = 0;
    slot = _actorBlocksHeapPtr;
    while (slot->unk8 != 0) {
        if (i > 0xFF) {
            nullsub_8(Str_8755E8C);
            return 0;
        }
        i++;
        slot++;
    }
    return slot;
}

void sub_8062FE0(ActorHeapNode* arg0)
{
    unk8* actor;
    s32 count;
    s32 temp;
    ActorHeapNode* prev;
    ActorHeapNode* next;

    actor = (unk8*)arg0->unk8;
    count = arg0->unk4;
    prev = arg0->unkC;
    next = arg0->unk10;
    temp = count;
    count--;
    if (temp != 0) {
        do {
            sub_80588A8(actor);
            actor += 0xC4;
        } while (count-- != 0);
    }
    if (_unk3005E58 == arg0) {
        _unk3005E58 = arg0->unkC;
    }
    if (prev == 0) {
        if (next == 0) {
            allocateActorHeaps();
        } else {
            _unk3005E60 = next;
            next->unkC = prev;
        }
    } else {
        prev->unk10 = next;
        if (next != 0) {
            next->unkC = prev;
        } else {
            _unk3005E64 -= arg0->unk4;
        }
    }
    arg0->unk8 = 0;
}

void sub_8063058(void)
{
    ActorHeapNode* node;

    node = _unk3005E60;
    while (node != 0) {
        node = node->unk10;
    }
}

INCLUDE_ASM("asm/dump/8057b80-debug/806306c.s");

void* sub_8063190(ActorHeapNode*, s32);

void sub_80630F4(ActorHeapNode* arg0)
{
    s16 i;
    unk8* actor;

    for (i = 0; i < arg0->unk4; i++) {
        actor = sub_8063190(arg0, i);
        if (actor != 0) {
            sub_80584B8(actor);
        }
    }
}

void sub_8063128(ActorHeapNode* arg0)
{
    s16 i;
    unk8* actor;

    for (i = 0; i < arg0->unk4; i++) {
        actor = sub_8063190(arg0, i);
        if (actor != 0) {
            renderActor2(actor);
        }
    }
}

void sub_806315C(ActorHeapNode* arg0)
{
    s16 i;
    unk8* actor;

    for (i = 0; i < arg0->unk4; i++) {
        actor = sub_8063190(arg0, i);
        if (actor != 0) {
            sub_80588A8(actor);
        }
    }
}

void* sub_8063190(ActorHeapNode* arg0, s32 arg1)
{
    if (arg1 >= arg0->unk4) {
        return 0;
    }
    return _actorsHeapPtr + (arg0->unk0 + arg1) * 0xC4;
}
