#include "spritestring.h"

#include "actor.h"
#include "actorheap.h"
#include "bios.h"
#include "common.h"
#include "ram.h"
#include "sprite.h"
#include "system.h"

extern const u8 byte_807D980[];

unk32 sub_8064F38(const u8* str)
{
    unk32 count;
    u8 c;

    count = 0;
    for (;;) {
        c = *str;
        if (c == 0) {
            break;
        }
        str++;
        if (c != ' ') {
            count++;
        }
    }
    return count;
}

unk32 sub_8064F50(unk32 value)
{
    unk32 count;
    unk32 group;
    unk32 previousGroup;

    count = 0;
    group = 3;
    if (value == 0) {
        return 1;
    }
    do {
        previousGroup = group;
        group--;
        if (previousGroup == 0) {
            group = 3;
            count++;
        }
        count++;
        value = Div(value, 10);
    } while (value != 0);
    return count;
}

unk32 sub_8064F84(const u8* str)
{
    unk32 length;
    u8 c;

    c = *str;
    length = 1;
    while (c != 0) {
        c = str[length];
        length++;
    }
    return length;
}

void sub_8064F9C(SpriteString* string, const u8* text, unk32 x, const u8* widthTable, Actor* actors,
    u8 count, unk32 y, unk32 unk18)
{
    unk32 scale;

    string->actors = actors;
    string->count = count;
    string->y = y;
    string->unk18 = unk18;
    string->text = text;
    string->x = x;
    string->previousX = x - 1;
    string->unk5_0 = 0;
    string->unk5_4 = 0;
    string->widthTable = widthTable;
    string->timer = -1;
    string->mode = 0;
    scale = 0x80;
    scale <<= 1;
    string->scaleX = scale;
    string->scaleY = scale;
    string->width = 0;
    sub_8065088(string);
}

ActorBlock* SpriteString_8064FE8(SpriteString* string, const u8* arg1, unk32 arg2, u16 count,
    void* argA, const u8* argB, unk32 argC, unk32 argD, u8 argE)
{
    ActorBlock* state;
    u16 i;
    Actor* actor;

    state = sub_8062EFC(count);
    if (state == NULL) {
        nullsub_8("Error allocating actors for SpriteString");
    }
    for (i = 0; i < count; i++) {
        actor = state->actor + i;
        actor_8057C58(actor, argA, 0, 0, 0, 0, 0);
        sub_80585C8(actor, 1);
    }
    sub_8064F9C(string, arg1, arg2, argB, state->actor, state->size, argC, argD);
    string->mode = argE;
    return state;
}

void sub_8065088(SpriteString* string)
{
    unk32 x;
    u16 i;
    Actor* actor;
    unk32 zero;
    unk32 scale;

    x = string->y;
    i = 0;
    if (i < string->count) {
        zero = 0;
        scale = 0x80;
        scale <<= 1;
        do {
            actor = &string->actors[i];
            actor->x = x << 8;
            actor->y = string->unk18 << 8;
            actor->unk16 = zero;
            actor->unk12 = scale;
            actor->unk14 = scale;
            actor->unk40 = zero;
            actor->unk44 = zero;
            actor->unk48 = zero;
            actor->unk4C = zero;
            actor->unk50 = zero;
            actor->unk54 = zero;
            x += actor->unk10;
            i++;
        } while (i < string->count);
    }
    string->scaleX = 0x100;
    string->scaleY = 0x100;
}

void sub_80650E0(SpriteString* string, unk32 value)
{
    if (string->timer == 0 && value != 0) {
        string->previousX = string->x - 1;
    }
    string->timer = value;
}

void sub_80650F8(SpriteString* string, const u8* text)
{
    string->text = text;
}

void sub_80650FC(SpriteString* string, unk32 x)
{
    string->text = NULL;
    string->previousX = string->x;
    string->x = x;
}

unk8 sub_8065108(SpriteString* string)
{
    unk16 count;
    unk16 index;
    Actor* actor;

    count = 0;
    for (index = 0; index < string->count; index++) {
        actor = &string->actors[index];
        if (actor->unk70 != 0) {
            count++;
        }
    }
    return count;
}

