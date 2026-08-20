#include <agb/macro.h>

#include "common.h"
#include "ram.h"
#include "system.h"
#include "unsorted.h"

extern u8 const Str_872CB2C[];

extern const void* const Unk_872CAF4[];

void sub_8057984(void)
{
    int i;
    for (i = 0; i < 14; i++) {
        // printf("irq %i:\t%i\n", i, _unk3001110[i]);
        printf(Str_872CB2C, i, _unk3001110[i]);
    }
}

void InitStuff_SetDispStat(u16 dispstat)
{
    s32 i;

    *(vu16*)REG_IME = 1;
    *(vu16*)REG_IE = 0;
    *(vu16*)REG_IF = 0;
    *(vu16*)REG_STAT = dispstat;

    DmaCopy(3, Unk_872CAF4, _unk3000DF0, 14 * 4, 32);

    i = 13;
    while (true) {
        i--;
        if (i < 0) {
            return;
        }
    }
}