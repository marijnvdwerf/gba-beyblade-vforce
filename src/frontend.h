#ifndef _FRONTEND_H
#define _FRONTEND_H

#include "common.h"

extern const unk8 SpriteSheet_823BF04[];
extern const unk8 SpriteSheet_823FF84[];
extern const unk8 SpriteSheet_8243874[];
extern const unk8 SpriteSheet_8251F40[];
extern const unk8 SpriteSheet_8252994[];
extern const unk8* _806DB8C[][5];
extern const unk8* _806E3B0[][5];
extern const unk8 Str_86FD470[];
extern const FrontendMenuData _80689A4[];
extern const FrontendMenuData _80692A4[];
extern const InputSequence _80693A0[];
extern const InputSequence _8069378[];
extern const InputSequence _806938C[];
extern const InputSequence _80693B4[];
extern const InputSequence _80693C8[];
extern const FrontendMenuData _80693DC[];
extern const FrontendMenuData _8069108[];
extern const FrontendMenuData _8069428[];
extern const FrontendMenuData _8069514[];

extern const unk8* const _806E0DC[][5];
extern const FrontendMenuData _806980C[];
extern const FrontendMenuData _8069830[];
extern const FrontendMenuData _8069D04[];
extern const FrontendSelectionRecord _8069FC8[];
extern const unk8 SpriteSheet_82B05EC[];
extern const unk8 ShadowFontMeta[];
extern const unk8* _806E650[];
extern const FrontendMotionData _8068840;
extern const s32 _8068868[];
extern const FrontendMotionData _8068890;

FrontendState* sub_8048FCC(void);
void sub_8049018(void);
void sub_80490CC(unk32, unk32);
void sub_80490F8(unk32);
void sub_8049168(void);
unk32 sub_804915C(void);
void sub_8049178(void);
void sub_8046468(FrontendSelectionObject*, const ItemDescriptionEntry*, unk32);
void sub_80464C0(FrontendSelectionObject*, s32);
SpriteTextCleanup* sub_804A0E0(s32);
void sub_8048FE4(void);
s32 sub_80491E0(unk32, s32);
void sub_8049234(unk32);
void sub_804924C(unk32);
unk32 sub_8049258(void);
void sub_8049344(u32);
unk32 sub_80493C8(void);
void sub_804903C(FrontendSubobject*, unk32, unk32);
unk8 sub_8048FFC(void);
void sub_80495C4(void);
void sub_804967C(void);

#endif
