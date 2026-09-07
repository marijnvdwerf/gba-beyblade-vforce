#ifndef _EFFECTS_H
#define _EFFECTS_H

#include "common.h"

typedef struct EffectSprites {
    SpriteEntry* unk0;
    SpriteEntry* unk4;
    unk8 pad8[0x34];
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
