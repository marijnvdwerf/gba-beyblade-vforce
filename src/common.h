#ifndef BEY_COMMON
#define BEY_COMMON

#include <agb/types.h>

typedef u8 unk8;
typedef u16 unk16;
typedef u32 unk32;

typedef unk8 bool8;
typedef unk16 bool16;
typedef unk32 bool32;

typedef struct AllocatedBlock AllocatedBlock;
typedef struct ScreenLayout ScreenLayout;
typedef struct ActorConfig ActorConfig;
typedef struct BGLayer BGLayer;
typedef struct Struct3000CA0 Struct3000CA0;
typedef struct TileMapHeader TileMapHeader;
typedef struct ActorTimerEntry ActorTimerEntry;
struct Actor;
struct RiderBase;
typedef void (*ActorPositionFunc)(struct Actor*, unk32*);
typedef struct SpriteEntry SpriteEntry;
typedef struct SpriteTextBlock SpriteTextBlock;
typedef struct SpriteTextCleanup SpriteTextCleanup;
typedef struct FrontendSelectionObject FrontendSelectionObject;
typedef struct ItemDescriptionEntry ItemDescriptionEntry;
typedef struct FrontendMotionData FrontendMotionData;
typedef struct LevelHudData LevelHudData;

typedef union PaletteBuffer {
    unk16* half;
    unk32* word;
} PaletteBuffer;

typedef struct Palette {
    unk8* source; /* 0x00 */
    u16 unk4; /* 0x04 */
    u16 unk6; /* 0x06 */
    s16 unk8; /* 0x08 */
    unk8 unkA[2]; /* 0x0A */
    PaletteBuffer unkC; /* 0x0C */
    AllocatedBlock* block; /* 0x10 */
} Palette;

typedef struct UnkStruct_sub1 {
    unk8 var00;
    unk8 var01;
    unk16 var02;
    unk16 var04;
    unk16 var06;
    unk16 var08;
    BGLayer* var0C;
    ScreenLayout* var10;
    unk32 var14;
} UnkStruct_sub1;

struct SpriteTextBlock {
    SpriteEntry* prev;
    SpriteEntry* next;
    unk32 count;
};

struct SpriteTextCleanup {
    s32 x;
    s32 y;
    unk16 unk8;
    u16 unkA;
    unk16 unkC;
    unk8 unkE;
    unk8 unkF;
    unk16 unk10;
    unk16 unk12;
    SpriteTextBlock unk14;
    const unk8* unk20;
    const u8* unk24;
    u8 unk28;
    s8 unk29;
    unk8 unk2A;
    u8 unk2B;
    SpriteEntry* ptr2C;
};

struct AllocatedBlock {
    void* address;
    u32 size;
    AllocatedBlock* previous;
    AllocatedBlock* next;
};

typedef struct MotionEntry {
    unk32 x;
    unk32 y;
    unk32 unk8;
    unk32 unkC;
    unk32 unk10;
    unk32 unk14;
} MotionEntry;

typedef struct UnkMotion {
    AllocatedBlock* block;
    SpriteTextBlock* sourceBlock;
    MotionEntry* motions;
    s16 count;
    unk16 mode;
    unk32 unk10;
    s32 unk14;
} UnkMotion;

typedef struct FrontendSubobjectData {
    unk8 pad0[0x28];
    FrontendMotionData* unk28;
} FrontendSubobjectData;

typedef struct FrontendMenuObjectData {
    s16 unk0;
    s16 unk2;
    unk8 pad4[2];
    s16 unk6;
    const unk8** unk8;
    const struct MenuItemDescriptor* unkC;
    unk16 unk10;
    unk16 unk12;
    unk8 unk14;
    unk8 unk15;
    unk8 unk16;
    unk8 unk17;
} FrontendMenuObjectData;

typedef struct FrontendSubobject {
    unk8 pad0[0x10];
    FrontendSubobjectData* unk10;
    s32 unk14;
    unk8 pad18[8];
    FrontendMenuObjectData* unk20;
} FrontendSubobject;

