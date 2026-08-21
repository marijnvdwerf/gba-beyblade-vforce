#ifndef BEY_COMMON
#define BEY_COMMON

#include <agb/types.h>

typedef u8 bool8;
typedef u16 bool16;
typedef u32 bool32;

typedef u8 unk8;
typedef u16 unk16;
typedef u32 unk32;

typedef struct AllocatedBlock AllocatedBlock;

struct AllocatedBlock {
    void* address;
    u32 size;
    AllocatedBlock* previous;
    AllocatedBlock* next;
};

typedef struct UnkMotion {
    AllocatedBlock* block;
    unk32 unk4;
    unk32 unk8;
    unk16 unkC;
    unk16 unkE;
    unk32 unk10;
    unk32 unk14;
} UnkMotion;

typedef struct FrontendSubobject {
    unk8 pad0[0x14];
    unk32 unk14;
    unk8 pad18[8];
    unk32 unk20;
} FrontendSubobject;

typedef struct FrontendObject {
    unk8 pad0[4];
    FrontendSubobject* unk4;
} FrontendObject;

typedef struct FrontendState {
    unk32 unk0;
    unk32 unk4;
    unk32 unk8;
    unk32 unkC;
    unk32 unk10;
    unk8 unk14[0x68];
    unk8 unk7C;
    unk8 unk7D;
    unk8 unk7E;
    unk8 unk7F;
    unk8 unk80;
    unk8 unk81;
    unk8 pad82[0x32];
    FrontendObject* unkB4;
    unk8 padB8[0x36C];
    unk32 unk424;
    unk8 pad428[0x30];
    UnkMotion motion;
    unk32 unk470;
    unk16 unk474;
    unk8 pad476[0xB];
    unk8 unk481;
    unk8 pad482[0xF6];
    unk32 unk578;
    unk32 unk57C;
    unk32 unk580;
    unk8 unk584;
    s8 unk585;
    unk8 unk586;
    unk8 pad587[1];
    unk32 unk588;
    unk32 unk58C;
    unk8 unk590[0x18];
    unk32 unk5A8;
} FrontendState;

typedef struct UnkMenu {
    unk8 unk0[0x24];
    unk32 unk24;
} UnkMenu;

typedef struct UnkTrail {
    unk8 unk0[0x10];
    unk32 unk10;
    unk32 unk14;
    unk8 unk18[0x14];
    unk16 unk2C;
} UnkTrail;

typedef struct UnkActor {
    unk8 unk0[0x8D];
    unk8 unk8D;
} UnkActor;

typedef struct SpriteEntry SpriteEntry;
typedef struct GeometryLine GeometryLine;

typedef struct EnvironmentActorCounters {
    s32 lineIndex;
    s32 selectedCount;
    s32 effectCount;
} EnvironmentActorCounters;

typedef struct EnvironmentActorConfig {
    unk8 pad0[4];
    unk8 unk4;
    unk8 unk5;
    unk8 unk6;
    unk8 unk7;
    unk32 unk8;
    unk8 padC[8];
    unk32 unk14;
} EnvironmentActorConfig;

typedef struct EnvironmentActorState {
    void* unk0;
    void* unk4;
    unk8 pad8[0x18];
    void* unk20;
    unk32 unk24;
    unk8 pad28[4];
    unk16 unk2C;
    unk8 pad2E[6];
} EnvironmentActorState;

typedef struct EnvironmentActorCallbackData {
    unk8 data[0x88];
} EnvironmentActorCallbackData;

typedef struct EnvironmentPointEntry {
    unk16 line;
    unk16 pad2;
    GeometryLine* geometry;
} EnvironmentPointEntry;

typedef struct EnvironmentActorMetaObject {
    unk16 size;
    unk16 type;
    unk16 id;
    unk16 unk6;
    EnvironmentActorConfig* config;
} EnvironmentActorMetaObject;

