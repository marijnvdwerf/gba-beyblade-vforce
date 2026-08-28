#include <stddef.h>

#include "common.h"

#define LBLOCKSIZE (sizeof(long))

#define CONTAINSNULL(X) (((X) - 0x01010101) & ~(X) & 0x80808080)

#define UNALIGNED(X) ((long)X & (LBLOCKSIZE - 1))

void* memcpy(void* dst0, const void* src0, size_t len0)
{
    unk8* dst = dst0;
    const unk8* src = src0;
    long* aligned_dst;
    const long* aligned_src;
    u32 len = len0;

    if (len >= 16 && !(UNALIGNED(src) | UNALIGNED(dst))) {
        aligned_dst = (long*)dst;
        aligned_src = (long*)src;

        while (len >= 16) {
            *aligned_dst++ = *aligned_src++;
            *aligned_dst++ = *aligned_src++;
            *aligned_dst++ = *aligned_src++;
            *aligned_dst++ = *aligned_src++;
            len -= 16;
        }

        while (len >= 4) {
            *aligned_dst++ = *aligned_src++;
            len -= 4;
        }

        dst = (unk8*)aligned_dst;
        src = (unk8*)aligned_src;
    }

    while (len--)
        *dst++ = *src++;

    return dst0;
}

void* memset(void* m, s32 c, size_t n)
{
    unk8* s = (unk8*)m;
    unk32 count, i;
    unsigned long buffer;
    unsigned long* aligned_addr;
    unk8* unaligned_addr;

    if (n >= LBLOCKSIZE && !UNALIGNED(m)) {

        aligned_addr = (unsigned long*)m;

        c &= 0xFF;
        if (LBLOCKSIZE == 4) {
            buffer = (c << 8) | c;
            buffer |= (buffer << 16);
        } else {
            buffer = 0;
            for (i = 0; i < LBLOCKSIZE; i++)
                buffer = (buffer << 8) | c;
        }

        while (n >= LBLOCKSIZE * 4) {
            *aligned_addr++ = buffer;
            *aligned_addr++ = buffer;
            *aligned_addr++ = buffer;
            *aligned_addr++ = buffer;
            n -= LBLOCKSIZE * 4;
        }
        while (n >= LBLOCKSIZE) {
            *aligned_addr++ = buffer;
            n -= LBLOCKSIZE;
        }

        s = (unk8*)aligned_addr;
    }

    while (n--)
        *s++ = (unk8)c;

    return m;
}

ASM_ZEROPAD
