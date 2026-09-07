#ifndef _DIALOGUE_H
#define _DIALOGUE_H

#include "common.h"

typedef struct TalkingHead {
    unk8 pad0[0x18];
    unk32 unk18;
    unk8 pad1C[4];
    unk32 unk20;
} TalkingHead;

typedef struct DialogueState {
    unk32 unk0;
    unk8 pad4[0x24];
} DialogueState;

extern void* _unk300007C;
extern unk8 _unk3000080[60];
extern void* _unk3000EE8;
extern DialogueState _unk3000EEC;
extern s32 _unk30000BC;
extern s32 _unk30000C0;
extern s32 _unk30000C4;
extern s32 _unk30000C8;
extern s32 _unk30000CC;
extern s32 _unk30000D0;
extern unk8 _unk30000D4;
extern unk8 _unk30000D5;
extern unk8 _unk30000D6;
extern SpriteEntry* _unk30000D8;

#endif
