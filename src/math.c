#include "math.h"

#include <agb/bios.h>

#include "include_asm.h"

extern const unk16 Unk_874D1C0[];
extern const s16 Unk_874CC3C[];

s16 sub_8059FA0(s16 a, s16 b)
{
    s32 p = a * b;

    p /= 256;
    return p;
}

s16 sub_8059FB8(s16 a, s16 b)
{
    return (a << 8) / b;
}

s32 sub_8059FD0(s32 a, s32 b)
{
    s32 shift;

    if (b < 0) {
        b = -b;
        a = -a;
    }
    if ((b >> 4) != 0) {
        shift = 16;
    } else {
        shift = 12;
    }
    return (Unk_874D1C0[b] * a) >> shift;
}

void sub_8059FF8(s32* arg0, unk32 arg1, unk32 arg2, unk32 arg3, unk32 arg4)
{
    arg0[0] = arg1;
    arg0[1] = arg2;
    arg0[2] = arg3;
    arg0[3] = arg4;
}

s32* sub_805A00C(s32 a, s32 b, s32 c, s32* out)
{
    s32 cosA;
    s32 cosB;
    s32 cosC;
    s32 sinA;
    s32 sinB;
    s32 sinC;
    s32 cosBcosC;
    s32 sinBsinC;

    cosA = Unk_874CC3C[(unk8)(a >> 1) + 0x40];
    cosB = Unk_874CC3C[(unk8)(b >> 1) + 0x40];
    cosC = Unk_874CC3C[(unk8)(c >> 1) + 0x40];
    sinA = Unk_874CC3C[(unk8)(a >> 1)];
    sinB = Unk_874CC3C[(unk8)(b >> 1)];
    sinC = Unk_874CC3C[(unk8)(c >> 1)];
    cosBcosC = (cosB * cosC) >> 8;
    sinBsinC = (sinB * sinC) >> 8;
    out[3] = (cosA * cosBcosC + sinA * sinBsinC) >> 8;
    out[0] = (sinA * cosBcosC - cosA * sinBsinC) >> 8;
    out[1] = (cosA * sinB * cosC + cosB * sinA * sinC) >> 16;
    out[2] = (cosA * cosB * sinC - sinB * sinA * cosC) >> 16;
    return out;
}

void sub_805A0DC(s32* q)
{
    u16 length;

    length = Sqrt(q[0] * q[0] + q[1] * q[1] + q[2] * q[2] + q[3] * q[3]);
    q[0] = (q[0] << 8) / length;
    q[1] = (q[1] << 8) / length;
    q[2] = (q[2] << 8) / length;
    q[3] = (q[3] << 8) / length;
}

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

void sub_805A290(s32* vector, s32* matrix, s32* out)
{
    out[0] = (vector[0] * matrix[0] + vector[1] * matrix[3] + vector[2] * matrix[6]) >> 8;
    out[1] = (vector[0] * matrix[1] + vector[1] * matrix[4] + vector[2] * matrix[7]) >> 8;
    out[2] = (vector[0] * matrix[2] + vector[1] * matrix[5] + vector[2] * matrix[8]) >> 8;
}

void sub_805A2DC(s32 (*a)[3], s32 (*b)[3], s32 (*out)[3])
{
    unk16 i;
    unk16 j;

    for (i = 0; i < 3; i++) {
        for (j = 0; j < 3; j++) {
            out[i][j] = (a[i][0] * b[0][j] + a[i][1] * b[1][j] + a[i][2] * b[2][j]) >> 8;
        }
    }
}

ASM_ZEROPAD
