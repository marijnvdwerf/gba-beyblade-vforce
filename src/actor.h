#ifndef _ACTOR_H
#define _ACTOR_H

#include "common.h"

void actor_8057C58(Actor*, void*, void*, unk32, unk32, unk32, unk32);
void sub_80584B8(Actor*);
void renderActor2(Actor*);
void sub_80588A8(Actor*);
void sub_80585C8(Actor*, unk32);
void rider_8058614(Actor*, unk16, unk16, unk16);
void ActorSetFrame(Actor*, unk32, u8);
void sub_8058794(Actor*, unk32, unk32, unk32, unk32);
void sub_80588DC(Actor*);
void sub_8058754(Actor*, unk32*);

#endif
