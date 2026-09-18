#include "sprite.h"

#include "common.h"
#include "include_asm.h"
#include "memory.h"
#include "packet.h"
#include "spritetext.h"
#include "system.h"
#include "unsorted.h"

typedef struct SpriteStruct2 SpriteStruct2;

struct SpriteStruct2 {
    u16 var00;
    u16 var02;
    SpriteStruct2* next;
};

extern s16 Unk_872CC3C[];

extern SpriteStruct2* _unk3005DC8;
extern SpriteStruct2* _unk3005DD8;
extern unk32 _unk3005E74;
extern unk32 _unk3005E6C;
extern AllocatedBlock* _spritesBlock;
extern AllocatedBlock* _rotationScaleBlock;
extern AllocatedBlock* _SpriteVramFreeList_block;
extern SpriteStruct2* _SpriteVramFreeList;
extern SpriteRotationScaleEntry* _rotationScale;
extern SpriteRotationScaleEntry* _unk3005DF8;
extern SpriteRotationScaleEntry* _rotationScale_end;
extern SpriteEntry* _spritesLeft;
extern unk32 _spritesFree;
extern SpriteEntry* _sprites;

SpriteEntry* _unk3005DE4;

extern u16 word_807D90C[];
extern const unk8 Str_8755A08[];

