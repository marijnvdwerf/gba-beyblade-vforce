#include <agb/types.h>

#include "bios.h"
#include "include_asm.h"
#include "sprite.h"
#include "spritestring.h"
#include "unsorted.h"

extern void sub_8060CDC(void*);
extern void sub_806123C(SpriteTextCleanup*);
extern void* resizeSpriteBlock(SpriteTextBlock*, unk16, unk8);
extern void LoadSpriteSheet(SpriteEntry*, const void*, unk32, unk32, unk32, unk32, unk32, unk32);
extern const u8 Str_8755B58[];
extern const u8 byte_807D980[];

void allocFont(SpriteTextCleanup* arg0, const u8* arg1, const u8* arg2, s16 arg3, s16 arg4,
    unk16 arg5, unk16 arg6)
{
    arg0->x = arg3 << 8;
    arg0->y = arg4 << 8;
    arg0->unkC = arg5;
    arg0->unkA = 0;
    arg0->unk14.count = 0;
    arg0->unk14.next = NULL;
    arg0->unk14.prev = NULL;
    arg0->unk20 = arg2;
    arg0->unk24 = arg1;
    arg0->unk8 = arg6;
    arg0->ptr2C = NULL;
    arg0->unkE = 0;
    arg0->unk10 = 0x100;
    arg0->unk12 = 0x100;
    arg0->unkF = 0;
    arg0->unk2B = 0;
    arg0->unk28 = 5;
    arg0->unk29 = 0;
    arg0->unk2A = arg1[5] + 4;
}

void sub_80611EC(SpriteTextCleanup* arg0, unk8 arg1)
{
    arg0->unk2A = arg1;
}

INCLUDE_ASM("asm/dump/8057b80-debug/80611f4.s");

void sub_80611FC(SpriteTextCleanup* arg0, unk8 arg1)
{
    arg0->unk28 = arg1;
}

void sub_8061204(SpriteTextCleanup* arg0)
{
    sub_8060CDC(&arg0->unk14);
    if (arg0->ptr2C != NULL) {
        sub_8061160(arg0->ptr2C);
        sub_8060B38(arg0->ptr2C);
        arg0->ptr2C = NULL;
    }
}

void sub_8061228(SpriteTextCleanup* arg0)
{
    sub_8060CDC(&arg0->unk14);
    arg0->unkA = 0;
}