typedef struct EnvironmentActorOffsetMeta {
    unk16 size;
    unk16 type;
    unk16 id;
    unk16 unk6;
    s16 x;
    unk16 padA;
    s16 y;
} EnvironmentActorOffsetMeta;

typedef struct EnvironmentActorTransformMeta {
    unk16 size;
    unk16 type;
    unk16 id;
    unk16 unk6;
    s32 x;
    s32 y;
    s32 z;
} EnvironmentActorTransformMeta;

typedef union EnvironmentActorPosition {
    SpriteEntry* sprite;
    s32 x;
} EnvironmentActorPosition;

/* The position x field and cleanup sprite handle share offset 0x4. */
typedef struct EnvironmentActorSlot {
    unk32 objectId;
    EnvironmentActorPosition unk4;
    s32 y;
    s32 z;
    unk8 pad10[0x29];
    unk8 unk39;
    unk8 pad3A[2];
    void* unk3C;
    s32 unk40;
    s32 unk44;
    s32 unk48;
    s32 unk4C;
    s32 unk50;
    s32 unk54;
    unk8 pad58[0x10];
    unk32 unk68;
    unk8 pad6C[0x24];
    EnvironmentActorState state90;
} EnvironmentActorSlot;

typedef struct EnvironmentActorContainer {
    unk8 pad0[0xB4];
    EnvironmentActorSlot slots[1];
} EnvironmentActorContainer;

typedef struct EnvironmentNode {
    SpriteEntry* sprite;
    GeometryLine* geometry;
    unk32 unk8;
    unk32 unkC;
    unk16 unk10;
    unk16 unk12;
    const void* unk14;
    EnvironmentActorSlot* actor;
} EnvironmentNode;

typedef struct EnvironmentObject {
    void* unk0;
    SpriteEntry* sprite;
    unk32 unk8;
    unk32 unkC;
    unk16 unk10;
    unk16 unk12;
    s32 unk14;
    s32 unk18;
    s32 unk1C;
    s32 unk20;
    s32 unk24;
    s32 unk28;
    s32 unk2C;
    s32 unk30;
    s32 unk34;
    unk16 unk38;
    unk16 unk3A;
    unk16 unk3C;
    unk16 unk3E;
    unk8 pad40[0xC];
} EnvironmentObject;

typedef struct EnvironmentActorAllocation {
    AllocatedBlock* block;
    EnvironmentNode* effect;
    EnvironmentActorContainer* actorContainer;
    unk32 effectCount;
    unk32 actorCount;
    EnvironmentObject* lineObjects;
    unk32 points;
    unk32 callbacks;
} EnvironmentActorAllocation;

typedef struct SpriteTextBlock {
    SpriteEntry* prev;
    SpriteEntry* next;
    unk32 count;
} SpriteTextBlock;

typedef struct SpriteTextCleanup {
    unk32 x;
    unk32 y;
    unk16 unk8;
    unk16 unkA;
    unk16 unkC;
    unk8 unkE;
    unk8 unkF;
    unk16 unk10;
    unk16 unk12;
    SpriteTextBlock unk14;
    const u8* unk20;
    const u8* unk24;
    unk8 unk28;
    s8 unk29;
    unk8 unk2A;
    unk8 unk2B;
    SpriteEntry* ptr2C;
} SpriteTextCleanup;

typedef struct RiderBase {
    unk8 unk0[0x238];
    unk8 unk238[4];
    unk8 unk23C[0xC0];
    unk8 unk2FC[4];
    unk8 unk300[0xC4];
    unk32 unk3C4;
    unk8 unk3C8[0x20];
    unk8 unk3E8;
    unk8 unk3E9[3];
    unk8 unk3EC[0x34];
    struct AllocatedBlock* unk420;
    unk8 pad424[4];
} RiderBase; /* 0x428; GameData begins with this layout */

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

typedef struct Particle {
    void* sprite;
    unk8 pad4[0x20];
} Particle;

