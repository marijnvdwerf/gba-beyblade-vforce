#include "trail.h"

#include <agb/types.h>

#include "debug.h"
#include "include_asm.h"
#include "memory.h"
#include "sprite.h"
#include "unsorted.h"

extern const u8 Str_8726F84[];
extern const u8 Str_8726FB4[];
extern const u8 Unk_874CEBC[];

void newSpriteTrail(UnkTrail* arg0, const SpriteTrailSheet* arg1, void* arg2, s32 arg3, unk32 arg4,
    u8 arg5, unk32 arg6)
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

#if 0
typedef struct CameraRecordDraft {
    unk8 pad0[0xC]; /* 0x00 */
    unk32 unkC; /* 0x0C */
    unk32 unk10; /* 0x10 */
} CameraRecordDraft;

typedef struct CameraStateDraft {
    CameraRecordDraft records[1]; /* 0x00 */
} CameraStateDraft;

typedef union SpriteTrailHalfwordDraft {
    unk16 unsignedValue;
    s16 signedValue;
} SpriteTrailHalfwordDraft;

typedef struct SpriteTrailEntryDraft {
    unk32 unk0; /* 0x00 */
    unk32 unk4; /* 0x04 */
    unk8 pad8[4]; /* 0x08 */
    SpriteTrailHalfwordDraft unkC; /* 0x0C */
    SpriteTrailHalfwordDraft unkE; /* 0x0E */
    unk16 unk10; /* 0x10 */
    s16 unk12; /* 0x12 */
    s16 unk14; /* 0x14 */
    unk16 unk16; /* 0x16 */
    SpriteEntry* sprite; /* 0x18 */
} SpriteTrailEntryDraft;

typedef struct UnkTrailDraft {
    unk16 unk0; /* 0x00 */
    unk16 unk2; /* 0x02 */
    unk16 unk4; /* 0x04 */
    unk16 unk6; /* 0x06 */
    SpriteTrailEntryDraft* sprites; /* 0x08 */
    AllocatedBlock* block; /* 0x0C */
    s32 unk10; /* 0x10 */
    s32 unk14; /* 0x14 */
    s32 unk18; /* 0x18 */
    s32 unk1C; /* 0x1C */
    const unk8* spriteSheet; /* 0x20 */
    s16 unk24; /* 0x24 */
    unk16 unk26; /* 0x26 */
    CameraStateDraft* unk28; /* 0x28 */
    unk16 unk2C; /* 0x2C */
} UnkTrailDraft;

void sub_804AB64(UnkTrailDraft*, SpriteTrailEntryDraft*, s16);
unk32 sub_804AB88(s32, s32);

