#include "menuobject.h"

#include "frontend.h"
#include "include_asm.h"
#include "keystate.h"
#include "language.h"
#include "motion.h"
#include "ram.h"
#include "sprite.h"
#include "spritetext.h"

#if 0
void sub_8043370(FrontendState* object)
{
    FrontendMenuObjectData* data;
    MenuState* state;
    UnkMotion* items;
    UnkMenuItem* motion;
    const FrontendMotionData* table;
    unk32 language;
    s32 offset;
    s32 i;
    s32 sign;
    s32 direction;

    data = object->unkB4->unk4->unk20;
    table = &_8068840;
    if (data != NULL) {
        state = &object->menuState;
        language = getLanguage();
        sub_805AD24(state, data->unk8[0], data->unk8[1], data->unk0, data->unk2, data->unk10,
            data->unk12, data->unk14, data->unk15, data->unk16, data->unk17, sub_8043604, 0,
            language);
        allocateMenuItems(state, data->unkC, 0);
        object->unk7E = 0;
        object->unk7D = 0;
        if (object->menuState.objectCount == 0)
            return;
        object->menuState.block = slowAllocate(object->menuState.objectCount * 0x18);
        object->menuState.objectItems = object->menuState.block->address;
        items = object->menuState.objectItems;
        motion = object->menuState.items;
        object->menuState.timer = 0;
        offset = (0xA0 - object->menuState.unk9) / 2 + data->unk6;
        i = 0;
        while (i < object->menuState.objectCount) {
            sign = ((i & 1) != 0) ? 1 : -1;
            direction = (sign > 0) ? -0x10 : 0xF0;
            sub_8061844(&motion->text, 0, direction);
            newMotionGroup(items, &motion->text.unk14, 6);
            sub_80504E4(items, table->unk0, table->unk4 * sign, table->unk8, table->unkC);
            sub_805052C(items, table->unk10, table->unk14 * sign, table->unk18, table->unk1C);
            sub_8050578(items, offset << 8, table->unk26);
            offset += object->menuState.unkA;
            items++;
            motion++;
            i++;
        }
    }
}
#endif
INCLUDE_ASM("asm/dump/8040d18/8043370.s");

void sub_80434EC(FrontendState* object)
{
    unk32 count;
    UnkMotion* item;

    count = object->menuState.objectCount;
    if (count != 0) {
        item = object->menuState.objectItems;
        count--;
        while (count != (unk32)-1) {
            sub_805041C(item);
            item++;
            count--;
        }
    }
    if (object->menuState.timer != 0) {
        item = &object->menuState.motion;
        sub_805041C(item);
        object->menuState.timer = object->menuState.timer - 1;
        if (object->menuState.timer == 0) {
            sub_8050584(item);
            sub_8061204(&object->menuState.cleanup);
        }
    }
}

extern const s32 _8068868[];

void sub_8043558(FrontendState* object)
{
    s32 i;
    unk32 odd;
    s32 direction;
    const s32* table;
    UnkMotion* motion;
    UnkMenuItem* item;

    if (object->menuState.objectCount != 0) {
        table = _8068868;
        motion = object->menuState.objectItems;
        item = object->menuState.items;
        i = 0;
        while (i < object->menuState.objectCount) {
            odd = i & 1;
            direction = -1;
            if (odd != 0) {
                direction = 1;
            }
            sub_8050584(motion);
            newMotionGroup(motion, &item->text.unk14, 0);
            sub_80504E4(motion, table[0] * direction, table[1], table[2], table[3]);
            sub_805052C(motion, table[4] * direction, table[5], table[6], table[7]);
            sub_8050574(motion, 0);
            item++;
            motion++;
            i++;
        }
    }
}

extern const FrontendMotionData _8068890;
extern void sub_80622E8(UnkMenuItem*, SpriteTextCleanup*);

void sub_8043604(UnkMenuItem* oldItem, s32 old, UnkMenuItem* item, s32 current)
{
    FrontendState* state;
    const FrontendMotionData* table;
    unk32* timer;
    SpriteTextCleanup* cleanup;
    UnkMotion* motion;
    s32 value;

    table = &_8068890;
    state = sub_8048FCC();
    timer = &state->menuState.timer;
    cleanup = &state->menuState.cleanup;
    motion = &state->menuState.motion;
    if (*timer != 0) {
        sub_8061204(cleanup);
        sub_8050584(motion);
    }
    sub_80622E8(item, cleanup);
    value = item->text.unk14.prev->y;
    sub_8061844(cleanup, 0, (value << 8) >> 16);
    sub_8061660(cleanup, item->unk30, 0xF);
    newMotionGroup(motion, &cleanup->unk14, 0);
    sub_80504E4(motion, table->unk0, table->unk4, table->unk8, table->unkC);
    sub_805052C(motion, table->unk10, table->unk14, table->unk18, table->unk1C);
    *timer = 0x10;
}

void sub_80436B0(FrontendState* object)
{
    unk32 count;
    UnkMotion* item;

    item = object->menuState.objectItems;
    count = object->menuState.objectCount;
    if (count == 0) {
        return;
    }
    while (count-- != 0) {
        sub_8050584(item);
        item++;
    }
    if (object->menuState.timer != 0) {
        sub_8050584(&object->menuState.motion);
        sub_8061204(&object->menuState.cleanup);
    }
    deallocateBlock(object->menuState.block);
    sub_805AD9C(&object->menuState);
}

unk32 sub_8043720(FrontendState* object)
{
    unk32 high;
    unk32 low;

    high = sub_805B240(&object->menuState);
    low = sub_805B210(&object->menuState);
    return (high << 16) | (low & 0xFFFF);
}

void sub_804374C(FrontendState* object)
{
    unk32 current;
    unk32 next;

    if (object->menuState.objectCount != 0) {
        current = sub_8043720(object);
        if ((_unk3005DA0 & 0xF0) != 0) {
            if ((_unk3005DA0 & 0x40) != 0) {
                sub_805AFBC(&object->menuState, 0);
            } else if ((_unk3005DA0 & 0x80) != 0) {
                sub_805AFBC(&object->menuState, 1);
            }
            if ((_unk3005DA0 & 0x20) != 0) {
                if (sub_805B210(&object->menuState) != (unk32)-1) {
                    sub_80490CC(9, sub_8043720(object));
                }
                sub_805B050(&object->menuState, 0);
            } else if ((_unk3005DA0 & 0x10) != 0) {
                if (sub_805B210(&object->menuState) != (unk32)-1) {
                    next = sub_8043720(object) | 0x80000000;
                    sub_80490CC(9, next);
                }
                sub_805B050(&object->menuState, 1);
            }
            next = sub_8043720(object);
            if (current != next) {
                sub_80490CC(4, next);
            }
        }
        if ((_unk3005DA0 & 1) != 0) {
            sub_80490CC(5, sub_8043720(object));
        } else if ((_unk3005DA0 & 2) != 0) {
            sub_80490CC(6, 0);
        }
    }
}

INCLUDE_ASM("asm/dump/8040d18/804385c.s");

INCLUDE_ASM("asm/dump/8040d18/80438cc.s");