void freeSpriteVramLocation(s32, s32);

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
    u32 n;

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
        n = max_sprites - 1;
        while (n--) {
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
        n = max_rotation_scale - 1;
        while (n--) {
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
        n = 30;
        while (n--) {
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

void freeSpriteVramLocation(s32 start, s32 size)
{
    SpriteStruct2* current;
    SpriteStruct2* freeEntry;
    SpriteStruct2* previous;
    SpriteStruct2* next;
    s32 end;

    current = _unk3005DC8;
    freeEntry = _unk3005DD8;
    previous = NULL;
    end = start + size;
    while (current != NULL) {
        if (end == current->var00) {
            current->var00 -= size;
            current->var02 += size;
            break;
        }
        if (start == current->var00 + current->var02) {
            current->var02 += size;
            break;
        }
        if (current->var00 > start) {
            if (freeEntry == NULL) {
                printf(Str_8755A08);
                return;
            }
            _unk3005DD8 = freeEntry->next;
            if (previous != NULL) {
                previous->next = freeEntry;
            } else {
                _unk3005DC8 = freeEntry;
            }
            freeEntry->next = current;
            freeEntry->var00 = start;
            freeEntry->var02 = size;
            break;
        }
        previous = current;
        current = current->next;
    }

    current = _unk3005DC8->next;
    previous = _unk3005DC8;
    while (current != NULL) {
        if (current->var00 == previous->var00 + previous->var02) {
            next = current->next;
            previous->var02 += current->var02;
            previous->next = next;
            current->next = _unk3005DD8;
            _unk3005DD8 = current;
            current = next;
        } else {
            previous = current;
            current = current->next;
        }
    }
}

const unk8 Str_8755A08[]
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

SpriteRotationScaleEntry* sub_8060B0C(void)
{
    SpriteRotationScaleEntry* first;
    SpriteRotationScaleEntry* last;
    SpriteRotationScaleEntry* volatile* head;
    SpriteRotationScaleEntry* volatile* tail;

    head = (SpriteRotationScaleEntry* volatile*)&_rotationScale_end;
    first = *head;
    if (first != NULL) {
        *head = first->next;
        tail = (SpriteRotationScaleEntry* volatile*)&_unk3005DF8;
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

void sub_8060B38(SpriteRotationScaleEntry* spriteEntry)
{
    SpriteRotationScaleEntry* prev;
    SpriteRotationScaleEntry* next;

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
        spriteEntry->next = _rotationScale_end;
        _rotationScale_end = spriteEntry;
    }
}

void LoadSpriteSheet(SpriteEntry* dst, const SpriteSheet* source, unk32 x, unk32 y, unk8 objMode,
    unk8 priority, unk8 flip, unk16 frame)
{
    s8 sourceFlags;
    unk8 sourceByteC;

    sourceFlags = source->unk7;
    sourceByteC = source->unkC;
    dst->unk2C = source;
    dst->flip_h_v = flip;
    dst->x = x;
    dst->y = y;
    dst->unk10 = (sourceFlags & 3) << 14;
    dst->unk10 |= (~sourceByteC & 1) << 13;
    dst->unk10 |= (((objMode & 3) << 10) | 0x1000) & 0xFFFF;
    dst->unk10 |= (sourceFlags & 0xC) << 28;
    dst->unk10 |= (flip & 3) << 28;
    dst->oam_attr_2 = ((sourceByteC >> 1) & 0xF) << 12;
    dst->oam_attr_2 |= (priority & 3) << 10;
    dst->unk28 = (const unk8*)source + (source->unk1C != 0 ? source->unk1C : source->unk10);
    dst->var16 = source->unk6;
    dst->frame.word = frame;
    dst->unk1A = 0xFFFF;
    dst->flip_h_v = 0;
    dst->var20 = 0;
    dst->var24 = -1;
}

SpriteEntry* sub_8060C1C(SpriteTextBlock* block, unk16 size, unk16 var22)
{
    SpriteEntry* first;
    SpriteEntry* cur;
    SpriteEntry* prev;
    SpriteEntry* insertion;

    if (_spritesFree < size) {
        printf("No sprites left for block, sprites left: %i, sprites requested: %i\n", _spritesFree,
            size);
        return NULL;
    }
    _spritesFree -= size;
    first = _spritesLeft;
    cur = first;
    insertion = sub_80609C4(_unk3005DE4, var22);
    prev = first;
    block->count = size;
    block->prev = first;
    first->var22 = var22;
    while (--size != 0) {
        cur = cur->next;
        cur->var22 = var22;
        cur->prev = prev;
        prev = cur;
    }
    block->next = cur;
    _spritesLeft = cur->next;
    if (insertion == NULL) {
        if (_unk3005DE4 != NULL) {
            _unk3005DE4->prev = cur;
        }
        cur->next = _unk3005DE4;
        first->prev = NULL;
        _unk3005DE4 = first;
    } else {
        if (insertion->next != NULL) {
            insertion->next->prev = cur;
        }
        cur->next = insertion->next;
        first->prev = insertion;
        insertion->next = first;
    }
    sub_80604D4(_unk3005DE4);
    return first;
}

void sub_8060CDC(SpriteTextBlock* block)
{
    SpriteEntry* first;
    SpriteEntry* last;
    SpriteEntry* prev;
    SpriteEntry* next;
    SpriteEntry* cur;
    u32 n;

    if (block->count == 0) {
        return;
    }

    first = block->prev;
    last = block->next;
    prev = first->prev;
    next = last->next;
    _spritesFree += block->count;
    cur = block->prev;
    n = block->count;
    while (n--) {
        if (cur->unk30 != NULL) {
            sub_8060B38(cur->unk30);
            cur->unk30 = NULL;
        }
        if (cur->var24 >= 0) {
            freeSpriteVramLocation(cur->var24, 1 << (cur->var16 - 5));
        }
        cur->var24 = -1;
        cur = cur->next;
    }
    if (prev != NULL) {
        prev->next = next;
    } else {
        _unk3005DE4 = next;
    }
    if (next != NULL) {
        next->prev = prev;
    }
    last->next = _spritesLeft;
    _spritesLeft = first;
    block->count = 0;
    block->prev = NULL;
    block->next = NULL;
    sub_80604D4(_unk3005DE4);
}

SpriteEntry* resizeSpriteBlock(SpriteTextBlock* block, u16 size, u16 var22)
{
    SpriteEntry* newFirst;
    SpriteEntry* cur;
    SpriteEntry* last;
    SpriteEntry* prev;

    if (block->count == size) {
        return block->prev;
    }
    if (block->count < size) {
        if (block->count != 0) {
            size -= block->count;
            if (_spritesFree < size) {
                nullsub_8("No sprites left for resize!");
                return NULL;
            }
            cur = _spritesLeft;
            newFirst = cur;
            last = block->next;
            prev = cur;
            var22 = block->prev->var22;
            _spritesFree -= size;
            block->count += size;
            cur->var22 = var22;
            size--;
            while (size != 0) {
                cur = cur->next;
                cur->var22 = var22;
                cur->prev = prev;
                prev = cur;
                size--;
            }
            _spritesLeft = cur->next;
            if (last->next != NULL) {
                last->next->prev = cur;
            }
            cur->next = last->next;
            last->next = newFirst;
            newFirst->prev = last;
            block->next = cur;
            sub_80604D4(_unk3005DE4);
            return block->prev;
        }
        sub_8060C1C(block, size, var22);
        return block->prev;
    }
    nullsub_8("resizeSpriteBlock: Reduce. Code needs writing.");
    sub_8060CDC(block);
    return sub_8060C1C(block, size, var22);
}

SpriteRotationScaleEntry* sub_8060E8C(
    SpriteRotationScaleEntry* entry, u16 scaleX, u16 scaleY, u8 angle)
{
    unk32 identity;
    s32 cosAngle;
    s32 factorX;
    s32 sinAngle;
    s32 factorY;

    identity = 0;
    if (angle == 0 && scaleX == 0x100 && scaleY == scaleX) {
        identity = 1;
    }
    if (entry != NULL) {
        if (entry->unk19 != 0) {
            return;
        }
        if (identity != 0) {
            sub_8060B38(entry);
            return NULL;
        }
    } else {
        if (identity != 0) {
            return NULL;
        }
        entry = sub_8060B0C();
        if (entry == NULL) {
            return NULL;
        }
    }
    entry->unk14 = scaleX;
    entry->unk16 = scaleY;
    entry->unk18 = angle;
    if (angle != 0) {
        cosAngle = Unk_874CC3C[angle + 0x40];
        factorX = Unk_872CC3C[scaleX];
        entry->unkC[0] = (cosAngle * factorX) >> 8;
        sinAngle = Unk_874CC3C[angle];
        entry->unkC[1] = (sinAngle * factorX) >> 8;
        sinAngle = -sinAngle;
        factorY = Unk_872CC3C[scaleY];
        entry->unkC[2] = (sinAngle * factorY) >> 8;
        entry->unkC[3] = (cosAngle * factorY) >> 8;
    } else {
        entry->unkC[0] = Unk_872CC3C[scaleX];
        entry->unkC[1] = 0;
        entry->unkC[2] = 0;
        entry->unkC[3] = Unk_872CC3C[scaleY];
    }
    return entry;
}

void sub_8060F64(SpriteEntry* sprite, u16 arg1, u16 arg2, u8 arg3)
{
    SpriteRotationScaleEntry* child = sprite->unk30;
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
            child_flags = child->oamAddr;
            size_mask = 0xF8;
            size_mask <<= 2;
            child_flags &= size_mask;
            child_flags <<= 20;
            child_flags |= 0x100;
            flags |= child_flags;
        }
    }
    if (child != NULL) {
        if (child->unk18 != 0) {
            if (child->unk14 > 0xB0 || child->unk16 > 0xB0) {
                flags |= 0x200;
            } else {
                flags &= ~0x200;
            }
        } else {
            if (child->unk14 > 0x100 || child->unk16 > 0x100) {
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
    SpriteRotationScaleEntry* child = spriteEntry->unk30;

    if (child != NULL) {
        sub_8060F64(spriteEntry, arg1, arg2, child->unk18);
    } else {
        sub_8060F64(spriteEntry, arg1, arg2, 0);
    }
}

void sub_8061030(SpriteEntry* spriteEntry, u16 arg1, u16 arg2)
{
    SpriteRotationScaleEntry* child = spriteEntry->unk30;

    if (child != NULL) {
        sub_8060F64(spriteEntry, child->unk14 + arg1, child->unk16 + arg2, child->unk18);
    } else {
        sub_8060F64(spriteEntry, arg1 + 0x100, arg2 + 0x100, 0);
    }
}

void sub_8061078(SpriteEntry* sprite, unk16 frame)
{
    u16 value;
    SpriteEntry* previous;

    value = frame;
    if (sprite->var22 == value) {
        return;
    }
    previous = sprite->prev;
    if (previous != NULL) {
        previous->next = sprite->next;
    } else {
        _unk3005DE4 = sprite->next;
    }
    if (sprite->next != NULL) {
        sprite->next->prev = sprite->prev;
    }
    sprite->var22 = value;
    previous = sub_80609C4(_unk3005DE4, value);
    if (previous == NULL) {
        if (_unk3005DE4 != NULL) {
            _unk3005DE4->prev = sprite;
        }
        sprite->next = _unk3005DE4;
        sprite->prev = previous;
        _unk3005DE4 = sprite;
    } else {
        if (previous->next != NULL) {
            previous->next->prev = sprite;
        }
        sprite->next = previous->next;
        sprite->prev = previous;
        previous->next = sprite;
    }
}

unk32 sub_80610EC(SpriteEntry* spriteEntry)
{
    u16* table = word_807D90C;
    unk32 index = ((spriteEntry->unk10 & 0xC000) >> 12) | ((u32)spriteEntry->unk10 >> 30);

    return (table[index] & 0xFF00) >> 7;
}

unk32 sub_8061110(SpriteEntry* spriteEntry)
{
    u16* table = word_807D90C;
    unk32 index = ((spriteEntry->unk10 & 0xC000) >> 12) | ((u32)spriteEntry->unk10 >> 30);

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

void sub_8061158(SpriteRotationScaleEntry* spriteEntry)
{
    spriteEntry->unk19 = 1;
}

void sub_8061160(SpriteRotationScaleEntry* spriteEntry)
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
