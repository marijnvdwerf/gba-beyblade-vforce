#ifndef _BACKUP_H
#define _BACKUP_H

#include "common.h"

typedef struct BatteryBackupConfig {
    unk32 unk0; /* 0x00 */
    u16 unk4; /* 0x04 */
    unk16 unk6; /* 0x06 */
    unk8 unk8; /* 0x08 */
    unk8 unk9; /* 0x09 */
    unk8 unkA; /* 0x0A */
    unk8 unkB; /* 0x0B */
} BatteryBackupConfig; /* 0x0C */

extern const BatteryBackupConfig* _unk_3005E9C;

extern u8 _batteryBackupTimer;
extern u16 _unk_3000DAA;
extern unk8 _unk_3000DAC;
extern volatile unk16* volatile _batteryBackupTimer_REG;
extern unk16 _unk_3000DB4;

extern const BatteryBackupConfig Unk_875687C;
extern const BatteryBackupConfig Unk_8756888;

typedef struct TimerConfig {
    unk16 unk0; /* 0x00 */
    unk16 unk2; /* 0x02 */
    unk16 unk4; /* 0x04 */
} TimerConfig; /* 0x06 */

extern const TimerConfig Unk_8756894;

unk16 initBatteryBackup(u16 arg0);
void onTimer2Overflow(void);
unk32 sub_806586C(u8 timerIndex, void (**isrOut)(void));
void sub_80658A4(const unk16* config);
void sub_806592C(void);
void DMA3Copy(unk32 src, unk32 dst, unk16 count);
unk32 sub_80659F0(u16 sector, void* buffer);
u16 sub_8065AA0(u16 sector, u32 data);
unk32 writeToBatteryBackup(u16 sector, unk16* data);
u16 sub_8065BD4(u16 sector, u32 data);

#endif
