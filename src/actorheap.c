#include "common.h"
#include "include_asm.h"
#include "system.h"

typedef struct Actor {
    unk8 pad[0xC4];
} Actor;

typedef struct ActorBlock ActorBlock;

struct ActorBlock {
    unk32 unk0;
    s32 unk4;
    Actor* unk8;
    ActorBlock* unkC;
    ActorBlock* unk10;
};

extern const char Str_8755E8C[];

extern ActorBlock* _actorBlocksHeapPtr;
extern ActorBlock* _unk3005E58;
extern ActorBlock* _unk3005E60;
extern unk32 _unk3005E64;
extern Actor* _actorsHeapPtr;

void allocateActorHeaps(void);
Actor* sub_8063190(ActorBlock*, s32);
void sub_80588A8(Actor*);
void sub_80584B8(Actor*);
void renderActor2(Actor*);

INCLUDE_ASM("asm/dump/8057b80-debug/8062e70-allocateActorHeaps.s");

INCLUDE_ASM("asm/dump/8057b80-debug/8062efc.s");

void* sub_8062FA8(void)
{
    u16 i;
    ActorBlock* slot;

    i = 0;
    slot = _actorBlocksHeapPtr;
    while (slot->unk8 != NULL) {
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

    actor = arg0->unk8;
    count = arg0->unk4;
    prev = arg0->unkC;
    next = arg0->unk10;
    while (count-- != 0) {
        sub_80588A8(actor);
        actor++;
    }
    if (_unk3005E58 == arg0) {
        _unk3005E58 = arg0->unkC;
    }
    if (prev == NULL) {
        if (next == NULL) {
            allocateActorHeaps();
        } else {
            _unk3005E60 = next;
            next->unkC = prev;
        }
    } else {
        prev->unk10 = next;
        if (next != NULL) {
            next->unkC = prev;
        } else {
            _unk3005E64 -= arg0->unk4;
        }
    }
    arg0->unk8 = NULL;
}

ActorBlock* sub_8063058(void)
{
    ActorBlock* node;

    node = _unk3005E60;
    while (node != NULL) {
        node = node->unk10;
    }
    return node;
}

INCLUDE_ASM("asm/dump/8057b80-debug/806306c.s");

void sub_80630F4(ActorBlock* arg0)
{
    s16 i;
    Actor* actor;

    for (i = 0; i < arg0->unk4; i++) {
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

    for (i = 0; i < arg0->unk4; i++) {
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

    for (i = 0; i < arg0->unk4; i++) {
        actor = sub_8063190(arg0, i);
        if (actor != NULL) {
            sub_80588A8(actor);
        }
    }
}

Actor* sub_8063190(ActorBlock* arg0, s32 arg1)
{
    if (arg1 >= arg0->unk4) {
        return NULL;
    }
    return &_actorsHeapPtr[arg0->unk0 + arg1];
}