#if 0
void sub_806123C(SpriteTextCleanup* text)
{
    const u8* widths;
    unk8 char_width;
    unk32 x;
    unk32 y;
    unk32 font_width;
    unk32 offset;
    unk32 count;
    SpriteEntry* current;
    SpriteEntry* cursor;
    SpriteEntry* marked;
    unk16 mode;
    unk32 scale;
    SpriteEntry* child;
    unk32 line_shift;
    SpriteEntry* next_line;
    s32 delta;
    s32 advance;
    s32 position;
    s32 adjustment;
    SpriteEntry* saved_first;

    widths = text->unk20;
    char_width = text->unk24[4];
    x = text->x;
    y = text->y;
    font_width = text->unkC;
    offset = 0;
    count = text->unk14.count;
    cursor = text->unk14.prev;
    marked = NULL;
    current = cursor;
    scale = 0x100;
    child = text->ptr2C;
    line_shift = 0;
    text->unkF = 0;
    if (count == 0) {
        return;
    }
    if (child != NULL) {
        scale = child->oam_attr_2;
    }
    mode = text->unk8;
    switch (mode & 3) {
    case 1:
        x += font_width << 8;
        break;
    case 2:
        x += (-2 & font_width) << 7;
        break;
    }
    saved_first = text->unk14.prev;
    while (count != 0) {
        if ((current->unk1E & 0x8000) != 0) {
            marked = current;
        }
        advance = (current->unk1E & 0x7FFF) - offset;
        delta = text->unk29;
        if (widths != NULL) {
            advance += delta + char_width - widths[current->frame];
            if (advance <= font_width && count > 1) {
                current = current->next;
                count--;
                continue;
            }
        } else if (advance + delta + char_width <= font_width && count > 1) {
            current = current->next;
            count--;
            continue;
        }
        if (count > 1) {
            if (marked != NULL) {
                next_line = marked->prev;
            } else {
                next_line = current->prev;
            }
        } else {
            next_line = current;
        }
        adjustment = 0;
        switch (mode & 3) {
        case 1:
            position = (next_line->unk1E & 0x7FFF) - offset;
            delta = text->unk29;
            if (widths != NULL) {
                position += delta + char_width - widths[next_line->frame];
            } else {
                position += delta + char_width;
            }
            adjustment = -(position << 8);
            break;
        case 2:
            position = (next_line->unk1E & 0x7FFF) - offset;
            delta = text->unk29;
            if (widths != NULL) {
                position += delta + char_width - widths[next_line->frame];
            } else {
                position += delta + char_width;
            }
            adjustment = -((position & ~1) << 7);
            break;
        }
        next_line = next_line->next;
        while (cursor != next_line) {
            cursor->x = x + (((adjustment - (offset << 8)) * scale) >> 8)
                + ((((cursor->unk1E & 0x7FFF) << 8) * scale) >> 8);
            cursor->y = y;
            cursor = cursor->next;
        }
        if (next_line != NULL) {
            offset = next_line->unk1E & 0x7FFF;
        } else {
            offset = 0;
        }
        marked = NULL;
        delta = text->unk2A;
        y += delta << 8;
        line_shift += delta << 8;
        text->unkF++;
        mode = text->unk8;
        current = current->next;
        count--;
    }
    count = text->unk14.count;
    current = saved_first;
    if ((text->unk8 & 0x30) == 0) {
        return;
    }
    if ((text->unk8 & 0x30) == 0x10) {
        line_shift >>= 1;
    }
    while (line_shift != 0 && count != 0) {
        current->y -= line_shift;
        current = current->next;
        count--;
    }
}
#endif

INCLUDE_ASM("asm/dump/8057b80-debug/806123c.s");
INCLUDE_ASM("asm/dump/8057b80-debug/80614b0.s");

unk8 showString(SpriteTextCleanup* arg0, const u8* text, unk8 mode)
{
    SpriteEntry* sprite;
    SpriteEntry* child;
    SpriteEntry* result;
    unk32 char_width;
    const u8* width;
    unk32 x;
    unk32 extra;
    unk32 flags;
    unk32 load_flags;
    unk32 text_width;
    unk32 count;
    unk32 advance;
    s32 offset;
    unk8 ch;

    text_width = sub_8064F38(text);
    char_width = arg0->unk24[4];
    width = arg0->unk20;
    count = arg0->unk14.count;
    x = arg0->unkA;
    extra = 0;
    load_flags = (arg0->unk8 & 0x180) >> 7;
    if (text == NULL) {
        return;
    }
    if (*text == 0) {
        return;
    }
    sprite = arg0->unk14.next;
    result = resizeSpriteBlock(&arg0->unk14, text_width + count, arg0->unk2B);
    if (result == NULL) {
        printf(Str_8755B58, text);
        return 0;
    }
    if (sprite != NULL) {
        result = sprite->next;
    }
    sprite = result;
    child = arg0->ptr2C;
    if (child != NULL) {
        flags = (child->x & 0x3E0) << 20;
        flags |= 0x100;
        if ((arg0->unk8 & 8) == 0) {
            /* The duplicate branches are required for the target instruction shape. */
            if (child->frame != 0) {
                if (child->oam_attr_2 > 0xB0 || child->var16 > 0xB0) {
                    flags |= 0x200;
                }
            } else if (child->oam_attr_2 > 0xB0 || child->var16 > 0xB0) {
                flags |= 0x200;
            }
        }
    }
    while ((ch = *text++) != 0) {
        advance = char_width;
        if (ch == ' ') {
            advance = arg0->unk28;
            extra = 0x8000;
        } else {
            ch = byte_807D980[ch];
            LoadSpriteSheet(sprite, arg0->unk24, 0, 0, 0, load_flags, 0, ch);
            sub_8061168(sprite, mode);
            sub_8061130(sprite, arg0->unkE);
            if (width != NULL) {
                advance = (unk16)(advance - width[ch]);
            }
            offset = arg0->unk29;
            advance = (unk16)(advance + offset);
            sprite->unk1E = x | extra;
            extra = 0;
            if (child != NULL) {
                sprite->unk10 = (sprite->unk10 & 0xC1FFFCFF) | flags;
                sprite->unk30 = child;
            }
            sprite = sprite->next;
        }
        x = (unk16)(x + advance);
    }
    sub_806123C(arg0);
    arg0->unkA = x;
    return 1;
}

