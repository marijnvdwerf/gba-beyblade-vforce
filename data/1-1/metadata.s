    .include "asm/common.inc"

global LineDataE01S01
    .4byte NULL
    .4byte NULL
    .4byte NULL
    .4byte NULL
    .4byte NULL
    .4byte NULL
    .4byte NULL
    .4byte LineDataE01S01_7
    .4byte LineDataE01S01_8
    .4byte LineDataE01S01_9
    .4byte LineDataE01S01_10
    .4byte NULL
    .4byte NULL
    .4byte NULL
    .4byte NULL

LineDataE01S01_7:
    .2byte 11
    .align 2, 0
    linedata_2 ID_ACTOR, SpriteSheet_822D814
    linedata_6 ID_COLLECT
    linedata_18 ID_COLLECT
    linedata_8 ID_NONE, 1, 2
    linedata_10 ID_ACTOR, 0, 960
    linedata_3 ID_COLLECTABLE, ID_COLLECTION_0
    linedata_1 ID_COLLECTABLE, 0
    linedata_13 ID_NONE, 0, 0x8C, 0x30, 0x00, 0x00, 0x00, 0x00, 0x00
    linedata_7 ID_COLLECT, 3, 5

LineDataE01S01_8:
    .2byte 4
    .align 2, 0
    linedata_6 ID_TUTORIAL
    linedata_18 ID_TUTORIAL
    linedata_1 ID_TUTORIAL_TRIGGER, 0
    linedata_7 ID_TUTORIAL, 2, 1

LineDataE01S01_9:
    .2byte 4
    .align 2, 0
    linedata_6 ID_TUTORIAL_1
    linedata_18 ID_TUTORIAL_1
    linedata_1 ID_TUTORIAL_TRIGGER, 1
    linedata_7 ID_TUTORIAL_1, 2, 1

LineDataE01S01_10:
    .2byte 4
    .align 2, 0
    linedata_6 ID_TUTORIAL_4
    linedata_18 ID_TUTORIAL_4
    linedata_1 ID_TUTORIAL_TRIGGER, 3
    linedata_7 ID_TUTORIAL_4, 2, 1

