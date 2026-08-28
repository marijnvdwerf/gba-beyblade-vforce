#include "backup.h"

#include <agb/define.h>
#include <agb/memory_map.h>

#include "include_asm.h"

unk16 initBatteryBackup(u16 arg0)
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

unk32 sub_806586C(u8 timerIndex, void** isrOut)
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

#if 0
unk32 sub_80659F0(u16 sector, void* buffer)
{
    unk16* temp;
    unk16* tempPtr;
    unk32 i;
    unk32 value;
    BatteryBackupConfig* config;

    config = _unk3005E9C;
    if (sector >= config->unk4) {
        return 0x80FF;
    }
    temp = (unk16*)buffer;
    tempPtr = temp + config->unk8 + 2;
    i = 0;
    while (i < config->unk8) {
        *tempPtr = sector;
        tempPtr--;
        sector >>= 1;
        i++;
    }
    *tempPtr = 1;
    tempPtr--;
    *tempPtr = 1;
    DMA3Copy(buffer, (void*)0x0D000000, config->unk8 + 3);
    DMA3Copy((void*)0x0D000000, buffer, 0x44);
    for (i = 0; i < 0x40; i++) {
        ((unk16*)buffer)[i] = ((unk16*)buffer)[i];
    }
    value = 0;
    for (i = 0; i < 4; i++) {
        value |= (((unk16*)buffer)[i + 4] & 1) << i;
    }
    ((unk16*)buffer)[0] = value;
    return 0;
}
#else
INCLUDE_ASM("asm/dump/8064f38/80659f0.s");
#endif
INCLUDE_ASM("asm/dump/8064f38/8065aa0.s");

unk32 writeToBatteryBackup(u16 sector, unk16* data)
{
    unk16 buffer[4];
    u8 i;
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

u16 sub_8065BD4(u16 sector, u32 data)
{
    u16 result;
    u8 retries;

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
