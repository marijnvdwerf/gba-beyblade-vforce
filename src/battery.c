#include "battery.h"

#include "AgbEeprom.h"
#include "common.h"
#include "debug.h"
#include "ram.h"

void initBatteryBackup(void)
{
    if (IdentifyEeprom(0x40)) {
        printf("An error occured in initBatteryBackup(), calling IdentifyEeprom()\n");
    }
    SetEepromTimerIntr(2, &_unk3000DF0[5]);
}

u32 writeToBatteryBackup(BackupBlock* data, u32 index, s32 size)
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
            if (ProgramEepromDword(batteryIndex, (unk16*)data) == 0) {
                writeResult = VerifyEepromDword(batteryIndex, (unk16*)data);
                if (writeResult == 0) {
                    retry = 0;
                }
            }
        }
        if (writeResult != 0) {
            printf("Error occured in writeToBatteryBackup() - failed at %i\n", batteryIndex);
            result = 0;
            blockCount = 0;
        }
        data++;
        batteryIndex++;
    }
    return result;
}

u32 readFromBatteryBackup(u16 index, BackupBlock* data, s32 size)
{
    u32 result;
    s32 blockCount;
    u16 retry;
    u16 readResult;

    result = 1;
    blockCount = (size + 7) >> 3;
    for (blockCount--; blockCount != -1; blockCount--) {
        for (retry = 7; retry != 0xFFFF; retry--) {
            readResult = ReadEepromDword(index, (unk16*)data);
            if (readResult == 0) {
                retry = 0;
            }
        }
        if (readResult != 0) {
            printf("Error occured in readFromBatteryBackup() - failed at %i\n", index);
            result = 0;
            blockCount = 0;
        }
        data++;
        index++;
    }
    return result;
}
