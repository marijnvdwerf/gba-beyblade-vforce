#include "common.h"
#include "include_asm.h"
#include "memory.h"
#include "sprite.h"
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

extern const s16 Unk_874CC3C[];
extern const s16 Unk_872CC3C[];

extern SpriteStruct2* _unk3005DC8;
extern SpriteStruct2* _unk3005DD8;
extern unk32 _unk3005E74;
extern unk32 _unk3005E6C;
extern AllocatedBlock* _spritesBlock;
extern AllocatedBlock* _rotationScaleBlock;
extern AllocatedBlock* _SpriteVramFreeList_block;
extern SpriteStruct2* _SpriteVramFreeList;
extern SpriteRotationScaleEntry* _rotationScale;
extern void* _unk3005DF8;
extern SpriteRotationScaleEntry* _rotationScale_end;
extern SpriteEntry* _spritesLeft;
extern unk32 _spritesFree;
extern SpriteEntry* _sprites;

SpriteEntry* _unk3005DE4;

extern u16 word_807D90C[];
extern const u8 Str_8755AC8[];

void nullsub_8(const char*);
void freeSpriteVramLocation(s32, s32);
void sub_8060B38(SpriteEntry*);
SpriteEntry* sub_8060E8C(SpriteEntry*, u16, u16, u8);

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

void SpriteVRamFree(u32 max_sprites, u32 max_rotation_scale)
{
    AllocatedBlock* block;
    SpriteEntry* sprite;
    void* prev;
    SpriteRotationScaleEntry* rotation;
    SpriteStruct2* free_entry;
    SpriteStruct2* vram_entry;
    SpriteStruct2* next;
    unk32 rotation_address;
    s32 i;

    _unk3005E74 = 0x800;
    _unk3005E6C = 0;
    if (max_sprites > 0x80) {
        max_sprites = 0x80;
    }
    if (max_rotation_scale > 0x20) {
        max_rotation_scale = 0x20;
    }
    if (_spritesBlock != NULL) {
        deallocateBlock(_spritesBlock);
        _spritesBlock = NULL;
    }
    if (_rotationScaleBlock != NULL) {
        deallocateBlock(_rotationScaleBlock);
        _rotationScaleBlock = NULL;
    }
    if (_SpriteVramFreeList_block != NULL) {
        deallocateBlock(_SpriteVramFreeList_block);
        _SpriteVramFreeList_block = NULL;
    }

    if (max_sprites != 0) {
        _spritesBlock = fastAllocate(max_sprites * 0x34);
        if (_spritesBlock == NULL) {
            nullsub_8("Not enough RAM for sprites");
        }
    }
    if (max_rotation_scale != 0) {
        _rotationScaleBlock = fastAllocate(max_rotation_scale * 0x1C);
        if (_rotationScaleBlock == NULL) {
            nullsub_8("Not enough RAM for rotation/scale");
        }
    }

    block = fastAllocate(0x100);
    _SpriteVramFreeList_block = block;
    if (block == NULL) {
        printf("Error allocating memory for SpriteVramFree list\n");
        _SpriteVramFreeList = NULL;
    } else {
        _SpriteVramFreeList = (SpriteStruct2*)block->address;
    }

    if (_spritesBlock != NULL) {
        _sprites = (SpriteEntry*)_spritesBlock->address;
    } else {
        _sprites = NULL;
    }
    if (_rotationScaleBlock != NULL) {
        _rotationScale = (SpriteRotationScaleEntry*)_rotationScaleBlock->address;
    } else {
        _rotationScale = NULL;
    }
    if (_sprites != NULL) {
        __fastMemoryClearARM(0, _sprites, _spritesBlock->size);
    }
    if (_rotationScale != NULL) {
        __fastMemoryClearARM(0, _rotationScale, _rotationScaleBlock->size);
    }

    if (max_sprites != 0) {
        sprite = _sprites;
        rotation = _rotationScale;
        prev = NULL;
        /* Reversed loops reproduce agbcc's loop reversal. */
        for (i = max_sprites - 2; i != -1; i--) {
            sprite->prev = prev;
            sprite->next = sprite + 1;
            sprite->var24 = -1;
            prev = sprite;
            sprite = sprite->next;
        }
        sprite->prev = prev;
        sprite->next = NULL;
        _unk3005DE4 = NULL;
        _spritesLeft = _sprites;
        _spritesFree = max_sprites;
    }

    if (max_rotation_scale != 0) {
        prev = NULL;
        rotation_address = 0x07000000;
        for (i = max_rotation_scale - 2; i != -1; i--) {
            rotation->prev = prev;
            rotation->next = rotation + 1;
            rotation->oamAddr = rotation_address;
            rotation_address += 0x20;
            prev = rotation;
            rotation = rotation->next;
        }
        rotation->prev = prev;
        rotation->next = NULL;
        rotation->oamAddr = rotation_address;
        _unk3005DF8 = NULL;
        _rotationScale_end = _rotationScale;
    }

    vram_entry = _SpriteVramFreeList;
    if (vram_entry != NULL) {
        _unk3005DC8 = vram_entry;
        _unk3005DD8 = vram_entry + 1;
        free_entry = vram_entry + 1;
        vram_entry->var00 = 0;
        vram_entry->var02 = 0x400;
        vram_entry->next = NULL;
        next = free_entry;
        for (i = 29; i != -1; i--) {
            next->next = next + 1;
            next = next->next;
        }
        next->next = NULL;
    }
    __fastMemoryClearARM(0xA0, (void*)0x07000000, 0x400);
}

