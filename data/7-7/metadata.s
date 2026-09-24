
	.global off_8000281
off_8000281:

    .include "asm/common.inc"

global LineDataE07S07
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
    .4byte LineDataE07S07_14
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
    .4byte LineDataE07S07_30
    .4byte LineDataE07S07_31
    .4byte LineDataE07S07_32

LineDataE07S07_14:
    .2byte 11
    .align 2, 0
    linedata_1 ID_WEIGHT, 280
    linedata_1 ID_ACCELERATION, 10
    linedata_1 ID_FRICTION, 9
    linedata_1 ID_AI_TARGET_RADIUS, 100
    linedata_1 ID_AI_TARGET_TIME, 200
    linedata_1 ID_UNK_505B, 8000
    linedata_1 ID_AI_BOSS, 0
    linedata_3 ID_AI_PATH, ID_UNK_6C0D
    linedata_1 ID_AI_PATH_SPEED, 1024
    linedata_1 ID_UNK_F0F8, 1
    linedata_1 ID_AI_RECHARGE_RATE, 10

LineDataE07S07_30:
    .2byte 9
    .align 2, 0
    linedata_2 ID_ACTOR, SpriteSheet_8227CEC
    linedata_6 ID_CHARGE_2
    linedata_18 ID_CHARGE_2
    linedata_8 ID_NONE, 1, 2
    linedata_13 ID_NONE, 0, 0x00, 0x30, 0x00, 0x00, 0x00, 0x00, 0x00
    linedata_1 ID_UNK_2A39, 0
    linedata_7 ID_CHARGE_2, 3, 3

LineDataE07S07_31:
    .2byte 9
    .align 2, 0
    linedata_2 ID_ACTOR, SpriteSheet_8227CEC
    linedata_6 ID_CHARGE_22
    linedata_18 ID_CHARGE_22
    linedata_8 ID_NONE, 1, 2
    linedata_13 ID_NONE, 0, 0x00, 0x30, 0x00, 0x00, 0x00, 0x00, 0x00
    linedata_1 ID_UNK_2A39, 0
    linedata_7 ID_CHARGE_22, 3, 3

LineDataE07S07_32:
    .2byte 9
    .align 2, 0
    linedata_2 ID_ACTOR, SpriteSheet_8227CEC
    linedata_6 ID_CHARGE_112
    linedata_18 ID_CHARGE_112
    linedata_8 ID_NONE, 1, 2
    linedata_13 ID_NONE, 0, 0x00, 0x30, 0x00, 0x00, 0x00, 0x00, 0x00
    linedata_1 ID_UNK_2A39, 0
    linedata_7 ID_CHARGE_112, 3, 3

