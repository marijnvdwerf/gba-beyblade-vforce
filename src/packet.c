#include "packet.h"

#include "include_asm.h"
#include "ram.h"

INCLUDE_ASM("asm/dump/8040d18/804393c.s");
unk8 sub_804393C(FrontendSubobject*);

void sub_8043960(FrontendSubobject* arg0)
{
    arg0->unk0.bytes[3] = sub_804393C(arg0);
}

void sub_80603E8(void);

unk32 sub_8043970(FrontendSubobject* arg0, unk8 arg1)
{
    if (arg0->unk0.bytes[3] == sub_804393C(arg0) && arg0->unk0.fields.unk2_0 == arg1) {
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
