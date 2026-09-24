#ifndef _AGB_EEPROM_H
#define _AGB_EEPROM_H

#include "common.h"

/* Nintendo AGB backup library: 4K/64Kbit EEPROM driver (AgbEeprom.o, EEPROM_V122) */

typedef struct eepromTypeTag {
    u32 size; /* Byte size */
    u16 adrCount; /* Total number of addresses */
    u16 agbWait; /* Game pak bus (ROM2) read/write wait */
    u8 adrBit; /* Number of address bits at DMA transfer time */
} eepromType;

extern const eepromType* eeprom;

u16 IdentifyEeprom(u16 eeprom_KbitSize);
void EepromTimerIntr(void);
u16 SetEepromTimerIntr(u8 timerNo, void (**IntrFunc)(void));
void StartEepromTimer(const u16* maxTime);
void StopEepromTimer(void);
void Dma3Transmit(u16* src, u16* dst, u16 trmCount);
u16 ReadEepromDword(u16 epAdr, u16* dst);
u16 ProgramEepromDword(u16 epAdr, u16* src);
u16 VerifyEepromDword(u16 epAdr, u16* src);
u16 sub_8065BD4(u16 epAdr, u16* src);

#endif
