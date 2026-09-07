#ifndef _EFFECTS_H
#define _EFFECTS_H

#include "common.h"

typedef struct EffectSprites {
    SpriteEntry* unk0;
    SpriteEntry* unk4;
    unk32 unk8;
    unk32 unkC;
    unk32 unk10;
    unk32 unk14;
    unk32 unk18;
    unk32 unk1C;
    unk32 unk20;
    unk32 unk24;
    unk16 unk28;
    unk16 unk2A;
    unk32 unk2C;
    unk32 unk30;
    unk32 unk34;
    unk32 unk38;
} EffectSprites;

void sub_805529C(void);
void sub_8055340(void);
void sub_8055624(void);
void sub_80556C4(void);
unk32 sub_80556DC(unk32);
void sub_80556F4(void);
void sub_8055734(unk32, Actor*, Actor*);
void sub_805582C(unk32, Actor*, unk32, unk32, unk32);
void sub_805589C(void);
void sub_80558B8(void);
void sub_80558D0(void);
void sub_80558E8(unk32);

void sub_8055914(EffectSprites*, unk32, unk32, unk32, unk32);

void sub_805599C(EffectSprites*);

void sub_8055C30(EffectSprites*);

#endif
