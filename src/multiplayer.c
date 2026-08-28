#include <agb/memory_map.h>

#include "debug.h"
#include "include_asm.h"
#include "memory.h"
#include "ram.h"
#include "system.h"
#include "unsorted.h"

extern const unk8 Str_8755834[];
extern const unk8 Str_8755884[];
extern const unk8 Str_87558B4[];
extern unk32 __divsi3(unk32, unk32);

#if 0
void initMultiPlayer(unk32 arg0, unk32 arg1, unk16 arg2)
{
    unk32 temp_r0;
    unk32 temp_r0_2;
    unk32 temp_r1;
    unk32 temp_r4;
    AllocatedBlock* temp_r0_3;
    unk8* temp_r1_2;
    unk8* temp_r6;
    unk8* temp_r2;
    unk8* temp_r3;

    temp_r0 = arg1 * arg0;
    temp_r1 = arg1 * 2;
    temp_r0_2 = (temp_r0 * 2) + temp_r1;
    temp_r4 = temp_r0_2 + 0x44;
    if ((arg1 & 3) != 0) {
        printf(Str_8755834);
    }
    temp_r0_3 = slowAllocate(temp_r4);
    if (temp_r0_3 == NULL) {
        printf(Str_8755884, temp_r4);
    }
    _unk3005DC4 = temp_r0_3->address;
    _unk3005DC4->unkC = temp_r0_3;
    _unk3005DC4->unk6 = arg2;
    _unk3005DC4->unk0 = 0;
    _unk3005DC4->unk1 = 0;
    _unk3005DC4->unk2 = 0;
    _unk3005DC4->unk4 = arg0;
    _unk3005DC4->unk3 = 0;
    _unk3005DC4->unk18 = arg1;
    _unk3005DC4->unk1C = 0;
    _unk3005DC4->unk20 = 0x10;
    _unk3005DC4->unk5 = 0;
    temp_r1_2 = temp_r0_3->address + 0x44;
    _unk3005DC4->unk24 = temp_r1_2;
    temp_r6 = temp_r1_2 + arg1;
    _unk3005DC4->unk28 = temp_r6;
    temp_r2 = temp_r0_3->address + temp_r1 + 0x44;
    _unk3005DC4->unk2C = temp_r2;
    temp_r3 = temp_r2 + temp_r0;
    _unk3005DC4->unk30 = temp_r3;
    _unk3005DC4->unk3C = temp_r1_2;
    _unk3005DC4->unk40 = temp_r6;
    _unk3005DC4->unk34 = temp_r2;
    _unk3005DC4->unk38 = temp_r3;
    __fastMemoryClearARM(0, temp_r1_2, temp_r0_2);
    *(vu16*)REG_RCNT = 0;
    *(vu16*)REG_SIOCNT = 0x2000;
    *(vu16*)REG_SIOCNT = arg2 | 0x4000 | *(vu16*)REG_SIOCNT;
    _unk3005DC4->unk10 = 0x400 - __divsi3(arg1 >> 1, 0x359E4);
    _unk3005DC4->unk14 = 0;
}
#endif

INCLUDE_ASM("asm/dump/8057b80-debug/805fed0-initMultiPlayer.s");

unk8 sub_805FFE4(void)
{
    MultiPlayerState* state;
    unk32 flags;
    unk32 newFlags;

    state = _unk3005DC4;
    flags = state->unk14;
    if ((flags & 1) == 0) {
        if ((*(vu16*)REG_SIOCNT & 8) == 0 || (*(vu16*)REG_SIOCNT & 0x80) != 0) {
            return 0;
        }
        newFlags = flags | 1;
        state->unk14 = newFlags;
        if ((*(vu16*)REG_SIOCNT & 4) == 0) {
            newFlags |= 8;
        } else {
            newFlags |= 0x10;
        }
        state->unk14 = newFlags;
    }
    return 1;
}

INCLUDE_ASM("asm/dump/8057b80-debug/806003c-nullsub_47.s");

unk32 sub_8060040(void)
{
    unk32 flags;

    flags = _unk3005DC4->unk14;
    if (flags & 8) {
        return 1;
    }
    if ((flags & 0x10) == 0) {
        printf(Str_87558B4);
    }
    return 0;
}

INCLUDE_ASM("asm/dump/8057b80-debug/8060070.s");

unk8 sub_806008C(void)
{
    if ((_unk3005DC4->unk14 & 0x100) != 0) {
        return 1;
    }
    return 0;
}

u8 isMultiplayer(void)
{
    return _unk3005DC4->unk2;
}

void sub_80600B4(void)
{
    unk32 size;
    unk32 zero;

    {
        MultiPlayerState* state;

        state = _unk3005DC4;
        size = state->unk18;
        size = (size + state->unk4 * size) * 2;
    }
    DisableInterrupt(0xC0);
    {
        MultiPlayerState* state;

        state = _unk3005DC4;
        zero = 0;
        state->unk0 = zero;
    }
    _unk3005DC4->unk1 = zero;
    _unk3005DC4->unk2 = zero;
    _unk3005DC4->unk3 = zero;
    _unk3005DC4->unk1C = zero;
    _unk3005DC4->unk14 = zero;
    _unk3005DC4->unk5 = zero;
    __fastMemoryClearARM(0, _unk3005DC4->unk24, size);
    {
        MultiPlayerState* state;

        state = _unk3005DC4;
        state->unk3C = state->unk24;
        state->unk40 = state->unk28;
        state->unk34 = state->unk2C;
        state->unk38 = state->unk30;
        *(vu16*)REG_SIOCNT = 0x2000;
        *(vu16*)REG_SIOCNT |= 0x4000 | state->unk6;
    }
    *(vu16*)REG_SIODATA8 = 0;
    *(vu16*)REG_SIOMULTI0 = 0;
    *(vu16*)REG_SIOMULTI1 = 0;
    *(vu16*)REG_SIOMULTI2 = 0;
    *(vu16*)REG_SIOMULTI3 = 0;
}

INCLUDE_ASM("asm/dump/8057b80-debug/806014c.s");

void sub_80603E8(void)
{
    if (_unk3005DC4->unk1C == 0) {
        _unk3005DC4->unk14 |= 0x400;
    }
}

INCLUDE_ASM("asm/dump/8057b80-debug/8060404.s");
INCLUDE_ASM("asm/dump/8057b80-debug/8060434.s");
INCLUDE_ASM("asm/dump/8057b80-debug/8060454-onSerialCommunication.s");
