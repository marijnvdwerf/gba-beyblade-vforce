#ifndef _TELETYPE_H
#define _TELETYPE_H

#include "common.h"
#include "sprite.h"

typedef struct TeletypeState TeletypeState;
typedef struct FontStyle FontStyle;
typedef void (*TeletypeCallback)(TeletypeState*, unk32);

struct FontStyle {
    const SpriteSheet* unk0;
    const unk8* unk4;
    unk8 pad8[4];
};

struct TeletypeState {
    const unk8* unk0;
    const SpriteSheet* unk4;
    const unk8* unk8;
    unk8 unkC;
    unk8 unkD;
    unk8 unkE;
    unk8 pad0F[0xD];
    unk8 unk1C[0x80];
    unk8 pad9C[0x10];
    unk32 unkAC;
    unk32 unkB0;
    unk8 padB4[6];
    unk16 unkBA;
    unk16 unkBC;
    unk8 unkBE;
    unk8 unkBF;
    unk8 unkC0;
    unk8 unkC1;
    unk8 unkC2;
    unk8 padC3;
    AllocatedBlock* unkC4;
    SpriteEntry* unkC8;
    unk8 padCC[0x10];
    TeletypeCallback unkDC;
    unk8 padE0[8];
    void (*unkE8)(TeletypeState*, unk16);
    SpriteTextBlock unkEC;
};

extern const FontStyle FontStyle_80688B8;

void sub_8063AD8(TeletypeState*, unk32);
TeletypeState* sub_8063E18(const unk8*, const FontStyle*, unk32, unk32, unk32, unk32, unk16);
void sub_8063F5C(TeletypeState*, TeletypeCallback);
void sub_8063F64(TeletypeState*);
void sub_8063F84(TeletypeState*);
void sub_806415C(TeletypeState*);
unk8 sub_806417C(TeletypeState*);
unk8 sub_8064188(TeletypeState*);

#endif
