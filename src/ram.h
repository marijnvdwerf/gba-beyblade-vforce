#ifndef _RAM_H
#define _RAM_H

#include <stddef.h>

#include "battery.h"
#include "camera.h"
#include "common.h"
#include "credits.h"
#include "effects.h"
#include "levelselect.h"
#include "memory.h"
#include "motion.h"
#include "packet.h"
#include "palette.h"
#include "render.h"
#include "sprite.h"

extern unk8 _unk30000DC;
extern unk8 _unk30000DD;
extern s32 _unk30000E0;
extern s32 _unk30000E4;
extern s32 _unk30000E8;
extern s32 _unk30000EC;
extern s32 _unk30000F0;
extern unk32 _unk30000F4;

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
extern LevelSelectState _3000038;
extern CreditsEntry* _currentCreditsPtr;
extern CreditsEntry* _creditsPtr;
extern SpriteTextCleanup* _fontPtr;
extern unk8 _unk3000BFC;
extern unk8 _unk3000BFD;
extern unk32 _unk3000C00;
extern RiderBase* _unk3000C10;
extern s32 withBoundingAreaCount;
extern unk32 withBoundingAreas[32];
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

typedef struct QuadTreeSplineEntry {
    GeometrySpline* unk0;
    unk16 unk4;
    unk16 unk6;
} QuadTreeSplineEntry;

typedef struct QuadTreeNode {
    struct QuadTreeNode* unk0;
    struct QuadTreeNode* unk4;
    struct QuadTreeNode* unk8;
    struct QuadTreeNode* unkC;
    GeometryLine** unk10;
    QuadTreeSplineEntry* unk14;
    s32 unk18;
    s32 unk1C;
    s32 unk20;
    s32 unk24;
    unk16 unk28;
    unk16 unk2A;
} QuadTreeNode;

typedef struct QuadTree {
    s32 unk0;
    s32 unk4;
    s32 unk8;
    s32 unkC;
    LevelGeometryAddresses* unk10;
    QuadTreeNode* unk14[4];
    AllocatedBlock* block24;
    AllocatedBlock* block28;
    QuadTreeNode* unk2C;
    GeometryLine** unk30;
    QuadTreeSplineEntry* unk34;
    unk16 unk38;
    unk16 unk3A;
    unk16 unk3C;
    unk16 unk3E;
    unk16 unk40;
    unk16 unk42;
    unk16 unk44;
    unk16 unk46;
    unk16 unk48;
    unk16 unk4A;
    unk32* unk4C;
    unk32 unk50;
    unk8 pad54[4];
} QuadTree;

typedef struct BeybladeActorData {
    AllocatedBlock* block;
    u8 unk4;
    unk8 pad5[3];
} BeybladeActorData;

typedef struct BeybladeActorCache {
    BeybladeActorData records[0x3C];
    unk16 unk1E0;
    unk8 pad1E2[2];
} BeybladeActorCache;

typedef struct ProjectileEntry {
    s32 x;
    s32 y;
    s32 z;
    unk32 velocityX;
    unk32 velocityY;
    unk32 velocityZ;
    unk32 accelerationX;
    unk32 accelerationY;
    unk32 accelerationZ;
    s32 duration;
    unk16 flags;
    s16 trailDelay;
    s16 unk2C;
    UnkTrail* trail;
} ProjectileEntry;

typedef struct ProjectileSystem {
    AllocatedBlock* block;
    s16 count;
    unk8 pad6[2];
    ProjectileEntry* entries;
    UnkTrail* trails;
    s32 unk10;
    s32 unk14;
    s32 unk18;
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
    s16 unk70;
    s16 unk72;
    s16 unk74;
    s16 unk76;
    unk16 unk78;
    s16 unk7A;

    union {
        unk32 word;

        struct {
            s16 unk7C;
            s16 unk7E;
        } parts;
    } unk7C;

    unk32 unk80;
    unk32 unk84;
    RiderBase* unk88;
} ProjectileSystem;

