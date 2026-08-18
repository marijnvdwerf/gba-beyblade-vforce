#include <agb/bios.h>
#include <agb/macro.h>

#include "ram.h"

void CpuSet(void* Srcp, void* Destp, u32 DmaCntData)
{
    register void* p1 asm("r0") = Srcp;
    register void* p2 asm("r1") = Destp;
    register u32 p3 asm("r2") = DmaCntData;

    asm("swi 0xB;" ::"r"(p1), "r"(p2), "r"(p3));
}

s32 Div(s32 Number, s32 Denom)
{
    register s32 p1 asm("r0") = Number;
    register s32 p2 asm("r1") = Denom;

    asm("swi 0x6;" : "+r"(p1) : "r"(p2));

    return p1;
}

s32 DivRem(s32 Number, s32 Denom)
{
    register s32 p1 asm("r0") = Number;
    register s32 p2 asm("r1") = Denom;

    asm("swi 0x6;" : "+r"(p2) : "r"(p1));

    return p2;
}
ASM_ZEROPAD

void LZ77UnCompWram(void* Srcp, void* Destp)
{
    register void* p1 asm("r0") = Srcp;
    register void* p2 asm("r1") = Destp;

    asm("swi 0x11;" ::"r"(p1), "r"(p2));
}

u16 Sqrt(u32 x)
{
    register const u32 p1 asm("r0") = x;

    asm("swi 0x8" ::"r"(p1));
}

void VBlankIntrWait()
{
    asm("movs r2, #0; swi 0x5;");
}
ASM_ZEROPAD

void sub_80578E0()
{
    DmaClear(3, 0, EX_WRAM, EX_WRAM_SIZE, 32);
    DmaClear(3, 0, CPU_WRAM, 0x7e00, 32);
}

void sub_805791C()
{
    _unk3000E30[0] = 0;
    _unk3000E30[1] = 0;
    _unk3000E30[2] = 0x10;
}

void sub_8057930()
{
    _unk3000E30[1] = _unk3000E30[0];
    _unk3000E30[0] += _unk3000E30[2];
}
