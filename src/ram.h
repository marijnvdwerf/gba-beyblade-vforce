#ifndef _RAM_H
#define _RAM_H

#include <stddef.h>

#include "battery.h"
#include "common.h"
#include "credits.h"
#include "memory.h"
#include "motion.h"
#include "palette.h"
#include "render.h"
#include "sprite.h"

extern MultiPlayerState* _unk3005DC4;
extern s32 _3000000;
extern s32 _3000004;
extern s32 _3000008;
extern s32 _300000C;
extern s32 _3000010;
extern s32 _3000014;
extern unk8 _3000020;
extern unk8 _3000021;
extern AllocatedBlock* _3000024;
extern CreditsEntry* _currentCreditsPtr;
extern CreditsEntry* _creditsPtr;
extern SpriteTextCleanup* _fontPtr;
extern unk8 _unk3000BFC;
extern unk16 _unk3000BFD;
extern unk32 _unk3000C00;
extern unk32 _unk3000C10[2];
extern s32 _unk3000C04;
extern unk8 _unk3000D30[80];
extern s32 _unk3000C08;
extern void (*_unk3000C0C)(void);
void sub_805565C(void);
void sub_8055674(void);

typedef struct Sub8052140Data {
    unk32 unk0;
    unk32 unk4;
    unk32 unk8;
    unk8 padC[2];
    unk16 unkE;
    unk8 pad10[4];
    unk16 unk14;
    unk16 unk16;
    unk16 unk18;
    unk16 unk1A;
    unk8 pad1C[8];
    unk8 unk24;
    unk8 unk25;
    unk8 unk26;
    unk8 pad27[0xB];
    unk16 unk32;
    unk8 pad34[0x24];
    unk32 unk58;
} Sub8052140Data;

typedef struct QuadTree {
    unk8 pad0[0x24];
    AllocatedBlock* block24;
    AllocatedBlock* block28;
    unk8 pad2C[0x2C];
} QuadTree;

typedef struct BeybladeActorData {
    AllocatedBlock* block;
    u8 unk4;
    unk8 pad5[3];
} BeybladeActorData;

typedef struct ProjectileEntry {
    unk32 x;
    unk32 y;
    unk32 z;
    unk32 velocityX;
    unk32 velocityY;
    unk32 velocityZ;
    unk32 accelerationX;
    unk32 accelerationY;
    unk32 accelerationZ;
    unk32 duration;
    unk16 flags;
    s16 trailDelay;
    unk16 unk2C;
    UnkTrail* trail;
} ProjectileEntry;

typedef struct ProjectileSystem {
    AllocatedBlock* block;
    s16 count;
    unk8 pad6[2];
    ProjectileEntry* entries;
    UnkTrail* trails;
    unk32 unk10;
    unk32 unk14;
    unk32 unk18;
    unk32 unk1C;
    unk32 unk20;
    unk32 unk24;
    unk16 unk28;
    unk8 pad2A[2];
    unk32 unk2C;
    unk32 unk30;
    Palette palette34;
    Palette palette48;
    Palette palette5C;
    unk16 unk70;
    unk16 unk72;
    unk16 unk74;
    unk16 unk76;
    unk16 unk78;
    unk16 unk7A;
    unk16 unk7C;
    unk16 unk7E;
    unk32 unk80;
    unk32 unk84;
    unk32 unk88;
} ProjectileSystem;

typedef struct LevelHudText {
    unk32 x; /* 0x00 */
    unk32 y; /* 0x04 */
    unk8 pad8[0x28]; /* 0x08 */
} LevelHudText;

typedef struct LevelHudData {
    SpriteTextCleanup text0; /* 0x00 */
    LevelHudText text1; /* 0x30 */
    unk8 pad60[0x60]; /* 0x60 */
    UnkMotion motion0; /* 0xC0 */
    UnkMotion motion1; /* 0xD8 */
    unk32 status; /* 0xF0 */
    unk8 padF4[0x16]; /* 0xF4 */
    unk16 state; /* 0x10A */
    unk16 pad10C; /* 0x10C */
    unk16 flags; /* 0x10E */
} LevelHudData;

typedef struct LevelHudObject {
    unk8 pad0[8];
    unk32 unk8;
    unk32 unkC;
    unk8 pad10[8];
    unk16 unk18;
} LevelHudObject;

