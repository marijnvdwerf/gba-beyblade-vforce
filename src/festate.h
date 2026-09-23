#ifndef _FESTATE_H
#define _FESTATE_H

#include "common.h"
#include "ram.h"

void initBBCollectionSprite(FrontendBladeState*);
void sub_804703C(FrontendBladeState*);
void sub_8047080(FrontendBladeState*, unk32);
void sub_80470C8(FrontendBladeState*);
void sub_804712C(FrontendBladeState*);

void sub_8043DB8(SpriteTextCleanup**, LevelState*, CurrentGameStateTail*, unk32);
void sub_8043F40(SpriteTextCleanup**, CurrentGameStateTail*, s32);
void sub_8048A74(FrontendSpriteTriple*, s32);

extern FrontendSubobject _80689C8;
extern FrontendSubobject _8068CA4;
extern FrontendSubobject _8068CF8;
extern FrontendSubobject _8068ED8;
extern FrontendSubobject _80690B8;
extern FrontendSubobject _80690E0;
extern FrontendSubobject _806912C;
extern FrontendSubobject _8069154;
extern FrontendSubobject _806917C;
extern FrontendSubobject _806927C;
extern FrontendSubobject _80692C8;
extern FrontendSubobject _80692F0;
extern FrontendSubobject _8069318;
extern FrontendSubobject _8069400;
extern FrontendSubobject _806944C;
extern FrontendSubobject _80694EC;
extern FrontendSubobject _8069538;
extern FrontendSubobject _8069648;
extern FrontendSubobject _80696F4;
extern FrontendSubobject _806971C;
extern FrontendSubobject _8069794;
extern FrontendSubobject _80697BC;
extern FrontendSubobject _80697E4;
extern FrontendSubobject _80699B4;
extern FrontendSubobject _8069CDC;
extern FrontendSubobject _8069D28;
extern FrontendSubobject _8069D74;
extern FrontendSubobject _8069DC0;
extern FrontendSubobject _8069DE8;
extern FrontendSubobject _8069E10;
extern FrontendSubobject _8069E64;
extern FrontendSubobject _8069FA0;

void selectBladeFrontendHandler(FrontendState*, unk32, unk32);
void sub_8043A0C(FrontendState*, u32, u32);
void sub_8043A58(FrontendState*, u32, u32);
void sub_8043AA0(FrontendState*, u32);
void sub_8043CF8(FrontendState*, u32);
void sub_8043D84(FrontendState*, u32);
void sub_8044054(FrontendState*, unk32);
void sub_804444C(FrontendState*, unk32);
void sub_80448F4(FrontendState*, unk32);
void sub_8044C48(FrontendState*, unk32);
void sub_8044ED4(FrontendState*, unk32);
void sub_8045160(FrontendState*, unk32, unk32);
void sub_80453D8(FrontendState*, u32);
void sub_804541C(FrontendState*, u32);
void sub_8045638(FrontendState*, u32, u32);
void sub_804566C(FrontendState*, unk32);
void sub_804568C(FrontendState*, u32);
void sub_8045848(FrontendState*, u32);
void sub_8045A7C(FrontendState*, u32);
void sub_8045CB4(FrontendState*, unk32, unk32);
void sub_80461D8(FrontendState*, u32);
void sub_8046424(FrontendState*, u32);
void sub_8046500(FrontendState*, u32, u32);
void sub_8046814(FrontendState*, u32);
void sub_8046A0C(FrontendState*, unk32);
void sub_8046B94(FrontendState*, u32);
void sub_8046CC4(FrontendState*, u32);
void sub_8047E5C(FrontendState*, unk32);
void sub_80480EC(FrontendState*, unk32);
void sub_8048310(FrontendState*, unk32);
void sub_804868C(FrontendState*, unk32);
void sub_8048AE8(FrontendState*, unk32, unk32);
void sub_8048D8C(FrontendState*, u32);

#endif
