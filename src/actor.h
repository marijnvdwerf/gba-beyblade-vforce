#ifndef _ACTOR_H
#define _ACTOR_H

#include "common.h"

typedef struct Actor {
    unk8 pad0[4];
    unk32 x;
    unk32 y;
    unk8 padC[4];
    unk8 unk10;
    unk8 pad11;
    unk16 unk12;
    unk16 unk14;
    unk16 unk16;
    unk8 pad18[0x28];
    unk32 unk40;
    unk32 unk44;
    unk32 unk48;
    unk32 unk4C;
    unk32 unk50;
    unk32 unk54;
    unk8 pad58[0x1C];
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
