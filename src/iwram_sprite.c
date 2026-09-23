#include <agb/memory_map.h>

#include "iwram.h"
#include "unsorted.h"

typedef struct OamEntry {
    unk32 attr01;
    unk16 attr2;
    unk8 pad6[2];
} OamEntry;

typedef struct OamAffine {
    unk8 pad0[6];
    unk16 pa;
    unk8 pad8[6];
    unk16 pb;
    unk8 pad10[6];
    unk16 pc;
    unk8 pad18[6];
    unk16 pd;
} OamAffine;

typedef struct SpriteImageHeader {
    unk32 unk0;
    unk32 unk4;
} SpriteImageHeader;

static inline const SpriteImageHeader* spriteSheetImageHeader(const SpriteSheet* sheet, unk32 frame)
{
    const unk8* data;

    data = (const unk8*)sheet;
    return (const SpriteImageHeader*)(data + sheet->unk10
        + ((const unk32*)(data + sheet->unk1C))[frame]);
}

static inline const unk8* spriteSheetImageData(
    const SpriteSheet* sheet, const SpriteImageHeader* header)
{
    return (const unk8*)header + (sheet->unkD & 0xFC);
}

unk32 ARM_sub_87569F4(UnkStruct_87569F4* arg0, unk32 arg1)
{
    unk32 result = arg0->unk24;
    unk32 current = _unk3005E74;
    if (current - result > 0x3FFu) {
        unk32 offset = current & 0x3FFu;
        if (offset + (arg1 >> 5) > 0x400u || offset < _unk3005E6C) {
            _unk3005E74 = ((current + 0x400u) & ~0x3FFu) + _unk3005E6C;
        }
        result = _unk3005E74;
        _unk3005E74 = result + (arg1 >> 5);
    }
    return result;
}

s32 ARM_sub_8756A84(SpriteEntry* sprite, unk16 byteCount, s32 objNo)
{
    const SpriteImageHeader* record;
    const unk8* source;
    unk8* destination;
    const unk8* image;
    unk32 mask;
    unk32 savedMask;
    unk32 count;
    unk32 transferBytes;
    s32 tileCount;
    unk32 shift;

    source = sprite->unk28 + (sprite->frame.word << sprite->var16);
    if (sprite->unk2C->unk1C == 0) {
        __fastMemoryCopyARM(source, (unk8*)(OBJ_MODE0_VRAM | ((objNo & 0x3FF) << 5)), byteCount);
    } else {
        savedMask = 0;
        record = spriteSheetImageHeader(sprite->unk2C, sprite->frame.word);
        mask = record->unk0;
        if (sprite->unk2C->unkD > 4) {
            savedMask = record->unk4;
        }
        image = spriteSheetImageData(sprite->unk2C, record);
        destination = (unk8*)(OBJ_MODE0_VRAM | ((objNo & 0x3FF) << 5));
        tileCount = sprite->unk2C->unkE;
        shift = (sprite->unk2C->unkC & 1) != 0 ? 5 : 6;
        while (tileCount > 0) {
            count = 0;
            if (mask == 0) {
                count = tileCount - (tileCount > 0x20) * 0x20;
                tileCount -= count;
                mask = savedMask;
                transferBytes = count << shift;
                __fastMemoryCopyARM(image, destination, transferBytes);
                image += transferBytes;
                destination += transferBytes;
            } else {
                while ((mask & 0xF) == 0xF) {
                    count += 4;
                    mask >>= 4;
                }
                while ((mask & 3) == 3) {
                    count += 2;
                    mask >>= 2;
                }
                while ((mask & 1) != 0) {
                    count++;
                    mask >>= 1;
                }
                if (count != 0) {
                    transferBytes = count << shift;
                    __fastMemoryClearARM(0, destination, transferBytes);
                    destination += transferBytes;
                } else {
                    while ((mask & 0xF) == 0) {
                        count += 4;
                        mask >>= 4;
                    }
                    while ((mask & 3) == 0) {
                        count += 2;
                        mask >>= 2;
                    }
                    while ((mask & 1) == 0) {
                        count++;
                        mask >>= 1;
                    }
                    transferBytes = count << shift;
                    fastMemoryCopyARM(image, destination, transferBytes);
                    image += transferBytes;
                    destination += transferBytes;
                }
                tileCount -= count;
                if (tileCount == 0x20) {
                    mask = savedMask;
                }
            }
        }
    }
    _unk3005E70++;
    return objNo;
}