typedef struct ParticleSystem {
    unk32 unk0;
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

/* Canonical level-geometry handle (0x11C bytes); filled by
 * getLevelGeometryAddresses(LevelGeometryAddresses*, void* geometryData). */
typedef struct GeometryPoint {
    s32 x;
    s32 y;
    s32 z;
    unk32 padC;
} GeometryPoint;

struct GeometryLine {
    unk32 point0;
    unk32 point1;
    unk8 unk8;
    unk8 pad9[0xD];
    unk16 type;
    unk8 pad18[8];
}; /* 0x20; stride proven by line-table indexing */

typedef struct GeometrySpline {
    unk32 pointCount;
    unk32 size;
    unk8 pad8[0x18];
    unk32 pointIndices[1];
} GeometrySpline;

typedef struct LevelGeometryTable LevelGeometryTable;

typedef struct LevelDesign {
    unk8 pad0[0x80];
    LevelGeometryTable* geometry;
} LevelDesign;

struct LevelGeometryTable {
    unk32 pointCount;

    /* Width pun proven by asm: getLevelGeometryAddresses reads this with
     * ldrsh/ldrh [r1,#4]; GetSplineAtIndex reads it with ldr [r0,#4]. */
    union {
        s16 splineCount;
        unk32 splineCountWord;
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

struct LineMetaObject {
    unk16 size; /* byte size of this record */
    unk16 type;
    unk16 id;
    unk16 unk6;
    unk32 unk8;
};

struct LineMetadata {
    unk16 count;
    unk16 pad2;
    LineMetaObject objects[1];
};

typedef struct LevelGeometryAddresses {
    LevelGeometryTable* unk0;
    GeometryPoint* unk4;
    GeometrySpline* unk8;
    GeometryLine* unkC;
    void* unk10;
    GeometrySpline* unk14[0x40];
    LineMetadata** unk114;
    unk16 unk118;
    unk8 pad11A[2];
} LevelGeometryAddresses;

typedef struct LevelState {
    unk16 unk0;
    unk16 unk2;
    s32 unk4;
    s32 unk8;
    struct LevelDescription* unkC;
    unk32 unk10;
    unk32 unk14;
} LevelState;

typedef struct CollectableEntry {
    GeometryLine* geometry;
    unk32 line;
} CollectableEntry;

typedef struct CollectableData {
    unk32 count;
    CollectableEntry entries[0x20];
    unk32 collectedBits;
} CollectableData;

typedef struct TutorialPage {
    unk8 data[0xB4];
} TutorialPage;

typedef struct TutorialEntry {
    unk32 line;
    TutorialPage* sprite;
} TutorialEntry;

typedef struct TutorialData {
    unk32 count;
    TutorialEntry entries[0x20];
    unk32 unk104;
    unk8 fontData[0x30];
    unk32 unk138;
    unk32 unk13C;
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
    void* unk3C;
    void* unk40;
} MultiPlayerState;

typedef struct MultiPlayerAllocation {
    MultiPlayerState state;
    unk8 data[1];
} MultiPlayerAllocation;

typedef struct Unk80516E0 {
    unk8 unk0;
    unk8 pad1;
    unk16 unk2;
    void* unk4;
} Unk80516E0;

typedef struct LevelDescription {
    unk8 unk0;
    unk8 unk1;
    unk8 pad2[2];
    s32 unk4;
    s32 unk8;
    unk8 padC[5];
    unk8 unk11;
    unk8 pad12[6];
    unk32 unk18;
    unk8 unk1C;
    unk8 unk1D[3];
    s32 unk20;
    s32 unk24;
    s32 unk28;
    LineMetadata** metadata;
    unk8 pad30[0xA0];
} LevelDescription;

#define true 1
#define false 0

#define min(a, b) (((a) < (b)) ? (a) : (b))
#define max(a, b) (((a) > (b)) ? (a) : (b))

#define ASM_ZEROPAD asm(".align 2, 0\n");

#endif // BEY_COMMON
