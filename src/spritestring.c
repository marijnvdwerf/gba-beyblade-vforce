#include "actor.h"
#include "common.h"
#include "include_asm.h"
#include "sprite.h"

extern s32 Div(s32, s32);
extern void sub_8065088(SpriteString*);
extern SpriteStringActorBlock* sub_8062EFC(unk32);
extern void nullsub_8(const char*);
extern void actor_8057C58(Actor*, unk32, unk32, unk32, unk32, unk32, unk32);
extern void sub_80585C8(Actor*, unk32);
extern const u8 Str_8756844[];

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
    unk32 temp;

    count = 0;
    group = 3;
    if (value == 0) {
        return 1;
    }
    do {
        temp = group;
        group--;
        if (temp == 0) {
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
    unk8 count, unk32 y, unk32 field18)
{
    unk32 zero;
    unk32 mask;
    unk32 negativeOne;
    unk32 scale;

    string->actors = actors;
    zero = 0;
    string->count = count;
    string->y = y;
    string->field18 = field18;
    string->text = text;
    string->x = x;
    string->previousX = x - 1;
    mask = 0x10;
    mask = -mask;
    string->flags &= (unk8)mask;
    mask = 0x11;
    mask = -mask;
    string->flags &= (unk8)mask;
    string->widthTable = widthTable;
    negativeOne = 1;
    negativeOne = -negativeOne;
    string->timer = negativeOne;
    string->mode = (unk16)zero;
    scale = 0x80;
    scale <<= 1;
    string->scaleX = (unk16)scale;
    string->scaleY = (unk16)scale;
    string->width = zero;
    sub_8065088(string);
}

void* SpriteString_8064FE8(SpriteString* string, const u8* arg1, unk32 arg2, unk16 count,
    unk32 argA, const u8* argB, unk32 argC, unk32 argD, unk8 argE)
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
            actor->y = string->field18 << 8;
            actor->unk16 = (unk16)zero;
            actor->unk12 = (unk16)scale;
            actor->unk14 = (unk16)scale;
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

INCLUDE_ASM("asm/dump/8064f38/80653b0.s");
INCLUDE_ASM("asm/dump/8064f38/80653d8.s");
INCLUDE_ASM("asm/dump/8064f38/8065508.s");
INCLUDE_ASM("asm/dump/8064f38/80655c0.s");
INCLUDE_ASM("asm/dump/8064f38/80656b8.s");
INCLUDE_ASM("asm/dump/8064f38/806570c.s");
INCLUDE_ASM("asm/dump/8064f38/8065760.s");
INCLUDE_ASM("asm/dump/8064f38/80657c4.s");
INCLUDE_ASM("asm/dump/8064f38/80657ec.s");
