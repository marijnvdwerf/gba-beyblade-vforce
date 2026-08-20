#include "common.h"
#include "include_asm.h"
#include "memory.h"
#include "system.h"
#include "unsorted.h"

typedef struct SpriteEntry SpriteEntry;

struct SpriteEntry {
    SpriteEntry* prev; // 0x00
    SpriteEntry* next; // 0x04
    u32 x; // 0x08
    u32 y; // 0x0C
    s32 unk10; // 0x10
    u16 oam_attr_2; // 0x14
    u16 var16; // 0x16
    u8 frame_lo; // 0x18
    u8 unk19; // 0x19
    u8 unk1A[2]; // 0x1A
    u16 flip_h_v; // 0x1C
    u8 unk1E[2]; // 0x1E
    u16 var20; // 0x20
    u16 var22; // 0x22
    s32 var24; // 0x24
    u8 unk28[4]; // 0x28
    SpriteEntry* unk2C; // 0x2C
    SpriteEntry* unk30; // 0x30
};

typedef struct SpriteStruct2 SpriteStruct2;

struct SpriteStruct2 {
    u16 var00;
    u16 var02;
    SpriteStruct2* next;
};

extern const u8 Str_87559C0[];
extern SpriteStruct2 (*_unk3005DC8)[];
extern SpriteStruct2 (*_unk3005DD8)[];
extern const s16 Unk_874CC3C[];
extern const s16 Unk_872CC3C[];

__asm__(".equ _unk3005E74, 0x03005E74");
__asm__(".equ _unk3005E6C, 0x03005E6C");
__asm__(".equ _spritesBlock, 0x03005DE0");
__asm__(".equ _rotationScaleBlock, 0x03005DDC");
__asm__(".equ _SpriteVramFreeList_block, 0x03005DD4");
__asm__(".equ _SpriteVramFreeList, 0x03005DCC");
__asm__(".equ _rotationScale, 0x03005DF0");
__asm__(".equ _unk3005DF8, 0x03005DF8");
__asm__(".equ _rotationScale_end, 0x03005DE8");
__asm__(".equ _unk3005DE4, 0x03005DE4");
__asm__(".equ _spritesLeft, 0x03005DEC");
__asm__(".equ _spritesFree, 0x03005DF4");
__asm__(".equ _unk3005DC8, 0x03005DC8");
__asm__(".equ _sprites, 0x03005DD0");
__asm__(".equ _unk3005DD8, 0x03005DD8");
extern u32 _unk3005E74;
extern u8 _unk3005E6C[];
extern AllocatedBlock* _spritesBlock;
extern AllocatedBlock* _rotationScaleBlock;
extern AllocatedBlock* _SpriteVramFreeList_block;
extern void* _SpriteVramFreeList;
extern SpriteEntry* _rotationScale;
extern SpriteEntry* _rotationScale_end;
extern SpriteEntry* _sprites;

void nullsub_8(const char*);

void sub_80604D4(SpriteEntry* current)
{
    SpriteEntry* prev;

    if (current == NULL) {
        return;
    }

    prev = current->prev;

    if (prev != NULL) {
        printf("> First prev is not zero.\n");
    }

    do {
        if (prev != NULL) {
            if (prev->next != current) {
                printf("> Prev next is not current\n");
            }
        }

        if (current->prev != prev) {
            printf("> Current prev is not prev\n");
        }

        prev = current;
        current = current->next;
    } while (current != NULL);
}

INCLUDE_ASM("asm/dump/8057b80-debug/8060520-SpriteVRamFree.s");

s32 sub_8060790(s32 arg0)
{
    SpriteStruct2** list;
    SpriteStruct2* entry;
    SpriteStruct2* prev;
    SpriteStruct2* next;
    u16 start;

    entry = *(SpriteStruct2**)&_unk3005DC8;
    prev = NULL;
    list = (SpriteStruct2**)&_unk3005DC8;
    if (entry != NULL && entry->var02 < arg0) {
        do {
            prev = entry;
            entry = entry->next;
            if (entry == NULL) {
                break;
            }
        } while (entry->var02 < arg0);
    }

    if (entry == NULL) {
        printf((const char*)Str_87559C0);
        return -1;
    }

    start = entry->var00;
    entry->var00 += arg0;
    entry->var02 -= arg0;
    if (entry->var02 == 0) {
        if (*list != entry || entry->next != NULL) {
            next = entry->next;
            if (prev != NULL) {
                prev->next = next;
            } else {
                *list = next;
            }
            entry->next = *(SpriteStruct2**)&_unk3005DD8;
            *(SpriteStruct2**)&_unk3005DD8 = entry;
        }
    }
    return start;
}

