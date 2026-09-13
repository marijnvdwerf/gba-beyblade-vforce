#include "trail.h"

#include <agb/bios.h>
#include <agb/types.h>

#include "camera.h"
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

void sub_804A908(UnkTrail* trail)
{
    s32 remaining;
    s32 index;
    s32 x;
    s32 y;
    s32 dx;
    s32 dy;
    s32 distanceSquared;
    s32 spacing;
    s32 xRatio;
    s32 yRatio;
    unk32 angle;
    SpriteTrailEntry* entry;

    spacing = 0xD00; // TODO: fakematch? (literal 0xD00 at the three uses diverges at
                     // +0x10E/+0x12E/+0x150)
    remaining = trail->unk2;
    index = trail->unk4;
    while (remaining-- != 0) {
        unk16 delay;
        SpriteEntry* sprite;

        entry = &trail->sprites[index];
        sprite = entry->sprite;
        entry->unkC--;
        if (entry->unkC == 0) {
            sprite->y = 0xA000;
            sub_8060F64(sprite, 0x100, 0x100, 0);
            trail->unk2--;
        } else {
            if (trail->unk28 != NULL) {
                x = entry->unk0 - (trail->unk28->records[0].field_C & 0xFFFFFF00);
                y = entry->unk4 - (trail->unk28->records[0].field_10 & 0xFFFFFF00);
                sprite->x = x;
                if (y >= -0x4000) {
                    sprite->y = y;
                } else {
                    sprite->y = 0xA000;
                }
            }
            delay = entry->unkE;
            if (entry->unkE > 0x10) {
                entry->unkE = delay - 0x10;
            } else {
                entry->unkE = (delay + 0x10) + entry->unk10;
                sprite->frame.word++;
                if (sprite->frame.word == entry->unk12 + entry->unk14) {
                    if (entry->unk16 == trail->unk26) {
                        sub_804AB64(trail, entry, trail->unk24);
                    } else {
                        sprite->y = 0xA000;
                        sub_8060F64(sprite, 0x100, 0x100, 0);
                        trail->unk2--;
                    }
                }
            }
        }
        index--;
        if (index < 0) {
            index = trail->unk0 - 1;
        }
    }
    dx = trail->unk10 - trail->unk18;
    dy = trail->unk14 - trail->unk1C;
    distanceSquared = dx * dx + dy * dy;
    if (distanceSquared > spacing * spacing) {
        s32 offsetX;
        s32 offsetY;
        unk16 frameIndex;

        distanceSquared = Sqrt(distanceSquared);
        xRatio = (dx << 8) / distanceSquared;
        yRatio = (dy << 8) / distanceSquared;
        angle = sub_804AB88(xRatio, yRatio);
        xRatio = (xRatio * spacing) >> 8;
        yRatio = (yRatio * spacing) >> 8;
        entry = &trail->sprites[trail->unk4];
        if (entry->unkC != 0) {
            frameIndex = trail->unk24;
            if (entry->unk16 != frameIndex) {
                sub_804AB64(trail, entry, trail->unk24);
            }
        }
        trail->unk4++;
        if (trail->unk4 == trail->unk0) {
            trail->unk4 = 0;
        }
        if (trail->unk2 < trail->unk0) {
            trail->unk2++;
        }
        entry = &trail->sprites[trail->unk4];
        offsetX = (xRatio >> 1) - 0x800;
        x = trail->unk18 + offsetX;
        offsetY = (yRatio >> 1) - 0x800;
        y = trail->unk1C + offsetY;
        entry->unk0 = x;
        entry->unk4 = y;
        if (trail->unk28 != NULL) {
            x -= trail->unk28->records[0].field_C & 0xFFFFFF00;
            y -= trail->unk28->records[0].field_10 & 0xFFFFFF00;
        }
        entry->sprite->x = x;
        if (y >= -0x4000) {
            entry->sprite->y = y;
        } else {
            entry->sprite->y = 0xA000;
        }
        entry->sprite->frame.word = 0;
        entry->sprite->oam_attr_2 = (entry->sprite->oam_attr_2 & 0xFFF) | (trail->unk2C << 12);
        sub_8060F64(entry->sprite, 0x100, 0x100, angle);
        entry->unkC = trail->unk6;
        sub_804AB64(trail, entry, 1);
        trail->unk18 += xRatio;
        trail->unk1C += yRatio;
    }
}

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
    s32 indexValue;
    s16 index;
    s32 tableValue;

    value = arg0;
    magnitude = arg1;
    if (magnitude < 0) {
        magnitude = -magnitude;
    }
    if (magnitude <= 0x80) {
        indexValue = -(arg1 >> 1);
    } else {
        indexValue = value >> 1;
        value = arg1;
    }
    index = indexValue;
    tableValue = Unk_874CEBC[index + 0x80];
    if (value < 0) {
        tableValue = 0xFF - tableValue;
    }
    if (magnitude > 0x80) {
        tableValue += 0x40;
        if (tableValue > 0xFF) {
            tableValue -= 0x100;
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