struct BGLayer {
    s32 columnCount;
    s32 rowCount;
    Struct3000CA0* var8;
    unk32 field_C;
    s32 field_10;
    s32 field_14;
    s32 field_18;
    s32 field_1C;
    s32 field_20;
    s32 field_24;
    s32 field_28;
    s32 field_2C;
    s32 field_30;
    s32 field_34;
    s32 field_38;
    s32 field_3C;
    s32 field_40;
    s32 field_44;
    s16 field_48;
    s16 field_4A;
    s32 field_4C;
    s32 field_50;
    unk32 field_54;
    unk32 field_58;
    unk8 screenBaseBlock;
    unk8 characterBaseBlock;
    unk8 layerIndex;
    unk8 field_5F;
    unk8 field_60;
    unk8 field_61;
    unk8 pad62[2];
    unk16 var64;
    TileMapHeader* var68;
    void* tileAddr;
    void* mapAddr;
    u32 tileBytes;
    unk32 mapBytes;
    unk8 field_7C;
    unk32 field_80;
    unk32 field_84;
};

typedef struct FrontendState FrontendState;
typedef void (*FrontendStateCallback)(FrontendState*, unk32);
typedef struct InputSequence InputSequence;

typedef struct UnkMenuItem UnkMenuItem;

typedef struct MenuOptionSet {
    const u8* values[5];
} MenuOptionSet;

struct UnkMenuItem {
    SpriteTextCleanup text;

    const u8* unk30;
    unk32 value;
    unk32 count;
    unk32 flags;
    const MenuOptionSet* options;
    unk8 unk44; /* 0x44 */
    unk8 pad45[3];
    UnkMenuItem* next;
};

typedef struct FrontendMenuData FrontendMenuData;
typedef struct FrontendMenuItem FrontendMenuItem;

struct FrontendMotionData {
    unk32 unk0;
    unk32 unk4;
    unk32 unk8;
    unk32 unkC;
    unk32 unk10;
    unk32 unk14;
    unk32 unk18;
    unk32 unk1C;
    unk32 unk20;
    unk8 pad24[2];
    s16 unk26;
};

typedef struct FrontendSelectionPalette {
    unk32 unk0;
    unk32 unk4;
} FrontendSelectionPalette;

typedef struct FrontendSelectionData {
    unk32 unk0;
    unk8 pad4[0x20];
    FrontendSelectionPalette* palette;
} FrontendSelectionData;

typedef struct FrontendSelectionRecord {
    unk8 pad0[4];
    FrontendSelectionData* data;
    unk8 pad8[0x10];
} FrontendSelectionRecord;

struct FrontendMenuData {
    unk8 pad0[0x24];
};

typedef struct FrontendMenuItemData {
    unk8 pad0[4];
    const u8* labels[4];
    unk8 pad14[0xC];
    unk32 nextPosition;
    unk32 previousPosition;
} FrontendMenuItemData;

typedef struct FrontendMenuBlockData {
    unk8 pad0[0xA];
    unk8 unkA;
} FrontendMenuBlockData;

typedef struct FrontendMenuConfig {
    FrontendMenuBlockData* address;
} FrontendMenuConfig;

struct FrontendMenuItem {
    FrontendMenuItemData* data;
    SpriteEntry* sprite;
    unk8 pad8[0xC];
    unk32 position;
    unk8 pad18[4];
};

typedef struct FrontendMenu {
    s32 itemCount;
    unk32 selection;
    unk8 pad8[4];
    unk32 step;
    unk32 velocity;
    unk32 position;
    unk32 textPosition;
    unk32 targetPosition;
    unk32 timer;
    unk32 timerTarget;
    FrontendMenuItem* items;
    FrontendMenuConfig* config;
    AllocatedBlock* block;
    unk8 pad34[8];
    unk16 flags;
    unk8 pad3E[2];
    SpriteTextCleanup text;
} FrontendMenu;

typedef void (*MenuStateCallback)(UnkMenuItem*, s32, UnkMenuItem*, s32);
typedef void (*MenuStateValueCallback)(UnkMenuItem*, s32);

