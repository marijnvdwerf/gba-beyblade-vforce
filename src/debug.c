#include <agb/define.h>
#include <agb/memory_map.h>
#include <agb/types.h>

#include "include_asm.h"
#include "keystate.h"
#include "unsorted.h"

void assert(unk8 condition, const char* message, const char* expression, const char* file, unk32 line)
{
    if (condition == 0) {
        printf("________________________________________________________\n");
        printf("Assertion failed: \n");
        printf("\n");
        printf("Message:    %s\n", message);
        printf("\n");
        printf("Expression: %s\n", expression);
        printf("\n");
        printf("In file:    %s\n", file);
        printf("On line:    %d\n", line);
        printf("\n");
        printf("________________________________________________________\n");
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

unk32 printf_2(const char* format, ...)
{
}

unk32 printf(const char* format, ...)
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
