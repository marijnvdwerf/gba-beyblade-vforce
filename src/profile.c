#include <agb/define.h>
#include <agb/memory_map.h>

#include "debug.h"
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

void profile(const char* name)
{
    s32 timer;
    float elapsed;
    float frameRate;
    unk32 scale;
    unk16 milliseconds;
    unk16 fraction;
    unk16 hundreds;
    unk16 tenths;
    unk16 ones;

    scale = 0;
    timer = (unk16) * (vu32*)REG_TM2CNT_L;
    *(vu32*)REG_TM2CNT_L = 0;
    switch (_unk3000150[0]) {
    case 1:
        frameRate = 3.814f;
        scale = 1000;
        break;
    case 2:
        frameRate = 15.256f;
        scale = 1000;
        break;
    case 3:
        frameRate = 61.025f;
        scale = 1000;
        break;
    case 0:
    default:
        frameRate = 59.595f;
        scale = 1000000;
        break;
    }
    elapsed = (float)timer * frameRate;
    elapsed /= scale;
    milliseconds = elapsed;
    fraction = (elapsed - milliseconds) * scale;
    hundreds = fraction / 100;
    tenths = (fraction / 10) % 10;
    ones = fraction % 10;
    printf("profile (%s): %d.%c%c%c ms\n", name, milliseconds, hundreds + '0', tenths + '0',
        ones + '0');
}
