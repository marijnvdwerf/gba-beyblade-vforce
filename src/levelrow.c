#include "levelrow.h"

#include <agb/define.h>
#include <agb/memory_map.h>

#include "frontend.h"
#include "include_asm.h"
#include "music.h"
#include "ram.h"
#include "spritetext.h"
#include "unsorted.h"

SpriteTextCleanup* sub_804A0E0(s32 index)
{
    SpriteTextCleanup* result;

    result = NULL;
    if (index <= _unk3000650.unkB4->unk4->unk14 && _unk3000650.unkB4->unk4->unk14 != 0) {
        result = _unk3000650.unk470 + index;
    }
    return result;
}

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
                    deltaX = (s16)sub_80491E0(deltaXFixed, 0x10);
                } else {
                    deltaX = 0;
                }
                if ((*frontendFlags & 0x10) == 0) {
                    deltaY = (s16)sub_80491E0(deltaYFixed, 0x10);
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

void sub_804A1E4(SpriteTextCleanup* text)
{
    s32 top;
    s32 bottom;
    s32 left;
    s32 right;

    top = sub_8061E44(text);
    top >>= 8;
    bottom = top + 8;
    left = sub_8061D54(text);
    left >>= 8;
    right = sub_8061E08(text);
    right >>= 8;
    *(vu16*)REG_WIN0H = (left << 8) + (right + 1);
    *(vu16*)REG_WIN0V = (top << 8) | bottom;
}

void sub_804A234(void)
{
    *(vu16*)REG_BLDCNT = BLD_UP_MODE | BLD_OBJ;
    *(vu16*)REG_WININ = WIN_ALL_ON;
    *(vu16*)REG_WINOUT = WIN_BG0_ON | WIN_BG1_ON | WIN_BG2_ON | WIN_BG3_ON | WIN_OBJ_ON;
    *(vu16*)REG_WIN0H = 0;
    *(vu16*)REG_WIN0V = 0;
    *(vu16*)REG_DISPCNT |= DISP_WIN0_ON;
}

void sub_804A26C(void)
{
    *(vu16*)REG_DISPCNT &= ~DISP_WIN0_ON;
}

void sub_804A280(FrontendState* arg0)
{
    unk32 index;
    const FrontendObject* entry;

    if (arg0->unk0 == arg0->unk4) {
        return;
    }

    index = arg0->unk4;
    entry = &_8069FC8[index];

    if (entry->unk4->unk0 == _gameData->unkC26) {
        return;
    }
    if (arg0->transition.unk586 != arg0->transition.value) {
        return;
    }

    if (_gameData->unkC26 != -1) {
        sub_804AF5C();
    }
    if (index != -1 && entry->unk4->unk0 != -1) {
        sub_804AF04(entry->unk4->unk0);
    }
}