struct LevelHudData {
    SpriteTextCleanup text0; /* 0x00 */
    SpriteTextCleanup text1; /* 0x30 */
    SpriteTextCleanup text2; /* 0x60 */
    SpriteTextCleanup text3; /* 0x90 */
    MotionGroup motion0; /* 0xC0 */
    MotionGroup motion1; /* 0xD8 */
    s32 status; /* 0xF0 */
    SpriteEntry* unkF4; /* 0xF4 */
    SpriteEntry* unkF8; /* 0xF8 */
    SpriteEntry* unkFC; /* 0xFC */
    SpriteEntry* unk100; /* 0x100 */
    s16 unk104; /* 0x104 */
    s16 unk106; /* 0x106 */
    unk16 unk108; /* 0x108 */
    unk16 state; /* 0x10A */
    unk16 unk10C; /* 0x10C */
    unk16 flags; /* 0x10E */
    SpriteEntry* unk110; /* 0x110 */
    SpriteEntry* unk114; /* 0x114 */
    SpriteEntry* unk118; /* 0x118 */
    SpriteEntry* unk11C; /* 0x11C */
    SpriteEntry* unk120; /* 0x120 */
    SpriteEntry* unk124; /* 0x124 */
    unk16 unk128; /* 0x128 */
    unk16 unk12A; /* 0x12A */
    unk8 unk12C; /* 0x12C */
    u8 unk12D; /* 0x12D */
    unk8 pad12E[2]; /* 0x12E */
    s32 unk130; /* 0x130 */
};

typedef struct FrontendBladeState {
    SpriteEntry* unk0; /* 0x00 */
    SpriteEntry* unk4; /* 0x04 */
    SpriteEntry* unk8; /* 0x08 */
    SpriteEntry* unkC; /* 0x0C */
    SpriteEntry* unk10; /* 0x10 */
    SpriteTextCleanup* unk14; /* 0x14 */
    SpriteTextCleanup* unk18; /* 0x18 */
    SpriteTextCleanup* unk1C; /* 0x1C */
    SpriteTextCleanup* unk20; /* 0x20 */
    SpriteTextCleanup* unk24; /* 0x24 */
    SpriteTextCleanup* unk28; /* 0x28 */
    SpriteTextCleanup* unk2C; /* 0x2C */
    SpriteTextCleanup* unk30; /* 0x30 */
    s8 unk34; /* 0x34 */
    s8 unk35; /* 0x35 */
    unk8 unk36; /* 0x36 */
    unk8 pad37[1]; /* 0x37 */
    DecompressorState decompressor; /* 0x38 */
} FrontendBladeState;

typedef char FrontendBladeStateSizeCheck[(sizeof(FrontendBladeState) == 0x48) ? 1 : -1];

