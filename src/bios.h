#ifndef _BIOS_H
#define _BIOS_H

#include "common.h"

void VBlankIntrWait(void);
s32 Div(s32, s32);
s32 DivRem(s32, s32);
void sub_8057930(void);

#endif /* _BIOS_H */
