#ifndef _PROJECTILE_H
#define _PROJECTILE_H

#include "common.h"
#include "ram.h"

void newSpriteTrail(UnkTrail*, const unk8*, void*, s32, unk32, unk8, unk32);
void sub_804ABE4(UnkTrail*);
void newProjectileSystem(ProjectileSystem*, s32, const unk8*, unk32, void*);
void sub_804C484(ProjectileSystem*);
void sub_804C208(ProjectileSystem*);

#endif /* _PROJECTILE_H */