typedef struct GameData {
    RiderBase base; /* 0x000 */
    AllocatedBlock* unk428; /* 0x428 */
    RiderBase* unk42C; /* 0x42C */
    s32 unk430; /* 0x430 */
    CameraState unk434; /* 0x434 */
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
    SpriteTextCleanup unk870; /* 0x870 */
    unk16 unk8A0; /* 0x8A0 */
    unk8 pad8A2[6];
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
    unk8 padB38[0x18]; /* 0xB38 */
    unk8 unkB50; /* 0xB50 */
    unk8 unkB51; /* 0xB51 */
    unk8 unkB52; /* 0xB52 */
    unk8 unkB53; /* 0xB53 */
    unk8 padB54[2]; /* 0xB54 */
    unk8 unkB56; /* 0xB56 */
    unk8 padB57[1]; /* 0xB57 */
    unk32 unkB58; /* 0xB58 */
    unk8 padB5C[0x2C]; /* 0xB5C */
    PolyTable unkB88; /* 0xB88 */
    RenderCode renderCode; /* 0xBA0 */
    s16 unkC24; /* 0xC24 */
    s16 unkC26; /* 0xC26 */
    unk32 unkC28; /* 0xC28 */
    unk32 unkC2C; /* 0xC2C */
    unk8 padC30[0x3C]; /* 0xC30 */
    s16 unkC6C; /* 0xC6C */
    s16 unkC6E; /* 0xC6E */
    unk8 padC70[4]; /* 0xC70 */
    EnvironmentActorAllocation environmentActors; /* 0xC74 */
    AllocatedBlock* unkCA0; /* 0xCA0 */
    void* unkCA4; /* 0xCA4 */
    unk32 unkCA8; /* 0xCA8 */
    unk8 padCAC[0x2A4]; /* 0xCAC */
    LevelHudData levelHud; /* 0xF50 */
    ProjectileSystem projectileSystem; /* 0x1084 */
    BeybladeActorCache actorData; /* 0x1110 */
    CollectableData collectables; /* 0x12F4 */
    TutorialData tutorial; /* 0x13FC */
    unk8 pad153C[0x84]; /* 0x153C */
    s16 unk15C0; /* 0x15C0 */
    unk8 pad15C2[2]; /* 0x15C2 */
    Packet unk15C4; /* 0x15C4 */
    Packet unk15D4[4]; /* 0x15D4 */
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
typedef char GameDataGeometryOffsetCheck[(offsetof(GameData, unk434.geometry) == 0x65C) ? 1 : -1];
typedef char GameDataQuadTreeOffsetCheck[(offsetof(GameData, unk7A4) == 0x7A4) ? 1 : -1];

typedef struct CurrentGameStateTail {
    s32 unk0;
    unk32 unk4;
    unk32 unk8;
    unk16 unkC;
} CurrentGameStateTail;

typedef struct CurrentGameSave {
    BackupBlock block0;
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
    unk32 unk594[4];
    s8 unk5A4[0x40];
    s8 unk5E4[0x40];
    s8 unk624[0x40];
    s8 unk664[0x40];
    unk8 unk6A4;
    unk8 unk6A5;
    unk8 unk6A6;
    unk8 unk6A7;
    unk8 unk6A8;
    unk8 unk6A9;
    unk8 pad6AA;
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
extern unk8 _unk3000E3C;
extern unk8 _unk3000E40;
extern CurrentGameState* _currentGameState;
extern unk8 _unk3000BE0[28];
extern ActorCollisionFunctions _unk3000FC0;
extern unk32 pad_3000FCC;
extern unk32 _unk3000FD0[4];
extern unk8 _unk3000FE0[304];
extern unk32 _unk3001110[16];

extern void (*_unk3000DF0[14])(void);
extern unk16 _unk3000F20[16];
extern s16 _unk3000F40;
extern unk16 _unk3000F42;
extern s16 _unk3000F44;
extern unk16 _unk3000F46;

extern SpriteEntry* _unk3000600;
extern s32 _unk3000604;
extern s32 _unk3000608;
extern s32 _unk300060C;
extern SpriteTextCleanup _unk3000610;
extern s32 _unk3000640;
extern unk32 _unk3000644;

typedef struct FrontendSpriteTriple {
    SpriteEntry* sprite0;
    SpriteEntry* sprite1;
    SpriteEntry* sprite2;
    unk16 state;
    unk16 timer;
} FrontendSpriteTriple;

extern SpriteEntry* _unk30002F4;
extern s32 _unk30002F8;
extern s32 _unk30002FC;
extern s32 _unk3000300;
extern SpriteTextCleanup _unk3000308;
extern SpriteTextCleanup _unk3000338;
extern s32 _unk3000368;

extern SpriteEntry* _unk3000158;
extern SpriteEntry* _unk300015C;
extern s32 _unk3000160;
extern s32 _unk3000164;
extern unk32 _unk3000168;
extern s32 _unk300016C;
extern s32 _unk3000170;
extern unk32 _unk3000174;
extern s32 _unk3000178;
extern SpriteTextCleanup* _unk3000180[10];
extern unk8 _unk30001A8;
extern s32 _unk30001AC;
extern s32 _unk30001B0;
extern s32 _unk30001B4;
extern unk32 _unk30001B8;
extern unk32 _unk30001BC;
extern unk16 _unk30001C0;
extern SpriteTextCleanup* _unk30001C8[10];
extern SpriteEntry* _unk30001F0;
extern SpriteEntry* _unk30001F4;
extern s32 _unk30001F8;
extern s32 _unk30001FC;
extern unk8 _unk3000200;
extern SpriteEntry* _unk3000204;
extern s32 _unk3000208;
extern s32 _unk300020C;
extern s32 _unk3000210;
extern SpriteTextCleanup _unk3000218;
extern SpriteTextCleanup _unk3000248;
extern s32 _unk3000278;
extern SpriteEntry* _unk300027C;
extern s32 _unk3000280;
extern s32 _unk3000284;
extern s32 _unk3000288;
extern SpriteTextCleanup _unk3000290;
extern SpriteTextCleanup _unk30002C0;
extern s32 _unk30002F0;
extern SpriteEntry* _unk30005B0;
extern SpriteEntry* _unk30005B4;
extern s32 _unk30005B8;
extern s32 _unk30005BC;
extern SpriteEntry* _unk3000568;
extern SpriteEntry* _unk300056C;
extern SpriteEntry* _unk3000570;
extern s32 _unk3000574;
extern s32 _unk3000578;
extern s32 _unk300057C;
extern SpriteTextCleanup _unk3000580;
extern SpriteEntry* _unk30005C0;
extern SpriteEntry* _unk30005C4;
extern s32 _unk30005C8;
extern s32 _unk30005CC;
extern SpriteEntry* _unk30005D0;
extern SpriteEntry* _unk30005D4;
extern s32 _unk30005D8;
extern s32 _unk30005DC;
extern unk16 _unk30005E0;
extern unk16 _unk30005E2;
extern s32 _unk30005E4;
extern s32 _unk30005E8;
extern unk8 _unk30005EC;
extern FrontendSpriteTriple _unk30005F0;

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
extern s32 _unk30003C8;
extern s32 _unk30003CC;
extern SpriteEntry* _unk30003D0;
extern SpriteEntry* _unk30003D4;
extern SpriteEntry* _unk30003D8;
extern SpriteEntry* _unk30003DC;
extern s32 _unk30003E0;
extern s32 _unk30003E4;
extern s32 _unk30003E8;
extern s32 _unk30003EC;
extern s32 _unk30003F0;
extern SpriteTextCleanup _unk30003F8;
extern SpriteTextCleanup _unk3000428;
extern unk32 _unk3000458;
extern unk32 _unk300045C;
extern u8 _unk3000460;
extern unk8 pad_3000461[3];
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
extern s32 _unk30004B4;
extern s32 _unk30004B8;
extern s32 _unk30004BC;
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

extern s32 _unk30004E4;
extern s32 _unk30004E8;
extern FrontendBladeState _unk30004F0;
extern unk8 _unk3000538;
extern unk8 _unk3000539;
extern unk8 _unk300053A;
extern unk8 _unk300053B;
extern SpriteEntry* _unk300053C;
extern SpriteEntry* _unk3000540;
extern SpriteEntry* _unk3000544;
extern s32 _unk3000548;
extern s32 _unk300054C;
extern s32 _unk3000550;
extern s32 _unk3000554;
extern s32 _unk3000558;
extern s32 _unk300055C;
extern s32 _unk3000560;
extern s32 _unk3000564;

extern SpriteEntry* _unk3000464;
extern SpriteEntry* _unk3000468;
extern s32 _unk300046C;
extern s32 _unk3000470;

extern unk32 _unk3005E6C;
extern unk32 _unk3005E74;

#endif
