#include <agb/types.h>

#include "debug.h"
#include "include_asm.h"
#include "memory.h"
#include "sprite.h"
#include "unsorted.h"

extern const u8 Str_8726F84[];
extern const u8 Str_8726FB4[];

void newSpriteTrail(
    UnkTrail* arg0, const u8* arg1, void* arg2, s32 arg3, unk32 arg4, unk8 arg5, unk32 arg6)
{
    AllocatedBlock* allocated;
    SpriteTrailEntry* sprites;
    unk32 size;
    unk32 remaining;
    unk32 zero;
    SpriteEntry* sprite;

    arg6 <<= 24;
    size = arg3 * 0x1C;
    if (arg6 != 0) {
        allocated = fastAllocate(size);
    } else {
        allocated = slowAllocate(size);
    }
    if (allocated == NULL) {
        printf(Str_8726F84, size);
        arg0->block = allocated;
        return;
    }
    sprites = allocated->address;
    zero = 0;
    arg0->unk2 = zero;
    arg0->unk4 = zero;
    arg0->unk6 = arg4;
    arg0->spriteSheet = arg1;
    arg0->unk28 = arg2;
    arg0->unk24 = zero;
    arg0->unk26 = 1;
    arg0->unk10 = zero;
    arg0->unk14 = zero;
    arg0->unk18 = zero;
    arg0->unk1C = zero;
    arg0->unk2C = arg5;
    arg0->sprites = sprites;
    arg0->unk0 = arg3;
    arg0->block = allocated;
    if (arg3 > 0) {
        arg0 = NULL;
        remaining = arg3;
        do {
            sprite = allocSprite(1);
            sprites->sprite = sprite;
            sprites->unkC = (unk32)arg0;
            if (sprite != NULL) {
                LoadSpriteSheet(sprite, arg1, 0, 0xA000, 1, (unk32)arg0, (unk32)arg0, (unk32)arg0);
            } else {
                printf(Str_8726FB4);
            }
            sprites++;
            remaining--;
        } while (remaining != 0);
    }
}

INCLUDE_ASM("asm/dump/804a388-tutorial/804a908.s");

void sub_804AB50(UnkTrail* arg0, unk8 arg1)
{
    arg0->unk2C = arg1 & 0xF;
}

INCLUDE_ASM("asm/dump/804a388-tutorial/804ab60-nullsub_39.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/804ab64.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/804ab88.s");

void sub_804ABD0(UnkTrail* arg0, unk32 arg1, unk32 arg2)
{
    arg0->unk10 = arg1;
    arg0->unk14 = arg2;
}

INCLUDE_ASM("asm/dump/804a388-tutorial/804abd8.s");

void sub_804ABE4(UnkTrail* arg0)
{
    AllocatedBlock* block;

    block = arg0->block;
    if (block != NULL) {
        deallocateBlock(block);
    }
    arg0->block = NULL;
}
