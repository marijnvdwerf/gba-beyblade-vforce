#include "projectile.h"

#include "debug.h"
#include "include_asm.h"
#include "memory.h"
#include "trail.h"

extern const unk8 Str_8726FE4[];

void newProjectileSystem(ProjectileSystem* arg0, s32 arg1, const unk8* arg2, unk32 arg3, void* arg4)
{
    AllocatedBlock* block;
    ProjectileEntry* entry;
    UnkTrail* trail;
    s32 initialZero;
    s32 remaining;
    s32 value;

    block = slowAllocate(0x64 * arg1);
    if (block == NULL) {
        printf(Str_8726FE4);
        return;
    }
    entry = block->address;
    trail = (UnkTrail*)(entry + arg1);
    arg0->block = block;
    initialZero = 0;
    arg0->count = arg1;
    arg0->entries = entry;
    arg0->trails = trail;
    arg0->unk24 = initialZero;
    arg0->unk20 = initialZero;
    arg0->unk1C = initialZero;
    arg0->unk18 = initialZero;
    arg0->unk14 = initialZero;
    arg0->unk10 = initialZero;
    if (arg1 > 0) {
        value = 0;
        remaining = arg1;
        do {
            initialZero = entry->trailDelay;
            entry->accelerationZ = initialZero;
            entry->accelerationY = initialZero;
            entry->accelerationX = initialZero;
            entry->velocityZ = initialZero;
            entry->velocityY = initialZero;
            entry->velocityX = initialZero;
            entry->z = initialZero;
            entry->y = initialZero;
            entry->x = initialZero;
            entry->unk2C = value;
            entry->flags = 3;
            entry->trail = trail;
            newSpriteTrail(trail, arg2, arg4, arg3, 0x28, 0xF, value);
            trail++;
            entry++;
            remaining--;
        } while (remaining != 0);
    }
}

void sub_804C208(ProjectileSystem* arg0)
{
    ProjectileEntry* entry;
    s32 count;
    s32 targetX;
    s32 targetY;
    s32 targetZ;
    s32 x;
    s32 y;

    count = arg0->count;
    targetX = arg0->unk10;
    targetY = arg0->unk14;
    targetZ = arg0->unk18;
    entry = arg0->entries;
    while (count-- != 0) {
        if (entry->unk2C == 0) {
            entry->x += entry->velocityX;
            entry->y += entry->velocityY;
            entry->z += entry->velocityZ;
            x = entry->x - entry->y;
            y = ((entry->x + entry->y) >> 1) - entry->z;
            if (entry->trailDelay != 0) {
                entry->trailDelay--;
                if (entry->trailDelay != 0) {
                    sub_804ABD0(entry->trail, x, y);
                }
            }
            entry->velocityX += entry->accelerationX;
            entry->velocityY += entry->accelerationY;
            entry->velocityZ += entry->accelerationZ;
            if ((entry->flags & 1) != 0) {
                entry->accelerationX = ((targetX - entry->x) * entry->duration) >> 12;
            }
            if ((entry->flags & 2) != 0) {
                entry->accelerationY = ((targetY - entry->y) * entry->duration) >> 12;
            }
            if ((entry->flags & 4) != 0) {
                entry->accelerationZ = ((targetZ - entry->z) * entry->duration) >> 12;
            }
            if ((entry->flags & 8) != 0) {
                entry->velocityX = ((targetX - entry->x) * entry->duration) >> 12;
            }
            if ((entry->flags & 0x10) != 0) {
                entry->velocityY = ((targetY - entry->y) * entry->duration) >> 12;
            }
            if ((entry->flags & 0x20) != 0) {
                entry->velocityZ = ((targetZ - entry->z) * entry->duration) >> 12;
            }
        } else {
            entry->unk2C--;
        }
        sub_804A908(entry->trail);
        entry++;
    }
    arg0->unk10 += arg0->unk1C;
    arg0->unk14 += arg0->unk20;
    arg0->unk18 += arg0->unk24;
}

INCLUDE_ASM("asm/dump/804a388-tutorial/804c34c.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/804c354.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/804c35c.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/804c3d4.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/804c464.s");

void sub_804C484(ProjectileSystem* system)
{
    s32 count;
    ProjectileEntry* entry;

    count = system->count;
    entry = system->entries;
    while (count-- != 0) {
        sub_804ABE4(entry->trail);
        entry++;
    }
    if (system->block != NULL) {
        deallocateBlock(system->block);
        system->block = NULL;
    }
}
