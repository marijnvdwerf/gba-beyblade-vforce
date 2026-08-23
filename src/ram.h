#ifndef _RAM_H
#define _RAM_H

#include "common.h"
#include "memory.h"
#include "motion.h"
#include "render.h"
#include "sprite.h"

typedef struct GeometryAddressTable {
    unk8 pad0[0x10];
    AllocatedBlock* block;
} GeometryAddressTable;

typedef struct QuadTree {
    unk8 pad0[0x24];
    AllocatedBlock* block24;
    AllocatedBlock* block28;
    unk8 pad2C[0x2C];
} QuadTree;

typedef struct BeybladeActorData {
    AllocatedBlock* block;
    unk8 unk4;
    unk8 pad5[3];
} BeybladeActorData;

typedef struct LevelHudText {
    s32 x; /* 0x00 */
    s32 y; /* 0x04 */
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

typedef struct HudGameDataView {
    unk8 pad0[0xF50];
    SpriteTextCleanup text0;
    LevelHudText text1;
    unk8 pad60[0x60];
    UnkMotion motion0;
    UnkMotion motion1;
    unk32 status;
    unk8 padF4[0x16];
    unk16 state;
    unk16 pad10C;
    unk16 flags;
} HudGameDataView;

typedef struct GameDataSignedMusicView {
    unk8 pad0[0xC26];
    s16 unkC26;
} GameDataSignedMusicView;

typedef struct GameData {
    unk8 pad0[0x200]; /* 0x000 */
    void* unk200; /* 0x200 */
    unk8 pad204[0x30]; /* 0x204 */
    s32 unk234; /* 0x234 */
    unk8 pad238[0x196]; /* 0x238 */
    unk8 unk3CE; /* 0x3CE */
    unk8 pad3CF[0x59]; /* 0x3CF */
    AllocatedBlock* unk428; /* 0x428 */
    RiderBase* unk42C; /* 0x42C */
    s32 unk430; /* 0x430 */
    void* unk434; /* 0x434 */
    unk8 pad438[0x224]; /* 0x438 */
    GeometryAddressTable unk65C; /* 0x65C */
    unk8 pad670[0x4C]; /* 0x670 */
    unk32 unk6BC; /* 0x6BC */
    unk8 pad6C0[0xB8]; /* 0x6C0 */
    void* unk778; /* 0x778 */
    unk8 pad77C[0x24]; /* 0x77C */
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
    UnkMotion levelHudMotion0; /* 0x1010 */
    UnkMotion levelHudMotion1; /* 0x1028 */
    unk32 levelHudStatus; /* 0x1040 */
    unk32 unk1044; /* 0x1044 */
    unk32 unk1048; /* 0x1048 */
    unk32 unk104C; /* 0x104C */
    unk32 unk1050; /* 0x1050 */
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
    unk8 unk107D; /* 0x107D */
    unk8 pad107E[2]; /* 0x107E */
    unk32 unk1080; /* 0x1080 */
    unk8 pad1084[0x8C]; /* 0x1084 */
    BeybladeActorData actorData[0x3C]; /* 0x1110 */
    u16 unk12F0; /* 0x12F0 */
    unk8 pad12F2[2]; /* 0x12F2 */
    CollectableData collectables; /* 0x12F4 */
    TutorialData tutorial; /* 0x13FC */
    unk8 pad153C[0xDC]; /* 0x153C */
    unk8 unk1618; /* 0x1618 */
    unk8 pad1619[2]; /* 0x1619 */
    unk8 unk161B; /* 0x161B */
    u16 unk161C; /* 0x161C */
    unk8 pad161E[2]; /* 0x161E */
    unk8 unk1620[0x18]; /* 0x1620 */
    unk8 unk1638; /* 0x1638 */
    unk8 pad1639[3]; /* 0x1639 */
    unk32 unk163C; /* 0x163C */
    unk8 unk1640; /* 0x1640 */
    unk8 unk1641; /* 0x1641 */
    unk8 pad1642[2]; /* 0x1642 */
} GameData;

typedef struct CurrentGameStateTail {
    unk32 unk0;
    unk32 unk4;
    unk32 unk8;
    unk16 unkC;
} CurrentGameStateTail;

typedef struct CurrentGameState {
    s8 unk0;
    unk8 unk1;
    unk8 unk2;
    unk8 unk3;
    LevelState unk4[0x38];
    unk8 pad544[0x160];
    unk8 unk6A4;
    unk8 pad6A5[6];
    unk8 unk6AB;
    unk16 unk6AC;
    unk16 unk6AE;
    AllocatedBlock* unk6B0;
    unk32 unk6B4;
    unk8 unk6B8[4];
    void* unk6BC;
    unk32 unk6C0;
    unk16 unk6C4;
    unk16 unk6C6;
    unk8 unk6C8[0x1C];
    unk16 unk6E4;
    unk16 unk6E6;
    unk8 unk6E8;
    unk8 unk6E9;
    unk16 unk6EA;
    CurrentGameStateTail unk6EC;
    unk8 pad6FC[0x568];
    unk32 unkC64;
    unk32 unkC68;
} CurrentGameState;

extern void* _levelDataBlockPtr;
extern GameData* _gameData;
extern EnvironmentObject* GetStruct4(unk32);
extern u32 _unk3000E30[3];
extern CurrentGameState* _currentGameState;
extern void* _unk3000FC0[4];
extern unk32 _unk3000FD0[4];
extern u8 _unk3000FE0[304];
extern u32 _unk3001110[16];

extern void* _unk3000DF0[14];

#endif // _RAM_H
