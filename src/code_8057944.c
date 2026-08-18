#include <agb/macro.h>

#include "ram.h"

extern void intr_main(void);
extern void intr_main_end(void);

void sub_8057944(void)
{
    /* Copy the interrupt main routine into IWRAM and point the interrupt
     * vector at it. */
    DmaCopy(3, intr_main, _unk3000FE0, intr_main_end - intr_main + 0x20, 32);
    *(vu32*)INTR_VECTOR_BUF = (vu32)_unk3000FE0;
}
