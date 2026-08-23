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
typedef struct SpriteEntry SpriteEntry;
typedef struct SpriteTextBlock SpriteTextBlock;
typedef struct SpriteTextCleanup SpriteTextCleanup;

struct SpriteTextBlock {
    SpriteEntry* prev;
    SpriteEntry* next;
    unk32 count;
};

struct SpriteTextCleanup {
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
    s8 unk2A; /* ldsb r0, [r7, r0] at .L8061430 in sub_806123C */
    unk8 unk2B;
    SpriteEntry* ptr2C;
};

struct AllocatedBlock {
    void* address;
    u32 size;
    AllocatedBlock* previous;
    AllocatedBlock* next;
};

typedef struct UnkMotion {
    AllocatedBlock* block;
    unk32* sourceBlock;
    unk32* motions;
    s16 count;
    unk16 mode;
    unk32 unk10;
    unk32 unk14;
} UnkMotion;

typedef struct FrontendSubobject {
    unk8 pad0[0x14];
    unk32 unk14;
    unk32 unk18;
    unk8 pad1C[8];
    unk32 unk24;
    unk8 pad28[0x54];
    unk8 unk7C;
} FrontendSubobject;

typedef struct FrontendState FrontendState;

typedef struct UnkMenuItem UnkMenuItem;

typedef void (*UnkMenuCallback)(UnkMenuItem*, s32, UnkMenuItem*, s32);

struct UnkMenuItem {
    unk8 pad0[0x30];
    const u8* text;
    s32 value;
    s32 count;
    unk32 flags;
    const u8* options;
    unk8 disabled;
    unk8 pad45[3];
    UnkMenuItem* next;
};

typedef struct FrontendMenu {
    unk8 pad0[4];
    unk32 selection;
} FrontendMenu;

typedef struct MenuState {
    unk8 pad0[0xC];
    UnkMenuItem* items; /* 0xC */
    unk8 pad10[4];
    s32 itemCount; /* 0x14 */
    unk32 objectCount; /* 0x18 */
    unk8 pad1C[8];
    s32 unk24; /* 0x24 */
    unk8 pad28[4];
    unk8 normalColor; /* 0x2C */
    unk8 disabledColor; /* 0x2D */
    unk8 selectedColor; /* 0x2E */
    unk8 pad2F;
    UnkMenuCallback callback; /* 0x30 */
    void (*valueCallback)(UnkMenuItem*, s32); /* 0x34 */
    FrontendMenu menu; /* 0x4B0 */
    unk8 pad40[0x68];
    UnkMotion* objectItems; /* 0xA8 */
    unk32 allocation; /* 0xAC */
    unk32 timer; /* 0xB0 */
    SpriteTextCleanup cleanup; /* 0xB4 */
    UnkMotion motion; /* 0xE4 */
    unk8 padFC[4];
} MenuState;

typedef struct FrontendResource {
    s16 state;
    s16 timer;
    const unk32* data;
} FrontendResource;

typedef struct FrontendObject {
    unk32 unk0;
    FrontendSubobject* unk4;
    void (*unk8)(FrontendState*, unk32, unk32);
    void (*unkC)(FrontendState*, unk32);
    void (*unk10)(FrontendState*, unk32);
    void (*unk14)(FrontendState*, unk32);
} FrontendObject;

struct FrontendState {
    unk32 unk0;
    unk32 unk4;
    unk32 unk8;
    unk32 unkC;
    unk32 unk10;
    unk32 unk14[0x1A];
    unk8 unk7C;
    unk8 unk7D;
    unk8 unk7E;
    unk8 unk7F;
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
    unk8 pad1C0[0x264];
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
    unk8 unk584;
    s8 unk585;
    unk8 unk586;
    unk8 pad587[1];
    void (*unk588)(FrontendState*, unk32);
    unk32 unk58C;
    unk8 unk590[0x18];
    unk32 unk5A8;
};

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

typedef struct Actor {
    unk8 pad0[4];
    unk32 x;
    unk32 y;
    unk8 padC[4];
    unk8 unk10;
    unk8 unk11;
    unk16 unk12;
    unk16 unk14;
    unk16 unk16;
    unk8 pad18[0xA];
    s16 unk22;
    unk8 pad24[0x1C];
    unk32 unk40;
    unk32 unk44;
    unk32 unk48;
    unk32 unk4C;
    unk32 unk50;
    unk32 unk54;
    unk8 pad58[0x18];
    unk32 unk70;
    unk32 unk74;
    unk32 unk78;
    struct AllocatedBlock* unk7C;
    unk8 pad80[0x22];
    s16 unkA2;
    unk8 padA4[0x14];
    SpriteEntry* unkB8;
    unk8 padBC[8];
} Actor;

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
    unk8 pad0[4];
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
    unk8 count;
    unk8 flags;
    unk16 mode;
    unk32 x;
    unk32 previousX;
    const u8* text;
    unk32 y;
    unk32 unk18;
    unk8 pad1C[4];
    unk32 width;
    s16 scaleX;
    s16 scaleY;
    const u8* widthTable;
    unk32 timer;
};

typedef struct Particle {
    SpriteEntry* sprite;
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

/* Proven width pun: ldrh at rider-state +6 and ldrb at +7 overlap. */
typedef union RiderStatePrefix {
    struct {
        unk16 unk0;
        unk16 unk2;
        unk16 unk4;
        unk16 unk6;
    } words;

    struct {
        unk8 pad0[7];
        unk8 unk7;
    } bytes;
} RiderStatePrefix;

typedef struct RiderState {
    RiderStatePrefix prefix;
    unk16 unk8;
    unk16 unkA;
    unk8 unkC;
    unk8 unkD;
    unk8 padE[0x46];
    unk32 unk54;
} RiderState;

typedef struct RiderBase {
    RiderState* unk0;
    unk32 unk4;
    unk8 pad8[8];
    unk32 unk10;
    unk32 unk14;
    unk8 pad18[4];
    unk32 unk1C;
    unk8 pad20[0x7C];
    unk32 flags;
    unk32 unkA0;
    unk32 unkA4;
    unk8 padA8[0x10];
    SpriteEntry* unkB8;
    unk8 padBC[0x178];
    s32 unk234;
    Actor unk238;
    Actor unk2FC;
    unk8 pad3C0[4];
    SpriteEntry* unk3C4;
    unk8 pad3C8[0x20];
    unk8 unk3E8;
    unk8 unk3E9[3];
    ParticleSystem unk3EC;
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

/* Canonical level-geometry handle (0x11C bytes); filled by
 * getLevelGeometryAddresses(LevelGeometryAddresses*, void* geometryData). */
typedef struct GeometryPoint {
    s32 x;
    s32 y;
    s32 z;
    unk32 padC;
} GeometryPoint;

typedef struct GeometryLine {
    unk32 point0;
    unk32 point1;
    unk8 unk8;
    unk8 pad9[0xD];
    unk16 type;
    unk8 pad18[8];
} GeometryLine; /* 0x20; stride proven by line-table indexing */

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
    unk8* unk104;
    SpriteTextCleanup fontData;
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
    unk32 unk30;
    unk32 unk34;
    unk8 pad38[0x58];
    unk32 unk90;
    unk8 pad94[0x3C];
} LevelDescription;

#define true 1
#define false 0

#define min(a, b) (((a) < (b)) ? (a) : (b))
#define max(a, b) (((a) > (b)) ? (a) : (b))

#define ASM_ZEROPAD asm(".align 2, 0\n");

#endif // BEY_COMMON
