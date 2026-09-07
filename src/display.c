#include "display.h"

#include "include_asm.h"

INCLUDE_ASM("asm/dump/804a388-tutorial/80506f4-newLayerManagement.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/8050894.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/80508a4.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/80508cc.s");

// TODO: fakematch?
void sub_8050A50(DisplayData* display)
{
    unk32 count;
    unk32 offset;

    if (display->unk4 + display->unk2) {
        offset = 0;
        count = display->unk4 + display->unk2;
        do {
            sub_8058EF4((DisplayRecord*)(display->ptrC + offset));
            offset += sizeof(DisplayRecord);
            count--;
        } while (count != 0);
    }
}

INCLUDE_ASM("asm/dump/804a388-tutorial/8050a78-nullsub_41.s");
