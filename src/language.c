#include "language.h"

void sub_8063A50(void)
{
    s32 i;

    for (i = 0; i < 21; i++) {
        _unk3005E80[i] = 0;
    }
}

void sub_8063A68(unk32 arg0, unk32 arg1)
{
    if (arg0 < 21) {
        _unk3005E80[arg0] = arg1;
    }
}

void sub_8063A7C(unk32 arg0)
{
    _unk3005E98 = arg0;
}

unk32 sub_8063A88(void)
{
    return _unk3005E98;
}

unk8 sub_8063A94(unk32 arg0)
{
    return _unk3005E80[arg0];
}

unk8 getLanguage(void)
{
    return _unk3005E80[_unk3005E98];
}
