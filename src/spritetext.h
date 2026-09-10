#ifndef _SPRITETEXT_H
#define _SPRITETEXT_H

#include "common.h"

typedef struct SpriteTextPlacement {
    unk32 unk0;
    unk32 unk4;
    unk32 unk8;
    unk16 unkC;
    unk8 padE[2];
} SpriteTextPlacement;

u8 sub_8061660(SpriteTextCleanup*, const u8*, u8);
void sub_8061684(SpriteTextCleanup*, unk16, unk16);
void sub_8061844(SpriteTextCleanup*, s16, s16);
void allocFont(SpriteTextCleanup*, const unk8*, const unk8*, s16, s16, unk16, unk16);
void sub_80611EC(SpriteTextCleanup*, unk8);
void sub_80611FC(SpriteTextCleanup*, unk8);
void sub_8062318(SpriteTextCleanup*, unk8);
void sub_8061204(SpriteTextCleanup*);
u8 showString(SpriteTextCleanup*, const u8*, u8);
u8 showNumber(SpriteTextCleanup*, s32, u8);
u8 showNumber_2(SpriteTextCleanup*, unk32, u8);
u8 printTime(SpriteTextCleanup*, unk32, unk8);
void sub_8061228(SpriteTextCleanup*);
void sub_8061824(SpriteTextCleanup*, s32, s32);
void sub_8061880(SpriteTextCleanup*, s16, s16);
unk32 sub_8061D54(SpriteTextCleanup*);
unk32 sub_8061E44(SpriteTextCleanup*);
unk32 sub_8061E08(SpriteTextCleanup*);
void sub_8061E58(SpriteTextCleanup*, u8);
void sub_80622E8(UnkMenuItem*, SpriteTextCleanup*);
void sub_806185C(void*, unk8);
u8 sub_8061C48(SpriteTextCleanup*, unk32, unk8);
SpriteEntry* sub_8060C1C(SpriteTextBlock*, unk16, unk16);

#endif
