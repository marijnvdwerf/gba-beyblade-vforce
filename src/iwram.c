#include "iwram.h"

#include <agb/memory_map.h>

#include "include_asm.h"
#include "ram.h"

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

INCLUDE_ASM("asm/dump/8756a00-iwram/8756a84-arm_sub_8756a84.s");
#if 0
typedef struct OamEntryDraft8756CC0 {
    unk32 attr0;
    unk16 attr1;
    unk16 attr2;
} OamEntryDraft8756CC0;

typedef struct SpriteRotationScaleEntryDraft8756CC0 {
    struct SpriteRotationScaleEntryDraft8756CC0* prev;
    struct SpriteRotationScaleEntryDraft8756CC0* next;
    OamEntryDraft8756CC0* oamAddr;
    unk16 matrix[8];
} SpriteRotationScaleEntryDraft8756CC0;

extern SpriteEntry* _unk3005DE4;
extern SpriteRotationScaleEntryDraft8756CC0* _unk3005DF8;
extern unk32 _spritesFree;
extern unk16 word_807D90C[];
extern void (*off_807D938)(s32, s32);
extern unk32 (*off_807D934)(s32);
extern s32 (*off_807D930)(const unk8*, ...);
extern const unk8 Str_8755EAC[];
extern const unk8 Str_8755EE0[];

void oam_8756CC0(void)
{
    SpriteEntry* sprite;
    SpriteEntry* rotationScale;
    SpriteRotationScaleEntryDraft8756CC0* rotation;
    unk32 count;
    OamEntryDraft8756CC0* oam;
    OamEntryDraft8756CC0* destination;
    unk32 flags;
    unk32 xMask;
    unk32 attr;
    unk32 size;
    unk16 character;
    unk16 frame;
    unk16 oldFrame;
    unk16 tableValue;
    unk16 uploadSize;
    unk8 uploaded;
    s32 charName;
    s32 x;
    s32 y;
    s32 high;
    s32 low;
    s32 adjustedHigh;
    s32 adjustedLow;
    s32 product;

    sprite = _unk3005DE4;
    rotation = _unk3005DF8;
    count = _spritesFree;
    oam = OAM;
    if (sprite != NULL) {
        xMask = 0x1FF00;
        do {
            x = sprite->x;
            flags = sprite->unk10;
            destination = oam;
            y = sprite->y;
            if ((flags & 0x200) != 0) {
                tableValue = word_807D90C[(flags >> 30) | ((flags & 0xC000) >> 12)];
                high = tableValue & 0xFF00;
                low = (tableValue & 0xFF) << 8;
                rotationScale = sprite->unk30;
                if (rotationScale != NULL) {
                    product = high * rotationScale->oam_attr_2;
                    adjustedHigh = (product >> 8) - high;
                    high -= adjustedHigh;
                    product = low * rotationScale->var16;
                    adjustedLow = (product >> 8) - low;
                    low -= adjustedLow;
                }
                x -= high;
                y -= low;
            }
            if (y < -0x5000 || x + 0x8000 > 0x17000u) {
                y = 0xA000;
            }
            if (y > 0xA000) {
                y = 0xA000;
            }
            attr = flags | ((y >> 8) & 0xFF);
            attr |= (sprite->flip_h_v & 3) << 28;
            attr |= (x & xMask) << 8;
            destination->attr0 = attr;
            character = sprite->var24;
            destination->attr2 = sprite->oam_attr_2 | (character & 0x3FF);
            oam++;
            sprite = sprite->next;
        } while (sprite != NULL);
    }

    sprite = _unk3005DE4;
    oam = OAM;
    count--;
    while (sprite != NULL) {
        uploaded = 0;
        if ((sprite->var20 & 1) == 0) {
            charName = sprite->var24;
            frame = sprite->frame.word;
            oldFrame = sprite->unk1A;
            size = 1 << (sprite->var16 - 5);
            if (frame != oldFrame) {
                if (charName >= 0) {
                    off_807D938(charName, size);
                    charName = -1;
                }
                sprite->unk1A = frame;
            }
            if (charName < 0) {
                charName = off_807D934(size);
                uploaded = 1;
            }
            sprite->var24 = charName;
            if (charName >= 0) {
                character = charName;
                oam->attr2 = sprite->oam_attr_2 | (character & 0x3FF);
                if (uploaded != 0) {
                    if (charName < _unk3005E6C) {
                        off_807D930(Str_8755EE0, charName, sprite->unk2C);
                    } else {
                        uploadSize = 1 << sprite->var16;
                        ARM_sub_8756A84(sprite, uploadSize, charName);
                    }
                }
            } else {
                off_807D930(Str_8755EAC, size);
            }
        }
        oam++;
        sprite = sprite->next;
    }
    if (count != -1) {
        do {
            count--;
            oam->attr0 = 0xA0;
            oam++;
        } while (count != -1);
    }
    while (rotation != NULL) {
        rotation->oamAddr[0].attr2 = rotation->matrix[0];
        rotation->oamAddr[1].attr2 = rotation->matrix[1];
        rotation->oamAddr[2].attr2 = rotation->matrix[2];
        rotation->oamAddr[3].attr2 = rotation->matrix[3];
        rotation = rotation->next;
    }
}
#endif
INCLUDE_ASM("asm/dump/8756a00-iwram/8756cc0-oam_8756cc0.s");
#if 0
#include <agb/memory_map.h>

