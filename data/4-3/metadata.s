    .include "asm/common.inc"

global LineDataE04S03
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
    .4byte LineDataE04S03_10
    .4byte LineDataE04S03_11
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
    .4byte NULL
    .4byte NULL
    .4byte NULL
    .4byte LineDataE04S03_30

LineDataE04S03_10:
    .2byte 11
    .align 2, 0
    linedata_1 ID_WEIGHT, 250
    linedata_1 ID_ACCELERATION, 12
    linedata_1 ID_FRICTION, 10
    linedata_1 ID_AI_TARGET_RADIUS, 100
    linedata_1 ID_AI_TARGET_TIME, 80
    linedata_1 ID_UNK_505B, 1000
    linedata_1 ID_AI_BOSS, 0
    linedata_3 ID_AI_PATH, ID_UNK_6C0D
    linedata_1 ID_AI_PATH_SPEED, 1024
    linedata_1 ID_AI_RECHARGE_RATE, 8
    linedata_1 ID_UNK_F0F8, 1

LineDataE04S03_11:
    .2byte 11
    .align 2, 0
    linedata_2 ID_ACTOR, SpriteSheet_822D814
    linedata_6 ID_COLLECT
    linedata_18 ID_COLLECT
    linedata_8 ID_NONE, 1, 2
    linedata_10 ID_ACTOR, 0, 960
    linedata_3 ID_COLLECTABLE, ID_COLLECTION
    linedata_1 ID_COLLECTABLE, 46
    linedata_13 ID_NONE, 0, 0x8C, 0x30, 0x00, 0x00, 0x00, 0x00, 0x00
    linedata_7 ID_COLLECT, 3, 5

LineDataE04S03_30:
    .2byte 9
    .align 2, 0
    linedata_2 ID_ACTOR, SpriteSheet_8227CEC
    linedata_6 ID_CHARGE_2
    linedata_18 ID_CHARGE_2
    linedata_8 ID_NONE, 1, 2
    linedata_13 ID_NONE, 0, 0x00, 0x30, 0x00, 0x00, 0x00, 0x00, 0x00
    linedata_1 ID_UNK_2A39, 0
    linedata_7 ID_CHARGE_2, 3, 3

