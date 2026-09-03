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
extern void (*__sub_8757FCC)(void);

void initMultiPlayer(unk32 numPlayers, s32 packetSize, unk16 serialMode)
{
    AllocatedBlock* block;
    unk8* bufA;
    unk8* bufB;
    unk8* bufC;
    unk8* bufD;
    unk32 totalPackets;
    unk32 headerSize;
    unk32 totalSize;
    unk32 allocSize;

    totalPackets = packetSize * numPlayers;
    totalSize = totalPackets * 2 + packetSize * 2;
    headerSize = packetSize * 2;
    allocSize = totalSize + 0x44;
    if ((packetSize & 3) != 0) {
        printf(Str_8755834);
    }
    block = slowAllocate(allocSize);
    if (block == NULL) {
        printf(Str_8755884, allocSize);
    }
    _unk3005DC4 = block->address;
    _unk3005DC4->unkC = block;
    _unk3005DC4->unk6 = serialMode;
    _unk3005DC4->unk0 = 0;
    _unk3005DC4->unk1 = 0;
    _unk3005DC4->unk2 = 0;
    _unk3005DC4->unk4 = numPlayers;
    _unk3005DC4->unk3 = 0;
    _unk3005DC4->unk18 = packetSize;
    _unk3005DC4->unk1C = 0;
    _unk3005DC4->unk20 = 0x10;
    _unk3005DC4->unk5 = 0;
    _unk3005DC4->unk24 = (unk8*)block->address + 0x44;
    bufA = _unk3005DC4->unk24;
    bufB = (unk8*)bufA + packetSize;
    _unk3005DC4->unk28 = bufB;
    bufC = (unk8*)block->address + (headerSize + 0x44);
    _unk3005DC4->unk2C = bufC;
    bufD = (unk8*)bufC + totalPackets;
    _unk3005DC4->unk30 = bufD;
    _unk3005DC4->unk3C = (unk16*)bufA;
    _unk3005DC4->unk40 = bufB;
    _unk3005DC4->unk34 = bufC;
    _unk3005DC4->unk38 = bufD;
    __fastMemoryClearARM(0, bufA, totalSize);
    *(vu16*)REG_RCNT = 0;
    *(vu16*)REG_SIOCNT = 0x2000;
    *(vu16*)REG_SIOCNT |= serialMode | 0x4000;
    _unk3005DC4->unk10 = 0x10000 - 0x359E4 / (packetSize >> 1);
    _unk3005DC4->unk14 = 0;
}

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

#if 0
extern void (*__sub_8757CD0)(void);
extern void (*__sub_8757D24)(void);
void sub_8060404(void);
void onSerialCommunication(void);

