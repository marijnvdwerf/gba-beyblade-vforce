#ifndef _ENVACTOR_H
#define _ENVACTOR_H

#include "common.h"

typedef struct EnvironmentActorTransformMeta {
    unk8 pad0[8];
    unk32 x;
    unk32 y;
    unk32 z;
} EnvironmentActorTransformMeta;

typedef struct EnvironmentActorOffsetMeta {
    unk8 pad0[8];
    s16 x;
    unk8 padA[2];
    s16 y;
    unk8 padE[2];
} EnvironmentActorOffsetMeta;

void initLevelEnvironmentActors(u16);
void initProjectileSystem(void);
void sub_8054FE0(void);

#endif