typedef struct TileMapRowDraft8756FC0 {
    unk8 pad0[2];
    s16 data[1];
} TileMapRowDraft8756FC0;

typedef struct TileMapRowTableDraft8756FC0 {
    TileMapRowDraft8756FC0* rows[1];
} TileMapRowTableDraft8756FC0;

typedef struct TileMapHeaderDraft8756FC0 {
    unk8 pad0[0xC];
    TileMapRowTableDraft8756FC0* rowTable;
    unk8 pad10[0xA];
    unk16 unk1A;
    unk8 pad1C[4];
} TileMapHeaderDraft8756FC0;

typedef struct BGLayerDraft8756FC0 {
    s32 columnCount;
    s32 rowCount;
    unk8 pad8[0x54];
    unk8 screenBaseBlock;
    unk8 pad5D[2];
    unk8 field_5F;
    unk8 field_60;
    unk8 pad61[3];
    unk16 var64;
    unk8 pad66[2];
    TileMapHeaderDraft8756FC0* var68;
    unk8 pad6C[4];
    const unk8* mapAddr;
    unk8 pad74[8];
    unk8 field_7C;
    unk8 pad7D[0xB];
} BGLayerDraft8756FC0;

extern void (*__sub_8757494)(const s16*, s32, s32, unk32, unk16*, unk16);

