#include "iwram.h"

#include <agb/memory_map.h>

#include "include_asm.h"
#include "ram.h"
#include "sound.h"
#include "sprite.h"
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

typedef struct TileMapRow {
    unk8 pad0[2];
    s16 data[0];
} TileMapRow;

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

void sub_8756FC0(BGLayer* layer, s32 x, s32 y, unk32 srcX, s32 srcY, s32 width, s32 height)
{
    const unk8* source;
    unk16* destination;
    s32 columns;
    unk32 columnMask;
    unk32 rowMask;
    unk32 screenWidth;
    unk32 compressed;
    const unk32* rowTable;
    unk32 fill;
    s32 mapRow;
    unk32 flags;
    s32 rows;
    const s16* rowData;
    unk32 destinationRow;
    s32 row;

    source = layer->mapAddr;
    source += (x + y * layer->columnCount) * 2;
    destination = (unk16*)(VRAM + (layer->screenBaseBlock << 11));
    columns = layer->columnCount;
    columnMask = (1 << layer->field_5F) - 1;
    flags = (layer->field_7C & 4) ? 2 : 0;
    rowMask = (1 << layer->field_60) - 1;
    screenWidth = 1 << layer->field_5F;
    compressed = layer->var64 & 2;
    rows = layer->rowCount;
    rowTable = (const unk32*)((const unk8*)layer->var68 + layer->var68->mapOffset);
    fill = layer->var68->unk1A;
    srcX &= columnMask;

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
            if (row >= 0 && row < rows) {
                flags |= 1;
            } else {
                flags &= ~1;
            }
        }
        rowData = ((const TileMapRow*)((const unk8*)rowTable + rowTable[mapRow]))->data;
        destinationRow = (row & rowMask) << layer->field_5F;
        if (srcX + width > screenWidth) {
            if (compressed) {
                if (flags & 1) {
                    __sub_8757494(rowData, x, mapRow, screenWidth - srcX,
                        destination + destinationRow + srcX, fill);
                    __sub_8757494(rowData, x + (screenWidth - srcX), mapRow,
                        width - (screenWidth - srcX), destination + destinationRow, fill);
                } else {
                    fastMemoryClear16ARM(
                        fill, destination + destinationRow + srcX, (screenWidth - srcX) * 2);
                    fastMemoryClear16ARM(
                        fill, destination + destinationRow, (width - (screenWidth - srcX)) * 2);
                }
            } else {
                fastMemoryCopy16ARM(
                    source, destination + destinationRow + srcX, (screenWidth - srcX) * 2);
                fastMemoryCopy16ARM(source + (screenWidth - srcX), destination + destinationRow,
                    (width - (screenWidth - srcX)) * 2);
            }
        } else {
            if (compressed) {
                if (flags & 1) {
                    __sub_8757494(
                        rowData, x, mapRow, width, destination + destinationRow + srcX, fill);
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

void sub_8757380(BGLayer* layer, unk32 x, s32 y, unk32 width, s32 height)
{
    unk8* screenAddress;
    unk32 rowMask;
    unk32 screenWidth;
    unk32 columnMask;
    unk32 srcX;
    unk32 fill;
    unk32 rowOffset;
    s32 row;

    screenAddress = (unk8*)(VRAM + (layer->screenBaseBlock << 11));
    fill = layer->var68->unk1A;
    columnMask = (1 << layer->field_5F) - 1;
    rowMask = (1 << layer->field_60) - 1;
    screenWidth = 1 << layer->field_5F;
    srcX = x & columnMask;
    for (row = y; row < y + height; row++) {
        rowOffset = (row & rowMask) << layer->field_5F;
        if (srcX + width > screenWidth) {
            fastMemoryClear16ARM(
                fill, screenAddress + rowOffset * 2 + srcX * 2, (screenWidth - srcX) * 2);
            fastMemoryClear16ARM(
                fill, screenAddress + rowOffset * 2, (width - (screenWidth - srcX)) * 2);
        } else {
            fastMemoryClear16ARM(fill, screenAddress + rowOffset * 2 + srcX * 2, width * 2);
        }
    }
}

void sub_8757494(const s16* source, s32 x, unk32 unused, s32 width, unk16* destination, unk16 fill)
{
    s32 run;
    s32 runLength;
    s32 position;
    s32 copyCount;

    position = 0;
    do {
        run = *source++;
        runLength = run < 0 ? -run : run;
        if (position + runLength > x) {
            break;
        }
        if (run >= 0) {
            source += runLength;
        }
        position += runLength;
    } while (1);
    if (run >= 0) {
        source += x - position;
    }
    runLength -= x - position;
    while (width > 0) {
        if (runLength < width) {
            copyCount = runLength;
        } else {
            copyCount = width;
        }
        if (run >= 0) {
            fastMemoryCopy16ARM(source, destination, copyCount * 2);
        } else {
            fastMemoryClear16ARM(fill, destination, copyCount * 2);
        }
        width -= copyCount;
        destination += copyCount;
        if (run >= 0) {
            source += runLength;
        }
        run = *source++;
        runLength = run < 0 ? -run : run;
    }
}

void sub_8757574(const unk32* tiles, const unk16* source, Tile4bpp* destination, s32 count)
{
    const unk32* tile;
    unk32* output;
    unk32 value;
    unk32 pixel;
    unk32 descriptor;
    unk32 row;

    while (count--) {
        descriptor = *source++;
        tile = &tiles[(descriptor & 0x3FF) * 2];
        value = *tile++;
        if ((descriptor & 0x800) != 0) {
            output = &(*destination)[7];
        } else {
            output = &(*destination)[0];
        }
        row = 7;
        do {
            if ((descriptor & 0x400) != 0) {
                pixel = (value & 1) != 0 ? 0x10000000 : 0;
                if ((value & 2) != 0) {
                    pixel |= 0x01000000;
                }
                if ((value & 4) != 0) {
                    pixel |= 0x00100000;
                }
                if ((value & 8) != 0) {
                    pixel |= 0x00010000;
                }
                if ((value & 0x10) != 0) {
                    pixel |= 0x00001000;
                }
                if ((value & 0x20) != 0) {
                    pixel |= 0x00000100;
                }
                if ((value & 0x40) != 0) {
                    pixel |= 0x00000010;
                }
                if ((value & 0x80) != 0) {
                    pixel |= 1;
                }
            } else {
                pixel = value & 1;
                if ((value & 2) != 0) {
                    pixel |= 0x10;
                }
                if ((value & 4) != 0) {
                    pixel |= 0x100;
                }
                if ((value & 8) != 0) {
                    pixel |= 0x1000;
                }
                if ((value & 0x10) != 0) {
                    pixel |= 0x10000;
                }
                if ((value & 0x20) != 0) {
                    pixel |= 0x100000;
                }
                if ((value & 0x40) != 0) {
                    pixel |= 0x1000000;
                }
                if ((value & 0x80) != 0) {
                    pixel |= 0x10000000;
                }
            }
            if ((descriptor & 0x800) != 0) {
                *output-- = pixel;
            } else {
                *output++ = pixel;
            }
            if (row == 4) {
                value = *tile++;
            } else {
                value >>= 8;
            }
        } while (row--);
        destination++;
    }
}

// TODO: fakematch?
void sub_87576D8(const unk32* rowTable, unk32 xArg, unk32 row, unk32 countArg,
    Tile4bpp* destination, const unk32* tiles)
{
    const s16* source;
    s32 position;
    s32 x;
    s32 count;
    s32 value;
    s32 runLength;
    s32 size;

    source = (const s16*)rowTable;
    x = xArg;
    count = countArg;
    source = ((const TileMapRow*)((const unk8*)source + rowTable[row]))->data;
    position = 0;
    do {
        value = *source++;
        runLength = value < 0 ? -value : value;
        if (position + runLength > x) {
            break;
        }
        if (value >= 0) {
            source += runLength;
        }
        position += runLength;
    } while (1);
    if (value >= 0) {
        source += x - position;
    }
    runLength -= x - position;
    while (count > 0) {
        if (runLength < count) {
            size = runLength;
        } else {
            size = count;
        }
        if (value >= 0) {
            sub_8757574(tiles, (const unk16*)source, destination, size);
        } else {
            fastMemoryClear16ARM(0, destination, size * sizeof(Tile4bpp));
        }
        count -= size;
        destination += size;
        if (value >= 0) {
            source += runLength;
        }
        value = *source++;
        runLength = value < 0 ? -value : value;
    }
}

extern const s16 Unk_8755F00[][16];
extern const unk8 Unk_8756520[][8];

// TODO: fakematch?
void sub_87577B4(SoundStructA* channel, unk32 arg1, unk32 arg2)
{
    SoundStructE* sample;
    SoundStructE* next;
    s16* destination;
    s8* source;
    unk32 phase;
    unk32 step;
    unk32 scaled;
    s32 mixed;
    s16 orderIndex;
    s32 endDistance;
    unk32 index;
    s32 max;
    s32 position;
    unk8 predictor;
    unk8 value;
    s32 segmentIndex;

    scaled = (channel->var10 * arg2) >> 12;
    phase = channel->var0C;
    destination = _soundMixerPlus;
    source = channel->var04;
    sample = channel->var00;
    step = channel->var08;
    endDistance = source + (arg1 >> 1) - &sample->data[sample->var04];
    if (sample->var00 == 0) {
        if (endDistance > 0) {
            arg1 -= endDistance << 1;
        }
    }

    _unk3005E78++;
    if (_unk3005E78 != 1) {
        if (sample->var00 != 0) {
            if (sample->var00 == 1) {
                if (arg1 != 0) {
                    __asm__ volatile("1:\tldrsb r0, [%1]\n"
                                     "\tldrsh r1, [%3]\n"
                                     "\tadds %0, %0, %4, lsl #4\n"
                                     "\tadc %1, %1, %4, lsr #28\n"
                                     "\tmla r1, r0, %5, r1\n"
                                     "\tstrh r1, [%3], #2\n"
                                     "\tsubs %2, %2, #1\n"
                                     "\tbpl 1b"
                        : "+r"(phase), "+r"(source)
                        : "r"(arg1), "r"(destination), "r"(step), "r"(scaled)
                        : "r0", "r1", "cc", "memory");
                }
            }
        }
    } else if (sample->var00 != 0) {
        if (sample->var00 == 1) {
            if (arg1 != 0) {
                __asm__ volatile("1:\tldrsb r0, [%1]\n"
                                 "\tadds %0, %0, %4, lsl #4\n"
                                 "\tadc %1, %1, %4, lsr #28\n"
                                 "\tmul r0, %5, r0\n"
                                 "\tstrh r0, [%3], #2\n"
                                 "\tsubs %2, %2, #1\n"
                                 "\tbpl 1b"
                    : "+r"(phase), "+r"(source)
                    : "r"(arg1), "r"(destination), "r"(step), "r"(scaled)
                    : "r0", "cc", "memory");
            }
        }
    } else {
        arg1 >>= 1;
        position = channel->var14;
        predictor = channel->var17;
        while (--arg1 != (unk32)-1) {
            max = 0x7FF;
            value = *source++;
            value ^= 0xEC;
            index = value >> 4;
            position += Unk_8755F00[predictor][index];
            if (position > max) {
                position = max;
            }
            if (position < -0x800) {
                position = -0x800;
            }
            mixed = position >> 3;
            mixed *= scaled;
            predictor = Unk_8756520[predictor][index & 7];
            position += Unk_8755F00[predictor][value & 0xF];
            if (position > max) {
                position = max;
            }
            *destination++ = mixed;
            if (position < -0x800) {
                position = -0x800;
            }
            mixed = position >> 3;
            mixed *= scaled;
            predictor = Unk_8756520[predictor][value & 7];
            *destination++ = mixed;
            if (endDistance >= 0 && arg1 == 0 && channel->var1C != 0) {
                orderIndex = channel->var24++;
                segmentIndex = channel->var20[orderIndex];
                if (segmentIndex == -1) {
                    channel->var24 = 1;
                    segmentIndex = channel->var20[0];
                }
                next = channel->var1C[segmentIndex];
                if (segmentIndex == -1) {
                    arg1 = 0;
                } else {
                    arg1 = endDistance;
                    source = next->data;
                    channel->var00 = next;
                }
                endDistance = -1;
                position = 0;
                predictor = 0;
            }
        }
        channel->var17 = predictor;
        channel->var14 = position;
    }

    channel->var0C = phase;
    channel->var04 = source;
}

// TODO: fakematch?
s32 sound_8757A64(unk8* destinationArg, s32 length, s32 offset)
{
    unk8* cursor;
    s16* source;
    s32 sample;
    unk32 hasLength;

    hasLength = length != 0;
    source = _soundMixerPlus + offset;
    cursor = destinationArg;
    sample = 0;
    sample = (s32)cursor;
    if (cursor != NULL && hasLength) {
        if (_unk3005E78 != 0) {
            do {
                sample = *source++;
                sample >>= 4;
                sample = sample < -128 ? (unk32)-128 : sample;
                sample = sample > 127 ? 127 : (s16)sample;
                *cursor++ = sample;
                length--;
            } while (length >= 0);
            return sample;
        } else {
            while (--length != -1) {
                *cursor++ = 0;
            }
        }
    }
    return sample;
}

extern void (*off_807D96C)(const char*, ...);
extern const char Str_87566A8[];

// TODO: fakematch?
void fastMemoryClearARM(unk32 fill, void* destination, unk32 byteCount)
{
    if (byteCount == 0) {
        return;
    }
    if (byteCount & 3) {
        off_807D96C(Str_87566A8);
        return;
    }
    byteCount /= sizeof(unk32);
    __asm__ volatile("mov r0, %1\n"
                     "mov r1, %1\n"
                     "mov r2, %1\n"
                     "tst %0, #1\n"
                     "strne r0, [%2], #4\n"
                     "tst %0, #2\n"
                     "stmneia %2!, {r0, r1}\n"
                     "movs %0, %0, lsr #2\n"
                     "beq 2f\n"
                     "1: stmia %2!, {r0-r2, %1}\n"
                     "subs %0, %0, #1\n"
                     "bne 1b\n"
                     "2:"
        : "+r"(byteCount), "+r"(fill), "+r"(destination)
        :
        : "r0", "r1", "r2", "cc", "memory");
}

extern const char Str_87566F8[];

// TODO: fakematch?
void fastMemoryCopyARM(const void* source, void* destination, unk32 bytes)
{
    if (bytes == 0) {
        return;
    }
    if (bytes & 3) {
        off_807D96C(Str_87566F8, bytes);
        return;
    }
    bytes /= sizeof(unk32);
    __asm__ volatile("tst %0, #1\n"
                     "ldrne r0, [%1], #4\n"
                     "strne r0, [%2], #4\n"
                     "tst %0, #2\n"
                     "ldmneia %1!, {r0, r1}\n"
                     "stmneia %2!, {r0, r1}\n"
                     "movs %0, %0, lsr #2\n"
                     "beq 2f\n"
                     "1: ldmia %1!, {r0-r3}\n"
                     "stmia %2!, {r0-r3}\n"
                     "subs %0, %0, #1\n"
                     "bne 1b\n"
                     "2:"
        : "=r"(bytes)
        : "r"(source), "r"(destination), "0"(bytes)
        : "r0", "r1", "r2", "r3", "cc", "memory");
}

extern const char Str_8756748[];

// TODO: fakematch?
void fastMemoryClear16ARM(unk32 fill, void* destination, unk32 byteCount)
{
    if (byteCount == 0) {
        return;
    }
    if (byteCount & 1) {
        off_807D96C(Str_8756748);
        return;
    }
    __asm__ volatile("mov %0, %0, lsr #1\n"
                     "1: strh %1, [%2], #2\n"
                     "subs %0, %0, #1\n"
                     "bne 1b"
        : "+r"(byteCount), "+r"(fill), "+r"(destination)
        :
        : "r0", "r1", "r2", "cc", "memory");
}

extern const char Str_8756798[];

// TODO: fakematch?
void fastMemoryCopy16ARM(const void* source, void* destination, unk32 byteCount)
{
    if (byteCount == 0) {
        return;
    }
    if (byteCount & 1) {
        off_807D96C(Str_8756798);
    } else {
        __asm__ volatile("mov %0, %0, lsr #1\n"
                         "1: ldrh r0, [%1], #2\n"
                         "strh r0, [%2], #2\n"
                         "subs %0, %0, #1\n"
                         "bne 1b"
            : "=r"(byteCount)
            : "r"(source), "r"(destination), "0"(byteCount)
            : "r0", "r1", "r2", "r3", "cc", "memory");
    }
}

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

void sub_8757D24(void)
{
    unk16* destination;
    unk8 count;
    unk16 index;
    unk16 value;

    count = _unk3005DC4->unk3;
    if ((*(vu16*)REG_SIOCNT & 0x40) != 0) {
        _unk3005DC4->unk14 |= 0x80;
    }
    destination = _unk3005DC4->unk34 + _unk3005DC4->unk1;
    for (index = 0; index < count; index++) {
        value = ((vu16*)REG_SIOMULTI0)[index];
        if (value == 0xFDD9 && index != 0) {
            _unk3005DC4->unk14 |= 0x40;
        }
        *destination = value;
        destination += _unk3005DC4->unk18 >> 1;
    }
    _unk3005DC4->unk1++;
    sub_8757CD0();
    if (_unk3005DC4->unk0 == (_unk3005DC4->unk18 >> 1)) {
        _unk3000DF0[6] = __sub_8757E4C;
    }
}

void sub_8757E4C(void)
{
    unk16* destination;
    unk8 count;
    unk16 value;
    unk16 index;

    count = _unk3005DC4->unk3;
    *(vu16*)REG_TM3CNT_H = 0;
    *(vu16*)REG_IE &= ~0x40;
    destination = _unk3005DC4->unk34 + _unk3005DC4->unk1;
    for (index = 0; index < count; index++) {
        value = ((vu16*)REG_SIOMULTI0)[index];
        if (value == 0xFDD9 && index != 0) {
            _unk3005DC4->unk14 |= 0x40;
        }
        *destination = value;
        destination += _unk3005DC4->unk18 >> 1;
    }
    if ((_unk3005DC4->unk14 & 0x40) == 0) {
        __fastMemoryCopyARM(_unk3005DC4->unk34, _unk3005DC4->unk38, _unk3005DC4->unk18 * count);
    }
    *(vu16*)REG_SIOMLT_SEND = 0xFDD9;
    *(vu16*)REG_SIOCNT |= 0x80;
    if ((*(vu16*)REG_SIOCNT & 0x40) != 0) {
        _unk3005DC4->unk14 |= 0x80;
    }
    _unk3005DC4->unk1 = 0;
    _unk3005DC4->unk14 |= 0x200;
}

void sub_8757FCC(void)
{
    unk8 special;
    unk16 index;
    unk16 count;
    unk16 packetHalf;
    unk16* destination;
    unk16 serial;

    packetHalf = _unk3005DC4->unk18 >> 1;
    special = 0;
    count = _unk3005DC4->unk3;
    _unk3005DC4->unk14 |= 0x20;
    if (_unk3005DC4->unk0 >= packetHalf) {
        _unk3005DC4->unk0 = 0;
    } else {
        _unk3005DC4->unk0++;
    }
    destination = _unk3005DC4->unk34 + _unk3005DC4->unk1;
    for (index = 0; index < count; index++) {
        serial = ((vu16*)REG_SIOMULTI0)[index];
        if (index == 0 && serial == 0xFDD9) {
            special = 1;
            break;
        }
        *destination = serial;
        destination += _unk3005DC4->unk18 >> 1;
    }
    *(vu16*)REG_SIOMLT_SEND
        = _unk3005DC4->unk0 < packetHalf ? _unk3005DC4->unk3C[_unk3005DC4->unk0] : 0xFDD9;
    if (special == 0) {
        _unk3005DC4->unk1++;
    }
    if (special != 0) {
        MultiPlayerState* state;
        unk16* source;

        source = _unk3005DC4->unk3C;
        if (_unk3005DC4->unk1 != packetHalf) {
            _unk3005DC4->unk14 |= 0x40;
        }
        state = _unk3005DC4;
        state->unk1 = 0;
        state->unk3C = state->unk40;
        state->unk40 = source;
        _unk3005DC4->unk0 = 0;
        __fastMemoryCopyARM(_unk3005DC4->unk34, _unk3005DC4->unk38, (packetHalf << 1) * count);
    }
    if ((*(vu16*)REG_SIOCNT & 0x40) != 0) {
        _unk3005DC4->unk14 |= 0x80;
    }
}
