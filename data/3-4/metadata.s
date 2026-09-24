    .include "asm/common.inc"

global LineDataE03S04
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
    .4byte LineDataE03S04_27
    .4byte LineDataE03S04_28
    .4byte LineDataE03S04_29
    .4byte LineDataE03S04_30
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

LineDataE03S04_27:
    .2byte 9
    .align 2, 0
    linedata_1 ID_WEIGHT, 400
    linedata_1 ID_ACCELERATION, 8
    linedata_1 ID_FRICTION, 8
    linedata_1 ID_AI_TARGET_RADIUS, 0
    linedata_1 ID_AI_TARGET_TIME, 60
    linedata_1 ID_UNK_505B, 1000
    linedata_3 ID_AI_PATH, ID_PATH
    linedata_1 ID_AI_PATH_SPEED, 1024
    linedata_1 ID_UNK_F0F8, 3

LineDataE03S04_28:
    .2byte 8
    .align 2, 0
    linedata_2 ID_ACTOR, SpriteSheet_8233A18
    linedata_6 ID_SPEEDDOWN_1
    linedata_18 ID_SPEEDDOWN_1
    linedata_8 ID_NONE, 1, 0
    linedata_4 ID_UNK_B396, 0, 1024, 0
    linedata_7 ID_SPEEDDOWN_1, 3, 2

LineDataE03S04_29:
    .2byte 9
    .align 2, 0
    linedata_2 ID_ACTOR, SpriteSheet_8227CEC
    linedata_6 ID_CHARGE_1
    linedata_18 ID_CHARGE_1
    linedata_8 ID_NONE, 1, 2
    linedata_13 ID_NONE, 0, 0x00, 0x30, 0x00, 0x00, 0x00, 0x00, 0x00
    linedata_1 ID_UNK_2A39, 0
    linedata_7 ID_CHARGE_1, 3, 3

LineDataE03S04_30:
    .2byte 11
    .align 2, 0
    linedata_2 ID_ACTOR, SpriteSheet_82325B0
    linedata_6 ID_COLLECT
    linedata_18 ID_COLLECT
    linedata_8 ID_NONE, 1, 2
    linedata_10 ID_ACTOR, 0, 960
    linedata_3 ID_COLLECTABLE, ID_COLLECTION
    linedata_1 ID_COLLECTABLE, 99
    linedata_13 ID_NONE, 0, 0x8C, 0x30, 0x00, 0x00, 0x00, 0x00, 0x00
    linedata_7 ID_COLLECT, 3, 5

