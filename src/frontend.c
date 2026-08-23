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
#include "ram.h"
#include "sound.h"
#include "unsorted.h"

INCLUDE_ASM("asm/dump/8040d18/8048f80.s");
INCLUDE_ASM("asm/dump/8040d18/8048fb4.s");
INCLUDE_ASM("asm/dump/8040d18/8048fc4-nullsub_38.s");
INCLUDE_ASM("asm/dump/8040d18/8048fc8-nullsub_33.s");
INCLUDE_ASM("asm/dump/8040d18/8048fcc.s");
INCLUDE_ASM("asm/dump/8040d18/8048fd4.s");
INCLUDE_ASM("asm/dump/8040d18/8048fe4.s");
INCLUDE_ASM("asm/dump/8040d18/8048ffc.s");

void sub_8049018(void)
{
    FrontendState* state;

    state = &_unk3000650;
    state->unk84 = state->unk88 = (unk32)-65536;
    state->unk8C = state->unk90 = (unk32)-65536;
}

INCLUDE_ASM("asm/dump/8040d18/804903c.s");
INCLUDE_ASM("asm/dump/8040d18/8049074.s");

extern unk8 _unk3000BFC;

void sub_80490CC(unk32 arg0, unk32 arg1)
{
    FrontendState* state;
    FrontendObject* object;

    state = &_unk3000650;
    object = state->unkB4;
    if (object != NULL && object->unk8 != NULL)
        object->unk8(state, arg0, arg1);
}

INCLUDE_ASM("asm/dump/8040d18/80490f8.s");

INCLUDE_ASM("asm/dump/8040d18/804915c.s");

void sub_8049168(void)
{
    _unk3000650.unk7C = 0;
}

INCLUDE_ASM("asm/dump/8040d18/8049178.s");
INCLUDE_ASM("asm/dump/8040d18/80491c4.s");
INCLUDE_ASM("asm/dump/8040d18/80491e0.s");
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

INCLUDE_ASM("asm/dump/8040d18/8049258.s");
extern unk8 _unk3000BFC;
extern u16 _unk3000BFD;
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
    _unk3000650.unk481 = 0;
    _unk3000650.unk578 = _unk3000650.unk57C = _unk3000650.unk580 = 0;
    _unk3000650.unk80 = 0;
    _unk3000650.unk7F = 0;
    _unk3000650.unk584 = 0;
    _unk3000650.unk585 = 0;
    _unk3000650.unk586 = 0;
    _unk3000650.unk588 = 0;
    _unk3000650.unk58C = 0;
    _unk3000650.unk81 = 0;
    _unk3000650.unk5A8 = 0;
}

INCLUDE_ASM("asm/dump/8040d18/8049320-StoreFunction.s");
INCLUDE_ASM("asm/dump/8040d18/8049330.s");

void sub_8049344(u32 arg0)
{
    FrontendState* base0;
    FrontendState* base;
    void (*callback)(FrontendState*, unk32);
    void (*stored)(FrontendState*, unk32);

    callback = NULL;
    base0 = &_unk3000650;
    stored = base0->unk588;
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
            if (base->unk585 > 0)
                callback = base->unkB4->unk14;
            else if (base->unk585 < 0)
                callback = base->unkB4->unk10;
            break;
        }
    }
    if (callback != NULL)
        callback(base, arg0);
}

s32 sub_80493C8(void)
{
    s32 result;
    FrontendState* state;
    GameData* data;

    result = 0;
    state = &_unk3000650;
    if (state->unk7F != 0 && sub_805FFE4() != 0 && state->unk584 != 0x40) {
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
        if (_unk3000650.unk0 != _unk3000650.unk4 && _unk3000650.unk584 == _unk3000650.unk586) {
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
        state->unk584 += state->unk585;
        sub_8057930();
        sub_80490CC(8, count++);
        if (state->unk585 == 0) {
            if ((*object)->unk4->unk20 != 0)
                sub_804374C(state);
            sub_80490CC(2, 0);
        }
        value = state->unk586;
        if (state->unk584 == value) {
            state->unk584 = value;
            sub_8049344(1);
            _unk3000650.unk585 = 0;
        }
    }
    sub_804A280(&_unk3000650);
}

#endif
INCLUDE_ASM("asm/dump/8040d18/8049458.s");

INCLUDE_ASM("asm/dump/8040d18/80495c4.s");
INCLUDE_ASM("asm/dump/8040d18/804967c.s");