void sub_8065140(SpriteString* string)
{
    s16 scaleX;
    s16 savedScale;
    unk16 scaleY;
    unk8 textOffset;
    unk16 i;
    unk8 visibleCount;
    unk32 x;
    s32 advance;
    Actor* actor;

    scaleX = string->scaleX;
    scaleY = string->scaleY;
    textOffset = 0;
    if (string->timer > 0) {
        string->timer -= _unk3000E30[0] - _unk3000E30[1];
        if (string->timer < 0) {
            string->timer = 0;
        }
    }
    if (string->text == NULL) {
        if (string->x != string->previousX) {
            if ((string->mode & 8) != 0) {
                sub_8065508(string);
            } else {
                sub_80653D8(string);
            }
        }
    } else if ((string->mode & 4) != 0) {
        sub_80656B8(string);
        visibleCount = sub_8065108(string);
        if (visibleCount < string->count) {
            sub_80655C0(string, string->x, string->count - 1, string->count - visibleCount, 0);
        }
    } else {
        sub_80656B8(string);
    }
    string->previousX = string->x;
    switch (string->mode & 3) {
    case 0:
        x = string->y << 8;
        break;
    case 1:
        savedScale = string->scaleX;
        string->scaleX = 0x100;
        x = (string->y - sub_8065334(string)) << 8;
        string->scaleX = savedScale;
        break;
    case 2:
        string->width = sub_8065334(string);
        x = (string->y - (string->width >> 1)) << 8;
        break;
    }
    for (i = 0; i < string->count; i++) {
        if (string->text != NULL && string->text[i + textOffset] == ' ') {
            x += 0x500;
            textOffset++;
        }
        actor = &string->actors[i];
        if (string->unk5_4 != 0) {
            actor->unk3A &= 0xE1;
            actor->unk3A |= string->unk5_0 << 1;
        }
        if ((string->mode & 0x20) == 0) {
            actor->x = x;
        }
        if ((string->mode & 0x10) != 0) {
            actor->y = string->unk18 << 8;
        }
        if ((string->mode & 0x40) == 0) {
            actor->unk12 = scaleX;
            actor->unk14 = scaleY;
        }
        if (string->timer == 0) {
            actor->unk70 = 0;
        }
        sub_80584B8(actor);
        if (actor->unk70 != 0) {
            if (string->widthTable != NULL) {
                advance = (actor->unk10 - string->widthTable[actor->unk22]) << 8;
                if (scaleX != 0x100) {
                    advance = (scaleX * advance) >> 8;
                }
            } else {
                advance = actor->unk10 << 8;
            }
            x += advance;
        }
    }
}

void sub_806530C(SpriteString* string)
{
    u16 i;

    for (i = 0; i < string->count; i++) {
        sub_80584B8(&string->actors[i]);
    }
}

s32 sub_8065334(SpriteString* string)
{
    unk16 textOffset;
    s32 total;
    unk16 index;
    Actor* actor;

    textOffset = 0;
    total = 0;
    for (index = 0; index < string->count; index++) {
        actor = &string->actors[index];
        if (string->text != NULL && string->text[index + textOffset] == ' ') {
            total += 5;
            textOffset++;
        }
        if (actor->unk70 != 0) {
            if (string->widthTable != NULL) {
                total += actor->unk10 - string->widthTable[actor->unk22];
            } else {
                total += actor->unk10;
            }
        }
    }
    total = (string->scaleX * total) >> 8;
    return total;
}

void sub_80653B0(SpriteString* string)
{
    u16 i;

    for (i = 0; i < string->count; i++) {
        renderActor2(&string->actors[i]);
    }
}

void sub_80653D8(SpriteString* string)
{
    s32 value;
    s32 remaining;
    s16 index;
    s16 count;
    s16 spacing;
    unk32 flag;
    unk32 remainder;
    Actor* actor;

    count = 0;
    spacing = 0;
    flag = 0;
    value = string->x;
    if (value < 0) {
        value = -value;
    }
    remaining = value;
    for (index = string->count - 1; index >= 0; index--) {
        actor = &string->actors[index];
        remainder = remaining > 0 ? DivRem(remaining, 10) : 0;
        if (spacing > 2 && remaining > 0) {
            spacing = spacing - 3;
            actor->unk70 = -1;
            ActorSetFrame(actor, 0, byte_807D980[0x2C]);
            count++;
        } else {
            if (remainder == 0 && remaining == 0 && count != 0) {
                if (string->x < 0 && flag == 0) {
                    actor->unk70 = -1;
                    ActorSetFrame(actor, 0, byte_807D980[0x2D]);
                    flag = 1;
                    count = count + 1;
                } else {
                    actor->unk70 = 0;
                }
            } else {
                actor->unk70 = -1;
                ActorSetFrame(actor, 0, remainder + 0x34);
                count++;
                spacing++;
            }
            if (remaining > 0) {
                remaining = Div(remaining, 10);
            }
        }
    }
}

void sub_8065508(SpriteString* string)
{
    s32 value;
    u16 i;
    unk32 remainder;
    unk32 index;
    Actor* actor;

    value = string->x;
    for (i = 0; i < string->count; i++) {
        actor = &string->actors[i];
        actor->unk70 = 0;
    }
    if (value < 0) {
        value = -value;
    }
    remainder = DivRem(value, 60);
    sub_80655C0(string, remainder, string->count - 1, 2, 1);
    value = Div(value, 60);
    index = string->count;
    ActorSetFrame(&string->actors[index - 3], 0, byte_807D980[':']);
    string->actors[string->count - 3].unk70 = -1;
    if (value != 0) {
        remainder = DivRem(value, 60);
    } else {
        remainder = 0;
    }
    sub_80655C0(string, remainder, string->count - 4, 2, 0);
}

ASM_ZEROPAD;
