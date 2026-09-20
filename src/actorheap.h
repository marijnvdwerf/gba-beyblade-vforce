#ifndef _ACTORHEAP_H
#define _ACTORHEAP_H

#include "common.h"

typedef struct ActorBlock ActorBlock;

struct ActorBlock {
    s32 offset;
    s32 size;
    Actor* actor;
    ActorBlock* prev;
    ActorBlock* next;
};

void allocateActorHeaps(void);
ActorBlock* sub_8062EFC(s32);

#endif
