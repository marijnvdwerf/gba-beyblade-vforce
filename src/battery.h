#ifndef _BATTERY_H
#define _BATTERY_H

#include "common.h"

typedef struct BackupBlock {
    unk32 magic;
    unk8 unk4;
    unk8 unk5;
    unk8 unk6;
    unk8 unk7;
} BackupBlock;

void initBatteryBackup(void);
u32 writeToBatteryBackup(BackupBlock*, u32, s32);
u32 readFromBatteryBackup(u16, BackupBlock*, s32);

#endif
