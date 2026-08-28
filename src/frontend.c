#include "frontend.h"

#include <agb/types.h>

#include "bios.h"
#include "display.h"
#include "include_asm.h"
#include "keystate.h"
#include "levelrow.h"
#include "menuobject.h"
#include "motion.h"
#include "multiplayer.h"
#include "music.h"
#include "ram.h"
#include "sound.h"
#include "unsorted.h"

INCLUDE_ASM("asm/dump/8040d18/8048f80.s");
INCLUDE_ASM("asm/dump/8040d18/8048fb4.s");
INCLUDE_ASM("asm/dump/8040d18/8048fc4-nullsub_38.s");

void nullsub_33(FrontendState* state, unk32 arg1)
{
}

INCLUDE_ASM("asm/dump/8040d18/8048fcc.s");
INCLUDE_ASM("asm/dump/8040d18/8048fd4.s");

void sub_8048FE4(void)
{
    sub_804AF5C();
    sub_804AE8C();
    sub_80490F8(-1);
}

unk8 sub_8048FFC(void)
{
    if ((_unk3000BE0.varC->unkEC & 1) != 0)
        return 1;
    return 0;
}

void sub_8049018(void)
{
    _unk3000650.unk84 = _unk3000650.unk88 = (unk32)-65536;
    _unk3000650.unk8C = _unk3000650.unk90 = (unk32)-65536;
}

void sub_804903C(FrontendSubobject* object, unk32 arg1, unk32 arg2)
{
    _unk3000650.unk8C = arg1 << 8;
    _unk3000650.unk90 = arg2 << 8;
    _unk3000650.unk84 = object->unk48 << 8;
    _unk3000650.unk88 = object->unk4A << 8;
}

INCLUDE_ASM("asm/dump/8040d18/8049074.s");

void sub_80490CC(unk32 arg0, unk32 arg1)
{
    if (_unk3000650.unkB4 != NULL && _unk3000650.unkB4->unk8 != NULL)
        _unk3000650.unkB4->unk8(&_unk3000650, arg0, arg1);
}

void sub_80490F8(unk32 arg0)
{
    if (_unk3000650.unk0 != arg0 && _unk3000650.unk4 != arg0) {
        if (_unk3000650.unk0 != (unk32)-1) {
            sub_8049344(3);
            sub_80490CC(3, 1);
            _unk3000BFC = 1;
        }
        if (_unk3000650.unk7C <= 14) {
            _unk3000650.history[_unk3000650.unk7C++] = _unk3000650.unk4;
            _unk3000650.unk8 = _unk3000650.unk0;
        }
        _unk3000650.unk4 = arg0;
        sub_80495C4();
    }
}

unk32 sub_804915C(void)
{
    return _unk3000650.unk8;
}

void sub_8049168(void)
{
    _unk3000650.unk7C = 0;
}

void sub_8049178(void)
{
    if (_unk3000650.unk7C != 0) {
        sub_8049344(3);
        sub_80490CC(3, 1);
        _unk3000BFC = 1;
        _unk3000650.unk4 = _unk3000650.history[--_unk3000650.unk7C];
        _unk3000650.unk8 = _unk3000650.unk0;
    }
    sub_80495C4();
}

INCLUDE_ASM("asm/dump/8040d18/80491c4.s");

s32 sub_80491E0(unk32 arg0, s32 arg1)
{
    s32 value;
    unk32 negative;

    value = arg0;
    negative = (unk32)value >> 31;
    if (value != 0) {
        if (negative != 0)
            value = 0 - value;
        while (arg1 != 0) {
            if (value > (arg1 << 8)) {
                value = arg1;
                break;
            }
            arg1 >>= 1;
        }
        if (arg1 == 0)
            value = 1;
        if (negative != 0)
            value = 0 - value;
    }
    return value;
}

INCLUDE_ASM("asm/dump/8040d18/8049210.s");

void sub_8049234(unk32 arg0)
{
    _unk3000650.unkC = arg0;
}

INCLUDE_ASM("asm/dump/8040d18/8049240.s");

void sub_804924C(unk32 arg0)
{
    _unk3000650.unk10 = arg0;
}

unk32 sub_8049258(void)
{
    return _unk3000650.unk10;
}

extern void (*__oam_8756CC0)(void);