typedef struct MenuState {
    const unk8* unk0; /* 0x00 */
    const unk8* unk4; /* 0x04 */
    u8 unk8;
    u8 unk9;
    s16 unkA; /* 0x0A */
    UnkMenuItem* items; /* 0x0C */
    AllocatedBlock* unk10; /* 0x10 */
    s32 itemCount; /* 0x14 */
    s32 objectCount; /* 0x18 */
    unk32 unk1C; /* 0x1C */
    unk32 unk20; /* 0x20 */
    unk32 unk24; /* 0x24 */
    unk32 unk28; /* 0x28 */
    unk8 unk2C; /* 0x2C */
    unk8 unk2D; /* 0x2D */
    u8 unk2E;
    u8 unk2F;
    MenuStateCallback callback; /* 0x30 */
    MenuStateValueCallback unk34; /* 0x34 */
} MenuState;

typedef struct FrontendResource {
    s16 state;
    s16 timer;
    const InputSequence* data;
} FrontendResource;

typedef struct FrontendObject {
    unk32 unk0;
    FrontendSubobject* unk4;
    void (*unk8)(FrontendState*, unk32, unk32);
    void (*unkC)(FrontendState*, unk32);
    void (*unk10)(FrontendState*, unk32);
    void (*unk14)(FrontendState*, unk32);
} FrontendObject;

typedef struct FrontendTransition {
    s8 value;
    s8 unk585;
    s8 unk586;
    unk8 pad587[1];
    FrontendStateCallback unk588;
    unk32 unk58C;
    UnkStruct_sub1 unk590; /* 0x590 */
    unk32 unk5A8; /* 0x5A8 */
} FrontendTransition;

struct FrontendState {
    s32 unk0;
    s32 unk4;
    unk32 unk8;
    unk32 unkC;
    unk32 unk10;
    unk32 history[16]; /* 0x14 */
    Palette paletteA; /* 0x54 */
    Palette paletteB; /* 0x68 */
    unk8 unk7C;
    unk8 unk7D;
    unk8 unk7E;
    u8 unk7F;
    unk8 unk80;
    unk8 unk81;
    unk8 pad82[2];
    unk32 unk84;
    unk32 unk88;
    unk32 unk8C;
    unk32 unk90;
    unk8 pad94[0x20];
    FrontendObject* unkB4;
    BGLayer bgLayers[4]; /* 0xB8 */
    unk8 pad2D8[0x14C];
    unk32 unk424;
    unk8 pad428[0x30];
    UnkMotion motion;
    SpriteTextCleanup* unk470;
    unk16 unk474;
    unk8 pad476[2];

    MenuState menuState; /* 0x478 */
    FrontendMenu menu; /* 0x4B0 */
    UnkMotion* menuObjectItems; /* 0x520 */
    AllocatedBlock* menuBlock; /* 0x524 */
    unk32 menuTimer; /* 0x528 */
    SpriteTextCleanup menuCleanup; /* 0x52C */
    UnkMotion menuMotion; /* 0x55C */
    unk8 pad574[4];

    unk32 unk578;
    unk32 unk57C;
    unk32 unk580;
    FrontendTransition transition;
};

typedef struct SpriteTrailFrame {
    unk16 unk0;
    unk16 unk2;
    unk16 unk4;
    unk8 pad6[2];
} SpriteTrailFrame;

typedef struct SpriteTrailSheet {
    unk8 pad0[0x20];
    SpriteTrailFrame frames[1];
} SpriteTrailSheet;

typedef struct SpriteTrailEntry {
    unk8 pad0[0xC];
    unk16 unkC;
    unk16 unkE;
    unk16 unk10;
    unk16 unk12;
    unk16 unk14;
    unk16 unk16;
    SpriteEntry* sprite;
} SpriteTrailEntry;

