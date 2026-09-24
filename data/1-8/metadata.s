    .include "asm/common.inc"

global LineDataE01S08
    .4byte NULL
    .4byte NULL
    .4byte NULL
    .4byte NULL
    .4byte NULL
    .4byte NULL
    .4byte NULL
    .4byte NULL
    .4byte NULL
    .4byte NULL
    .4byte NULL
    .4byte NULL
    .4byte NULL
    .4byte NULL
    .4byte LineDataE01S08_14
    .4byte LineDataE01S08_15
    .4byte LineDataE01S08_16
    .4byte LineDataE01S08_17
    .4byte LineDataE01S08_18
    .4byte NULL
    .4byte NULL
    .4byte NULL
    .4byte NULL
    .4byte NULL
    .4byte NULL
    .4byte NULL
    .4byte NULL
    .4byte LineDataE01S08_27
    .4byte LineDataE01S08_28
    .4byte LineDataE01S08_29
    .4byte LineDataE01S08_30
    .4byte NULL
    .4byte NULL
    .4byte NULL
    .4byte NULL
    .4byte NULL
    .4byte NULL
    .4byte NULL
    .4byte NULL
    .4byte NULL
    .4byte NULL
    .4byte NULL
    .4byte NULL
    .4byte NULL
    .4byte NULL
    .4byte NULL

LineDataE01S08_14:
    .2byte 8
    .align 2, 0
    linedata_1 ID_WEIGHT, 256
    linedata_1 ID_ACCELERATION, 10
    linedata_1 ID_FRICTION, 8
    linedata_1 ID_AI_TARGET_RADIUS, 100
    linedata_1 ID_AI_TARGET_TIME, 600
    linedata_1 ID_UNK_505B, 1000
    linedata_3 ID_AI_PATH, ID_PATH_1
    linedata_1 ID_AI_PATH_SPEED, 1024

LineDataE01S08_15:
    .2byte 8
    .align 2, 0
    linedata_1 ID_WEIGHT, 256
    linedata_1 ID_ACCELERATION, 10
    linedata_1 ID_FRICTION, 8
    linedata_1 ID_AI_TARGET_RADIUS, 100
    linedata_1 ID_AI_TARGET_TIME, 600
    linedata_1 ID_UNK_505B, 1000
    linedata_3 ID_AI_PATH, ID_PATH_2
    linedata_1 ID_AI_PATH_SPEED, 1024

LineDataE01S08_16:
    .2byte 8
    .align 2, 0
    linedata_1 ID_WEIGHT, 256
    linedata_1 ID_ACCELERATION, 10
    linedata_1 ID_FRICTION, 8
    linedata_1 ID_AI_TARGET_RADIUS, 100
    linedata_1 ID_AI_TARGET_TIME, 600
    linedata_1 ID_UNK_505B, 1000
    linedata_3 ID_AI_PATH, ID_PATH_3
    linedata_1 ID_AI_PATH_SPEED, 1024

LineDataE01S08_17:
    .2byte 8
    .align 2, 0
    linedata_1 ID_WEIGHT, 256
    linedata_1 ID_ACCELERATION, 10
    linedata_1 ID_FRICTION, 8
    linedata_1 ID_AI_TARGET_RADIUS, 100
    linedata_1 ID_AI_TARGET_TIME, 600
    linedata_1 ID_UNK_505B, 1000
    linedata_3 ID_AI_PATH, ID_PATH_4
    linedata_1 ID_AI_PATH_SPEED, 1024

LineDataE01S08_18:
    .2byte 8
    .align 2, 0
    linedata_1 ID_WEIGHT, 256
    linedata_1 ID_ACCELERATION, 10
    linedata_1 ID_FRICTION, 8
    linedata_1 ID_AI_TARGET_RADIUS, 100
    linedata_1 ID_AI_TARGET_TIME, 600
    linedata_1 ID_UNK_505B, 1000
    linedata_3 ID_AI_PATH, ID_PATH_5
    linedata_1 ID_AI_PATH_SPEED, 1024

LineDataE01S08_27:
    .2byte 8
    .align 2, 0
    linedata_2 ID_ACTOR, SpriteSheet_82355DC
    linedata_6 ID_SPEEDX_06
    linedata_18 ID_SPEEDX_06
    linedata_8 ID_NONE, 1, 0
    linedata_4 ID_UNK_B396, 1024, 0, 0
    linedata_7 ID_SPEEDX_06, 3, 2

LineDataE01S08_28:
    .2byte 8
    .align 2, 0
    linedata_2 ID_ACTOR, SpriteSheet_822BC50
    linedata_6 ID_SPEEDDOWN_1
    linedata_18 ID_SPEEDDOWN_1
    linedata_8 ID_NONE, 1, 0
    linedata_4 ID_UNK_B396, 0, -1024, 0
    linedata_7 ID_SPEEDDOWN_1, 3, 2

LineDataE01S08_29:
    .2byte 11
    .align 2, 0
    linedata_2 ID_ACTOR, SpriteSheet_82325B0
    linedata_6 ID_COLLECT
    linedata_18 ID_COLLECT
    linedata_8 ID_NONE, 1, 2
    linedata_10 ID_ACTOR, 0, 960
    linedata_3 ID_COLLECTABLE, ID_COLLECTION_0
    linedata_1 ID_COLLECTABLE, 97
    linedata_13 ID_NONE, 0, 0x8C, 0x30, 0x00, 0x00, 0x00, 0x00, 0x00
    linedata_7 ID_COLLECT, 3, 5

LineDataE01S08_30:
    .2byte 11
    .align 2, 0
    linedata_2 ID_ACTOR, SpriteSheet_822D814
    linedata_6 ID_COLLECT_1
    linedata_18 ID_COLLECT_1
    linedata_8 ID_NONE, 1, 2
    linedata_10 ID_ACTOR, 0, 960
    linedata_3 ID_COLLECTABLE, ID_COLLECTION_0
    linedata_1 ID_COLLECTABLE, 59
    linedata_13 ID_NONE, 0, 0x8C, 0x30, 0x00, 0x00, 0x00, 0x00, 0x00
    linedata_7 ID_COLLECT_1, 3, 5

