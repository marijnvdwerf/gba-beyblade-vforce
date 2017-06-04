#ifndef _BIOS_H
#define _BIOS_H

#include "common.h"

void CpuSet(const void* source, void* destination, u32 mode);
s32 Div(s32 divisor, s32 number);
s32 Mod(s32 divisor, s32 number);
void Lz77UnCompWram(const void* source, void* destination);
u16 Sqrt(u32 x);
void VBlankIntrWait();

#endif // _BIOS_H
