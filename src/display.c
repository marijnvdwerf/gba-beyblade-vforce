#include "display.h"

#include "include_asm.h"

INCLUDE_ASM("asm/dump/804a388-tutorial/80506f4-newLayerManagement.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/8050894.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/80508a4.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/80508cc.s");

void sub_8050A50(DisplayData* display)
{
    unk32 count;
    unk32 remaining;
    unk32 offset;

    count = display->unk4 + display->unk2;
    if (count != 0) {
        offset = 0;
        remaining = count;
        do {
            sub_8058EF4((DisplayRecord*)((unk8*)display->ptrC + offset));
            offset += 0x88;
            remaining--;
        } while (remaining != 0);
    }
}

INCLUDE_ASM("asm/dump/804a388-tutorial/8050a78-nullsub_41.s");
