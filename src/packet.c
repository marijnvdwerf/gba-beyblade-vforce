#include "packet.h"

#include "include_asm.h"

INCLUDE_ASM("asm/dump/8040d18/804393c.s");
INCLUDE_ASM("asm/dump/8040d18/8043960.s");
INCLUDE_ASM("asm/dump/8040d18/8043970.s");

void sub_80439A0(FrontendSubobject* arg0)
{
    unk8 index;
    unk8* table;

    arg0->unk24 = 0;
    table = (unk8*)Unk_874CC3C;
    index = _unk3000E30[0] >> 6;
    arg0->unk14 = *(s16*)(table + (index << 1)) * 2 - 0x100;
    arg0->unk18 = *(s16*)(table + ((index + 0x40) << 1)) * 2 + 0x200;
    arg0->unk7C |= 3;
}

INCLUDE_ASM("asm/dump/8040d18/80439f4.s");