void sub_8049264(void)
{
    _gameData->unkC26 = (unk16)-1;
    _unk3000650.unk4 = 0;
    _unk3000650.unkC = 0;
    sub_804924C(7);
    _unk3000650.unk0 = (unk32)-1;
    _unk3000650.unk8 = (unk32)-1;
    _unk3000650.unk7C = 0;
    sub_8050384(&_unk3000650.motion);
    _unk3000650.unk424 = 0;
    _unk3000650.unk470 = 0;
    _unk3000650.unk474 = 0;
    _unk3000650.menuState.unk9 = 0;
    _unk3000650.unk578 = _unk3000650.unk57C = _unk3000650.unk580 = 0;
    _unk3000650.unk80 = 0;
    _unk3000650.unk7F = 0;
    _unk3000650.transition.value = 0;
    _unk3000650.transition.unk585 = 0;
    _unk3000650.transition.unk586 = 0;
    _unk3000650.transition.unk588 = 0;
    _unk3000650.transition.unk58C = 0;
    _unk3000650.unk81 = 0;
    _unk3000650.transition.unk5A8 = 0;
}

void StoreFunction(void (*function)(FrontendState*, unk32))
{
    _unk3000650.transition.unk588 = function;
}

void sub_8049330(unk32 arg0)
{
    _unk3000650.transition.unk58C = arg0;
}

void sub_8049344(u32 arg0)
{
    FrontendState* base0;
    FrontendState* base;
    void (*callback)(FrontendState*, unk32);
    void (*stored)(FrontendState*, unk32);

    callback = NULL;
    base0 = &_unk3000650;
    stored = base0->transition.unk588;
    base = base0;
    if (stored != NULL)
        callback = stored;
    else if (arg0 <= 4) {
        switch (arg0) {
        case 0:
        case 2:
            callback = base->unkB4->unk10;
            break;
        case 3:
            callback = base->unkB4->unk14;
            break;
        case 1:
        case 4:
            if (base->transition.unk585 > 0)
                callback = base->unkB4->unk14;
            else if (base->transition.unk585 < 0)
                callback = base->unkB4->unk10;
            break;
        }
    }
    if (callback != NULL)
        callback(base, arg0);
}

unk32 sub_80493C8(void)
{
    unk32 result;
    FrontendState* state;
    GameData* data;

    result = 0;
    state = &_unk3000650;
    if (state->unk7F != 0 && sub_805FFE4() != 0 && state->transition.value != 0x40) {
        data = _gameData;
        if (data->unk1619 != 1) {
            if (sub_806014C(data->unk15D4, data->unk15D4 - 0x10, 1) == 0 && sub_806008C() != 0) {
                _gameData->unk1618 = 0;
                _gameData->unk1619 = 1;
                state->unk7F = 0;
                sub_80490F8(0x1D);
            } else {
                result = 1;
            }
        }
    }
    return result;
}
#if 0
void sub_8049458(void)
{
    unk32 count;
    FrontendState *state;
    FrontendObject **object;
    unk8 value;

    count = 0;
    sub_8049018();
    VBlankIntrWait();
    sub_804A280(&_unk3000650);
    sub_80627F0();
    _unk3000BFC = 1;
    _unk3000BFD = 0;
    sub_8049168();
    sub_80490F8(_unk3000650.unkC);
    while (_unk3000650.unk0 != (unk32)-1 || _unk3000650.unk4 != (unk32)-1) {
        VBlankIntrWait();
        updateKeyState();
        sub_804A280(&_unk3000650);
        sub_80627F0();
        sub_80493C8();
        sub_80490CC(1, _unk3000BFC);
        __oam_8756CC0();
        if (_unk3000650.unk0 != _unk3000650.unk4 && _unk3000650.transition.value == _unk3000650.transition.unk586) {
            count = 0;
            sub_804967C();
        }
        state = &_unk3000650;
        object = &state->unkB4;
        if (*object == NULL)
            break;
        sub_8050A50(state);
        if (state->motion.unkC != 0)
            sub_805041C(&state->motion);
        if ((*object)->unk4->unk14 != 0)
            sub_804A110();
        sub_80434EC(state);
        sub_8049344(4);
        state->transition.value += state->transition.unk585;
        sub_8057930();
        sub_80490CC(8, count++);
        if (state->transition.unk585 == 0) {
            if ((*object)->unk4->unk20 != 0)
                sub_804374C(state);
            sub_80490CC(2, 0);
        }
        value = state->transition.unk586;
        if (state->transition.value == value) {
            state->transition.value = value;
            sub_8049344(1);
            _unk3000650.transition.unk585 = 0;
        }
    }
    sub_804A280(&_unk3000650);
}

#endif
INCLUDE_ASM("asm/dump/8040d18/8049458.s");