void sub_804A908(UnkTrailDraft* trail)
{
    unk32 remaining;
    unk32 count;
    unk32 previous;
    s32 index;
    unk32 scale;
    s32 x;
    s32 y;

    remaining = trail->unk2;
    index = trail->unk4;
    count = remaining;
    remaining--;
    if (count != 0) {
        scale = 0x100;
        do {
            SpriteTrailEntryDraft* entry;
            SpriteEntry* sprite;
            unk32 delay;
            unk32 nextDelay;

            entry = &trail->sprites[index];
            sprite = entry->sprite;
            entry->unkC.unsignedValue--;
            if (entry->unkC.unsignedValue == 0) {
                sprite->y = 0xA000;
                sub_8060F64(sprite, scale, scale, 0);
                trail->unk2--;
            } else {
                if (trail->unk28 != NULL) {
                    x = entry->unk0 - (trail->unk28->records[0].unkC & 0xFFFFFF00);
                    y = entry->unk4 - (trail->unk28->records[0].unk10 & 0xFFFFFF00);
                    sprite->x = x;
                    if (y >= -0x4000) {
                        sprite->y = y;
                    } else {
                        sprite->y = 0xA000;
                    }
                }
                delay = entry->unkE.unsignedValue;
                if (entry->unkE.signedValue > 0x10) {
                    entry->unkE.unsignedValue = delay - 0x10;
                } else {
                    nextDelay = delay;
                    nextDelay += 0x10;
                    entry->unkE.unsignedValue = nextDelay + entry->unk10;
                    sprite->frame.word++;
                    if (sprite->frame.word == entry->unk12 + entry->unk14) {
                        if (entry->unk16 == trail->unk26) {
                            sub_804AB64(trail, entry, trail->unk24);
                        } else {
                            sprite->y = 0xA000;
                            sub_8060F64(sprite, scale, scale, 0);
                            trail->unk2--;
                        }
                    }
                }
            }
            index--;
            if (index < 0) {
                index = trail->unk0 - 1;
            }
            previous = remaining;
            remaining--;
        } while (previous != 0);
    }

    {
        s32 dx;
        s32 dxSquared;
        s32 dySquared;
        s32 distanceSquared;
        s32 radius;
        s32 xRatio;
        s32 yRatio;
        s32 scaledX;
        s32 scaledY;
        unk8 angle;
        SpriteTrailEntryDraft* entry;
        SpriteEntry* sprite;

        dx = trail->unk10 - trail->unk18;
        x = trail->unk14 - trail->unk1C;
        dxSquared = dx;
        dxSquared *= dx;
        dySquared = x;
        dySquared *= x;
        distanceSquared = dxSquared + dySquared;
        if (distanceSquared <= 0xD00 * 0xD00) {
            return;
        } else {
            radius = Sqrt(distanceSquared);
            xRatio = (dx << 8) / radius;
            yRatio = (x << 8) / radius;
            angle = sub_804AB88(xRatio, yRatio);
            scaledX = (xRatio * 0xD00) >> 8;
            scaledY = (yRatio * 0xD00) >> 8;
            trail->unk4++;
            if (trail->unk4 == trail->unk0) {
                trail->unk4 = 0;
            }
            if (trail->unk2 < trail->unk0) {
                trail->unk2++;
            }
            entry = &trail->sprites[trail->unk4];
            if (entry->unkC.signedValue != 0 && entry->unk16 != trail->unk24) {
                sub_804AB64(trail, entry, trail->unk24);
            }
            dx = trail->unk18 + (scaledX >> 1) - 0x800;
            y = trail->unk1C + (scaledY >> 1) - 0x800;
            entry->unk0 = dx;
            entry->unk4 = y;
            if (trail->unk28 != NULL) {
                dx -= trail->unk28->records[0].unkC & 0xFFFFFF00;
                y -= trail->unk28->records[0].unk10 & 0xFFFFFF00;
            }
            sprite = entry->sprite;
            sprite->x = dx;
            if (y >= -0x4000) {
                sprite->y = y;
            } else {
                sprite->y = 0xA000;
            }
            sprite->frame.word = 0;
            sprite->oam_attr_2 = (sprite->oam_attr_2 & 0xFFF) | (trail->unk2C << 12);
            sub_8060F64(sprite, 0x100, 0x100, angle);
            entry->unkC.unsignedValue = trail->unk6;
            sub_804AB64(trail, entry, 1);
            trail->unk18 += scaledX;
            trail->unk1C += scaledY;
        }
    }
}
#endif
INCLUDE_ASM("asm/dump/804a388-tutorial/804a908.s");

void sub_804AB50(UnkTrail* arg0, unk16 arg1)
{
    u8 value;

    value = arg1;
    arg0->unk2C = value & 0xF;
}

INCLUDE_ASM("asm/dump/804a388-tutorial/804ab60-nullsub_39.s");

void sub_804AB64(UnkTrail* trail, SpriteTrailEntry* entry, unk32 index)
{
    const SpriteTrailFrame* frame;
    SpriteEntry* sprite;

    frame = trail->spriteSheet->frames;
    frame += index;
    entry->unk16 = index;
    sprite = entry->sprite;
    entry->unk12 = frame->unk0;
    sprite->frame.word = frame->unk0;
    entry->unk14 = frame->unk2;
    entry->unkE = frame->unk4;
    entry->unk10 = frame->unk4;
}

unk32 sub_804AB88(s32 arg0, s32 arg1)
{
    s32 value;
    s32 magnitude;
    s32 index;
    unk32 tableValue;

    value = arg0;
    magnitude = arg1;
    if (magnitude < 0) {
        magnitude = 0 - magnitude;
    }
    if (magnitude <= 0x80) {
        index = 0 - (arg1 >> 1);
    } else {
        index = value >> 1;
        value = arg1;
    }
    tableValue = Unk_874CEBC[(s16)index + 0x80];
    if (value < 0) {
        tableValue = 0xFF - tableValue;
    }
    if (magnitude > 0x80) {
        tableValue += 0x40;
        if ((s32)tableValue > 0xFF) {
            tableValue += 0xFFFFFF00;
        }
    }
    return tableValue;
}

void sub_804ABD0(UnkTrail* arg0, unk32 arg1, unk32 arg2)
{
    arg0->unk10 = arg1;
    arg0->unk14 = arg2;
}

void sub_804ABD8(UnkTrail* arg0, unk32 arg1, unk32 arg2)
{
    arg0->unk10 = arg1;
    arg0->unk14 = arg2;
    arg0->unk18 = arg1;
    arg0->unk1C = arg2;
}

void sub_804ABE4(UnkTrail* arg0)
{
    if (arg0->block != NULL) {
        deallocateBlock(arg0->block);
    }
    arg0->block = NULL;
}
