#ifndef _ACTOR_H
#define _ACTOR_H

#include "common.h"

typedef struct Actor {
    unk8 pad[0xC4];
} Actor;

void sub_80584B8(Actor*);
void renderActor2(Actor*);
void sub_80588A8(Actor*);

#endif /* _ACTOR_H */