typedef struct UnkTrail {
    unk16 unk0;
    unk16 unk2;
    unk16 unk4;
    unk16 unk6;
    SpriteTrailEntry* sprites;
    AllocatedBlock* block;
    unk32 unk10;
    unk32 unk14;
    unk32 unk18;
    unk32 unk1C;
    const SpriteTrailSheet* spriteSheet;
    unk16 unk24;
    unk16 unk26;
    void* unk28;
    unk16 unk2C;
} UnkTrail;

typedef struct ActorFrame {
    unk8 unk0;
    unk8 unk1;
    unk8 pad2[0xE];
} ActorFrame;

typedef struct ActorSequenceEntry {
    unk16 unk0;
    unk16 size;
    unk16 unk4;
    unk8 pad6[2];
    unk16 frames[1];
} ActorSequenceEntry;

typedef struct ActorFrameSequence {
    unk16 unk0;
    unk16 unk2;
    unk16 unk4;
    unk8 unk6;
    unk8 unk7;
} ActorFrameSequence;

struct ActorConfig {
    unk32 unk0;
    unk8 pad4[3];
    unk8 unk7;
    unk32 unk8;
    unk8 padC[0xC];
    unk32 unk18; /* 0x18 */
    unk8 pad1C[4];
    ActorFrameSequence sequences[1];
};

struct LevelGeometryAddresses;
struct GeometryLine;
typedef unk8 (*ActorCollisionResponse)(
    struct Actor*, struct LevelGeometryAddresses*, struct GeometryLine*, unk16);
typedef unk8 (*ActorCollisionOverlap)(
    struct Actor*, struct LevelGeometryAddresses*, struct GeometryLine*);
typedef unk8 (*ActorCollisionFilter)(
    struct Actor*, struct LevelGeometryAddresses*, struct GeometryLine*, unk16);

typedef struct ActorCollisionFunctions {
    ActorCollisionResponse unk0;
    ActorCollisionOverlap unk4;
    ActorCollisionFilter unk8;
} ActorCollisionFunctions;

typedef struct ActorCollisionCallbacks {
    void* unk0;
    ActorCollisionFunctions* unk4;
} ActorCollisionCallbacks;

typedef struct Actor {
    ActorConfig* unk0;
    s32 x;
    s32 y;
    s32 z;
    u8 unk10;
    unk8 unk11;
    unk16 unk12;
    unk16 unk14;
    unk16 unk16;
    unk8 pad18[2];
    s16 unk1A; /* 0x1A */
    unk16 unk1C;
    unk16 unk1E;
    unk16 unk20;
    unk16 unk22;
    unk8 unk24;
    unk8 unk25;
    unk16 unk26;
    unk16 unk28;
    unk8 pad2A[4];
    s16 unk2E; /* 0x2E */
    unk8 unk30;
    unk8 unk31;
    unk8 unk32;
    unk8 unk33;
    unk16 unk34;
    unk16 unk36;
    unk8 pad38;
    unk8 unk39;
    unk8 pad3A;
    unk8 unk3B; /* 0x3B */
    BGLayer* unk3C;
    s32 unk40;
    s32 unk44;
    s32 unk48;
    s32 unk4C;
    s32 unk50;
    s32 unk54;
    unk32 unk58;
    unk8 pad5C[0xC];
    s32 unk68;
    s32 unk6C;
    s32 unk70;
    s32 unk74;
    ActorTimerEntry* unk78;
    struct AllocatedBlock* unk7C;
    struct LevelGeometryAddresses* unk80;
    s32 unk84;
    s32 unk88;
    unk8 unk8C;
    unk8 unk8D; /* 0x8D */
    unk8 pad8E[2];
    ActorCollisionCallbacks callbacks;
    unk8 unk98;
    unk8 pad99[1];
    s16 unk9A;
    s16 unk9C;
    s16 unk9E;
    unk16 unkA0;
    s16 unkA2;
    unk8 unkA4;
    unk8 unkA5;
    unk8 padA6[2];
    s16 unkA8;
    s16 unkAA;
    s16 unkAC;
    s16 unkAE;
    ActorPositionFunc unkB0;

    union {
        struct RiderBase* rider;
        s32 lineIndex;
    } unkB4;

    SpriteEntry* unkB8;
    unk16 unkBC;
    unk8 padBE[2];
    void (*unkC0)(struct Actor*, s32); /* 0xC0 */
} Actor;

