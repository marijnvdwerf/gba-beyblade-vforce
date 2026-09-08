#include "iwram.h"

#include "include_asm.h"
#include "ram.h"

unk32 ARM_sub_87569F4(UnkStruct_87569F4* arg0, unk32 arg1)
{
    unk32 result = arg0->unk24;
    unk32 current = _unk3005E74;
    if (current - result > 0x3FFu) {
        unk32 offset = current & 0x3FFu;
        if (offset + (arg1 >> 5) > 0x400u || offset < _unk3005E6C) {
            _unk3005E74 = ((current + 0x400u) & ~0x3FFu) + _unk3005E6C;
        }
        result = _unk3005E74;
        _unk3005E74 = result + (arg1 >> 5);
    }
    return result;
}

INCLUDE_ASM("asm/dump/8756a00-iwram/8756a84-arm_sub_8756a84.s");
INCLUDE_ASM("asm/dump/8756a00-iwram/8756cc0-oam_8756cc0.s");
INCLUDE_ASM("asm/dump/8756a00-iwram/8756fc0-sub_8756fc0.s");
INCLUDE_ASM("asm/dump/8756a00-iwram/8757380-sub_8757380.s");
INCLUDE_ASM("asm/dump/8756a00-iwram/8757494-sub_8757494.s");
INCLUDE_ASM("asm/dump/8756a00-iwram/8757574-sub_8757574.s");
INCLUDE_ASM("asm/dump/8756a00-iwram/87576d8-sub_87576d8.s");
INCLUDE_ASM("asm/dump/8756a00-iwram/87577b4-sub_87577b4.s");
INCLUDE_ASM("asm/dump/8756a00-iwram/8757a64-sound_8757a64.s");
INCLUDE_ASM("asm/dump/8756a00-iwram/3006fac-fastmemorycleararm.s");
INCLUDE_ASM("asm/dump/8756a00-iwram/3007034-fastmemorycopyarm.s");
INCLUDE_ASM("asm/dump/8756a00-iwram/30070b8-fastmemoryclear16arm.s");
INCLUDE_ASM("asm/dump/8756a00-iwram/300711c-fastmemorycopy16arm.s");
INCLUDE_ASM("asm/dump/8756a00-iwram/8757cd0-sub_8757cd0.s");
INCLUDE_ASM("asm/dump/8756a00-iwram/8757d24-sub_8757d24.s");
INCLUDE_ASM("asm/dump/8756a00-iwram/8757e4c-sub_8757e4c.s");
INCLUDE_ASM("asm/dump/8756a00-iwram/8757fcc-sub_8757fcc.s");
