#include "display.h"

#include "include_asm.h"

INCLUDE_ASM("asm/dump/804a388-tutorial/80506f4-newLayerManagement.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/8050894.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/80508a4.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/80508cc.s");

#if 0
void sub_8050A50(DisplayData* display)
{
    unk32 remaining;
    unk32 i;

    remaining = display->unk4 + display->unk2;
    if (remaining != 0) {
        i = 0;
        do {
            sub_8058EF4(&display->ptrC[i]);
            i++;
            remaining--;
        } while (remaining != 0);
    }
}
#endif
INCLUDE_ASM("asm/dump/804a388-tutorial/8050a50.s");

INCLUDE_ASM("asm/dump/804a388-tutorial/8050a78-nullsub_41.s");