struct ActorTimerEntry {
    s32 unk0;
    s32 unk4;
    void (*unk8)(void*, void*);
    unk32 unkC;
};

typedef struct EnvironmentNode {
    SpriteEntry* sprite;
    unk32 unk4;
    unk32 unk8;
    unk32 unkC;
    unk16 unk10;
    unk16 unk12;
    const unk8* unk14;
    Actor* actor;
} EnvironmentNode;

typedef struct EnvironmentObject {
    Actor* actor;
    SpriteEntry* sprite;
    unk32 unk8;
    unk32 unkC;
    unk16 unk10;
    unk16 unk12;
    unk32 unk14;
    unk32 unk18;
    unk32 unk1C;
    unk32 unk20;
    unk32 unk24;
    unk32 unk28;
    unk8 pad2C[0xC];
    unk16 unk38;
    unk16 unk3A;
    unk16 unk3C;
    unk16 unk3E;
    unk32 unk40;
    unk32 unk44;
    unk8 pad48[4];
} EnvironmentObject;

typedef struct EnvironmentPointEntry {
    unk16 line;
    unk8 pad2[2];
    struct GeometryLine* geometry;
} EnvironmentPointEntry;

typedef struct EnvironmentActorAllocation {
    AllocatedBlock* block;
    EnvironmentNode* effect;
    Actor* actorContainer;
    unk32 effectCount;
    unk32 actorCount;
    EnvironmentObject* lineObjects;
    EnvironmentPointEntry* points;
    unk32 callbacks[4];
} EnvironmentActorAllocation;

typedef struct SpriteStringActorBlock SpriteStringActorBlock;

struct SpriteStringActorBlock {
    unk32 offset;
    unk32 count;
    struct Actor* actors;
    SpriteStringActorBlock* previous;
    SpriteStringActorBlock* next;
};

typedef struct SpriteString SpriteString;

struct SpriteString {
    struct Actor* actors;
    u8 count;
    u8 flags;
    unk16 mode;
    unk32 x;
    unk32 previousX;
    const u8* text;
    unk32 y;
    unk32 unk18;
    unk8 pad1C[4];
    unk32 width;
    unk16 scaleX;
    unk16 scaleY;
    const u8* widthTable;
    unk32 timer;
};

typedef struct ParticleFrameData {
    unk16 frame0;
    unk16 frame1;
    unk8 pad4[4];
} ParticleFrameData;

typedef struct Particle {
    SpriteEntry* sprite;
    unk8 pad4[0x20];
} Particle;

typedef struct ParticleSystem {
    const ParticleFrameData* unk0;
    s16 count;
    unk16 unk6;
    Particle* particles;
    unk32 unkC;
    unk32 unk10;
    unk32 unk14;
    unk32 unk18;
    unk32 unk1C;
    unk32 unk20;
    unk32 unk24;
    unk32 unk28;
    unk32 unk2C;
    struct AllocatedBlock* unk30;
} ParticleSystem;