INCLUDE_ASM("asm/dump/8057b80-debug/8060808-freeSpriteVramLocation.s");

// 875594C
const u8 Str_875594C[] = "Not enough RAM for sprites";

// 8755968
const u8 Str_8755968[] = "Not enough RAM for rotation/scale";

// 875598C
const u8 Str_875598C[] = "Error allocating memory for SpriteVramFree list\n";

// 87559C0
const u8 Str_87559C0[] = "There was no free space in Sprite VRAM for requested characters (%i)\n";

// 8755A08
const u8 Str_8755A08[]
    = "There are no free SpriteVramFree entries remaining on a call to freeSpriteVramLocation()\n";

extern SpriteStruct2 (*_unk3005DC8)[];
extern SpriteStruct2 (*_unk3005DD8)[];
extern u8 word_807D90C[];
extern u8 _unk3005DF8[];
extern u32 _spritesFree;
extern SpriteEntry* _spritesLeft;

void sub_80608CC(void)
{
    u32 remainingEntries;
    SpriteStruct2* entry = &(*_unk3005DC8)[0];

    printf("Vram space list\n");
    while (entry != NULL) {
        printf("  > %i -> %i\n", entry->var00, entry->var00 + entry->var02);
        entry = entry->next;
    }

    entry = &(*_unk3005DD8)[0];
    remainingEntries = 0;
    while (entry != NULL) {
        remainingEntries += 1;
        entry = entry->next;
    }

    printf("remaining entries %i\n", remainingEntries);

    printf("spritesFree = %i\n", _spritesFree);
}

void freeSpriteVramLocation(s32, s32);
extern SpriteEntry* _unk3005DE4;
extern u8 _unk3005DCC[];

void sub_8060934(u16 arg0)
{
    s32 temp_r0;
    s32 temp_r2;
    s32 var_r3;
    u16 temp_r6;
    SpriteStruct2* temp_r1;
    SpriteStruct2* temp_r3;
    SpriteStruct2* var_r2;
    volatile SpriteStruct2** freeList;
    SpriteEntry* var_r4;

    temp_r6 = arg0;
    var_r4 = *(SpriteEntry**)&_unk3005DE4;
    if (var_r4 != NULL) {
        do {
            if ((var_r4->var20 & 1) == 0) {
                temp_r2 = var_r4->var24;
                if (temp_r2 >= 0) {
                    freeSpriteVramLocation(temp_r2, 1 << (var_r4->var16 - 5));
                }
                var_r4->var24 = -1;
            }
            var_r4 = var_r4->next;
        } while (var_r4 != NULL);
    }
    *(s32*)_unk3005E6C = temp_r6;
    temp_r3 = *(SpriteStruct2**)&_SpriteVramFreeList;
    if (temp_r3 != NULL) {
        *(SpriteStruct2**)&_unk3005DC8 = temp_r3;
        freeList = (volatile SpriteStruct2**)&_unk3005DD8;
        var_r2 = (SpriteStruct2*)((u8*)temp_r3 + 8);
        *freeList = var_r2;
        temp_r3->var00 = temp_r6;
        temp_r3->var02 = 0x400 - temp_r6;
        temp_r3->next = NULL;
        var_r3 = 0x1D;
        do {
            temp_r1 = (SpriteStruct2*)((u8*)var_r2 + 8);
            var_r2->next = temp_r1;
            var_r2 = temp_r1;
            temp_r0 = var_r3;
            var_r3 -= 1;
        } while (temp_r0 != 0);
        temp_r1->next = (SpriteStruct2*)temp_r0;
    }
}

SpriteEntry* sub_80609C4(SpriteEntry* arg0, u16 arg1)
{
    SpriteEntry* retval = NULL;

    if (arg0 != NULL) {
        do {
            if (arg0->var22 >= arg1) {
                break;
            }

            retval = arg0;
            arg0 = arg0->next;
        } while (arg0 != NULL);
    }

    return retval;
}