void sub_8756FC0(BGLayerDraft8756FC0* layer, s32 x, s32 y, unk32 srcX, s32 srcY, s32 width, s32 height)
{
    const unk8* source;
    unk16* destination;
    s32 columns;
    unk32 rowMask;
    unk32 screenWidth;
    unk32 compressed;
    TileMapRowTableDraft8756FC0* rowTable;
    unk32 fill;
    s32 mapRow;
    unk32 flags;
    s32 rows;
    unk32 split;
    const s16* rowData;
    unk32 destinationRow;
    s32 row;

    source = layer->mapAddr;
    source += (x + y * layer->columnCount) * 2;
    destination = (unk16*)(VRAM + (layer->screenBaseBlock << 11));
    columns = layer->columnCount;
    compressed = layer->var64 & 2;
    flags = (layer->field_7C & 4) ? 2 : 0;
    screenWidth = 1 << layer->field_5F;
    rows = layer->rowCount;
    rowTable = layer->var68->rowTable;
    rowMask = (1 << layer->field_60) - 1;
    fill = layer->var68->unk1A;
    srcX &= screenWidth - 1;
    split = screenWidth - srcX;

    for (row = srcY; row < srcY + height; row++) {
        mapRow = row;
        if (flags & 2) {
            while (mapRow >= rows) {
                mapRow -= rows;
            }
            if (row < 0) {
                while (mapRow < 0) {
                    mapRow += rows;
                }
            }
            flags |= 1;
        } else {
            unk32 valid = row < rows;
            if (row < 0) {
                valid = 0;
            }
            if (valid) {
                flags |= 1;
            } else {
                flags &= ~1;
            }
        }
        rowData = rowTable->rows[mapRow]->data;
        destinationRow = (row & rowMask) << layer->field_5F;
        if (srcX + width > screenWidth) {
            if (compressed) {
                if (flags & 1) {
                    __sub_8757494(rowData, x, mapRow, split, destination + destinationRow + srcX, fill);
                    __sub_8757494(rowData, x + split, mapRow, width - split, destination + destinationRow, fill);
                } else {
                    fastMemoryClear16ARM(fill, destination + destinationRow + srcX, split * 2);
                    fastMemoryClear16ARM(fill, destination + destinationRow, (width - split) * 2);
                }
            } else {
                fastMemoryCopy16ARM(source, destination + destinationRow + srcX, split * 2);
                fastMemoryCopy16ARM(source + split, destination + destinationRow, (width - split) * 2);
            }
        } else {
            if (compressed) {
                if (flags & 1) {
                    __sub_8757494(rowData, x, mapRow, width, destination + destinationRow + srcX, fill);
                } else {
                    fastMemoryClear16ARM(fill, destination + destinationRow + srcX, width * 2);
                }
            } else {
                fastMemoryCopy16ARM(source, destination + destinationRow + srcX, width * 2);
            }
        }
        source += columns * 2;
    }
}
#endif
INCLUDE_ASM("asm/dump/8756a00-iwram/8756fc0-sub_8756fc0.s");
INCLUDE_ASM("asm/dump/8756a00-iwram/8757380-sub_8757380.s");
INCLUDE_ASM("asm/dump/8756a00-iwram/8757494-sub_8757494.s");
INCLUDE_ASM("asm/dump/8756a00-iwram/8757574-sub_8757574.s");
INCLUDE_ASM("asm/dump/8756a00-iwram/87576d8-sub_87576d8.s");
#if 0
typedef struct SoundSample87577B4 SoundSample87577B4;
typedef struct SoundChannel87577B4 SoundChannel87577B4;

struct SoundSample87577B4 {
    unk8 var00;
    unk8 pad01[3];
    unk32 var04;
    unk32 var08;
    unk8 pad0C[4];
    s8 data[0];
};

struct SoundChannel87577B4 {
    SoundSample87577B4* var00;
    s8* var04;
    unk32 var08;
    unk32 var0C;
    unk16 var10;
    unk8 pad12[2];
    s16 var14;
    unk8 var16;
    unk8 var17;
    unk32 var18;
    SoundSample87577B4** var1C;
    s16* var20;
    unk16 var24;
    unk8 pad26[2];
};

extern s16* _soundMixerPlus;
extern unk8 _unk3005E78;
extern const s16 Unk_8755F00[][16];
extern const unk8 Unk_8756520[][8];

