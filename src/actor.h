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
    unk8 pad18[0xA];
    s16 unk22;
    unk8 pad24[0x1C];
    unk32 unk40;
    unk32 unk44;
    unk32 unk48;
    unk32 unk4C;
    unk32 unk50;
    unk32 unk54;
    unk8 pad58[0x18];
    unk32 unk70;
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
void sub_80585C8(Actor*, unk32);
void ActorSetFrame(Actor*, s32, unk8);
void sub_8058794(Actor*, unk32, unk32, unk32, unk32);
void sub_80588DC(Actor*);

#endif /* _ACTOR_H */