typedef struct RiderBase {
    Actor* unk0;
    struct RiderBase* unk4;
    unk8 unk8;
    unk8 unk9;
    unk8 padA[2];
    unk32 unkC;
    s32 unk10;
    unk32 unk14;
    unk32 unk18;
    unk32 unk1C;
    unk32 unk20;
    unk32 unk24;
    unk32 unk28;
    unk32 unk2C;
    unk32 unk30; /* 0x30 */
    unk32 unk34;
    unk32 unk38;
    unk32 unk3C; /* 0x3C */
    unk32 unk40; /* 0x40 */
    unk32 unk44; /* 0x44 */
    unk32 unk48;
    unk32 unk4C;
    unk16 unk50; /* 0x50 */
    unk16 unk52; /* 0x52 */
    unk8 pad54[0xE];
    s16 unk62; /* 0x62 */
    unk8 pad64[8];
    unk32 unk6C; /* 0x6C */
    unk32 unk70; /* 0x70 */
    unk32 unk74; /* 0x74 */
    unk8 pad78[8];
    s32 unk80;
    unk8 pad84[4];
    unk32 unk88;
    unk8 pad8C[4];
    unk32 unk90;
    unk8 pad94[4];
    unk16 unk98;
    unk8 pad9A[2];
    unk32 flags;
    unk32 unkA0; /* 0xA0 */
    unk32 unkA4;
    unk32 unkA8;
    unk32 unkAC;
    unk32 unkB0;
    unk8 padB4[4];
    SpriteEntry* unkB8;
    unk32 unkBC;
    unk8 padC0[0xC];
    unk32 unkCC; /* 0xCC */
    unk8 padD0[0x14];
    struct GeometryLine* unkE4;
    unk8 padE8[4];
    struct GeometryLine* unkEC;
    unk8 padF0[0x2C];
    unk16 unk11C; /* 0x11C */
    unk8 pad11E[0x26];
    unk16 unk144; /* 0x144 */
    unk8 pad146[0xA];
    unk16 unk150; /* 0x150 */
    unk8 pad152[2];
    unk32 unk154;
    unk32 unk158;
    unk32 unk15C;
    unk8 pad160[0xC];
    unk32 unk16C;
    s32 unk170;
    unk8 pad174[0x24];
    unk32 unk198;
    s32 unk19C; /* 0x19C */
    unk32 unk1A0;
    unk32 unk1A4;
    unk32 unk1A8; /* 0x1A8 */
    unk32 unk1AC; /* 0x1AC */
    unk32 unk1B0; /* 0x1B0 */
    unk32 unk1B4; /* 0x1B4 */
    unk16 unk1B8;
    unk8 pad1BA[2];
    s32 unk1BC;
    unk8 unk1C0;
    unk8 pad1C1[2];
    unk8 unk1C3; /* 0x1C3 */
    unk16 unk1C4;
    unk16 unk1C6;
    unk16 unk1C8;
    unk8 pad1CA[0x24];
    s16 unk1EE; /* 0x1EE */
    unk8 pad1F0[2];
    s16 unk1F2; /* 0x1F2 */
    unk8 pad1F4[8];
    s32 unk1FC; /* 0x1FC */
    struct GeometryLine* unk200; /* 0x200 */
    unk8 pad204[4];
    s32 unk208; /* 0x208 */
    struct RiderBase* unk20C;
    s32 unk210; /* 0x210 */
    struct GeometrySpline* unk214;
    s16 unk218; /* 0x218 */
    s16 unk21A; /* 0x21A */
    unk16 unk21C; /* 0x21C */
    unk16 unk21E; /* 0x21E */
    s16 unk220; /* 0x220 */
    s16 unk222; /* 0x222 */
    s32 unk224;
    unk16 unk228; /* 0x228 */
    unk16 unk22A; /* 0x22A */
    unk16 unk22C; /* 0x22C */
    unk16 unk22E;
    unk16 unk230;
    unk8 pad232[2];
    unk32 unk234;
    Actor unk238;
    Actor unk2FC;
    SpriteEntry* unk3C0;
    SpriteEntry* unk3C4;
    unk16 unk3C8;
    unk8 pad3CA[2];
    unk16 unk3CC;
    unk8 unk3CE;
    unk8 pad3CF[1];
    unk8 unk3D0; /* 0x3D0 */
    unk8 pad3D1[0x13];
    unk32 unk3E4;
    u8 unk3E8;
    unk8 unk3E9[3];
    ParticleSystem unk3EC;
    struct AllocatedBlock* unk420;
    s16 unk424; /* 0x424 */
    unk8 pad426[2];
} RiderBase; /* 0x428 */

typedef struct PolyTable {
    unk16 unk0;
    unk16 unk2;
    unk16 unk4;
    unk16 unk6;
    void* unk8;
    void* unkC;
    struct AllocatedBlock* unk10;
    struct AllocatedBlock* unk14;
} PolyTable;

typedef struct GeometryPoint {
    s32 x;
    s32 y;
    s32 z;
    unk32 padC;
} GeometryPoint;