void sub_87577B4(SoundChannel87577B4* channel, unk32 arg1, unk32 arg2)
{
    SoundSample87577B4* sample;
    s8* source;
    s16* destination;
    unk32 phase;
    unk32 step;
    unk32 scaled;
    s32 mixed;
    s16 orderIndex;
    s32 endDistance;
    unk32 index;
    unk32 nextIndex;
    s32 max;
    s32 min;
    s32 position;
    unk8 predictor;
    unk8 value;
    s32 segmentIndex;
    s32 count;

    scaled = arg2 * channel->var10;
    phase = channel->var0C;
    destination = _soundMixerPlus;
    source = channel->var04;
    sample = channel->var00;
    step = channel->var08;
    scaled >>= 12;
    endDistance = source + (arg1 >> 1) - (sample->data + sample->var04 + 0x10);
    count = arg1;
    if (sample->var00 != 0) {
        if (endDistance > 0) {
            count = arg1 - (endDistance << 1);
        }
    }

    _unk3005E78++;
    if (_unk3005E78 != 1) {
        if (sample->var00 != 0) {
            if (sample->var00 == 1) {
                if (count != 0) {
                    do {
                        mixed = *source * scaled;
                        mixed += *destination;
                        *destination++ = mixed;
                        phase += step << 4;
                        source += step >> 28;
                        count--;
                    } while (count >= 0);
                }
            }
        }
    } else {
        if (sample->var00 != 0) {
            if (sample->var00 == 1) {
                if (count != 0) {
                    do {
                        *destination++ = *source * scaled;
                        phase += step << 4;
                        source += step >> 28;
                        count--;
                    } while (count >= 0);
                }
            }
        } else {
            count >>= 1;
            count--;
            position = channel->var14;
            predictor = channel->var17;
            max = 0x7FF;
            min = 0x80000000;
            min >>= 20;
            if (count != -1) {
                do {
                    value = *source++;
                    value ^= 0xEC;
                    index = value >> 4;
                    position += Unk_8755F00[predictor][index];
                    if (position >= max) {
                        position = max;
                    }
                    if (position <= -0x801) {
                        position = min;
                    }
                    *destination++ = scaled * (position >> 3);
                    nextIndex = Unk_8756520[predictor][index & 7];
                    position += Unk_8755F00[nextIndex][value & 0xF];
                    if (position >= max) {
                        position = max;
                    }
                    if (position <= -0x801) {
                        position = min;
                    }
                    *destination++ = scaled * (position >> 3);
                    predictor = Unk_8756520[nextIndex][value & 7];
                    if (endDistance >= 0 && count == 0) {
                        if (channel->var1C != NULL) {
                            orderIndex = channel->var24++;
                            segmentIndex = channel->var20[orderIndex];
                            if (segmentIndex == -1) {
                                channel->var24 = 1;
                                segmentIndex = channel->var20[0];
                            }
                            sample = channel->var1C[segmentIndex];
                            count = 0;
                            if (segmentIndex != -1) {
                                count = endDistance;
                                source = sample->data;
                                channel->var00 = sample;
                            }
                            endDistance = -1;
                            position = 0;
                            predictor = 0;
                        }
                    }
                    count--;
                } while (count != -1);
            }
            channel->var17 = predictor;
            channel->var14 = position;
        }
    }

    channel->var0C = phase;
    channel->var04 = source;
}
#endif
INCLUDE_ASM("asm/dump/8756a00-iwram/87577b4-sub_87577b4.s");

