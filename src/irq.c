#include <agb/macro.h>

#include "common.h"
#include "debug.h"
#include "main.h"
#include "ram.h"
#include "system.h"
#include "unsorted.h"

const void* const Unk_872CAF4[] = {
    onVBlank,
    nullsub_37,
    nullsub_31,
    nullsub_31,
    onTimer1Overflow,
    nullsub_31,
    nullsub_31,
    nullsub_31,
    nullsub_31,
    nullsub_31,
    nullsub_31,
    nullsub_31,
    nullsub_31,
    nullsub_31,
};

void sub_8057984(void)
{
    s32 i;
    for (i = 0; i < 14; i++) {
        printf("irq %i:\t%i\n", i, _unk3001110[i]);
    }
}

void InitStuff_SetDispStat(unk16 dispstat)
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
