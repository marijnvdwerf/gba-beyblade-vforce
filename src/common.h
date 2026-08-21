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

typedef struct UnkSpriteText {
    unk8 unk0[0x28];
    unk8 unk28;
    unk8 unk29;
    unk8 unk2A;
} UnkSpriteText;

typedef struct SpriteTextCleanup {
    unk8 unk0[0xA];
    unk16 unkA;
    unk8 unkC[0x8];
    unk8 unk14[0x18];
    void* ptr2C;
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
typedef struct LevelGeometryLine {
    unk8 unk0[0x20];
} LevelGeometryLine;

typedef struct LevelGeometryTable {
    unk8 pad0[8];
    s32 unk8;
} LevelGeometryTable;

typedef struct LevelGeometryAddresses {
    LevelGeometryTable* unk0;
    void* unk4;
    void* unk8;
    LevelGeometryLine* unkC;
    void* unk10;
    void* unk14[0x40];
    void* unk114;
    unk16 unk118;
    unk8 pad11A[2];
} LevelGeometryAddresses;

typedef struct GeometryPoint {
    s32 x;
    s32 y;
    s32 z;
    unk32 unkC;
} GeometryPoint;

typedef struct GeometryLine {
    unk32 pointIndex;
    unk8 pad4[4];
    unk8 unk8;
    unk8 pad9[0xD];
    unk16 type;
    unk8 pad18[8];
} GeometryLine;

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
    LevelGeometryLine* geometry;
    unk32 line;
} CollectableEntry;

typedef struct CollectableData {
    unk32 count;
    CollectableEntry entries[0x20];
    unk32 collectedBits;
} CollectableData;

typedef struct LineMetaObject {
    unk8 unk0[8];
    unk32 unk8;
} LineMetaObject;

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
    unk32 unk2C;
    unk8 pad30[0xA0];
} LevelDescription;

#define true 1
#define false 0

#define min(a, b) (((a) < (b)) ? (a) : (b))
#define max(a, b) (((a) > (b)) ? (a) : (b))

#define ASM_ZEROPAD asm(".align 2, 0\n");

#endif // BEY_COMMON
