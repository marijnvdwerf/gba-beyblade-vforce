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
typedef struct ActorConfig ActorConfig;
typedef struct ActorTimerEntry ActorTimerEntry;
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

typedef struct UnkFrontendTarget {
    unk8 pad0[0xEC];
    unk16 unkEC;
} UnkFrontendTarget;

typedef struct UnkStruct_sub1 {
    unk8 var00;
    unk8 var01;
    unk16 var02;
    unk16 var04;
    unk16 var06;
    unk16 var08;
    UnkFrontendTarget* var0C;
    unk32 var10;
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

typedef struct FrontendSubobject {
    unk32 unk0;
    unk8 pad4[0xC];
    FrontendSubobjectData* unk10;
    s32 unk14;
    unk32 unk18;
    unk8 pad1C[4];
    unk32 unk20;
    unk32 unk24;
    unk8 pad28[0x20];
    s16 unk48;
    s16 unk4A;
    unk8 pad4C[0x30];
    unk8 unk7C;
    unk8 pad7D[3];
} FrontendSubobject;

typedef struct FrontendState FrontendState;
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
    unk8 pad44[4];
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
    unk8 pad0[8];
    u8 unk8;
    u8 unk9;
    unk8 padA[2];
    UnkMenuItem* items; /* 0xC */
    unk8 pad10[4]; /* 0x10 */
    s32 itemCount; /* 0x14 */
    s32 objectCount; /* 0x18 */
    unk8 pad1C[8];
    unk32 unk24; /* 0x24 */
    unk8 pad28[6];
    u8 unk2E;
    u8 unk2F;
    MenuStateCallback callback; /* 0x30 */
    unk8 pad34[4];
    FrontendMenu menu; /* 0x38 */
    UnkMotion* objectItems; /* 0xA8 */
    AllocatedBlock* block; /* 0xAC */
    unk32 timer; /* 0xB0 */
    SpriteTextCleanup cleanup; /* 0xB4 */
    UnkMotion motion; /* 0xE4 */
    unk8 padFC[4];
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
    void (*unk588)(FrontendState*, unk32);
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
    unk8 pad7D[2];
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
    FrontendSubobject unkB8;
    unk8 pad138[8];
    FrontendSubobject unk140;
    unk8 pad1C0[8];
    unk32 unk1C8; /* 0x1C8 */
    unk8 pad1CC[0x84];
    unk8 unk250[0x1D4];
    unk32 unk424;
    unk8 pad428[0x30];
    UnkMotion motion;
    SpriteTextCleanup* unk470;
    unk16 unk474;
    unk8 pad476[2];

    MenuState menuState; /* 0x478 */

    unk32 unk578;
    unk32 unk57C;
    unk32 unk580;
    FrontendTransition transition;
};

typedef struct SpriteTrailEntry {
    unk8 pad0[0xC];
    unk16 unkC;
    unk8 padE[0xA];
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
    const unk8* spriteSheet;
    unk16 unk24;
    unk16 unk26;
    void* unk28;
    unk16 unk2C;
} UnkTrail;

typedef struct UnkActor {
    unk8 unk0[0x8D];
    unk8 unk8D;
} UnkActor;

typedef struct ActorFrame {
    unk8 unk0;
    unk8 unk1;
    unk8 pad2[0xE];
} ActorFrame;

typedef struct ActorSequenceEntry {
    unk16 unk0;
    unk16 size;
    unk8 pad4[4];
    unk16 sequence;
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
    unk8 pad38[6];
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
    void* unk80;
    s32 unk84;
    unk8 pad88[0x10];
    unk8 unk98;
    unk8 pad99[1];
    unk16 unk9A;
    unk16 unk9C;
    unk16 unk9E;
    unk8 padA0[4];
    unk8 unkA4;
    unk8 unkA5;
    unk8 padA6[0xA];
    void (*unkB0)(struct Actor*, unk32*);
    unk32 unkB4;
    SpriteEntry* unkB8;
    unk8 padBC[4];
    void (*unkC0)(struct Actor*, s32); /* 0xC0 */
} Actor;

struct ActorTimerEntry {
    s32 unk0;
    s32 unk4;
    void (*unk8)(void*, void*);
    unk32 unkC;
};

typedef struct EnvironmentActorSlot {
    unk32 objectId;
    SpriteEntry* sprite;
    unk8 pad8[0x98];
    unk16 unkA0;
    unk16 unkA2;
    unk8 padA4[4];
    unk16 unkA8;
    unk16 unkAA;
    unk16 unkAC;
    unk16 unkAE;
    unk8 padB0[0x14];
} EnvironmentActorSlot;

typedef struct EnvironmentActorContainer {
    unk8 pad0[0xB4];
    EnvironmentActorSlot slots[1];
} EnvironmentActorContainer;

typedef struct EnvironmentNode {
    SpriteEntry* sprite;
    unk8 pad4[0x18];
} EnvironmentNode;

typedef struct EnvironmentObject {
    Actor* actor;
    SpriteEntry* sprite;
    unk8 pad8[0x44];
} EnvironmentObject;

struct Actor;

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

typedef struct RiderStatePrefix {
    s16 unk0;
    s16 unk2;
    s16 unk4;
    unk16 unk6_0 : 10;
    unk16 unk6_10 : 6;
} RiderStatePrefix;

