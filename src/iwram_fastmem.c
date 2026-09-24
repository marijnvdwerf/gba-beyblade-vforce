#include "iwram.h"

// TODO: fakematch?
void fastMemoryClearARM(unk32 fill, void* destination, unk32 byteCount)
{
    if (byteCount == 0) {
        return;
    }
    if (byteCount & 3) {
        off_807D96C("Attempt to clear data in fastMemoryClearARM() with non-multiple of 4 length\n");
        return;
    }
    byteCount /= sizeof(unk32);
    __asm__ volatile("mov r0, %1\n"
                     "mov r1, %1\n"
                     "mov r2, %1\n"
                     "tst %0, #1\n"
                     "strne r0, [%2], #4\n"
                     "tst %0, #2\n"
                     "stmneia %2!, {r0, r1}\n"
                     "movs %0, %0, lsr #2\n"
                     "beq 2f\n"
                     "1: stmia %2!, {r0-r2, %1}\n"
                     "subs %0, %0, #1\n"
                     "bne 1b\n"
                     "2:"
        : "+r"(byteCount), "+r"(fill), "+r"(destination)
        :
        : "r0", "r1", "r2", "cc", "memory");
}

// TODO: fakematch?
void fastMemoryCopyARM(const void* source, void* destination, unk32 bytes)
{
    if (bytes == 0) {
        return;
    }
    if (bytes & 3) {
        off_807D96C("Attempt to copy data in fastMemoryCopyARM() with non-multiple of 4 length (%i)\n", bytes);
        return;
    }
    bytes /= sizeof(unk32);
    __asm__ volatile("tst %0, #1\n"
                     "ldrne r0, [%1], #4\n"
                     "strne r0, [%2], #4\n"
                     "tst %0, #2\n"
                     "ldmneia %1!, {r0, r1}\n"
                     "stmneia %2!, {r0, r1}\n"
                     "movs %0, %0, lsr #2\n"
                     "beq 2f\n"
                     "1: ldmia %1!, {r0-r3}\n"
                     "stmia %2!, {r0-r3}\n"
                     "subs %0, %0, #1\n"
                     "bne 1b\n"
                     "2:"
        : "=r"(bytes)
        : "r"(source), "r"(destination), "0"(bytes)
        : "r0", "r1", "r2", "r3", "cc", "memory");
}

// TODO: fakematch?
void fastMemoryClear16ARM(unk32 fill, void* destination, unk32 byteCount)
{
    if (byteCount == 0) {
        return;
    }
    if (byteCount & 1) {
        off_807D96C("Attempt to clear data in fastMemoryClear16ARM() with non-multiple of 2 length\n");
        return;
    }
    __asm__ volatile("mov %0, %0, lsr #1\n"
                     "1: strh %1, [%2], #2\n"
                     "subs %0, %0, #1\n"
                     "bne 1b"
        : "+r"(byteCount), "+r"(fill), "+r"(destination)
        :
        : "r0", "r1", "r2", "cc", "memory");
}

// TODO: fakematch?
void fastMemoryCopy16ARM(const void* source, void* destination, unk32 byteCount)
{
    if (byteCount == 0) {
        return;
    }
    if (byteCount & 1) {
        off_807D96C("Attempt to copy data in fastMemoryCopy16ARM() with non-multiple of 2 length\n");
    } else {
        __asm__ volatile("mov %0, %0, lsr #1\n"
                         "1: ldrh r0, [%1], #2\n"
                         "strh r0, [%2], #2\n"
                         "subs %0, %0, #1\n"
                         "bne 1b"
            : "=r"(byteCount)
            : "r"(source), "r"(destination), "0"(byteCount)
            : "r0", "r1", "r2", "r3", "cc", "memory");
    }
}
