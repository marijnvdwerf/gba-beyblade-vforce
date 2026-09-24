    .include "asm/common.inc"

global LineDataE06S07
    .4byte NULL
    .4byte NULL
    .4byte NULL
    .4byte NULL
    .4byte NULL
    .4byte NULL
    .4byte LineDataE06S07_6
    .4byte NULL
    .4byte NULL
    .4byte NULL
    .4byte NULL
    .4byte NULL
    .4byte NULL
    .4byte NULL
    .4byte NULL
    .4byte NULL
    .4byte LineDataE06S07_16
    .4byte LineDataE06S07_17
    .4byte LineDataE06S07_18
    .4byte LineDataE06S07_19
    .4byte NULL
    .4byte NULL
    .4byte NULL
    .4byte NULL
    .4byte NULL

LineDataE06S07_6:
    .2byte 11
    .align 2, 0
    linedata_1 ID_WEIGHT, 210
    linedata_1 ID_ACCELERATION, 10
    linedata_1 ID_FRICTION, 9
    linedata_1 ID_AI_TARGET_RADIUS, 100
    linedata_1 ID_AI_TARGET_TIME, 20000
    linedata_1 ID_UNK_505B, 1000
    linedata_1 ID_AI_BOSS, 0
    linedata_3 ID_AI_PATH, ID_UNK_6C0D
    linedata_1 ID_AI_PATH_SPEED, 1024
    linedata_1 ID_AI_RECHARGE_RATE, 9
    linedata_1 ID_UNK_F0F8, 1

LineDataE06S07_16:
    .2byte 9
    .align 2, 0
    linedata_2 ID_ACTOR, SpriteSheet_8227CEC
    linedata_6 ID_CHARGE_1
    linedata_18 ID_CHARGE_1
    linedata_8 ID_NONE, 1, 2
    linedata_13 ID_NONE, 0, 0x00, 0x30, 0x00, 0x00, 0x00, 0x00, 0x00
    linedata_1 ID_UNK_2A39, 0
    linedata_7 ID_CHARGE_1, 3, 3

LineDataE06S07_17:
    .2byte 9
    .align 2, 0
    linedata_2 ID_ACTOR, SpriteSheet_8227CEC
    linedata_6 ID_CHARGE_2
    linedata_18 ID_CHARGE_2
    linedata_8 ID_NONE, 1, 2
    linedata_13 ID_NONE, 0, 0x00, 0x30, 0x00, 0x00, 0x00, 0x00, 0x00
    linedata_1 ID_UNK_2A39, 0
    linedata_7 ID_CHARGE_2, 3, 3

LineDataE06S07_18:
    .2byte 9
    .align 2, 0
    linedata_2 ID_ACTOR, SpriteSheet_8227CEC
    linedata_6 ID_CHARGE_3
    linedata_18 ID_CHARGE_3
    linedata_8 ID_NONE, 1, 2
    linedata_13 ID_NONE, 0, 0x00, 0x30, 0x00, 0x00, 0x00, 0x00, 0x00
    linedata_1 ID_UNK_2A39, 0
    linedata_7 ID_CHARGE_3, 3, 3

LineDataE06S07_19:
    .2byte 9
    .align 2, 0
    linedata_2 ID_ACTOR, SpriteSheet_8227CEC
    linedata_6 ID_CHARGE_4
    linedata_18 ID_CHARGE_4
    linedata_8 ID_NONE, 1, 2
    linedata_13 ID_NONE, 0, 0x00, 0x30, 0x00, 0x00, 0x00, 0x00, 0x00
    linedata_1 ID_UNK_2A39, 0
    linedata_7 ID_CHARGE_4, 3, 3

