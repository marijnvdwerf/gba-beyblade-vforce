#include "bios.h"

void CpuSet(const void* source, void* destination, u32 mode)
{
    register const void* p1 asm("r0") = source;
    register void* p2 asm("r1") = destination;
    register u32 p3 asm("r2") = mode;

    asm("swi 0xB;" ::"r"(p1), "r"(p2), "r"(p3));
}

s32 Div(s32 divisor, s32 number)
{
    register s32 p1 asm("r0") = divisor;
    register s32 p2 asm("r1") = number;

    asm("swi 0x6;" : "+r"(p1) : "r"(p2));

    return p1;
}

s32 Mod(s32 divisor, s32 number)
{
    register s32 p1 asm("r0") = divisor;
    register s32 p2 asm("r1") = number;

    asm("swi 0x6;" : "+r"(p2) : "r"(p1));

    return p2;
}
ASM_ZEROPAD

void Lz77UnCompWram(const void* source, void* destination)
{
    register const void* p1 asm("r0") = source;
    register void* p2 asm("r1") = destination;

    asm("swi 0x11;" ::"r"(p1), "r"(p2));
}

u16 Sqrt(u32 x)
{
    register const u32 p1 asm("r0") = x;

    asm("swi 0x8" ::"r"(p1));
}

void VBlankIntrWait() { asm("movs r2, #0; swi 0x5;"); }
ASM_ZEROPAD