SpriteEntry* _unk3005DE4;

void* allocSprite(u16 arg0)
{

    SpriteEntry* sprite = _spritesLeft;

    if (sprite != NULL) {
        SpriteEntry* sprite2 = sub_80609C4(_unk3005DE4, arg0);
        sprite->var22 = arg0;
        _spritesLeft = sprite->next;

        if (sprite2 == NULL) {
            if (_unk3005DE4 != NULL) {
                _unk3005DE4->prev = sprite;
            }

            sprite->next = _unk3005DE4;
            sprite->prev = sprite2;
            _unk3005DE4 = sprite;

        } else {
            if (sprite2->next != NULL) {
                sprite2->next->prev = sprite;
            }

            sprite->next = sprite2->next;
            sprite->prev = sprite2;
            sprite2->next = sprite;
        }

        _spritesFree -= 1;
    } else {
        nullsub_8("No sprites left!");
    }

    sub_80604D4(_unk3005DE4);
    return sprite;
}

void sub_8060A60(SpriteEntry* spriteEntry)
{
    if (spriteEntry == NULL) {
        return;
    }

    if (spriteEntry->var24 >= 0 && (spriteEntry->var20 & 1) == 0) {
        freeSpriteVramLocation(spriteEntry->var24, 1 << (spriteEntry->var16 - 5));
    }

    spriteEntry->var24 = -1;
}

void sub_8060B38(SpriteEntry*);

void sub_8060A94(SpriteEntry* spriteEntry)
{
    SpriteEntry* prev;
    SpriteEntry* next;

    prev = spriteEntry->prev;
    next = spriteEntry->next;
    if (spriteEntry->var24 >= 0 && (spriteEntry->var20 & 1) == 0) {
        freeSpriteVramLocation(spriteEntry->var24, 1 << (spriteEntry->var16 - 5));
    }
    spriteEntry->var24 = -1;
    if (prev != NULL) {
        prev->next = next;
    } else {
        *(SpriteEntry**)&_unk3005DE4 = next;
    }
    if (next != NULL) {
        next->prev = prev;
    }
    spriteEntry->next = *(SpriteEntry**)&_spritesLeft;
    *(SpriteEntry**)&_spritesLeft = spriteEntry;
    if (spriteEntry->unk30 != NULL) {
        sub_8060B38(spriteEntry->unk30);
        spriteEntry->unk30 = NULL;
    }
    (*(s32*)&_spritesFree) += 1;
    sub_80604D4(*(SpriteEntry**)&_unk3005DE4);
}

SpriteEntry* sub_8060B0C(void)
{
    SpriteEntry* first;
    SpriteEntry* last;
    SpriteEntry* volatile* head;
    SpriteEntry* volatile* tail;

    head = (SpriteEntry* volatile*)&_rotationScale_end;
    first = *head;
    if (first != NULL) {
        *head = first->next;
        tail = (SpriteEntry* volatile*)_unk3005DF8;
        last = *tail;
        if (last != NULL) {
            last->prev = first;
        }
        first->next = *tail;
        first->prev = NULL;
        *tail = first;
    }
    return first;
}

void sub_8060B38(SpriteEntry* spriteEntry)
{
    SpriteEntry* prev;
    SpriteEntry* next;

    if (spriteEntry->unk19 == 0) {
        prev = spriteEntry->prev;
        next = spriteEntry->next;
        if (prev != NULL) {
            prev->next = next;
        } else {
            *(SpriteEntry**)0x03005DF8 = next;
        }
        if (next != NULL) {
            next->prev = prev;
        }
        spriteEntry->next = *(SpriteEntry**)&_rotationScale_end;
        *(SpriteEntry**)&_rotationScale_end = spriteEntry;
    }
}

INCLUDE_ASM("asm/dump/8057b80-debug/8060b68-LoadSpriteSheet.s");
INCLUDE_ASM("asm/dump/8057b80-debug/8060c1c.s");
INCLUDE_ASM("asm/dump/8057b80-debug/8060cdc.s");
INCLUDE_ASM("asm/dump/8057b80-debug/8060d98-resizeSpriteBlock.s");
INCLUDE_ASM("asm/dump/8057b80-debug/8060e8c.s");

extern const u8 Str_8755AC8[];

