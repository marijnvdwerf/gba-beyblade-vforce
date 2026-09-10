#include "math.h"

#include "include_asm.h"

s16 sub_8059FA0(s16 a, s16 b)
{
    s32 p = a * b;

    p /= 256;
    return p;
}

INCLUDE_ASM("asm/dump/8057b80-debug/8059fb8.s");
INCLUDE_ASM("asm/dump/8057b80-debug/8059fd0.s");

void sub_8059FF8(unk32* arg0, unk32 arg1, unk32 arg2, unk32 arg3, unk32 arg4)
{
    arg0[0] = arg1;
    arg0[1] = arg2;
    arg0[2] = arg3;
    arg0[3] = arg4;
}

INCLUDE_ASM("asm/dump/8057b80-debug/805a00c.s");
INCLUDE_ASM("asm/dump/8057b80-debug/805a0dc.s");

s32* sub_805A148(s32* a, s32* b, s32* out)
{
    s32 x;
    s32 y;
    s32 z;
    s32 w;
    s32 out0;

    y = a[1];
    out0 = b[2] * y;
    z = a[2];
    out0 -= z * b[1];
    w = a[3];
    out0 += b[0] * w;
    x = a[0];
    out0 += b[3] * x;
    out[0] = out0 >> 8;
    out[1] = (z * b[0] - b[2] * x + b[1] * w + b[3] * y) >> 8;
    out[2] = (b[1] * x - b[0] * y + b[2] * w + z * b[3]) >> 8;
    out[3] = (b[3] * w - b[0] * x - b[1] * y - z * b[2]) >> 8;
    return out;
}

void sub_805A1DC(s32* arg0, s32* arg1)
{
    s32 x;
    s32 y;
    s32 z;
    s32 w;
    s32 x2;
    s32 y2;
    s32 z2;
    s32 xx;
    s32 xy;
    s32 xz;
    s32 yy;
    s32 yz;
    s32 zz;
    s32 wx;
    s32 wy;
    s32 wz;

    x = arg0[0];
    x2 = x * 2;
    y = arg0[1];
    y2 = y * 2;
    z = arg0[2];
    z2 = z * 2;
    xx = x * x2 >> 8;
    xy = x * y2 >> 8;
    xz = x * z2 >> 8;
    yy = y * y2 >> 8;
    yz = y * z2 >> 8;
    zz = z * z2 >> 8;
    w = arg0[3];
    wx = w * x2 >> 8;
    wy = w * y2 >> 8;
    wz = w * z2 >> 8;
    arg1[0] = 0x100 - (yy + zz);
    arg1[1] = xy - wz;
    arg1[2] = xz + wy;
    arg1[3] = xy + wz;
    arg1[4] = 0x100 - (xx + zz);
    arg1[5] = yz - wx;
    arg1[6] = xz - wy;
    arg1[7] = yz + wx;
    arg1[8] = 0x100 - (xx + yy);
}

INCLUDE_ASM("asm/dump/8057b80-debug/805a290.s");
INCLUDE_ASM("asm/dump/8057b80-debug/805a2dc.s");