extern unk16 word_807D90C[];
extern void (*off_807D938)(s32, s32);
extern s32 (*off_807D934)(s32);
extern s32 (*off_807D930)(const char*, ...);
extern const char Str_8755EAC[];
extern const char Str_8755EE0[];

void oam_8756CC0(void)
{
    SpriteEntry* sprite;
    SpriteRotationScaleEntry* rotation;
    unk32 count;
    OamEntry* oam;
    unk32* destination;
    unk16* attribute2;
    unk32 flags;
    unk32 size;
    unk32 one = 1;
    unk32 uploaded;
    s32 charName;
    s32 x;
    s32 y;
    s32 high;
    s32 low;

    sprite = _unk3005DE4;
    rotation = _unk3005DF8;
    count = _spritesFree;
    oam = (OamEntry*)OAM;
    while (sprite != NULL) {
        x = sprite->x;
        flags = sprite->unk10;
        destination = &oam->attr01;
        y = sprite->y;
        if ((flags & 0x200) != 0) {
            high = word_807D90C[((flags & 0xC000) >> 12) | (flags >> 30)] & 0xFF00;
            low = (word_807D90C[((flags & 0xC000) >> 12) | (flags >> 30)] & 0xFF) << 8;
            if (sprite->unk30 != NULL) {
                high -= ((sprite->unk30->unk14 * high) >> 8) - high;
                low -= ((sprite->unk30->unk16 * low) >> 8) - low;
            }
            x -= high;
            y -= low;
        }
        if (((x + 0x8000 > 0x17000u) | (y < -0x5000)) || y > 0xA000) {
            y = 0xA000;
        }
        *destination++
            = (flags | ((y >> 8) & 0xFF)) | (((x & 0x1FF00) << 8) | ((sprite->flip_h_v & 3) << 28));
        *(unk16*)destination = sprite->oam_attr_2 | (sprite->var24 & 0x3FF);
        oam++;
        sprite = sprite->next;
    }

    sprite = _unk3005DE4;
    oam = (OamEntry*)OAM;
    while (sprite != NULL) {
        uploaded = 0;
        attribute2 = &oam->attr2;
        if ((sprite->var20 & 1) != 0) {
            sprite = sprite->next;
            oam++;
            continue;
        }
        charName = sprite->var24;
        size = one << (sprite->var16 - 5);
        if (sprite->frame.word != sprite->unk1A) {
            if (charName >= 0) {
                off_807D938(charName, size);
                charName = -1;
            }
            sprite->unk1A = sprite->frame.word;
        }
        if (charName < 0) {
            charName = off_807D934(size);
            uploaded = 1;
        }
        sprite->var24 = charName;
        if (charName < 0) {
            off_807D930(Str_8755EAC, size);
            sprite = sprite->next;
            oam++;
            continue;
        }
        *attribute2 = sprite->oam_attr_2 | (sprite->var24 & 0x3FF);
        if (uploaded != 0) {
            if (charName < _unk3005E6C) {
                off_807D930(Str_8755EE0, charName, sprite->unk2C);
            }
            ARM_sub_8756A84(sprite, one << sprite->var16, charName);
        }
        oam++;
        sprite = sprite->next;
    }
    while (count-- != 0) {
        oam->attr01 = 0xA0;
        oam++;
    }
    while (rotation != NULL) {
        OamAffine* affine = (OamAffine*)rotation->oamAddr;

        affine->pa = rotation->unkC[0];
        affine->pb = rotation->unkC[1];
        affine->pc = rotation->unkC[2];
        affine->pd = rotation->unkC[3];
        rotation = rotation->next;
    }
}
