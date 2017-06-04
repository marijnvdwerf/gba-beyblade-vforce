#ifndef _KEYSTATE_H
#define _KEYSTATE_H

#include "common.h"

typedef struct KeyState {
    u32 var00;
    u32 var04;
    u32 var08;
    u32 var0C;
    u16 var10;
    u32 var14;
} KeyState;

void initKeyState(void);

KeyState* sub_805A914(u8 arg0);

void initKeyRecording(u16 arg0);

#endif // _KEYSTATE_H