void sub_80495C4(void)
{
    FrontendSelectionData* selected;
    const FrontendSelectionRecord* record;
    FrontendSubobject* state;
    FrontendMotionData* data;
    FrontendState* base;

    base = &_unk3000650;
    state = base->unkB4->unk4;
    if (base->unk4 != (unk32)-1) {
        record = &_8069FC8[base->unk4];
        selected = record->data;
    } else {
        selected = NULL;
    }
    if (_unk3000650.motion.count != 0) {
        data = state->unk10->unk28;
        if (data != NULL) {
            sub_80504E4(&_unk3000650.motion, data->unk0, data->unk4, data->unk8, data->unkC);
            sub_805052C(&_unk3000650.motion, data->unk10, data->unk14, data->unk18, data->unk1C);
            sub_8050578(&_unk3000650.motion, data->unk20, data->unk26);
        }
    }
    sub_8043558(&_unk3000650);
    if (selected != NULL && selected->palette != NULL && sub_8048FFC() != 0) {
        sub_804903C(&_unk3000650.unk140, selected->palette->unk0, selected->palette->unk4);
    }
}

#if 0
void sub_804967C(void)
{
    sub_80490CC(7, 0);
    if (_unk3000650.unk0 != (unk32)-1) {
        if (_unk3000650.unk424 != NULL) {
            if (_unk3000650.unk470 != NULL) {
                SpriteTextCleanup* cleanup;
                s32 count;

                cleanup = _unk3000650.unk470;
                count = _unk3000650.unkB4->unk4->unk14 - 1;
                if (count != -1) {
                    do {
                        sub_8061204(cleanup);
                        cleanup++;
                        count--;
                    } while (count != -1);
                }
                _unk3000650.unk470 = NULL;
            }
            deallocateBlock(_unk3000650.unk424);
            _unk3000650.unk424 = NULL;
        }
        sub_80436B0(&_unk3000650);
        if (_unk3000650.motion.count != 0) {
            sub_8050584(&_unk3000650.motion);
            sub_8061204(&_unk3000650.unk428);
        }
    }
    {
        FrontendState* state;
        FrontendSubobject967C* object;
        FrontendSubobjectData* cursor;
        FrontendMotionData* motionData;
        SpriteTextCleanup* destination;
        s32 index;

        state = &_unk3000650;
        if (state->unk4 != (unk32)-1)
            state->unkB4 = (FrontendObject*)&_8069FC8[state->unk4];
        else
            state->unkB4 = NULL;
        state->unk0 = state->unk4;
        if (state->unk4 == (unk32)-1)
            return;
        object = (FrontendSubobject967C*)state->unkB4->unk4;
        state->unk80 &= 0xF3;
        StoreFunction(0);
        _unk3000BFD = 0;
        if (state->transition.unk588 != NULL)
            ((void (*)(void))state->transition.unk588)();
        else if (state->unkB4->unkC != NULL)
            ((void (*)(void))state->unkB4->unkC)();
        sub_8049330(0);
        sub_8049344(2);
        if (object->unk14 * 0x30 != 0) {
            state->unk424 = slowAllocate(object->unk14 * 0x30);
            if (state->unk424 != NULL) {
                destination = state->unk424->address;
                state->unk470 = destination;
                cursor = object->unk18;
                index = object->unk14;
                do {
                    allocFont(destination, cursor->font->spriteSheet, cursor->font->fontMeta, cursor->x,
                        cursor->y, cursor->tileCount, cursor->font->glyphWidth);
                    sub_8061660(destination, cursor->languageStrings[getLanguage()], cursor->font->unkA);
                    cursor++;
                    destination++;
                    index--;
                } while (index != 0);
            }
        }
        cursor = object->unk10;
        if (cursor != NULL) {
            motionData = cursor->unk24;
            allocFont(&_unk3000A78.cleanup, cursor->font->spriteSheet, cursor->font->fontMeta,
                cursor->x, cursor->y, cursor->tileCount, cursor->font->glyphWidth);
            sub_8061660(&_unk3000A78.cleanup, cursor->languageStrings[getLanguage()], cursor->font->unkA);
            if (motionData != NULL) {
                newMotionGroup(&_unk3000A78.motion, &_unk3000A78.cleanup.unk14, motionData->unk26);
                sub_80504E4(&_unk3000A78.motion, motionData->unk0, motionData->unk4,
                    motionData->unk8, motionData->unkC);
                sub_805052C(&_unk3000A78.motion, motionData->unk10, motionData->unk14,
                    motionData->unk18, motionData->unk1C);
                sub_8050578(&_unk3000A78.motion, motionData->unk20, motionData->unk26);
            }
        }
        sub_8043370(state);
        sub_80490CC(0, 0);
    }
}
#endif

INCLUDE_ASM("asm/dump/8040d18/804967c.s");