#if 0
void sound_8757A64(void* destinationArg, s32 length, s32 offset)
{
    extern s16(*_soundMixerPlus)[];
    extern unk8 _unk3005E78;
    unk8* destination;
    s16* source;
    s16 sample16;
    s32 sample;

    source = &(*_soundMixerPlus)[offset];
    destination = destinationArg;
    if (destination != NULL && length != 0) {
        if (_unk3005E78 != 0) {
            do {
                sample16 = *source++;
                sample = sample16 >> 4;
                if (sample < -128) {
                    sample = ~0x7F;
                }
                if (sample > 127) {
                    sample = 127;
                }
                *destination++ = sample;
                length--;
            } while (length >= 0);
        } else {
            length--;
            if (length == -1) {
                return;
            }
            do {
                length--;
                *destination++ = _unk3005E78;
            } while (length != -1);
        }
    }
}
#endif
INCLUDE_ASM("asm/dump/8756a00-iwram/8757a64-sound_8757a64.s");
#if 0
void fastMemoryClearARM(unk32 value, void* destinationArg, unk32 byteCount)
{
    extern const unk8 Str_87566A8[];
    extern void (*off_807D96C)(const unk8*);
    unk32* destination;
    unk32 count;

    destination = destinationArg;
    count = byteCount;
    if (count == 0) {
        return;
    }
    if (count & 3) {
        off_807D96C(Str_87566A8);
        return;
    }
    count >>= 2;
    if (count & 1) {
        *destination++ = value;
    }
    if (count & 2) {
        *destination++ = value;
        *destination++ = value;
    }
    count >>= 2;
    while (count != 0) {
        *destination++ = value;
        *destination++ = value;
        *destination++ = value;
        *destination++ = value;
        count--;
    }
}
#endif
INCLUDE_ASM("asm/dump/8756a00-iwram/3006fac-fastmemorycleararm.s");
#if 0
void fastMemoryCopyARM(const void* source, void* destination, unk32 bytes)
{
    typedef struct Copy2 {
        unk32 a;
        unk32 b;
    } Copy2;
    typedef struct Copy4 {
        unk32 a;
        unk32 b;
        unk32 c;
        unk32 d;
    } Copy4;
    const Copy4* src = (const Copy4*)source;
    Copy4* dst = (Copy4*)destination;
    const Copy2* src2;
    Copy2* dst2;
    extern const unk8 Str_87566F8[];
    extern unk32 (*off_807D96C)(const unk8*, ...);

    if (bytes == 0) {
        return;
    }
    if (bytes & 3) {
        off_807D96C(Str_87566F8, bytes);
        return;
    }
    bytes >>= 2;
    if (bytes & 1) {
        dst->a = src->a;
        src = (const Copy4*)((const unk32*)src + 1);
        dst = (Copy4*)((unk32*)dst + 1);
    }
    if (bytes & 2) {
        src2 = (const Copy2*)src;
        dst2 = (Copy2*)dst;
        *dst2 = *src2;
        src = (const Copy4*)(src2 + 1);
        dst = (Copy4*)(dst2 + 1);
    }
    bytes >>= 2;
    for (; bytes != 0; bytes--, src++, dst++) {
        *dst = *src;
    }
}
#endif
INCLUDE_ASM("asm/dump/8756a00-iwram/3007034-fastmemorycopyarm.s");
#if 0
void fastMemoryClear16ARM(unk32 fill, void* destination, unk32 byteCount)
{
    extern unk32 (*off_807D96C)(const unk8*);
    extern const unk8 Str_8756748[];
    unk32 count;
    unk32 value;
    unk16* cursor;

    if ((count = byteCount) == 0) {
        return;
    }
    value = fill;
    cursor = destination;
    if (count & 1) {
        off_807D96C(Str_8756748);
        return;
    }
    count >>= 1;
    do {
        *cursor++ = value;
        count--;
    } while (count != 0);
}
#endif
INCLUDE_ASM("asm/dump/8756a00-iwram/30070b8-fastmemoryclear16arm.s");
#if 0
extern const unk8 Str_8756798[];
extern void (*off_807D96C)(const unk8*);

void fastMemoryCopy16ARM(const void* sourceArg, void* destinationArg, unk32 byteCount)
{
    const unk16* source;
    unk16* destination;

    source = sourceArg;
    destination = destinationArg;
    if (byteCount == 0) {
        return;
    }
    if (byteCount & 1) {
        off_807D96C(Str_8756798);
    } else {
        byteCount >>= 1;
        do {
            *destination++ = *source++;
            byteCount--;
        } while (byteCount != 0);
    }
}
#endif
INCLUDE_ASM("asm/dump/8756a00-iwram/300711c-fastmemorycopy16arm.s");

void sub_8757CD0(void)
{
    MultiPlayerState* state;
    unk16* src;

    state = _unk3005DC4;
    src = state->unk3C;
    *(vu16*)REG_SIOMLT_SEND = *src++;
    *(vu16*)REG_SIOCNT |= 0x80;
    state->unk3C = src;
    state->unk0++;
}