typedef struct GameData {
    RiderBase base; /* 0x000 */
    AllocatedBlock* unk428; /* 0x428 */
    RiderBase* unk42C; /* 0x42C */
    s32 unk430; /* 0x430 */
    void* unk434; /* 0x434 */
    unk8 pad438[0x224]; /* 0x438 */
    LevelGeometryAddresses unk65C; /* 0x65C */
    unk8 pad778[0x28]; /* 0x778 */
    unk32 unk7A0; /* 0x7A0 */
    QuadTree unk7A4; /* 0x7A4 */
    unk16 unk7FC; /* 0x7FC */
    unk16 unk7FE; /* 0x7FE */
    unk16 unk800; /* 0x800 */
    unk16 unk802; /* 0x802 */
    unk16 unk804; /* 0x804 */
    unk16 unk806; /* 0x806 */
    unk16 unk808; /* 0x808 */
    unk16 unk80A; /* 0x80A */
    unk8 pad80C[4]; /* 0x80C */
    SpriteTextCleanup unk810; /* 0x810 */
    SpriteTextCleanup unk840; /* 0x840 */
    unk8 pad870[0x38]; /* 0x870 */
    SpriteTextCleanup unk8A8; /* 0x8A8 */
    unk8 pad8D8[0x44]; /* 0x8D8 */
    unk32 unk91C; /* 0x91C */
    unk8 pad920[0x0C]; /* 0x920 */
    SpriteTextBlock unk92C; /* 0x92C */
    unk8 pad938[0x40]; /* 0x938 */
    unk32 unk978; /* 0x978 */
    unk32 unk97C; /* 0x97C */
    unk32 unk980; /* 0x980 */
    unk32 unk984; /* 0x984 */
    unk32 unk988; /* 0x988 */
    unk32 unk98C; /* 0x98C */
    unk32 unk990; /* 0x990 */
    unk32 unk994; /* 0x994 */
    unk32 unk998; /* 0x998 */
    u16 unk99C; /* 0x99C */
    unk8 pad99E[0x182]; /* 0x99E */
    u16 unkB20; /* 0xB20 */
    u16 unkB22; /* 0xB22 */
    u16 unkB24; /* 0xB24 */
    u16 unkB26; /* 0xB26 */
    u16 unkB28; /* 0xB28 */
    u16 unkB2A; /* 0xB2A */
    unk8 padB2C[8]; /* 0xB2C */
    unk32 unkB34; /* 0xB34 */
    unk8 padB38[0x1B]; /* 0xB38 */
    unk8 unkB53; /* 0xB53 */
    unk8 padB54[2]; /* 0xB54 */
    unk8 unkB56; /* 0xB56 */
    unk8 padB57[1]; /* 0xB57 */
    unk32 unkB58; /* 0xB58 */
    unk8 padB5C[0x2C]; /* 0xB5C */
    PolyTable unkB88; /* 0xB88 */
    RenderCode renderCode; /* 0xBA0 */
    u16 unkC24; /* 0xC24 */
    u16 unkC26; /* 0xC26 */
    unk32 unkC28; /* 0xC28 */
    unk32 unkC2C; /* 0xC2C */
    unk8 padC30[0x3C]; /* 0xC30 */
    u16 unkC6C; /* 0xC6C */
    u16 unkC6E; /* 0xC6E */
    unk8 padC70[4]; /* 0xC70 */
    AllocatedBlock* unkC74; /* 0xC74 */
    EnvironmentNode* unkC78; /* 0xC78 */
    EnvironmentActorContainer* unkC7C; /* 0xC7C */
    unk32 unkC80; /* 0xC80 */
    unk32 unkC84; /* 0xC84 */
    EnvironmentObject* unkC88; /* 0xC88 */
    unk32 unkC8C; /* 0xC8C */
    unk32 unkC90[4]; /* 0xC90 */
    AllocatedBlock* unkCA0; /* 0xCA0 */
    void* unkCA4; /* 0xCA4 */
    unk32 unkCA8; /* 0xCA8 */
    unk8 padCAC[0x2A4]; /* 0xCAC */
    SpriteTextCleanup levelHud0; /* 0xF50 */
    SpriteTextCleanup levelHud1; /* 0xF80 */
    SpriteTextCleanup levelHud2; /* 0xFB0 */
    SpriteTextCleanup levelHud3; /* 0xFE0 */
    MotionGroup levelHudMotion0; /* 0x1010 */
    MotionGroup levelHudMotion1; /* 0x1028 */
    unk32 levelHudStatus; /* 0x1040 */
    LevelHudObject* unk1044; /* 0x1044 */
    LevelHudObject* unk1048; /* 0x1048 */
    unk32 unk104C; /* 0x104C */
    LevelHudObject* unk1050; /* 0x1050 */
    unk16 unk1054; /* 0x1054 */
    unk16 unk1056; /* 0x1056 */
    unk16 unk1058; /* 0x1058 */
    unk16 unk105A; /* 0x105A */
    unk16 unk105C; /* 0x105C */
    unk16 unk105E; /* 0x105E */
    SpriteEntry* unk1060; /* 0x1060 */
    SpriteEntry* unk1064; /* 0x1064 */
    void* unk1068; /* 0x1068 */
    unk32 unk106C; /* 0x106C */
    unk32 unk1070; /* 0x1070 */
    SpriteEntry* unk1074; /* 0x1074 */
    unk16 unk1078; /* 0x1078 */
    unk16 unk107A; /* 0x107A */
    unk8 unk107C; /* 0x107C */
    u8 unk107D; /* 0x107D */
    unk8 pad107E[2]; /* 0x107E */
    unk32 unk1080; /* 0x1080 */
    ProjectileSystem projectileSystem; /* 0x1084 */
    BeybladeActorData actorData[0x3C]; /* 0x1110 */
    unk16 unk12F0; /* 0x12F0 */
    unk8 pad12F2[2]; /* 0x12F2 */
    CollectableData collectables; /* 0x12F4 */
    TutorialData tutorial; /* 0x13FC */
    unk8 pad153C[0x98]; /* 0x153C */
    unk8 unk15D4[0x40]; /* 0x15D4 */
    unk8 pad1614[4]; /* 0x1614 */
    u8 unk1618; /* 0x1618 */
    unk8 unk1619; /* 0x1619 */
    unk8 unk161A; /* 0x161A */
    u8 unk161B; /* 0x161B */
    u16 unk161C; /* 0x161C */
    unk8 pad161E[2]; /* 0x161E */
    unk8 unk1620[0x18]; /* 0x1620 */
    u8 unk1638; /* 0x1638 */
    unk8 pad1639[3]; /* 0x1639 */
    unk32 unk163C; /* 0x163C */
    unk8 unk1640; /* 0x1640 */
    u8 unk1641; /* 0x1641 */
    unk8 pad1642[2]; /* 0x1642 */
} GameData;

