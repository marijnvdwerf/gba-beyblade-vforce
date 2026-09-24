    .include "asm/common.inc"

global LineDataE03S05
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
    .4byte LineDataE03S05_29
    .4byte LineDataE03S05_30
    .4byte NULL
    .4byte LineDataE03S05_32
    .4byte LineDataE03S05_33
    .4byte LineDataE03S05_34
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
    .4byte NULL
    .4byte NULL
    .4byte NULL
    .4byte NULL
    .4byte NULL
    .4byte NULL

LineDataE03S05_29:
    .2byte 9
    .align 2, 0
    linedata_1 ID_WEIGHT, 256
    linedata_1 ID_ACCELERATION, 8
    linedata_1 ID_FRICTION, 8
    linedata_1 ID_AI_TARGET_RADIUS, 100
    linedata_1 ID_AI_TARGET_TIME, 120
    linedata_1 ID_UNK_505B, 10000
    linedata_3 ID_AI_PATH, ID_PATH
    linedata_1 ID_AI_PATH_SPEED, 700
    linedata_1 ID_UNK_F0F8, 1

LineDataE03S05_30:
    .2byte 9
    .align 2, 0
    linedata_1 ID_WEIGHT, 256
    linedata_1 ID_ACCELERATION, 8
    linedata_1 ID_FRICTION, 8
    linedata_1 ID_AI_TARGET_RADIUS, 100
    linedata_1 ID_AI_TARGET_TIME, 120
    linedata_1 ID_UNK_505B, 10000
    linedata_3 ID_AI_PATH, ID_PATH_2
    linedata_1 ID_AI_PATH_SPEED, 700
    linedata_1 ID_UNK_F0F8, 1

LineDataE03S05_32:
    .2byte 9
    .align 2, 0
    linedata_1 ID_WEIGHT, 120
    linedata_1 ID_ACCELERATION, 8
    linedata_1 ID_FRICTION, 8
    linedata_1 ID_AI_TARGET_RADIUS, 1
    linedata_1 ID_AI_TARGET_TIME, 0
    linedata_1 ID_UNK_505B, 10000
    linedata_3 ID_AI_PATH, ID_PATH_6
    linedata_1 ID_AI_PATH_SPEED, 900
    linedata_1 ID_UNK_F0F8, 3

LineDataE03S05_33:
    .2byte 9
    .align 2, 0
    linedata_2 ID_ACTOR, SpriteSheet_8227CEC
    linedata_6 ID_CHARGE_1
    linedata_18 ID_CHARGE_1
    linedata_8 ID_NONE, 1, 2
    linedata_13 ID_NONE, 0, 0x00, 0x30, 0x00, 0x00, 0x00, 0x00, 0x00
    linedata_1 ID_UNK_2A39, 0
    linedata_7 ID_CHARGE_1, 3, 3

LineDataE03S05_34:
    .2byte 11
    .align 2, 0
    linedata_2 ID_ACTOR, SpriteSheet_822D814
    linedata_6 ID_COLLECT
    linedata_18 ID_COLLECT
    linedata_8 ID_NONE, 1, 2
    linedata_10 ID_ACTOR, 0, 960
    linedata_3 ID_COLLECTABLE, ID_COLLECTION
    linedata_1 ID_COLLECTABLE, 13
    linedata_13 ID_NONE, 0, 0x8C, 0x30, 0x00, 0x00, 0x00, 0x00, 0x00
    linedata_7 ID_COLLECT, 3, 5

