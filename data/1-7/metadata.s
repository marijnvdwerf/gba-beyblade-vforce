    .include "asm/common.inc"

global LineDataE01S07
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
    .4byte LineDataE01S07_14
    .4byte LineDataE01S07_15
    .4byte LineDataE01S07_16
    .4byte LineDataE01S07_17
    .4byte LineDataE01S07_18
    .4byte LineDataE01S07_19
    .4byte LineDataE01S07_20
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

LineDataE01S07_14:
    .2byte 11
    .align 2, 0
    linedata_1 ID_WEIGHT, 240
    linedata_1 ID_ACCELERATION, 10
    linedata_1 ID_FRICTION, 9
    linedata_1 ID_AI_TARGET_RADIUS, 100
    linedata_1 ID_AI_TARGET_TIME, 200
    linedata_1 ID_UNK_505B, 1000
    linedata_1 ID_AI_BOSS, 0
    linedata_3 ID_AI_PATH, ID_UNK_6C0D
    linedata_1 ID_AI_PATH_SPEED, 1024
    linedata_1 ID_UNK_F0F8, 1
    linedata_1 ID_AI_RECHARGE_RATE, 9

LineDataE01S07_15:
    .2byte 9
    .align 2, 0
    linedata_2 ID_ACTOR, SpriteSheet_8227CEC
    linedata_6 ID_CHARGE_1
    linedata_18 ID_CHARGE_1
    linedata_8 ID_NONE, 1, 2
    linedata_13 ID_NONE, 0, 0x00, 0x30, 0x00, 0x00, 0x00, 0x00, 0x00
    linedata_1 ID_UNK_2A39, 0
    linedata_7 ID_CHARGE_1, 3, 3

LineDataE01S07_16:
    .2byte 9
    .align 2, 0
    linedata_2 ID_ACTOR, SpriteSheet_8227CEC
    linedata_6 ID_CHARGE_2
    linedata_18 ID_CHARGE_2
    linedata_8 ID_NONE, 1, 2
    linedata_13 ID_NONE, 0, 0x00, 0x30, 0x00, 0x00, 0x00, 0x00, 0x00
    linedata_1 ID_UNK_2A39, 0
    linedata_7 ID_CHARGE_2, 3, 3

LineDataE01S07_17:
    .2byte 8
    .align 2, 0
    linedata_2 ID_ACTOR, SpriteSheet_82355DC
    linedata_6 ID_UNK_45F9
    linedata_18 ID_UNK_45F9
    linedata_8 ID_NONE, 1, 0
    linedata_4 ID_UNK_B396, 1024, 0, 0
    linedata_7 ID_UNK_45F9, 3, 2

LineDataE01S07_18:
    .2byte 8
    .align 2, 0
    linedata_2 ID_ACTOR, SpriteSheet_82355DC
    linedata_6 ID_UNK_45C2
    linedata_18 ID_UNK_45C2
    linedata_8 ID_NONE, 1, 0
    linedata_4 ID_UNK_B396, 1024, 0, 0
    linedata_7 ID_UNK_45C2, 3, 2

LineDataE01S07_19:
    .2byte 4
    .align 2, 0
    linedata_6 ID_TUTORIAL
    linedata_18 ID_TUTORIAL
    linedata_1 ID_TUTORIAL_TRIGGER, 13
    linedata_7 ID_TUTORIAL, 2, 1

LineDataE01S07_20:
    .2byte 11
    .align 2, 0
    linedata_2 ID_ACTOR, SpriteSheet_82325B0
    linedata_6 ID_COLLECT
    linedata_18 ID_COLLECT
    linedata_8 ID_NONE, 1, 2
    linedata_10 ID_ACTOR, 0, 960
    linedata_3 ID_COLLECTABLE, ID_COLLECTION
    linedata_1 ID_COLLECTABLE, 107
    linedata_13 ID_NONE, 0, 0x8C, 0x30, 0x00, 0x00, 0x00, 0x00, 0x00
    linedata_7 ID_COLLECT, 3, 5

