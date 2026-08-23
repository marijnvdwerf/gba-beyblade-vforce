#include "projectile.h"

#include "debug.h"
#include "include_asm.h"
#include "memory.h"

extern const u8 Str_8726FE4[];

void newProjectileSystem(ProjectileSystem* arg0, s32 arg1, const u8* arg2, unk32 arg3, void* arg4)
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
    trail = (UnkTrail*)((u8*)entry + 0x34 * arg1);
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

INCLUDE_ASM("asm/dump/804a388-tutorial/804c208.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/804c34c.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/804c354.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/804c35c.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/804c3d4.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/804c464.s");

void sub_804C484(void* arg0)
{
    s32 var_r4;
    ProjectileEntry* var_r5;
    ProjectileSystem* var_r6;

    var_r6 = arg0;
    var_r4 = var_r6->count;
    var_r5 = var_r6->entries;
    while (var_r4-- != 0) {
        sub_804ABE4(var_r5->trail);
        var_r5++;
    }
    if (var_r6->block != NULL) {
        deallocateBlock(var_r6->block);
        var_r6->block = NULL;
    }
}
