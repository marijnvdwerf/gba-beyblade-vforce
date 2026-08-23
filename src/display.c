#include "display.h"

#include "include_asm.h"

INCLUDE_ASM("asm/dump/804a388-tutorial/80506f4-newLayerManagement.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/8050894.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/80508a4.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/80508cc.s");
extern void sub_8058EF4(unk32);

void sub_8050A50(DisplayData* arg0)
{
    unk32 temp;
    unk32 count;
    unk32 offset;

    temp = arg0->unk4 + arg0->unk2;
    if (temp != 0) {
        offset = 0;
        count = temp;
        do {
            sub_8058EF4(arg0->ptrC + offset);
            offset += 0x88;
            count--;
        } while (count != 0);
    }
}

INCLUDE_ASM("asm/dump/804a388-tutorial/8050a78-nullsub_41.s");