INCLUDE_ASM("asm/dump/8057b80-debug/8061660.s");
INCLUDE_ASM("asm/dump/8057b80-debug/8061684.s");
INCLUDE_ASM("asm/dump/8057b80-debug/8061824.s");
INCLUDE_ASM("asm/dump/8057b80-debug/8061844.s");
INCLUDE_ASM("asm/dump/8057b80-debug/806185c.s");
INCLUDE_ASM("asm/dump/8057b80-debug/8061880.s");

unk8 showNumber(SpriteTextCleanup* arg0, s32 arg1, unk8 arg2)
{
    unk8 negative;
    unk8 group;
    unk8 digits;
    unk8 buffer[16];
    unk8* ptr;
    s32 digit;

    negative = 0;
    group = 3;
    digits = 0xE;
    if (arg1 < 0) {
        negative = 1;
        arg1 = -arg1;
    }
    ptr = &buffer[15];
    *ptr = 0;
    if (arg1 == 0) {
        ptr--;
        *ptr = '0';
    } else {
        while (1) {
            if ((arg0->unk8 & 0x40) == 0) {
                group--;
                if (group == 0xFF) {
                    ptr--;
                    *ptr = ',';
                    group = 2;
                    digits--;
                }
            }
            digit = DivRem(arg1, 10);
            ptr--;
            *ptr = digit + '0';
            arg1 = Div(arg1, 10);
            digits--;
            if (arg1 == 0 || digits == 0) {
                break;
            }
        }
    }
    if (negative != 0) {
        ptr--;
        *ptr = '-';
    }
    return showString(arg0, ptr, arg2);
}

unk8 showNumber_2(SpriteTextCleanup* arg0, unk32 arg1, unk8 arg2)
{
    sub_8061228(arg0);
    return showNumber(arg0, arg1, arg2);
}

INCLUDE_ASM("asm/dump/8057b80-debug/80619a4.s");
INCLUDE_ASM("asm/dump/8057b80-debug/8061a18-printTime.s");
INCLUDE_ASM("asm/dump/8057b80-debug/8061ae8.s");
INCLUDE_ASM("asm/dump/8057b80-debug/8061ba0.s");
INCLUDE_ASM("asm/dump/8057b80-debug/8061c24.s");
INCLUDE_ASM("asm/dump/8057b80-debug/8061c48.s");
INCLUDE_ASM("asm/dump/8057b80-debug/8061c6c.s");
INCLUDE_ASM("asm/dump/8057b80-debug/8061c90.s");
INCLUDE_ASM("asm/dump/8057b80-debug/8061cb4.s");
INCLUDE_ASM("asm/dump/8057b80-debug/8061d54.s");
INCLUDE_ASM("asm/dump/8057b80-debug/8061d68.s");
INCLUDE_ASM("asm/dump/8057b80-debug/8061e08.s");
INCLUDE_ASM("asm/dump/8057b80-debug/8061e44.s");
INCLUDE_ASM("asm/dump/8057b80-debug/8061e58.s");
INCLUDE_ASM("asm/dump/8057b80-debug/8061e90.s");
INCLUDE_ASM("asm/dump/8057b80-debug/8061e94.s");
INCLUDE_ASM("asm/dump/8057b80-debug/8061e9c.s");
INCLUDE_ASM("asm/dump/8057b80-debug/8061f3c.s");
INCLUDE_ASM("asm/dump/8057b80-debug/80622d0.s");
INCLUDE_ASM("asm/dump/8057b80-debug/80622e8.s");
INCLUDE_ASM("asm/dump/8057b80-debug/8062318.s");
