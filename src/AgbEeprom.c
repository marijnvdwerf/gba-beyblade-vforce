#include "AgbEeprom.h"

#include <agb/define.h>
#include <agb/memory_map.h>

#include "include_asm.h"

static const u8 AgbLibEeprom_ver[12] = "EEPROM_V122";

static const eepromType eeprom_list[2] = {
    { 0x200, 0x40, 0x300, 6 }, /* 4Kbit */
    { 0x2000, 0x400, 0x300, 14 }, /* 64Kbit */
};

static const u16 epMaxTime[3] = { 10, 0xFFBD, 0xC2 };

static u8 timer_No;
static u16 timer_Count;
static u8 timeoutFlag;
static vu16* timerReg;
static u16 shelt_ime;

const eepromType* eeprom;

u16 IdentifyEeprom(u16 eeprom_KbitSize)
{
    u16 result;

    result = 0;
    if (eeprom_KbitSize == 4) {
        eeprom = &eeprom_list[0];
    } else if (eeprom_KbitSize == 0x40) {
        eeprom = &eeprom_list[1];
    } else {
        eeprom = &eeprom_list[0];
        result = 1;
    }
    return result;
}

void EepromTimerIntr()
{
    if (timer_Count != 0) {
        if (--timer_Count == 0) {
            timeoutFlag = 1;
        }
    }
}

u16 SetEepromTimerIntr(u8 timerNo, void (**IntrFunc)(void))
{
    if (timerNo > 3) {
        return 1;
    }
    timer_No = timerNo;
    timerReg = (vu16*)(REG_TM0CNT + timer_No * 4);
    *IntrFunc = EepromTimerIntr;
    return 0;
}

void StartEepromTimer(const u16* maxTime)
{
    shelt_ime = *(vu16*)REG_IME;
    *(vu16*)REG_IME = 0;
    timerReg[1] = 0;
    *(vu16*)REG_IF = TIMER0_INTR_FLAG << timer_No;
    *(vu16*)REG_IE |= TIMER0_INTR_FLAG << timer_No;
    timeoutFlag = 0;
    timer_Count = *maxTime++;
    *timerReg++ = *maxTime++;
    *timerReg-- = *maxTime++;
    *(vu16*)REG_IME = 1;
}

void StopEepromTimer()
{
    *(vu16*)REG_IME = 0;
    *timerReg++ = 0;
    *timerReg-- = 0;
    *(vu16*)REG_IE &= ~(TIMER0_INTR_FLAG << timer_No);
    *(vu16*)REG_IME = shelt_ime;
}

void Dma3Transmit(u16* src, u16* dst, u16 trmCount)
{
    u16 shelt_ime2;

    shelt_ime2 = *(vu16*)REG_IME;
    *(vu16*)REG_IME = 0;
    *(vu16*)REG_WAITCNT = (*(vu16*)REG_WAITCNT & 0xF8FF) | eeprom->agbWait;
    *(vu32*)REG_DMA3SAD = (u32)src;
    *(vu32*)REG_DMA3DAD = (u32)dst;
    *(vu32*)REG_DMA3CNT = trmCount | DMA_ENABLE;
    while (*(vu16*)REG_DMA3CNT_H & (DMA_ENABLE >> 16)) { }
    *(vu16*)REG_IME = shelt_ime2;
}

u16 ReadEepromDword(u16 epAdr, u16* dst)
{
    u8 i;
    u8 j;
    u16* commp;
    u16 data;
    u16 buff[68];

    if (epAdr >= eeprom->adrCount) {
        return 0x80FF;
    }
    commp = buff;
    (u8*)commp += ((eeprom->adrBit << 1) + 1);
    ((u8*)commp)++;
    for (i = 0; i < eeprom->adrBit; i++) {
        *commp-- = epAdr;
        epAdr >>= 1;
    }
    *commp-- = 1;
    *commp = 1;
    Dma3Transmit(buff, (u16*)0x0D000000, eeprom->adrBit + 3);
    Dma3Transmit((u16*)0x0D000000, buff, 68);
    commp = buff + 4;
    dst += 3;
    for (i = 0; i < 4; i++) {
        data = 0;
        for (j = 0; j < 16; j++) {
            data <<= 1;
            data |= *commp++ & 1;
        }
        *dst-- = data;
    }
    return 0;
}

u16 ProgramEepromDword(u16 epAdr, u16* src)
{
    u8 i;
    u8 j;
    u16* commp;
    u16 data;
    u16 result;
    u16 buff[81];

    if (epAdr >= eeprom->adrCount) {
        return 0x80FF;
    }
    commp = buff;
    (u8*)commp += ((eeprom->adrBit << 1) + 0x83);
    ((u8*)commp)++;
    *commp-- = 0;
    for (i = 0; i < 4; i++) {
        data = *src++;
        for (j = 0; j < 16; j++) {
            *commp-- = data;
            data >>= 1;
        }
    }
    for (i = 0; i < eeprom->adrBit; i++) {
        *commp-- = epAdr;
        epAdr >>= 1;
    }
    *commp-- = 0;
    *commp = 1;
    Dma3Transmit(buff, (u16*)0x0D000000, eeprom->adrBit + 0x43);
    StartEepromTimer(epMaxTime);
    result = 0;
    while ((*(vu16*)0x0D000000 & 1) == 0) {
        if (timeoutFlag != 0) {
            if ((*(vu16*)0x0D000000 % 2) == 0) {
                result = 0xC001;
            }
            break;
        }
    }
    StopEepromTimer();
    return result;
}

u16 VerifyEepromDword(u16 epAdr, u16* src)
{
    u8 i;
    u16 rddata[4];
    u16* rdp;
    u16 result;

    result = 0;
    if (epAdr >= eeprom->adrCount) {
        return 0x80FF;
    }
    ReadEepromDword(epAdr, rddata);
    rdp = rddata;
    for (i = 0; i < 4; i++) {
        if (*src++ != *rdp++) {
            result = 0x8000;
            break;
        }
    }
    return result;
}

u16 sub_8065BD4(u16 epAdr, u16* src)
{
    u16 result;
    u8 retries;

    retries = 0;
    while (retries <= 2) {
        result = ProgramEepromDword(epAdr, src);
        if (result == 0) {
            result = VerifyEepromDword(epAdr, src);
        }
        if (result == 0) {
            break;
        }
        retries++;
    }
    return result;
}

ASM_ZEROPAD
