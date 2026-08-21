#include "actor.h"
#include "bios.h"
#include "common.h"
#include "include_asm.h"
#include "sprite.h"
#include "system.h"

extern void sub_8065088(SpriteString*);
extern SpriteStringActorBlock* sub_8062EFC(unk32);
extern void actor_8057C58(Actor*, unk32, unk32, unk32, unk32, unk32, unk32);
extern void sub_80585C8(Actor*, unk32);
extern const u8 Str_8756844[];
extern const u8 byte_807D980[];
extern void ActorSetFrame(Actor*, s32, unk8);
extern unk32 sub_80655C0(SpriteString*, s32, unk16, unk16, unk8);
extern void sub_8058794(Actor*, unk32, unk32, unk32, unk32);
extern void sub_80588DC(Actor*);

s32 sub_8064F38(const u8* str)
{
    s32 count;
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
    if (c != 0) {
        do {
            c = str[length];
            length++;
        } while (c != 0);
    }
    return length;
}

void sub_8064F9C(SpriteString* string, const u8* text, unk32 x, const u8* widthTable, Actor* actors,
    unk8 count, unk32 y, unk32 unk18)
{
    unk32 mask;
    unk32 scale;

    string->actors = actors;
    string->count = count;
    string->y = y;
    string->unk18 = unk18;
    string->text = text;
    string->x = x;
    string->previousX = x - 1;
    mask = 0x10;
    mask = -mask;
    string->flags &= mask;
    mask = 0x11;
    mask = -mask;
    string->flags &= mask;
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

SpriteStringActorBlock* SpriteString_8064FE8(SpriteString* string, const u8* arg1, unk32 arg2,
    unk16 count, unk32 argA, const u8* argB, unk32 argC, unk32 argD, unk8 argE)
{
    SpriteStringActorBlock* state;
    unk16 i;
    Actor* actor;

    state = sub_8062EFC(count);
    if (state == NULL) {
        nullsub_8((const char*)Str_8756844);
    }
    i = 0;
    if (i < count) {
        do {
            actor = state->actors + i;
            actor_8057C58(actor, argA, 0, 0, 0, 0, 0);
            sub_80585C8(actor, 1);
            i++;
        } while (i < count);
    }
    sub_8064F9C(string, arg1, arg2, argB, state->actors, state->count, argC, argD);
    string->mode = argE;
    return state;
}

void sub_8065088(SpriteString* string)
{
    unk32 x;
    unk16 i;
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

INCLUDE_ASM("asm/dump/8064f38/8065108.s");
INCLUDE_ASM("asm/dump/8064f38/806513e.s");

void sub_806530C(SpriteString* string)
{
    unk16 i;

    i = 0;
    while (i < string->count) {
        sub_80584B8(&string->actors[i]);
        i++;
    }
}

#if 0
s32 sub_8065334(SpriteString* string)
{
    unk16 textOffset;
    s32 total;
    unk16 index;
    unk8 count;
    const u8* text;
    Actor* actor;

    textOffset = 0;
    total = 0;
    index = 0;
    count = string->count;
    if ((unk32)total < count) {
        text = string->text;
        do {
            actor = &string->actors[index];
            if (text != NULL && text[index + textOffset] == ' ') {
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
            index++;
        } while (index < count);
    }
    total = (string->scaleX * total) >> 8;
    return total;
}
#else
INCLUDE_ASM("asm/dump/8064f38/8065334.s");
#endif

void sub_80653B0(SpriteString* string)
{
    unk16 i;

    i = 0;
    while (i < string->count) {
        renderActor2(&string->actors[i]);
        i++;
    }
}

INCLUDE_ASM("asm/dump/8064f38/80653d8.s");

INCLUDE_ASM("asm/dump/8064f38/8065508.s");
INCLUDE_ASM("asm/dump/8064f38/80655c0.s");

void sub_80656B8(SpriteString* string)
{
    s32 count;
    s32 character;
    const u8* text;
    Actor* actor;

    count = string->count;
    text = string->text;
    actor = string->actors;
    while (count != 0 && (character = *text++) != 0) {
        if (character != ' ') {
            ActorSetFrame(actor, 0, byte_807D980[character]);
            actor->unk70 = -1;
            actor++;
            count--;
        }
    }
    while (count-- != 0) {
        actor->unk70 = 0;
        actor++;
    }
}

void sub_806570C(SpriteString* string, unk32 arg1, unk32 arg2, unk32 arg3, unk32 arg4, unk32 step)
{
    unk16 i;
    unk32 offset;

    offset = 0;
    i = 0;
    while (i < string->count) {
        sub_8058794(&string->actors[i], arg1, arg2, arg3, arg4 + offset);
        offset += step;
        i++;
    }
}

void sub_8065760(SpriteString* string, unk32 arg1, unk32 arg2, unk32 arg3, unk32 arg4, unk32 step,
    unk32 maxCount)
{
    unk16 i;
    unk16 count;
    unk32 offset;

    count = (unk16)maxCount;
    offset = 0;
    if (count > string->count) {
        count = string->count;
    }
    i = 0;
    while (i < count) {
        sub_8058794(&string->actors[i], arg1, arg2, arg3, arg4 + offset);
        offset += step;
        i++;
    }
}

void sub_80657C4(SpriteString* string)
{
    unk16 i;

    i = 0;
    while (i < string->count) {
        sub_80588DC(&string->actors[i]);
        i++;
    }
}

void sub_80657EC(SpriteString* string, unk8 value)
{
    unk32 flags;
    unk32 mask;
    unk32 low;

    value = (unk8)value;
    flags = 0x10;
    flags |= string->flags;
    mask = 0xF;
    low = value & mask;
    mask -= 0x1F;
    flags &= mask;
    flags |= low;
    string->flags = (unk8)flags;
}
