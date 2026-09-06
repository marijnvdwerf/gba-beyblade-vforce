#include "packet.h"

#include "include_asm.h"
#include "multiplayer.h"
#include "ram.h"

unk8 sub_804393C(Packet* arg0)
{
    unk32 checksum;
    s32 i;
    const unk8* data;

    checksum = arg0->unk2_4;
    checksum += arg0->unk2_0;
    i = 0;
    data = arg0->unk4;
    do {
        checksum ^= (s8)data[i];
        i++;
    } while (i <= 0xB);
    return checksum;
}

void sub_8043960(Packet* arg0)
{
    arg0->unk3 = sub_804393C(arg0);
}

unk32 sub_8043970(Packet* arg0, unk8 arg1)
{
    if (arg0->unk3 == sub_804393C(arg0) && arg0->unk2_0 == arg1) {
        return 1;
    }
    sub_80603E8();
    return 0;
}

void sub_80439A0(FrontendSubobject* arg0)
{
    u8 index;
    const s16* table;

    arg0->unk24 = 0;
    table = Unk_874CC3C;
    index = _unk3000E30[0] >> 6;
    arg0->unk14 = table[index] * 2 - 0x100;
    arg0->unk18 = Unk_874CC3C[index + 0x40] * 2 + 0x200;
    arg0->unk7C |= 3;
}

INCLUDE_ASM("asm/dump/8040d18/80439f4.s");
