#include "language.h"

void sub_8063A50(void)
{
    s32 i;

    for (i = 0; i < 21; i++) {
        _unk3005E80[i] = 0;
    }
}

void sub_8063A68(u32 arg0, u32 arg1)
{
    if (arg0 < 21) {
        _unk3005E80[arg0] = arg1;
    }
}

void sub_8063A7C(u32 arg0)
{
    _unk3005E98 = arg0;
}

u32 sub_8063A88(void)
{
    return _unk3005E98;
}

u8 sub_8063A94(u32 arg0)
{
    return _unk3005E80[arg0];
}

u32 getLanguage(void)
{
    return _unk3005E80[_unk3005E98];
}