typedef struct GeometryLine {
    s32 point0;
    s32 point1;
    unk8 unk8;
    unk8 pad9[4];
    unk8 unkD;
    unk8 padE;
    unk8 unkF;
    unk8 unk10;
    unk8 unk11_0 : 1;
    unk8 unk11_1 : 1;
    unk8 unk11_2 : 1;
    unk8 unk11_3 : 1;
    unk8 unk11_4 : 4;
    unk8 pad12[6];
    s8 unk18;
    unk8 pad19[7];
} GeometryLine; /* 0x20 */

typedef struct GeometrySpline {
    s32 pointCount;
    unk32 size;
    unk8 pad8[4];
    unk16 unkC; /* 0x0C */
    unk8 padE[0x12];
    unk32 pointIndices[1];
} GeometrySpline;

typedef struct GeometrySplineLine {
    s8 unk0;
    unk8 pad1[7];
    s16 unk8;
    unk16 unkA;
    s32 unkC;
} GeometrySplineLine;

typedef struct LevelGeometryTable LevelGeometryTable;

typedef struct SplineConnection {
    GeometrySpline* unk0;
    unk32 unk4;
    unk32 unk8;
    GeometrySplineLine* unkC;
    GeometrySplineLine* unk10;
} SplineConnection;

typedef struct SplineMotionFlags {
    unk8 unk0_0 : 1;
    unk8 unk0_1 : 1;
    unk8 unk0_2 : 1;
    unk8 unk0_3 : 1;
} SplineMotionFlags;

typedef struct ActorSplineCallbacks {
    unk8 pad0[4];
    void (*unk4)(Actor*, struct LevelGeometryAddresses*, s32);
    void (*unk8)(Actor*, struct LevelGeometryAddresses*, GeometrySpline*, s32, s32);
    void (*unkC)(Actor*, struct LevelGeometryAddresses*, unk32);
} ActorSplineCallbacks;

struct TileMapHeader {
    unk8 filler00[4];
    u32 tileOffset;
    u32 tileBytes;
    u32 mapOffset;
    u32 mapBytes;
    u8 var14;
    unk8 filler15[3];
    u8 var18;
    u8 colorMode;
    unk8 filler1A[2];
    u16 columnCount;
    u16 rowCount;
};

typedef struct LevelDesignLayer {
    TileMapHeader* unk0;
    s32 unk4;
    s32 unk8;
    unk32 unkC;
    unk8 pad10[4];
    unk32 unk14;
} LevelDesignLayer;

struct ScreenLayout {
    unk8 pad0[0x14];
    LevelDesignLayer layers[4];
    unk8 unk74_0 : 2;
    unk8 unk74_2 : 2;
    unk8 unk74_4 : 2;
    unk8 unk74_6 : 2;
    unk8 pad75[3];
    unk16* bgPalette;
    unk16* spritePalette;
    LevelGeometryTable* geometry;
};

struct LevelGeometryTable {
    s32 pointCount;

    union {
        s16 splineCount;
        s32 splineCountWord;
    } count;

    s32 lineCount;
    unk32 padC;
    unk32 pointOffset;
    unk32 splineOffset;
    unk32 lineOffset;
    unk32 pad1C;
};

typedef struct LineMetaObject LineMetaObject;
typedef struct LineMetadata LineMetadata;

typedef struct LineMetaTransform {
    s32 x;
    s32 y;
    s32 z;
} LineMetaTransform;

typedef struct LineMetaOffset {
    s16 x;
    unk8 pad2[2];
    s16 y;
} LineMetaOffset;

typedef struct LineMetaSequence {
    unk16 unk0;
    unk16 unk2;
} LineMetaSequence;

typedef union LineMetaObjectValue {
    ActorConfig* config;
    const unk8* data;
    unk32 word;
    unk16 half;
    unk8 unk0;
    LineMetaTransform transform;
    LineMetaOffset offset;
    LineMetaSequence sequence;
} LineMetaObjectValue;

