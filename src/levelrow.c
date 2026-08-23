#include "levelrow.h"

#include "frontend.h"
#include "include_asm.h"
#include "music.h"
#include "ram.h"
#include "spritetext.h"
#include "unsorted.h"

INCLUDE_ASM("asm/dump/8040d18/804a0e0.s");

void sub_804A110(void)
{
    s32 deltaX;
    s32 deltaY;
    s32 deltaXFixed;
    s32 deltaYFixed;
    s32 remainingRows;
    s16* row;
    LevelRowSprite* sprite;
    s16* rows;
    unk8* frontendFlags;
    LevelRows* levelRows;
    FrontendState* frontend;

    sprite = _unk3000650.unk470;
    levelRows = (LevelRows*)_unk3000650.unkB4->unk4;
    rows = levelRows->rows18;
    remainingRows = levelRows->count14;
    remainingRows--;
    if (remainingRows != -1) {
        frontend = &_unk3000650;
        frontendFlags = &frontend->unk80;
        do {
            row = rows;
            if (frontend->transition.unk585 <= 0) {
                row += 2;
            }
            deltaXFixed = (row[0] << 8) - sprite->x;
            deltaYFixed = (row[1] << 8) - sprite->y;
            deltaXFixed &= 0xFFFFFF00;
            deltaYFixed &= 0xFFFFFF00;
            if (deltaXFixed != 0 || deltaYFixed != 0) {
                if ((*frontendFlags & 0x20) == 0) {
                    deltaX = (s32)sub_80491E0(deltaXFixed, 0x10);
                } else {
                    deltaX = 0;
                }
                if ((*frontendFlags & 0x10) == 0) {
                    deltaY = (s32)sub_80491E0(deltaYFixed, 0x10);
                } else {
                    deltaY = 0;
                }
                sub_8061824(sprite, deltaX, deltaY);
            }
            sprite++;
            rows += 0x16;
            remainingRows--;
        } while (remainingRows != -1);
    }
}

INCLUDE_ASM("asm/dump/8040d18/804a1e4.s");
INCLUDE_ASM("asm/dump/8040d18/804a234.s");
INCLUDE_ASM("asm/dump/8040d18/804a26c.s");

INCLUDE_ASM("asm/dump/8040d18/804a280.s");
