#ifndef _PROJECTILE_H
#define _PROJECTILE_H

#include "common.h"
#include "ram.h"

void newProjectileSystem(ProjectileSystem*, s32, const u8*, unk32, void*);
void sub_804C484(void*);
void sub_804C208(ProjectileSystem*);

#endif /* _PROJECTILE_H */
