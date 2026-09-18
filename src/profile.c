#include <agb/define.h>
#include <agb/memory_map.h>

#include "include_asm.h"
#include "ram.h"

void sub_80431E8(unk8 arg0)
{
    switch (arg0) {
    case 0:
        *(vu32*)REG_TM2CNT_L = TMR_ENABLE | TMR_PRESCALER_1CK;
        break;
    case 1:
        *(vu32*)REG_TM2CNT_L = TMR_ENABLE | TMR_PRESCALER_64CK;
        break;
    case 2:
        *(vu32*)REG_TM2CNT_L = TMR_ENABLE | TMR_PRESCALER_256CK;
        break;
    case 3:
        *(vu32*)REG_TM2CNT_L = TMR_ENABLE | TMR_PRESCALER_1024CK;
        break;
    default:
        *(vu32*)REG_TM2CNT_L = TMR_ENABLE | TMR_PRESCALER_1CK;
        break;
    }
    _unk3000150[0] = arg0;
}

INCLUDE_ASM("asm/dump/8040d18/804323c-profile.s");
