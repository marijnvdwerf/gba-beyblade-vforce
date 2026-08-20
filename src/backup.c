#include "backup.h"

#include <agb/define.h>
#include <agb/memory_map.h>

#include "include_asm.h"

unk32 initBatteryBackup(unk16 arg0)
{
    unk32 result;

    result = 0;
    if (arg0 == 4) {
        _unk_3005E9C = &Unk_875687C;
    } else if (arg0 == 0x40) {
        _unk_3005E9C = &Unk_8756888;
    } else {
        _unk_3005E9C = &Unk_875687C;
        result = 1;
    }
    return result;
}

void onTimer2Overflow(void)
{
    unk32 value;

    if (_unk_3000DAA != 0) {
        value = _unk_3000DAA - 1;
        _unk_3000DAA = value;
        if ((value << 16) == 0) {
            _unk_3000DAC = 1;
        }
    }
}

unk32 sub_806586C(unk8 timerIndex, void** isrOut)
{
    if (timerIndex > 3) {
        return 1;
    }
    _batteryBackupTimer = timerIndex;
    _batteryBackupTimer_REG = (volatile unk16*)(REG_TM0CNT + _batteryBackupTimer * 4);
    *isrOut = onTimer2Overflow;
    return 0;
}

INCLUDE_ASM("asm/dump/8064f38/80658a4.s");

void sub_806592C(void)
{
    void* ptr;

    *(vu16*)REG_IME = 0;
    ptr = (void*)_batteryBackupTimer_REG;
    *(vu16*)ptr = 0;
    ptr += 2;
    _batteryBackupTimer_REG = ptr;
    *(vu16*)ptr = 0;
    ptr -= 2;
    _batteryBackupTimer_REG = ptr;
    *(vu16*)REG_IE &= ~(8 << *(vu8*)&_batteryBackupTimer);
    *(vu16*)REG_IME = _unk_3000DB4;
}

INCLUDE_ASM("asm/dump/8064f38/8065970-DMA3Copy.s");

INCLUDE_ASM("asm/dump/8064f38/80659f0.s");
INCLUDE_ASM("asm/dump/8064f38/8065aa0.s");

unk32 writeToBatteryBackup(unk16 sector, unk16* data)
{
    unk16 buffer[4];
    unk8 i;
    unk16* bufferPtr;
    unk32 result;

    result = 0;
    if (sector >= _unk_3005E9C->unk4) {
        return 0x80FF;
    }
    sub_80659F0(sector, buffer);
    bufferPtr = buffer;
    for (i = 0; i <= 3; i++) {
        unk16 dataValue;
        unk16 bufferValue;

        dataValue = *data;
        bufferValue = *bufferPtr;
        bufferPtr++;
        data++;
        if (dataValue != bufferValue) {
            result = 0x8000;
            break;
        }
    }
    return result;
}

unk16 sub_8065BD4(unk16 sector, unk32 data)
{
    unk16 result;
    unk8 retries;

    retries = 0;
    while (retries <= 2) {
        result = sub_8065AA0(sector, data);
        if (result == 0) {
            result = writeToBatteryBackup(sector, (unk16*)data);
        }
        if (result == 0) {
            break;
        }
        retries++;
    }
    return result;
}

asm(".align 2, 0");
