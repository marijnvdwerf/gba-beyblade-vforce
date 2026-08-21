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
void updateKeyState(void);
KeyState* sub_805A914(u8);
void initKeyRecording(u16);
void sub_805AAEC(void*, u16);
void sub_805AB38(void);
unk32 sub_805AB58(void);

#endif /* _KEYSTATE_H */
