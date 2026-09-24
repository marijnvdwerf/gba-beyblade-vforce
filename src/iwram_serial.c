#include <agb/memory_map.h>

#include "iwram.h"
#include "unsorted.h"

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
    *(vu16*)REG_SIOMLT_SEND = _unk3005DC4->unk0 < packetHalf ? _unk3005DC4->unk3C[_unk3005DC4->unk0] : 0xFDD9;
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
