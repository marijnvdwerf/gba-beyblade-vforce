#ifndef _KEYSTATE_H
#define _KEYSTATE_H

#include "common.h"

typedef struct KeyState {
    unk32 var00;
    unk32 var04;
    unk32 var08;
    unk32 var0C;
    unk16 var10;
    unk32 var14;
} KeyState;

void initKeyState(void);
void updateKeyState(void);
KeyState* sub_805A914(u8);
void initKeyRecording(u16);
void sub_805AAEC(void*, u16);
void sub_805AB38(void);
void sub_805AAB4(void);
unk32 sub_805AB58(void);

#endif /* _KEYSTATE_H */
