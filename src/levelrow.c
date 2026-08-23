#include "levelrow.h"

#include "include_asm.h"
#include "ram.h"
#include "unsorted.h"

__asm__(".equ _LevelRowMusicTable, 0x08069FC8");

typedef struct LevelRows {
    unk8 pad0[4];
    unk32* var4;
    unk8 pad8[0xC];
    s32 count14;
    s16* rows18;
} LevelRows;

typedef struct LevelRowSprite {
    unk32 x;
    unk32 y;
} LevelRowSprite;

typedef struct LevelRowMusicEntry {
    unk32 unk0;
    unk32* unk4;
    unk8 pad8[0x10];
} LevelRowMusicEntry;

extern LevelRowMusicEntry _LevelRowMusicTable[];
extern void sub_804AF04(unk32);
extern void sub_804AF5C(void);

extern s16 sub_80491E0(s32, s32);
extern void sub_8061824(unk8*, s32, s32);

INCLUDE_ASM("asm/dump/8040d18/804a0e0.s");

void sub_804A110(void)
{
    s32 var_r2;
    s32 var_r5;
    s32 temp_r3;
    s32 temp_r4;
    s32 var_r7;
    s16* var_r8;
    LevelRowSprite* var_r6;
    s16* row;
    unk8* sl;
    unk8* r9;
    LevelRows* rows;

    var_r6 = (LevelRowSprite*)_unk3000650.unk470;
    rows = (LevelRows*)_unk3000650.unkB4->unk4;
    var_r8 = rows->rows18;
    var_r7 = rows->count14;
    var_r7--;
    if (var_r7 != -1) {
        sl = (unk8*)&_unk3000650;
        r9 = sl + 0x80;
        do {
            row = var_r8;
            if (((FrontendState*)sl)->unk585 <= 0) {
                row += 2;
            }
            temp_r3 = (row[0] << 8) - var_r6->x;
            temp_r4 = (row[1] << 8) - var_r6->y;
            temp_r3 &= 0xFFFFFF00;
            temp_r4 &= 0xFFFFFF00;
            if (temp_r3 != 0 || temp_r4 != 0) {
                if ((*r9 & 0x20) == 0) {
                    var_r5 = (s32)sub_80491E0(temp_r3, 0x10);
                } else {
                    var_r5 = 0;
                }
                if ((*r9 & 0x10) == 0) {
                    var_r2 = (s32)sub_80491E0(temp_r4, 0x10);
                } else {
                    var_r2 = 0;
                }
                sub_8061824((unk8*)var_r6, var_r5, var_r2);
            }
            var_r6 = (LevelRowSprite*)((unk8*)var_r6 + 0x30);
            var_r8 += 0x16;
            var_r7--;
        } while (var_r7 != -1);
    }
}

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
    GameDataSignedMusicView* musicView;
    s16* musicIndex;
    unk8* flags;

    base = arg0;
    current = base->unk0;
    index = base->unk4;
    if (current != index) {
        entry = &_LevelRowMusicTable[index];
        ptr = entry->unk4;
        musicView = (GameDataSignedMusicView*)_gameData;
        musicIndex = &musicView->unkC26;
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
