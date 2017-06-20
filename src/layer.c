#include "common.h"
#include "io_reg.h"

vu16* GetBGLayerHOffsetPtr(u8 layer)
{
    switch (layer) {
    case 0:
        return &REG_BG0HOFS;

    case 1:
        return &REG_BG1HOFS;

    case 2:
        return &REG_BG2HOFS;

    case 3:
        return &REG_BG3HOFS;
    }
}

vu16* GetBGLayerVOffsetPtr(u8 layer)
{
    switch (layer) {
    case 0:
        return &REG_BG0VOFS;

    case 1:
        return &REG_BG1VOFS;

    case 2:
        return &REG_BG2VOFS;

    case 3:
        return &REG_BG3VOFS;
    }
}

vu16* GetBGLayerCntPtr(u8 layer)
{
    switch (layer) {
    case 0:
        return &REG_BG0CNT;

    case 1:
        return &REG_BG1CNT;

    case 2:
        return &REG_BG2CNT;

    case 3:
        return &REG_BG3CNT;
    }
}

void SetBGOffset(u8 layer, s32 x, s32 y)
{
    switch (layer) {
    case 2:
        REG_BG2X_L = x;
        REG_BG2X_H = x >> 16;
        REG_BG2Y_L = y;
        REG_BG2Y_H = y >> 16;
        break;
    case 3:
        REG_BG3X_L = x;
        REG_BG3X_H = x >> 16;
        REG_BG3Y_L = y;
        REG_BG3Y_H = y >> 16;
        break;
    }
}

void sub_8059AB8(u8 layer, u16 dx, u16 dmx, u16 dy, u16 dmy)
{

    switch (layer) {
    case 2:
        REG_BG2PA = dx;
        REG_BG2PB = dmx;
        REG_BG2PC = dy;
        REG_BG2PD = dmy;
        break;
    case 3:
        REG_BG3PA = dx;
        REG_BG3PB = dmx;
        REG_BG3PC = dy;
        REG_BG3PD = dmy;
        break;
    }
}

void ToggleLayerVisibility(u8 layer, bool8 enabled)
{
    if (enabled) {
        switch (layer) {
        case 0:
            REG_DISPCNT |= (1 << 8);
            break;

        case 1:
            REG_DISPCNT |= (1 << 9);
            break;

        case 2:
            REG_DISPCNT |= (1 << 10);
            break;

        case 3:
            REG_DISPCNT |= (1 << 11);
            break;
        }
    } else {
        switch (layer) {
        case 0:
            REG_DISPCNT &= ~(1 << 8);
            break;

        case 1:
            REG_DISPCNT &= ~(1 << 9);
            break;

        case 2:
            REG_DISPCNT &= ~(1 << 10);
            break;

        case 3:
            REG_DISPCNT &= ~(1 << 11);
            break;
        }
    }
}
