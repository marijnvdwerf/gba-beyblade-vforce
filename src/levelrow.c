#include "levelrow.h"

#include "include_asm.h"
#include "ram.h"

__asm__(".equ _LevelRowMusicTable, 0x08069FC8");

typedef struct LevelRowMusicEntry {
    unk32 unk0;
    unk32* unk4;
    unk8 pad8[0x10];
} LevelRowMusicEntry;

extern LevelRowMusicEntry _LevelRowMusicTable[];
extern void sub_804AF04(unk32);
extern void sub_804AF5C(void);

INCLUDE_ASM("asm/dump/8040d18/804a0e0.s");
INCLUDE_ASM("asm/dump/8040d18/804a110.s");
INCLUDE_ASM("asm/dump/8040d18/804a1e4.s");
INCLUDE_ASM("asm/dump/8040d18/804a234.s");
INCLUDE_ASM("asm/dump/8040d18/804a26c.s");

void sub_804A280(FrontendState* arg0)
{
    FrontendState* base;
    unk32 current;
    unk32 index;
    LevelRowMusicEntry* entry;
    unk32* ptr;
    unk32 value;
    s16* musicIndex;
    unk8* flags;

    base = arg0;
    current = base->unk0;
    index = base->unk4;
    if (current != index) {
        entry = &_LevelRowMusicTable[index];
        ptr = entry->unk4;
        musicIndex = &_gameData->unkC26;
        if (*ptr != *musicIndex) {
            flags = &base->unk586;
            if (flags[0] == flags[-2]) {
                if (*musicIndex != -1) {
                    sub_804AF5C();
                }
                if (index != (unk32)-1) {
                    value = *entry->unk4;
                    if (value != (unk32)-1) {
                        sub_804AF04(value);
                    }
                }
            }
        }
    }
}
