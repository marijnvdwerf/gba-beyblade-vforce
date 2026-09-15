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
    if (_unk_3000DAA != 0) {
        if (--_unk_3000DAA == 0) {
            _unk_3000DAC = 1;
        }
    }
}

unk32 sub_806586C(u8 timerIndex, void (**isrOut)(void))
{
    if (timerIndex > 3) {
        return 1;
    }
    _batteryBackupTimer = timerIndex;
    _batteryBackupTimer_REG = (unk16*)(REG_TM0CNT + _batteryBackupTimer * 4);
    *isrOut = onTimer2Overflow;
    return 0;
}

void sub_80658A4(const unk16* config)
{
    _unk_3000DB4 = *(vu16*)REG_IME;
    *(vu16*)REG_IME = 0;
    _batteryBackupTimer_REG[1] = 0;
    *(vu16*)REG_IF = TIMER0_INTR_FLAG << _batteryBackupTimer;
    *(vu16*)REG_IE |= TIMER0_INTR_FLAG << _batteryBackupTimer;
    _unk_3000DAC = 0;
    _unk_3000DAA = *config++;
    *_batteryBackupTimer_REG++ = *config++;
    *_batteryBackupTimer_REG-- = *config++;
    *(vu16*)REG_IME = 1;
}

void sub_806592C(void)
{
    *(vu16*)REG_IME = 0;
    *_batteryBackupTimer_REG++ = 0;
    *_batteryBackupTimer_REG-- = 0;
    *(vu16*)REG_IE &= ~(TIMER0_INTR_FLAG << _batteryBackupTimer);
    *(vu16*)REG_IME = _unk_3000DB4;
}

void DMA3Copy(const void* src, void* dst, unk16 count)
{
    unk16 ime;

    ime = *(vu16*)REG_IME;
    *(vu16*)REG_IME = 0;
    *(vu16*)REG_WAITCNT = (*(vu16*)REG_WAITCNT & 0xF8FF) | _unk_3005E9C->unk6;
    *(vu32*)REG_DMA3SAD = (u32)src;
    *(vu32*)REG_DMA3DAD = (u32)dst;
    *(vu32*)REG_DMA3CNT = count | DMA_ENABLE;
    while (*(vu16*)REG_DMA3CNT_H & (DMA_ENABLE >> 16)) { }
    *(vu16*)REG_IME = ime;
}

unk32 sub_80659F0(u16 sector, unk16* data)
{
    unk16 buffer[0x44];
    unk16* ptr;
    u8 i;
    u8 j;
    unk16 value;

    if (sector >= _unk_3005E9C->unk4) {
        return 0x80FF;
    }
    ptr = buffer;
    (unk8*)ptr += ((_unk_3005E9C->unk8 << 1) + 1);
    ((unk8*)ptr)++;
    for (i = 0; i < _unk_3005E9C->unk8; i++) {
        *ptr-- = sector;
        sector >>= 1;
    }
    *ptr-- = 1;
    *ptr = 1;
    DMA3Copy(buffer, (void*)0x0D000000, _unk_3005E9C->unk8 + 3);
    DMA3Copy((void*)0x0D000000, buffer, 0x44);
    ptr = buffer + 4;
    data += 3;
    for (i = 0; i < 4; i++) {
        value = 0;
        for (j = 0; j < 16; j++) {
            value <<= 1;
            value |= *ptr++ & 1;
        }
        *data-- = value;
    }
    return 0;
}

u16 sub_8065AA0(u16 sector, unk16* data)
{
    unk16 buffer[0x52];
    u16 result;
    unk16* ptr;
    unk16 value;
    u8 i;
    u8 j;

    if (sector >= _unk_3005E9C->unk4) {
        return 0x80FF;
    }
    ptr = buffer;
    (unk8*)ptr += ((_unk_3005E9C->unk8 << 1) + 0x83);
    ((unk8*)ptr)++;
    *ptr-- = 0;
    for (i = 0; i < 4; i++) {
        value = *data++;
        for (j = 0; j < 16; j++) {
            *ptr-- = value;
            value >>= 1;
        }
    }
    for (i = 0; i < _unk_3005E9C->unk8; i++) {
        *ptr-- = sector;
        sector >>= 1;
    }
    *ptr-- = 0;
    *ptr = 1;
    DMA3Copy(buffer, (void*)0x0D000000, _unk_3005E9C->unk8 + 0x43);
    sub_80658A4(Unk_8756894);
    result = 0;
    while ((*(vu16*)0x0D000000 & 1) == 0) {
        if (_unk_3000DAC != 0) {
            if ((*(vu16*)0x0D000000 % 2) == 0) {
                result = 0xC001;
            }
            break;
        }
    }
    sub_806592C();
    return result;
}

unk32 writeToBatteryBackup(u16 sector, unk16* data)
{
    unk32 result;
    unk16 buffer[4];
    unk16* bufferPtr;
    u8 i;

    result = 0;
    if (sector >= _unk_3005E9C->unk4) {
        return 0x80FF;
    }
    sub_80659F0(sector, buffer);
    bufferPtr = buffer;
    for (i = 0; i < 4; i++) {
        if (*data++ != *bufferPtr++) {
            result = 0x8000;
            break;
        }
    }
    return result;
}

u16 sub_8065BD4(u16 sector, unk16* data)
{
    u16 result;
    u8 retries;

    retries = 0;
    while (retries <= 2) {
        result = sub_8065AA0(sector, data);
        if (result == 0) {
            result = writeToBatteryBackup(sector, data);
        }
        if (result == 0) {
            break;
        }
        retries++;
    }
    return result;
}

ASM_ZEROPAD