struct LineMetaObject {
    u16 size;
    u16 type;
    u16 id;
    u16 unk6;
    LineMetaObjectValue unk8;
};

struct LineMetadata {
    u16 count;
    unk16 pad2;
    LineMetaObject objects[1];
};

typedef struct LevelGeometryAddresses {
    LevelGeometryTable* unk0;
    GeometryPoint* unk4;
    GeometrySpline* unk8;
    GeometryLine* unkC;
    AllocatedBlock* block; /* 0x10 */
    GeometrySpline* unk14[0x40];
    LineMetadata** unk114;
    unk16 unk118;
    unk8 pad11A[2];
} LevelGeometryAddresses;

typedef struct LevelState {
    unk16 unk0;
    unk16 unk2;
    s32 unk4;
    unk32 unk8;
    struct LevelDescription* unkC;
    unk32 unk10[2]; /* 0x10 */
} LevelState;

typedef struct CollectableEntry {
    GeometryLine* geometry;
    unk32 line;
} CollectableEntry;

typedef struct CollectableData {
    s32 count;
    CollectableEntry entries[0x20];
    unk32 collectedBits[1];
} CollectableData;

typedef struct TutorialStringGroup {
    const unk8* strings[5];
} TutorialStringGroup;

typedef struct TutorialPage {
    s32 languageCount[5];
    TutorialStringGroup languageStrings[8];
} TutorialPage;

typedef struct TutorialEntry {
    unk32 line;
    TutorialPage* sprite;
} TutorialEntry;

typedef struct TutorialData {
    unk32 count;
    TutorialEntry entries[0x20];
    TutorialEntry* unk104;
    SpriteTextCleanup fontData;
    SpriteEntry* unk138;
    SpriteEntry* unk13C;
} TutorialData;

typedef struct MultiPlayerState {
    unk8 unk0;
    unk8 unk1;
    unk8 unk2;
    unk8 unk3;
    unk8 unk4;
    unk8 unk5;
    unk8 unk6;
    unk8 pad7[5];
    struct AllocatedBlock* unkC;
    unk32 unk10;
    unk32 unk14;
    unk32 unk18;
    unk32 unk1C;
    unk32 unk20;
    void* unk24;
    void* unk28;
    void* unk2C;
    void* unk30;
    void* unk34;
    void* unk38;
    unk16* unk3C;
    void* unk40;
} MultiPlayerState;

typedef struct MultiPlayerAllocation {
    MultiPlayerState state;
    unk8 data[1];
} MultiPlayerAllocation;

typedef struct LevelSlot {
    unk8 unk0;
    unk8 pad1;
    unk16 unk2;
    void* unk4;
} LevelSlot;

typedef struct LevelDescription {
    u8 unk0;
    u8 unk1;
    unk8 pad2[2];
    unk32 unk4;
    s32 unk8;
    unk16 unkC;
    unk8 padE[2];
    u8 unk10;
    u8 unk11;
    unk8 pad12[2];
    s32 unk14;
    unk32 unk18;
    u8 unk1C;
    unk8 unk1D[3];
    s32 unk20;
    unk32 unk24;
    s32 unk28;
    LineMetadata** metadata;
    unk32 unk30;
    unk32 unk34;
    unk8 pad38[8];
    const unk8* unk40[5];
    const unk8* unk54[5]; /* 0x54 */
    const unk8* unk68[6];
    unk8 pad80[0x10];
    unk32 unk90;
    const unk8* unk94[5];
    const unk8* unkA8[5];
    unk8 unkBC;
    unk8 padBD[3];
    const unk8* unkC0;
    const unk8* unkC4;
    const unk8* unkC8;
    const unk8* unkCC;
} LevelDescription;

typedef char LevelDescriptionSizeCheck[(sizeof(LevelDescription) == 0xD0) ? 1 : -1];

#define true 1
#define false 0

#define min(a, b) (((a) < (b)) ? (a) : (b))
#define max(a, b) (((a) > (b)) ? (a) : (b))

#define ASM_ZEROPAD asm(".align 2, 0\n");

#endif
