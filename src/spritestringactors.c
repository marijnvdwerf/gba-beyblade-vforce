#include "actor.h"
#include "bios.h"
#include "common.h"
#include "teletype.h"

unk32 sub_80655C0(SpriteString* string, s32 value, unk16 index, unk16 step, unk8 modeArg)
{
    s16 current;
    s32 remaining;
    s16 count;
    unk32 remainder;
    Actor* actor;

    count = 0;
    if (value < 0) {
        value = -value;
    }
    remaining = value;
    if ((s16)index >= string->count) {
        return 0;
    }
    current = index;
    while (current > (s16)index - (s16)step) {
        actor = &string->actors[current];
        remainder = remaining > 0 ? DivRem(remaining, 10) : 0;
        if (remainder == 0 && remaining == 0 && count != 0) {
            if (modeArg == 0) {
                break;
            }
            actor->unk70 = -1;
            ActorSetFrame(actor, 0, 0x34);
            count++;
        } else {
            actor->unk70 = -1;
            ActorSetFrame(actor, 0, remainder + 0x34);
            count++;
        }
        if (remaining > 0) {
            remaining = Div(remaining, 10);
        }
        current--;
    }
    return (unk16)count;
}

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
            ActorSetFrame(actor, 0, GlyphMap[character]);
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

void sub_806570C(SpriteString* string, ActorTimerCallback arg1, unk32 arg2, unk32 arg3, unk32 arg4, unk32 step)
{
    u16 i;
    unk32 offset;

    offset = 0;
    i = 0;
    while (i < string->count) {
        sub_8058794(&string->actors[i], arg1, arg2, arg3, arg4 + offset);
        offset += step;
        i++;
    }
}

void sub_8065760(SpriteString* string, ActorTimerCallback arg1, unk32 arg2, unk32 arg3, unk32 arg4, unk32 step, unk32 maxCount)
{
    u16 i;
    u16 count;
    unk32 offset;

    count = maxCount;
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
    u16 i;

    i = 0;
    while (i < string->count) {
        sub_80588DC(&string->actors[i]);
        i++;
    }
}

void sub_80657EC(SpriteString* string, u8 value)
{
    string->unk5_4 = 1;
    string->unk5_0 = value;
}
