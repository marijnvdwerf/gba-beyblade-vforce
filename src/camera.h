#ifndef _CAMERA_H
#define _CAMERA_H

#include "common.h"

typedef struct CameraSubState {
    unk8 pad0[0x80];
    unk32 unk80;
} CameraSubState;

typedef struct CameraState {
    unk8 pad220[0x220];
    CameraSubState* unk220;
    unk32 unk224;
    unk32 unk228;
    unk8 pad22C[0x11C];
    unk32 unk348;
    unk8 pad34C[9];
    unk8 unk355;
    unk8 unk356;
    unk8 pad357;
    unk16 unk358;
    unk8 pad35A[0xA];
    unk32* unk364;
    unk32* unk368;
} CameraState;

void nullsub_12(void*);
void sub_805EADC(CameraState*);
unk32* sub_805EEE0(CameraState*);
void sub_805E8A0(CameraState*, unk32*, unk16, unk32*);
void sub_805EEFC(CameraState*, unk32, unk32);

#endif /* _CAMERA_H */
