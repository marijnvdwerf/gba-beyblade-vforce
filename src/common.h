#ifndef BEY_COMMON
#define BEY_COMMON

#include <agb/types.h>

typedef u8 bool8;
typedef u16 bool16;
typedef u32 bool32;

typedef u8 unk8;
typedef u16 unk16;
typedef u32 unk32;

typedef struct Unk3000650 {
    unk8 unk0[0xC];
    unk32 unkC;
    unk32 unk10;
    unk8 unk14[0x40];
} Unk3000650;

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

/* Canonical level-geometry handle (0x11C bytes); filled by
 * getLevelGeometryAddresses(LevelGeometryAddresses*, void* geometryData). */
typedef struct LevelGeometryTable {
    unk8 pad0[8];
    s32 unk8;
} LevelGeometryTable;

typedef struct LevelGeometryAddresses {
    LevelGeometryTable* unk0;
    void* unk4;
    void* unk8;
    void* unkC;
    void* unk10;
    void* unk14[0x40];
    void* unk114;
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

typedef struct Unk80516E0 {
    unk8 unk0;
    unk8 pad1;
    unk16 unk2;
    void* unk4;
} Unk80516E0;

typedef struct LevelDescription {
    unk8 unk0;
    unk8 pad1[3];
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
    unk8 pad2C[0xA4];
} LevelDescription;

#define true 1
#define false 0

#define min(a, b) (((a) < (b)) ? (a) : (b))
#define max(a, b) (((a) > (b)) ? (a) : (b))

#define ASM_ZEROPAD asm(".align 2, 0\n");

#endif // BEY_COMMON