typedef struct RiderState {
    RiderStatePrefix prefix;
    u16 unk8;
    u16 unkA;
    u8 unkC;
    u8 unkD_0 : 4;
    u8 unkD_4 : 4;
    unk8 padE[0x46];
    unk32 unk54;
} RiderState;

typedef struct RiderTemp {
    unk8 pad0[0x3C4];
    SpriteEntry* unk3C4;
    unk8 pad3C8[4];
    unk16 unk3CC;
    unk8 pad3CE[0x56];
    s16 unk424;
} RiderTemp;

typedef struct RiderBase {
    Actor* unk0;
    RiderTemp* unk4;
    unk8 pad8[8];
    unk32 unk10;
    unk32 unk14;
    unk8 pad18[4];
    unk32 unk1C;
    unk8 pad20[0x10];
    unk32 unk30; /* 0x30 */
    unk8 pad34[8];
    unk32 unk3C; /* 0x3C */
    unk32 unk40; /* 0x40 */
    unk32 unk44; /* 0x44 */
    unk32 unk48;
    unk32 unk4C;
    unk16 unk50; /* 0x50 */
    unk16 unk52; /* 0x52 */
    unk8 pad54[0x18];
    unk32 unk6C; /* 0x6C */
    unk32 unk70; /* 0x70 */
    unk32 unk74; /* 0x74 */
    unk8 pad78[0x24];
    unk32 flags;
    unk32 unkA0; /* 0xA0 */
    unk32 unkA4;
    unk8 padA8[0x10];
    SpriteEntry* unkB8;
    unk8 padBC[0x10];
    unk32 unkCC; /* 0xCC */
    unk8 padD0[0x74];
    unk16 unk144; /* 0x144 */
    unk8 pad146[0xA];
    unk16 unk150; /* 0x150 */
    unk8 pad152[0x4A];
    unk32 unk19C; /* 0x19C */
    unk8 pad1A0[0x4E];
    s16 unk1EE; /* 0x1EE */
    unk8 pad1F0[2];
    s16 unk1F2; /* 0x1F2 */
    unk8 pad1F4[8];
    unk32 unk1FC; /* 0x1FC */
    struct GeometryLine* unk200; /* 0x200 */
    unk8 pad204[4];
    s32 unk208; /* 0x208 */
    unk8 pad20C[4];
    unk32 unk210; /* 0x210 */
    unk8 pad214[4];
    unk16 unk218; /* 0x218 */
    unk16 unk21A; /* 0x21A */
    unk16 unk21C; /* 0x21C */
    unk16 unk21E; /* 0x21E */
    unk16 unk220; /* 0x220 */
    unk16 unk222; /* 0x222 */
    unk8 pad224[4];
    unk16 unk228; /* 0x228 */
    unk16 unk22A; /* 0x22A */
    unk16 unk22C; /* 0x22C */
    unk8 pad22E[6];
    unk32 unk234;
    Actor unk238;
    Actor unk2FC;
    SpriteEntry* unk3C0;
    SpriteEntry* unk3C4;
    unk8 pad3C8[4];
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
    unk16 unk424; /* 0x424 */
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
    unk32 z;
    unk32 padC;
} GeometryPoint;

typedef struct GeometryLine {
    unk32 point0;
    unk32 point1;
    unk8 unk8;
    unk8 pad9[7];
    unk8 unk10;
    unk8 unk11;
    unk8 pad12[0xE];
} GeometryLine; /* 0x20 */

typedef struct GeometrySpline {
    unk32 pointCount;
    unk32 size;
    unk8 pad8[4];
    unk16 unkC; /* 0x0C */
    unk8 padE[0x12];
    unk32 pointIndices[1];
} GeometrySpline;

typedef struct GeometrySplineLine {
    unk8 pad0[0x10];
} GeometrySplineLine;

typedef struct LevelGeometryTable LevelGeometryTable;

typedef struct TileMapHeader {
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
} TileMapHeader;

typedef struct LevelDesignLayer {
    TileMapHeader* unk0;
    s32 unk4;
    s32 unk8;
    unk32 unkC;
    unk8 pad10[8];
} LevelDesignLayer;

typedef struct LevelDesign {
    unk8 pad0[0x14];
    LevelDesignLayer layers[4];
    unk8 unk74;
    unk8 pad75[3];
    void* unk78;
    void* unk7C;
    LevelGeometryTable* geometry;
} LevelDesign;

struct LevelGeometryTable {
    unk32 pointCount;

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

typedef union LineMetaObjectValue {
    unk32 word;
    unk16 half;
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
    unk32 unk10;
    unk32 unk14;
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
    unk8 padE[3];
    u8 unk11;
    unk8 pad12[6];
    unk32 unk18;
    u8 unk1C;
    unk8 unk1D[3];
    s32 unk20;
    unk32 unk24;
    s32 unk28;
    LineMetadata** metadata;
    unk32 unk30;
    unk32 unk34;
    unk8 pad38[0x30];
    const unk8* unk68[6];
    unk8 pad80[0x10];
    unk32 unk90;
    unk8 pad94[0x2C];
    const unk8* unkC0;
    void* unkC4;
    unk8 padC8[8];
} LevelDescription;

#define true 1
#define false 0

#define min(a, b) (((a) < (b)) ? (a) : (b))
#define max(a, b) (((a) > (b)) ? (a) : (b))

#define ASM_ZEROPAD asm(".align 2, 0\n");

#endif
