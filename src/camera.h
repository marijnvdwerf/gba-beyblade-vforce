#ifndef _CAMERA_H
#define _CAMERA_H

#include "common.h"
#include "layer.h"

typedef struct CameraDisplayEntry {
    struct DisplayRecord* display;
    unk8 pad4[0x14];
} CameraDisplayEntry;

typedef struct CameraSubState {
    unk8 pad0[0x14];
    CameraDisplayEntry entries[4];
    unk8 pad74[0xC];
    unk32 unk80;
} CameraSubState;

typedef struct CameraState {
    struct DisplayRecord records[4];
    LevelDesign* unk220;
    void* unk224;
    LevelGeometryAddresses geometry;
    void (*callback)(void*, struct CameraState*);
    unk32 unk348;
    unk8 pad34C[8];
    s8 unk354;
    s8 unk355;
    unk8 unk356;
    unk8 pad357;
    unk16 unk358;
    unk8 pad35A[2];
    unk16 unk35C;
    unk16 unk35E;
    unk16 unk360;
    unk16 unk362;
    unk32 unk364;
    unk32 unk368;
} CameraState;

void nullsub_12(void*);
void sub_805EADC(CameraState*);
void sub_805EB00(CameraState*);
void sub_805EBCC(CameraState*);
LevelGeometryAddresses* sub_805EEE0(CameraState*);
void sub_805E8D8(CameraState*, LevelDesign*, unk16, s32*);
void sub_805E8A0(CameraState*, LevelDesign*, unk16, s32*);
void sub_805EEFC(CameraState*, unk32, unk32);

#endif
