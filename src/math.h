#ifndef _MATH_H
#define _MATH_H

#include <agb/types.h>

extern const s16 ScaleReciprocalTable[];
extern const s16 SinTable[];
extern const u8 AcosTable[];

s16 multiplyFixed(s16 a, s16 b);
s16 divideFixed(s16 a, s16 b);
s32 divideByReciprocal(s32 a, s32 b);
void setQuaternion(s32* arg0, s32 arg1, s32 arg2, s32 arg3, s32 arg4);
s32* convertEulerToQuaternion(s32 a, s32 b, s32 c, s32* out);
void normaliseQuaternion(s32* q);
s32* multiplyQuaternions(s32* a, s32* b, s32* out);
void convertQuaternionToMatrix(s32* arg0, s32 (*arg1)[3]);
void multiplyVectorByMatrix(s32* vector, s32 (*matrix)[3], s32* out);
void multiplyMatrices(s32 (*a)[3], s32 (*b)[3], s32 (*out)[3]);

#endif