typedef char LevelGeometryAddressesSizeCheck[(sizeof(LevelGeometryAddresses) == 0x11C) ? 1 : -1];
typedef char GameDataGeometryOffsetCheck[(offsetof(GameData, unk65C) == 0x65C) ? 1 : -1];
typedef char GameDataQuadTreeOffsetCheck[(offsetof(GameData, unk7A4) == 0x7A4) ? 1 : -1];

typedef struct CurrentGameStateTail {
    unk32 unk0;
    unk32 unk4;
    unk32 unk8;
    unk16 unkC;
} CurrentGameStateTail;

typedef struct CurrentGameSave {
    unk32 magic;
    u8 unk4;
    u8 unk5;
    u8 unk6;
    u8 unk7;
    LevelState levelStates[0x38];
    unk8 unk548[0x10];
    u16 unk558;
    u16 unk55A;
    u32 unk55C;
    unk32 checksum;
    unk8 pad564[4];
} CurrentGameSave;

typedef struct CurrentGameState {
    s8 unk0;
    unk8 unk1;
    u8 unk2;
    u8 unk3;
    LevelState unk4[0x38];
    LevelSlot unk544[10];
    unk8 unk594[0x10];
    unk8 pad5A4[0x100];
    unk8 unk6A4;
    unk8 pad6A5[6];
    u8 unk6AB;
    unk16 unk6AC;
    unk16 unk6AE;
    AllocatedBlock* unk6B0;
    unk32 unk6B4;
    unk8 unk6B8[4];
    void* unk6BC;
    u32 unk6C0;
    u16 unk6C4;
    unk16 unk6C6;
    unk8 unk6C8[0x1C];
    u16 unk6E4;
    u16 unk6E6;
    u8 unk6E8;
    unk8 unk6E9;
    s16 unk6EA;
    CurrentGameStateTail unk6EC;
    CurrentGameSave unk6FC;
    unk32 unkC64;
    unk32 unkC68;
} CurrentGameState;