INCLUDE_ASM("asm/dump/8756a00-iwram/8757d24-sub_8757d24.s");

#if 0
void sub_8757E4C(void)
{
    unk8* destination;
    unk8 count;
    s16 value;
    unk16 index;
    extern void (*__fastMemoryCopyARM)(const void*, void*, unk32);

    count = _unk3005DC4->unk3;
    index = 0;
    *(vu16*)REG_TM3CNT_H = 0;
    *(vu16*)REG_IE &= ~0x40;
    destination = _unk3005DC4->unk34 + _unk3005DC4->unk1 * 2;
    while (index < count) {
        value = ((const volatile s16*)REG_SIOMULTI0)[index];
        if ((unk16)value == 0xFDD9 && index != 0) {
            _unk3005DC4->unk14 |= 0x40;
        }
        index++;
        *(s16*)destination = value;
        destination += _unk3005DC4->unk18 & ~1;
    }
    if ((_unk3005DC4->unk14 & 0x40) == 0) {
        __fastMemoryCopyARM(_unk3005DC4->unk34, _unk3005DC4->unk38, count * _unk3005DC4->unk18);
    }
    *(vu16*)REG_SIOMLT_SEND = -551;
    *(vu16*)REG_SIOCNT |= 0x80;
    if ((*(vu16*)REG_SIOCNT & 0x40) != 0) {
        _unk3005DC4->unk14 |= 0x80;
    }
    _unk3005DC4->unk1 = 0;
    _unk3005DC4->unk14 |= 0x200;
}
#endif

INCLUDE_ASM("asm/dump/8756a00-iwram/8757e4c-sub_8757e4c.s");
#if 0
void sub_8757FCC(void)
{
    unk8 special;
    unk16 index;
    s16 packetHalf;
    unk8 value;
    unk8* destination;
    s16 serial;
    unk16* source;
    extern void (*__fastMemoryCopyARM)(const void*, void*, unk32);

    packetHalf = _unk3005DC4->unk18 >> 1;
    value = _unk3005DC4->unk0;
    special = 0;
    _unk3005DC4->unk14 |= 0x20;
    if (value >= (unk16)packetHalf) {
        _unk3005DC4->unk0 = special;
    } else {
        _unk3005DC4->unk0 = value + 1;
    }
    index = 0;
    destination = _unk3005DC4->unk34;
    destination += _unk3005DC4->unk1 * 2;
    while (index < _unk3005DC4->unk3) {
        serial = ((vu16*)REG_SIOMULTI0)[index];
        if (index == 0 && (unk16)serial == 0xFDD9) {
            special = 1;
            break;
        }
        *(unk16*)destination = serial;
        index++;
        destination += _unk3005DC4->unk18 & ~1;
    }
    if (_unk3005DC4->unk0 < (unk16)packetHalf) {
        *(vu16*)REG_SIODATA8 = _unk3005DC4->unk3C[_unk3005DC4->unk0];
    } else {
        *(vu16*)REG_SIODATA8 = 0xFDD9;
    }
    if (special == 0) {
        _unk3005DC4->unk1++;
    } else {
        source = _unk3005DC4->unk3C;
        if (_unk3005DC4->unk1 != (unk16)packetHalf) {
            _unk3005DC4->unk14 |= 0x40;
        }
        _unk3005DC4->unk1 = 0;
        _unk3005DC4->unk3C = _unk3005DC4->unk40;
        _unk3005DC4->unk40 = source;
        _unk3005DC4->unk0 = 0;
        (*__fastMemoryCopyARM)(_unk3005DC4->unk34, _unk3005DC4->unk38, _unk3005DC4->unk3 * (packetHalf * 2));
    }
    if ((*(vu16*)REG_SIOCNT & 0x40) != 0) {
        _unk3005DC4->unk14 |= 0x80;
    }
}
#endif
INCLUDE_ASM("asm/dump/8756a00-iwram/8757fcc-sub_8757fcc.s");
