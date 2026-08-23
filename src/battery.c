#include "battery.h"

#include "backup.h"
#include "common.h"
#include "debug.h"
#include "ram.h"

extern const unk8 Str_872C8E4[];
extern const unk8 Str_872C928[];
extern const unk8 Str_872C960[];

void initBattery(void)
{
    if (initBatteryBackup(0x40)) {
        printf(Str_872C8E4);
    }
    sub_806586C(2, &_unk3000DF0[5]);
}

u32 sub_80574D0(BackupBlock* data, u32 index, s32 size)
{
    u32 result;
    u16 retry;
    u16 batteryIndex;
    s32 blockCount;
    u16 writeResult;

    batteryIndex = index;
    result = 1;
    blockCount = (size + 7) >> 3;
    for (blockCount--; blockCount != -1; blockCount--) {
        for (retry = 7; retry != 0xFFFF; retry--) {
            if (sub_8065AA0(batteryIndex, (unk32)data) == 0) {
                writeResult = writeToBatteryBackup(batteryIndex, (unk16*)data);
                if (writeResult == 0) {
                    retry = 0;
                }
            }
        }
        if (writeResult != 0) {
            printf(Str_872C928, batteryIndex);
            result = 0;
            blockCount = 0;
        }
        data++;
        batteryIndex++;
    }
    return result;
}

u32 sub_8057568(u16 index, BackupBlock* data, s32 size)
{
    u32 result;
    s32 blockCount;
    u16 retry;
    u16 readResult;

    result = 1;
    blockCount = (size + 7) >> 3;
    for (blockCount--; blockCount != -1; blockCount--) {
        for (retry = 7; retry != 0xFFFF; retry--) {
            readResult = sub_80659F0(index, data);
            if (readResult == 0) {
                retry = 0;
            }
        }
        if (readResult != 0) {
            printf(Str_872C960, index);
            result = 0;
            blockCount = 0;
        }
        data++;
        index++;
    }
    return result;
}
