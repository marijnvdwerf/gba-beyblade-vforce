#ifndef _ACTOR_H
#define _ACTOR_H

#include "common.h"

typedef struct Actor {
    unk8 pad0[0x74];
    unk32 unk74;
    unk32 unk78;
    struct AllocatedBlock* unk7C;
    unk8 pad80[0x38];
    void* unkB8;
    unk8 padBC[8];
} Actor;

void sub_80584B8(Actor*);
void renderActor2(Actor*);
void sub_80588A8(Actor*);

#endif /* _ACTOR_H */
