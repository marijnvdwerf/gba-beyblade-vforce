    .include "asm/common.inc"

global LineDataE01S06
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
    .4byte LineDataE01S06_10
    .4byte LineDataE01S06_11
    .4byte LineDataE01S06_12
    .4byte LineDataE01S06_13
    .4byte LineDataE01S06_14
    .4byte LineDataE01S06_15
    .4byte LineDataE01S06_16
    .4byte LineDataE01S06_17
    .4byte NULL
    .4byte NULL
    .4byte NULL
    .4byte NULL
    .4byte NULL
    .4byte NULL
    .4byte NULL
    .4byte NULL
    .4byte NULL

LineDataE01S06_10:
    .2byte 8
    .align 2, 0
    linedata_2 ID_ACTOR, SpriteSheet_8238A5C
    linedata_6 ID_SPEED
    linedata_18 ID_SPEED
    linedata_8 ID_NONE, 1, 0
    linedata_4 ID_UNK_B396, -1024, 0, 0
    linedata_7 ID_SPEED, 3, 2

LineDataE01S06_11:
    .2byte 8
    .align 2, 0
    linedata_2 ID_ACTOR, SpriteSheet_8238A5C
    linedata_6 ID_SPEED_1
    linedata_18 ID_SPEED_1
    linedata_8 ID_NONE, 1, 0
    linedata_4 ID_UNK_B396, -1024, 0, 0
    linedata_7 ID_SPEED_1, 3, 2

LineDataE01S06_12:
    .2byte 8
    .align 2, 0
    linedata_2 ID_ACTOR, SpriteSheet_8238A5C
    linedata_6 ID_SPEED_2
    linedata_18 ID_SPEED_2
    linedata_8 ID_NONE, 1, 0
    linedata_4 ID_UNK_B396, -1024, 0, 0
    linedata_7 ID_SPEED_2, 3, 2

LineDataE01S06_13:
    .2byte 8
    .align 2, 0
    linedata_2 ID_ACTOR, SpriteSheet_82355DC
    linedata_6 ID_SPEEDX
    linedata_18 ID_SPEEDX
    linedata_8 ID_NONE, 1, 0
    linedata_4 ID_UNK_B396, 1024, 0, 0
    linedata_7 ID_SPEEDX, 3, 2

LineDataE01S06_14:
    .2byte 8
    .align 2, 0
    linedata_2 ID_ACTOR, SpriteSheet_82355DC
    linedata_6 ID_SPEED_3
    linedata_18 ID_SPEED_3
    linedata_8 ID_NONE, 1, 0
    linedata_4 ID_UNK_B396, 1024, 0, 0
    linedata_7 ID_SPEED_3, 3, 2

LineDataE01S06_15:
    .2byte 10
    .align 2, 0
    linedata_1 ID_WEIGHT, 256
    linedata_1 ID_ACCELERATION, 8
    linedata_1 ID_FRICTION, 8
    linedata_1 ID_AI_TARGET_RADIUS, 0
    linedata_1 ID_AI_TARGET_TIME, 60
    linedata_1 ID_UNK_505B, 1000
    linedata_3 ID_AI_PATH, ID_PATH
    linedata_1 ID_AI_PATH_SPEED, 1024
    linedata_1 ID_UNK_F0F8, 0
    linedata_1 ID_AI_RECHARGE_RATE, 3

LineDataE01S06_16:
    .2byte 8
    .align 2, 0
    linedata_1 ID_WEIGHT, 256
    linedata_1 ID_ACCELERATION, 8
    linedata_1 ID_FRICTION, 8
    linedata_1 ID_AI_TARGET_RADIUS, 0
    linedata_1 ID_AI_TARGET_TIME, 60
    linedata_1 ID_UNK_505B, 1000
    linedata_3 ID_AI_PATH, ID_UNK_32FC
    linedata_1 ID_AI_PATH_SPEED, 1024

LineDataE01S06_17:
    .2byte 11
    .align 2, 0
    linedata_2 ID_ACTOR, SpriteSheet_82371A0
    linedata_6 ID_COLLECT
    linedata_18 ID_COLLECT
    linedata_8 ID_NONE, 1, 2
    linedata_10 ID_ACTOR, 0, 960
    linedata_3 ID_COLLECTABLE, ID_COLLECTION
    linedata_1 ID_COLLECTABLE, 68
    linedata_13 ID_NONE, 0, 0x8C, 0x30, 0x00, 0x00, 0x00, 0x00, 0x00
    linedata_7 ID_COLLECT, 3, 5