s32 sub_8060790(s32 arg0)
{
    SpriteStruct2* entry;
    SpriteStruct2* prev;
    SpriteStruct2* next;
    u16 start;

    entry = _unk3005DC8;
    prev = NULL;
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
        printf("There was no free space in Sprite VRAM for requested characters (%i)\n");
        return -1;
    }

    start = entry->var00;
    entry->var00 += arg0;
    entry->var02 -= arg0;
    if (entry->var02 == 0) {
        if (_unk3005DC8 != entry || entry->next != NULL) {
            next = entry->next;
            if (prev != NULL) {
                prev->next = next;
            } else {
                _unk3005DC8 = next;
            }
            entry->next = _unk3005DD8;
            _unk3005DD8 = entry;
        }
    }
    return start;
}

INCLUDE_ASM("asm/dump/8057b80-debug/8060808-freeSpriteVramLocation.s");

// 8755A08
const u8 Str_8755A08[]
    = "There are no free SpriteVramFree entries remaining on a call to freeSpriteVramLocation()\n";

void sub_80608CC(void)
{
    u32 remainingEntries;
    SpriteStruct2* entry = _unk3005DC8;

    printf("Vram space list\n");
    while (entry != NULL) {
        printf("  > %i -> %i\n", entry->var00, entry->var00 + entry->var02);
        entry = entry->next;
    }

    entry = _unk3005DD8;
    remainingEntries = 0;
    while (entry != NULL) {
        remainingEntries += 1;
        entry = entry->next;
    }

    printf("remaining entries %i\n", remainingEntries);

    printf("spritesFree = %i\n", _spritesFree);
}

void sub_8060934(u16 arg0)
{
    s32 count;
    SpriteStruct2* next;
    SpriteStruct2* head;
    SpriteStruct2* entry;
    SpriteStruct2** freeList;
    SpriteEntry* sprite;

    sprite = _unk3005DE4;
    while (sprite != NULL) {
        if ((sprite->var20 & 1) == 0) {
            if (sprite->var24 >= 0) {
                freeSpriteVramLocation(sprite->var24, 1 << (sprite->var16 - 5));
            }
            sprite->var24 = -1;
        }
        sprite = sprite->next;
    }
    _unk3005E6C = arg0;
    head = _SpriteVramFreeList;
    if (head != NULL) {
        _unk3005DC8 = head;
        freeList = &_unk3005DD8;
        entry = head + 1;
        *freeList = entry;
        head->var00 = arg0;
        head->var02 = 0x400 - arg0;
        head->next = NULL;
        count = 0x1D;
        do {
            next = entry + 1;
            entry->next = next;
            entry = next;
        } while (count-- != 0);
        next->next = NULL;
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
        _unk3005DE4 = next;
    }
    if (next != NULL) {
        next->prev = prev;
    }
    spriteEntry->next = _spritesLeft;
    _spritesLeft = spriteEntry;
    if (spriteEntry->unk30 != NULL) {
        sub_8060B38(spriteEntry->unk30);
        spriteEntry->unk30 = NULL;
    }
    _spritesFree += 1;
    sub_80604D4(_unk3005DE4);
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
        tail = (SpriteEntry* volatile*)&_unk3005DF8;
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
            _unk3005DF8 = next;
        }
        if (next != NULL) {
            next->prev = prev;
        }
        spriteEntry->next = (SpriteEntry*)_rotationScale_end;
        _rotationScale_end = (SpriteRotationScaleEntry*)spriteEntry;
    }
}

INCLUDE_ASM("asm/dump/8057b80-debug/8060b68-LoadSpriteSheet.s");
INCLUDE_ASM("asm/dump/8057b80-debug/8060c1c.s");
INCLUDE_ASM("asm/dump/8057b80-debug/8060cdc.s");
INCLUDE_ASM("asm/dump/8057b80-debug/8060d98-resizeSpriteBlock.s");
INCLUDE_ASM("asm/dump/8057b80-debug/8060e8c.s");

void sub_8060F64(SpriteEntry* sprite, u16 arg1, u16 arg2, u8 arg3)
{
    SpriteEntry* child = sprite->unk30;
    u32 flags = sprite->unk10;
    u32 child_flags;
    u32 size_mask;

    if (child != NULL) {
        child = sprite->unk30 = sub_8060E8C(child, arg1, arg2, arg3);
        if (child == NULL) {
            flags &= ~0x3E000300;
            flags |= (sprite->flip_h_v & 3) << 28;
        }
    } else {
        child = sprite->unk30 = sub_8060E8C(NULL, arg1, arg2, arg3);
        if (child != NULL) {
            flags &= ~0x3E000200;
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
                flags &= ~0x200;
            }
        } else {
            if (child->oam_attr_2 > 0x100 || child->var16 > 0x100) {
                flags |= 0x200;
            } else {
                flags &= ~0x200;
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
    u16* table = word_807D90C;
    unk32 index = ((spriteEntry->unk10 & 0xC000) >> 12) | ((unk32)spriteEntry->unk10 >> 30);

    return (table[index] & 0xFF00) >> 7;
}

unk32 sub_8061110(SpriteEntry* spriteEntry)
{
    u16* table = word_807D90C;
    unk32 index = ((spriteEntry->unk10 & 0xC000) >> 12) | ((unk32)spriteEntry->unk10 >> 30);

    return (table[index] & 0xFF) * 2;
}

void sub_8061130(SpriteEntry* spriteEntry, u8 arg1)
{
    spriteEntry->unk10 = (spriteEntry->unk10 & 0xFFFFF3FF) | ((arg1 & 3) << 10);
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

void sub_8061168(SpriteEntry* spriteEntry, u8 arg1)
{
    spriteEntry->oam_attr_2 = (spriteEntry->oam_attr_2 & 0xFFF) | ((arg1 & 0xF) << 12);
}

unk32 sub_8061184(void)
{
    return _spritesFree;
}
