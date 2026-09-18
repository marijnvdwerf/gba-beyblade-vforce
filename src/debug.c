#include <agb/define.h>
#include <agb/memory_map.h>
#include <agb/types.h>

#include "include_asm.h"
#include "keystate.h"
#include "unsorted.h"

extern const unk8 Str_872CB38[];
extern const unk8 Str_872CB74[];
extern const unk8 Str_872CB88[];
extern const unk8 Str_872CB8C[];
extern const unk8 Str_872CB9C[];
extern const unk8 Str_872CBAC[];
extern const unk8 Str_872CBBC[];

void assert(
    unk8 condition, const unk8* message, const unk8* expression, const unk8* file, unk32 line)
{
    if (condition == 0) {
        printf(Str_872CB38);
        printf(Str_872CB74);
        printf(Str_872CB88);
        printf(Str_872CB8C, message);
        printf(Str_872CB88);
        printf(Str_872CB9C, expression);
        printf(Str_872CB88);
        printf(Str_872CBAC, file);
        printf(Str_872CBBC, line);
        printf(Str_872CB88);
        printf(Str_872CB38);
        do {
            updateKeyState();
        } while ((_keyInput & A_BUTTON) == 0);
    }
}

void nullsub_17(void)
{
}

void nullsub_46(void)
{
}

void nullsub_18(void)
{
}

void nullsub_19(void)
{
}

void nullsub_20(void)
{
}

unk32 printf_2(const unk8* format, ...)
{
}

unk32 printf(const unk8* format, ...)
{
}

s32 sub_8057C40(void)
{
    return _unk3000E30[0];
}

unk16 GetVCount(void)
{
    return *(vu16*)REG_VCOUNT;
}
