#include "iconmenu.h"

#include "debug.h"
#include "include_asm.h"
#include "language.h"
#include "memory.h"
#include "sprite.h"
#include "spritetext.h"

extern const u8 Str_8729398[];
extern const s16 Unk_874CC3C[];

INCLUDE_ASM("asm/dump/804a388-tutorial/8050a7c-newIconMenu.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/8050c18.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/8050df8.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/8050e80.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/8050f0c.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/8050f98.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/8050fc8.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/8050fe8.s");

void sub_8050FEC(FrontendMenu* menu, unk32 value)
{
    menu->textPosition = value;
}

INCLUDE_ASM("asm/dump/804a388-tutorial/8050ff0.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/805100c.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/8051028.s");