unk32 sub_806014C(unk8* arg0, unk8* arg1, unk8 arg2)
{
    unk32 flags;
    unk8 newCounter;
    unk32 localFlag;
    unk8 player;
    unk16 matchCount;

    player = _unk3005DC4->unk3;
    flags = _unk3005DC4->unk14;
    if ((flags & 0x100) != 0) {
        return 0;
    }

    if ((flags & 0xC0) != 0) {
        localFlag = 0;
        newCounter = _unk3005DC4->unk5 + 1;
    } else {
        newCounter = flags & 0x400;
        localFlag = 1;
        if (newCounter != 0) {
            newCounter = _unk3005DC4->unk5 + 1;
        }
    }

    _unk3005DC4->unk5 = newCounter;
    if (_unk3005DC4->unk5 > 0x3B) {
        _unk3005DC4->unk14 |= 0x100;
        return 0;
    }

    flags = _unk3005DC4->unk14 & 0xFFFFFBBF;
    _unk3005DC4->unk14 = flags;
    if ((flags & 0x80) != 0) {
        _unk3005DC4->unk1C++;
        flags &= 0xFFFFFF7F;
        _unk3005DC4->unk14 = flags;
        if (_unk3005DC4->unk1C >= _unk3005DC4->unk20) {
            _unk3005DC4->unk14 = flags | 0x100;
            return 0;
        }
    } else {
        _unk3005DC4->unk1C = 0;
    }

    if ((_unk3005DC4->unk14 & 2) == 0) {
        matchCount = 0;
        *(vu16*)REG_SIOMLT_SEND = 0xDEAF;
        if (sub_8060040() != 0) {
            if (*(vu16*)REG_SIOMULTI0 == 0xDEAF) {
                matchCount = 1;
            }
            if (*(vu16*)REG_SIOMULTI1 == 0xDEAF) {
                matchCount++;
            }
            if (_unk3005DC4->unk4 > 2 && *(vu16*)REG_SIOMULTI2 == 0xDEAF) {
                matchCount++;
            }
            if (_unk3005DC4->unk4 > 3 && *(vu16*)REG_SIOMULTI3 == 0xDEAF) {
                matchCount++;
            }
            if (matchCount >= _unk3005DC4->unk4) {
                sub_8060404();
                return localFlag;
            }
            *(vu16*)REG_SIOCNT |= 0x80;
            _unk3005DC4->unk14 |= 0x200;
        } else if ((_unk3005DC4->unk14 & 4) == 0) {
            _unk3005DC4->unk14 |= 4;
            _unk3000DF0[7] = onSerialCommunication;
            EnableInterrupt(0x80);
        }
        return localFlag;
    }

    if (sub_8060040() != 0) {
        if ((_unk3005DC4->unk14 & 0x200) == 0) {
            return 0;
        }
        _unk3005DC4->unk14 &= 0xFFFFFDFF;
        _unk3005DC4->unk0 = 0;
        __fastMemoryCopyARM(arg1, _unk3005DC4->unk24, _unk3005DC4->unk18);
        _unk3005DC4->unk3C = _unk3005DC4->unk24;
        _unk3000DF0[6] = __sub_8757D24;
        *(vu16*)REG_SIOCNT = _unk3005DC4->unk10;
        *(vu16*)REG_RCNT = 0xC0;
        EnableInterrupt(0x40);
        (*__sub_8757CD0)();
        if (localFlag != 0 || arg2 != 0) {
            __fastMemoryCopyARM(_unk3005DC4->unk38, arg0, player * _unk3005DC4->unk18);
        }
        return localFlag;
    }

    if (localFlag != 0 || arg2 != 0) {
        __fastMemoryCopyARM(_unk3005DC4->unk38, arg0, player * _unk3005DC4->unk18);
    }
    __fastMemoryCopyARM(arg1, _unk3005DC4->unk40, _unk3005DC4->unk18);
    if ((_unk3005DC4->unk14 & 0x20) != 0) {
        _unk3005DC4->unk1C = 0;
    } else {
        _unk3005DC4->unk14 |= 0x80;
    }
    _unk3005DC4->unk14 &= 0xFFFFFFDE;
    return localFlag;
}
#endif

INCLUDE_ASM("asm/dump/8057b80-debug/806014c.s");

void sub_80603E8(void)
{
    if (_unk3005DC4->unk1C == 0) {
        _unk3005DC4->unk14 |= 0x400;
    }
}

void sub_8060404(void)
{
    _unk3005DC4->unk2 = (*(vu16*)REG_SIOCNT >> 4) & 3;
    if (_unk3005DC4->unk2 < _unk3005DC4->unk4) {
        _unk3005DC4->unk3 = _unk3005DC4->unk4;
        _unk3005DC4->unk14 |= 2;
    }
}

INCLUDE_ASM("asm/dump/8057b80-debug/8060434.s");

void onSerialCommunication(void)
{
    MultiPlayerState* state;
    unk16 matchCount;

    matchCount = 0;
    if (*(vu16*)REG_SIOMULTI0 == 0xDEAF) {
        matchCount = 1;
    }
    if (*(vu16*)REG_SIOMULTI1 == 0xDEAF) {
        matchCount++;
    }
    if (*(vu16*)REG_SIOMULTI2 == 0xDEAF) {
        matchCount++;
    }
    if (*(vu16*)REG_SIOMULTI3 == 0xDEAF) {
        matchCount++;
    }
    state = _unk3005DC4;
    if (matchCount >= state->unk4) {
        _unk3000DF0[7] = __sub_8757FCC;
        *(vu16*)REG_SIODATA8 = *state->unk3C;
        sub_8060404();
    }
}
