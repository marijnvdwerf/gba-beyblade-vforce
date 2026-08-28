#ifndef _SPRITETEXT_H
#define _SPRITETEXT_H

#include "common.h"

u8 sub_8061660(SpriteTextCleanup*, const u8*, u8);
void sub_8061844(SpriteTextCleanup*, s16, s16);
void allocFont(SpriteTextCleanup*, const unk8*, const unk8*, s16, s16, unk16, unk16);
void sub_80611EC(SpriteTextCleanup*, unk8);
void sub_80611FC(SpriteTextCleanup*, unk8);
void sub_8061204(SpriteTextCleanup*);
u8 showString(SpriteTextCleanup*, const u8*, u8);
u8 showNumber(SpriteTextCleanup*, s32, u8);
u8 showNumber_2(SpriteTextCleanup*, unk32, u8);
void sub_8061228(SpriteTextCleanup*);
void sub_8061824(SpriteTextCleanup*, s32, s32);
void sub_8061E58(SpriteTextCleanup*, u8);

#endif
