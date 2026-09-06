#ifndef _PROJECTILE_H
#define _PROJECTILE_H

#include "common.h"
#include "ram.h"

typedef struct ProjectileTemplate {
    unk32 unk0;
    unk32 unk4;
    unk32 unk8;
    unk32 unkC;
    unk32 unk10;
    unk32 unk14;
    unk32 unk18;
    unk32 unk1C;
    unk32 unk20;
    unk32 unk24;
    unk16 unk28;
    unk16 unk2A;
    unk16 unk2C;
    unk16 unk2E;
} ProjectileTemplate;

void newSpriteTrail(UnkTrail*, const unk8*, void*, s32, unk32, unk8, unk32);
void sub_804ABE4(UnkTrail*);
void newProjectileSystem(ProjectileSystem*, s32, const unk8*, unk32, void*);
void sub_804C484(ProjectileSystem*);
void sub_804C208(ProjectileSystem*);
void sub_804C3D4(ProjectileSystem*, unk32, unk32, unk32, const ProjectileTemplate*);
void sub_804C34C(ProjectileSystem*, unk32, unk32, unk32);
void sub_804C354(ProjectileSystem*, unk32, unk32, unk32);
void sub_804C464(ProjectileSystem*);

#endif