SpriteEntry* sub_8060E8C(SpriteEntry*, u16, u16, u8);

void sub_8060F64(SpriteEntry* sprite, u16 arg1, u16 arg2, u8 arg3)
{
    SpriteEntry* child;
    u32 flags;
    u32 child_flags;
    u32 size_mask;
    child = sprite->unk30;
    flags = sprite->unk10;
    if (child != NULL) {
        child = sprite->unk30 = sub_8060E8C(child, arg1, arg2, arg3);
        if (child == NULL) {
            flags &= 0xC1FFFCFF;
            flags |= (sprite->flip_h_v & 3) << 28;
        }
    } else {
        child = sprite->unk30 = sub_8060E8C(NULL, arg1, arg2, arg3);
        if (child != NULL) {
            flags &= 0xC1FFFDFF;
            child_flags = child->x;
            size_mask = 0xF8;
            size_mask <<= 2;
            child_flags &= size_mask;
            child_flags <<= 20;
            child_flags |= 0x100;
            flags |= child_flags;
        }
    }
    if (child != NULL) {
        if (child->frame_lo != 0) {
            if (child->oam_attr_2 > 0xB0 || child->var16 > 0xB0) {
                flags |= 0x200;
            } else {
                flags &= 0xFFFFFDFF;
            }
        } else {
            if (child->oam_attr_2 > 0x100 || child->var16 > 0x100) {
                flags |= 0x200;
            } else {
                flags &= 0xFFFFFDFF;
            }
        }
    }
    sprite->unk10 = flags;
}

void sub_806100C(SpriteEntry* spriteEntry, u16 arg1, u16 arg2)
{
    SpriteEntry* child = spriteEntry->unk30;

    if (child != NULL) {
        sub_8060F64(spriteEntry, arg1, arg2, child->frame_lo);
    } else {
        sub_8060F64(spriteEntry, arg1, arg2, 0);
    }
}

void sub_8061030(SpriteEntry* spriteEntry, u16 arg1, u16 arg2)
{
    SpriteEntry* child = spriteEntry->unk30;

    if (child != NULL) {
        sub_8060F64(spriteEntry, child->oam_attr_2 + arg1, child->var16 + arg2, child->frame_lo);
    } else {
        sub_8060F64(spriteEntry, arg1 + 0x100, arg2 + 0x100, 0);
    }
}

INCLUDE_ASM("asm/dump/8057b80-debug/8061078.s");

unk32 sub_80610EC(SpriteEntry* spriteEntry)
{
    u8* table;
    s32 value;
    unk32 index;

    table = word_807D90C;
    value = spriteEntry->unk10;
    index = (((value & 0xC000) >> 12) | ((unk32)value >> 30)) * 2;
    return (*(u16*)((unk32)table + index) & 0xFF00) >> 7;
}

unk32 sub_8061110(SpriteEntry* spriteEntry)
{
    u8* table;
    s32 value;
    unk32 index;

    table = word_807D90C;
    value = spriteEntry->unk10;
    index = (((value & 0xC000) >> 12) | ((unk32)value >> 30)) * 2;
    return *(u8*)((unk32)table + index) * 2;
}

void sub_8061130(SpriteEntry* spriteEntry, unk32 arg1)
{
    unk32 value;
    unk32 temp;

    arg1 <<= 24;
    value = spriteEntry->unk10 & 0xFFFFF3FF;
    temp = 0x03000000;
    temp &= arg1;
    spriteEntry->unk10 = value | (temp >> 14);
}

unk32 sub_806114C(SpriteEntry* spriteEntry)
{
    return (spriteEntry->unk10 >> 10) & 3;
}

void sub_8061158(SpriteEntry* spriteEntry)
{
    spriteEntry->unk19 = 1;
}

void sub_8061160(SpriteEntry* spriteEntry)
{
    spriteEntry->unk19 = 0;
}

void sub_8061168(SpriteEntry* spriteEntry, unk32 arg1)
{
    unk32 value;
    unk32 bits;

    arg1 <<= 24;
    value = spriteEntry->oam_attr_2 & 0xFFF;
    bits = 0x0F000000;
    bits &= arg1;
    spriteEntry->oam_attr_2 = value | (bits >> 12);
}

unk32 sub_8061184(void)
{
    return *(unk32*)&_spritesFree;
}
