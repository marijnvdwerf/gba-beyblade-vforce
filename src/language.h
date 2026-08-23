#ifndef _LANGUAGE_H
#define _LANGUAGE_H

#include "common.h"

extern u8 _unk3005E80[21];
extern u32 _unk3005E98;

void sub_8063A50(void);
void sub_8063A68(u32, u32);
void sub_8063A7C(u32);
u32 sub_8063A88(void);
u8 sub_8063A94(u32);
u32 getLanguage(void);

#endif /* _LANGUAGE_H */
