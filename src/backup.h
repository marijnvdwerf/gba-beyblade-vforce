#ifndef _BACKUP_H
#define _BACKUP_H

#include "common.h"

typedef struct BatteryBackupConfig {
    unk32 unk0; /* 0x00 */
    unk16 unk4; /* 0x04 */
    unk16 unk6; /* 0x06 */
    unk8 unk8; /* 0x08 */
    unk8 unk9; /* 0x09 */
    unk8 unkA; /* 0x0A */
    unk8 unkB; /* 0x0B */
} BatteryBackupConfig; /* size: 0x0C */

extern const BatteryBackupConfig* _unk_3005E9C;

extern unk8 _batteryBackupTimer; /* 0x03000DA8 — timer index (0-3) */
extern unk16 _unk_3000DAA; /* 0x03000DAA — countdown ticks */
extern unk8 _unk_3000DAC; /* 0x03000DAC — completion flag */
extern volatile unk16* volatile _batteryBackupTimer_REG; /* 0x03000DB0 — &REG_TMxCNT_L */
extern unk16 _unk_3000DB4; /* 0x03000DB4 — saved IME */

extern const BatteryBackupConfig Unk_875687C;
extern const BatteryBackupConfig Unk_8756888;

typedef struct TimerConfig {
    unk16 unk0; /* 0x00 */
    unk16 unk2; /* 0x02 */
    unk16 unk4; /* 0x04 */
} TimerConfig; /* size: 0x06 */

extern const TimerConfig Unk_8756894;

unk16 initBatteryBackup(unk16 arg0);
void onTimer2Overflow(void);
unk32 sub_806586C(unk8 timerIndex, void** isrOut);
void sub_80658A4(const TimerConfig* config);
void sub_806592C(void);
void DMA3Copy(unk32 src, unk32 dst, unk16 count);
unk32 sub_80659F0(unk16 sector, void* buffer);
unk16 sub_8065AA0(unk16 sector, unk32 data);
unk32 writeToBatteryBackup(unk16 sector, unk16* data);
unk16 sub_8065BD4(unk16 sector, unk32 data);

#endif /* _BACKUP_H */
