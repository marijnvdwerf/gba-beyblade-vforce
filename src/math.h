#ifndef _MATH_H
#define _MATH_H

#include "common.h"

extern const s16 ScaleReciprocalTable[];
extern const s16 SinTable[];
extern const unk8 AcosTable[];
extern const unk16 AcosTableHiRes[];
extern const unk16 ReciprocalTable[];

s16 sub_8059FA0(s16, s16);
void sub_8059FF8(s32*, unk32, unk32, unk32, unk32);
s32* sub_805A148(s32*, s32*, s32*);
void sub_805A1DC(s32*, s32*);

#endif
