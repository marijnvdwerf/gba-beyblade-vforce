#include "common.h"
#include "io_reg.h"
#include "macro.h"
#include "ram.h"
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

    REG_IME = 1;
    REG_IE = 0;
    REG_IF = 0;
    REG_DISPSTAT = dispstat;

    DmaCopy32(3, Unk_872CAF4, 0x3000DF0, 56);

    i = 13;
    while (true) {
        i--;
        if (i < 0) {
            return;
        }
    }
}