extern s16 _unk3000F14;
extern s16 _unk3000F18;
extern s16 _unk3000F1C;
extern u16 _unk3005DA0;
extern void* _levelDataBlockPtr;
extern GameData* _gameData;
extern EnvironmentObject* GetStruct4(unk32);
extern u32 _unk3000E30[3];
extern CurrentGameState* _currentGameState;
extern unk8 _unk3000BE0[28];
extern void* _unk3000FC0[4];
extern unk32 _unk3000FD0[4];
extern unk8 _unk3000FE0[304];
extern unk32 _unk3001110[16];

extern void* _unk3000DF0[14];
extern unk8 _unk3000F20[32];
extern unk16 _unk3000F40;
extern unk16 _unk3000F42;
extern unk16 _unk3000F44;
extern unk16 _unk3000F46;

extern SpriteEntry* _unk3000600;
extern s32 _unk3000604;
extern s32 _unk3000608;
extern s32 _unk300060C;
extern SpriteTextCleanup _unk3000610;
extern s32 _unk3000640;
extern unk32 _unk3000644;

extern SpriteEntry* _unk3000158;
extern SpriteEntry* _unk300015C;
extern s32 _unk3000160;
extern s32 _unk3000164;
extern unk32 _unk3000168;
extern SpriteEntry* _unk30005B0;
extern SpriteEntry* _unk30005B4;
extern s32 _unk30005B8;
extern s32 _unk30005BC;

typedef struct FrontendCoordinateTarget {
    s32 value;
    unk8 pad4[4];
} FrontendCoordinateTarget;

struct FrontendSelectionObject {
    SpriteEntry* sprite;
    SpriteTextCleanup* unk4;
    SpriteTextCleanup* unk8;
    s16 frame;
    unk8 unkE;
    unk8 padF;
};

extern SpriteEntry* _unk300036C;
extern SpriteEntry* _unk3000370;
extern s32 _unk3000374;
extern FrontendCoordinateTarget _unk3000378;
extern FrontendResource _unk3000380;
extern FrontendResource _unk3000388;
extern FrontendResource _unk3000390;
extern FrontendResource _unk3000398;
extern FrontendResource _unk30003A0;
extern SpriteEntry* _unk30003A8;
extern SpriteEntry* _unk30003AC;
extern s32 _unk30003B0;
extern s32 _unk30003B4;
extern SpriteEntry* _unk30003B8;
extern SpriteEntry* _unk30003BC;
extern s32 _unk30003C0;
extern s32 _unk30003C4;
extern s32 _unk3000474;
extern FrontendCoordinateTarget _unk3000478;
extern FrontendSelectionObject _unk3000480;
extern unk8 _unk3000490;
extern u8 _unk3000491;
extern SpriteEntry* _unk3000494;
extern SpriteEntry* _unk3000498;
extern s32 _unk300049C;
extern s32 _unk30004A0;
extern SpriteEntry* _unk30004A4;
extern SpriteEntry* _unk30004A8;
extern s32 _unk30004AC;
extern s32 _unk30004B0;
extern unk32 _unk30004B4;
extern unk32 _unk30004B8;
extern unk32 _unk30004BC;
extern s32 _unk30004C4;
extern s32 _unk30004C8;
extern s32 _unk30004CC;
extern unk8 _unk30004C0;
extern unk8 _unk30004C1;
extern unk32 _unk3000648;
extern SpriteEntry* _unk30004D0;
extern SpriteEntry* _unk30004D4;
extern s32 _unk30004D8;
extern s32 _unk30004DC;
extern unk8 _unk30004E0;

extern SpriteEntry* _unk3000464;
extern SpriteEntry* _unk3000468;
extern s32 _unk300046C;
extern s32 _unk3000470;

#endif
