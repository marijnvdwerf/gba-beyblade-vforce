#include "common.h"
#include "unsorted.h"

typedef struct SpriteEntry SpriteEntry;

struct SpriteEntry {
    SpriteEntry* prev; // 0x00
    SpriteEntry* next; // 0x04
    u32 x; // 0x08
    u32 y; // 0x0C
    u8 unk10[4]; // 0x10
    u16 oam_attr_2; // 0x14
    u16 var16; // 0x16
    u16 frame; // 0x18
    u8 unk1A[2]; // 0x1A
    u16 flip_h_v; // 0x1C
    u8 unk1E[2]; // 0x1E
    u16 var20; // 0x20
    u16 var22; // 0x22
    s32 var24; // 0x24
};

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

typedef struct SpriteStruct2 SpriteStruct2;

struct SpriteStruct2 {
    u16 var00;
    u16 var02;
    SpriteStruct2* next;
};

extern SpriteStruct2 (*_unk3005DC8)[];
extern SpriteStruct2 (*_unk3005DD8)[];
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

void nullsub_8(const char*);

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

void freeSpriteVramLocation(int, int);

#ifdef NONMATCHING
void sub_8060A60(SpriteEntry* spriteEntry)
{

    if (spriteEntry == NULL) {
        return;
    }

    if (spriteEntry->var24 >= 0) {

        int i = spriteEntry->var20 & 1;
        if (i == 0) {
            freeSpriteVramLocation(spriteEntry->var24, spriteEntry->var16 - 5);
        }
    }

    spriteEntry->var24 = -1;
}
#endif
