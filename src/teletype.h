#ifndef _TELETYPE_H
#define _TELETYPE_H

#include "common.h"

typedef struct TeletypeState TeletypeState;
typedef void (*TeletypeCallback)(TeletypeState*, unk32);

struct TeletypeState {
    const unk8* unk0;
    unk8 pad04[0xA8];
    unk32 unkAC;
    unk32 unkB0;
    unk8 padB4[6];
    unk16 unkBA;
    unk16 unkBC;
    unk8 unkBE;
    unk8 padBF;
    unk8 unkC0;
    unk8 padC1[3];
    AllocatedBlock* unkC4;
    SpriteEntry* unkC8;
    unk8 padCC[0x10];
    TeletypeCallback unkDC;
    unk8 padE0[8];
    void (*unkE8)(TeletypeState*, unk16);
    SpriteTextBlock unkEC;
};

TeletypeState* sub_8063E18(const unk8*, const unk8*, unk32, unk32, unk32, unk32, unk16);
void sub_8063F5C(TeletypeState*, TeletypeCallback);
void sub_8063F64(TeletypeState*);
void sub_8063F84(TeletypeState*);
void sub_806415C(TeletypeState*);
unk8 sub_806417C(TeletypeState*);
unk8 sub_8064188(TeletypeState*);

#endif
