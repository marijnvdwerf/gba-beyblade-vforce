    .include "asm/common.inc"

global LineDataE03S01
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
    .4byte LineDataE03S01_21
    .4byte LineDataE03S01_22
    .4byte LineDataE03S01_23
    .4byte LineDataE03S01_24
    .4byte LineDataE03S01_25
    .4byte LineDataE03S01_26
    .4byte LineDataE03S01_27
    .4byte LineDataE03S01_28
    .4byte LineDataE03S01_29
    .4byte LineDataE03S01_30
    .4byte LineDataE03S01_31
    .4byte LineDataE03S01_32
    .4byte LineDataE03S01_33
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

LineDataE03S01_21:
    .2byte 10
    .align 2, 0
    linedata_1 ID_WEIGHT, 200
    linedata_1 ID_ACCELERATION, 8
    linedata_1 ID_FRICTION, 8
    linedata_1 ID_AI_TARGET_RADIUS, 0
    linedata_1 ID_AI_TARGET_TIME, 60
    linedata_1 ID_UNK_505B, 1000
    linedata_3 ID_AI_PATH, ID_PATH
    linedata_1 ID_AI_PATH_SPEED, 1024
    linedata_1 ID_UNK_F0F8, 3
    linedata_1 ID_AI_RECHARGE_RATE, 2

LineDataE03S01_22:
    .2byte 8
    .align 2, 0
    linedata_2 ID_ACTOR, SpriteSheet_82355DC
    linedata_6 ID_SPEEDX_2
    linedata_18 ID_SPEEDX_2
    linedata_8 ID_NONE, 1, 0
    linedata_4 ID_UNK_B396, 1024, 0, 0
    linedata_7 ID_SPEEDX_2, 3, 2

LineDataE03S01_23:
    .2byte 8
    .align 2, 0
    linedata_2 ID_ACTOR, SpriteSheet_82355DC
    linedata_6 ID_SPEEDX_3
    linedata_18 ID_SPEEDX_3
    linedata_8 ID_NONE, 1, 0
    linedata_4 ID_UNK_B396, 1024, 0, 0
    linedata_7 ID_SPEEDX_3, 3, 2

LineDataE03S01_24:
    .2byte 8
    .align 2, 0
    linedata_2 ID_ACTOR, SpriteSheet_82355DC
    linedata_6 ID_SPEEDX_4
    linedata_18 ID_SPEEDX_4
    linedata_8 ID_NONE, 1, 0
    linedata_4 ID_UNK_B396, 1024, 0, 0
    linedata_7 ID_SPEEDX_4, 3, 2

LineDataE03S01_25:
    .2byte 9
    .align 2, 0
    linedata_1 ID_WEIGHT, 320
    linedata_1 ID_ACCELERATION, 8
    linedata_1 ID_FRICTION, 8
    linedata_1 ID_AI_TARGET_RADIUS, 0
    linedata_1 ID_AI_TARGET_TIME, 60
    linedata_1 ID_UNK_505B, 1000
    linedata_3 ID_AI_PATH, ID_PATH_2
    linedata_1 ID_AI_PATH_SPEED, 1024
    linedata_1 ID_AI_RECHARGE_RATE, 0

LineDataE03S01_26:
    .2byte 8
    .align 2, 0
    linedata_2 ID_ACTOR, SpriteSheet_82355DC
    linedata_6 ID_SPEED
    linedata_18 ID_SPEED
    linedata_8 ID_NONE, 1, 0
    linedata_4 ID_UNK_B396, 1024, 0, 0
    linedata_7 ID_SPEED, 3, 2

LineDataE03S01_27:
    .2byte 9
    .align 2, 0
    linedata_2 ID_ACTOR, SpriteSheet_8227CEC
    linedata_6 ID_CHARGE_1
    linedata_18 ID_CHARGE_1
    linedata_8 ID_NONE, 1, 2
    linedata_13 ID_NONE, 0, 0x00, 0x30, 0x00, 0x00, 0x00, 0x00, 0x00
    linedata_1 ID_UNK_2A39, 0
    linedata_7 ID_CHARGE_1, 3, 3

LineDataE03S01_28:
    .2byte 8
    .align 2, 0
    linedata_2 ID_ACTOR, SpriteSheet_82355DC
    linedata_6 ID_SPEEDX_6
    linedata_18 ID_SPEEDX_6
    linedata_8 ID_NONE, 1, 0
    linedata_4 ID_UNK_B396, 1024, 0, 0
    linedata_7 ID_SPEEDX_6, 3, 2

LineDataE03S01_29:
    .2byte 11
    .align 2, 0
    linedata_2 ID_ACTOR, SpriteSheet_822D814
    linedata_6 ID_COLLECT
    linedata_18 ID_COLLECT
    linedata_8 ID_NONE, 1, 2
    linedata_10 ID_ACTOR, 0, 960
    linedata_3 ID_COLLECTABLE, ID_COLLECTION
    linedata_1 ID_COLLECTABLE, 25
    linedata_13 ID_NONE, 0, 0x8C, 0x30, 0x00, 0x00, 0x00, 0x00, 0x00
    linedata_7 ID_COLLECT, 3, 5

LineDataE03S01_30:
    .2byte 11
    .align 2, 0
    linedata_1 ID_WEIGHT, 120
    linedata_1 ID_ACCELERATION, 8
    linedata_1 ID_FRICTION, 8
    linedata_1 ID_AI_TARGET_RADIUS, 0
    linedata_1 ID_AI_TARGET_TIME, 60
    linedata_1 ID_UNK_505B, 1000
    linedata_3 ID_AI_PATH, ID_UNK_ACBA
    linedata_1 ID_AI_PATH_SPEED, 1024
    linedata_1 ID_UNK_F0F8, 3
    linedata_1 ID_COLLECTABLE, 40
    linedata_1 ID_AI_RECHARGE_RATE, 2

LineDataE03S01_31:
    .2byte 10
    .align 2, 0
    linedata_1 ID_WEIGHT, 120
    linedata_1 ID_ACCELERATION, 8
    linedata_1 ID_FRICTION, 8
    linedata_1 ID_AI_TARGET_RADIUS, 0
    linedata_1 ID_AI_TARGET_TIME, 60
    linedata_1 ID_UNK_505B, 1000
    linedata_3 ID_AI_PATH, ID_UNK_0CED
    linedata_1 ID_AI_PATH_SPEED, 1024
    linedata_1 ID_UNK_F0F8, 3
    linedata_1 ID_AI_RECHARGE_RATE, 2

LineDataE03S01_32:
    .2byte 10
    .align 2, 0
    linedata_1 ID_WEIGHT, 120
    linedata_1 ID_ACCELERATION, 8
    linedata_1 ID_FRICTION, 8
    linedata_1 ID_AI_TARGET_RADIUS, 0
    linedata_1 ID_AI_TARGET_TIME, 60
    linedata_1 ID_UNK_505B, 1000
    linedata_3 ID_AI_PATH, ID_UNK_0CEC
    linedata_1 ID_AI_PATH_SPEED, 1024
    linedata_1 ID_UNK_F0F8, 3
    linedata_1 ID_AI_RECHARGE_RATE, 2

LineDataE03S01_33:
    .2byte 10
    .align 2, 0
    linedata_1 ID_WEIGHT, 120
    linedata_1 ID_ACCELERATION, 8
    linedata_1 ID_FRICTION, 8
    linedata_1 ID_AI_TARGET_RADIUS, 0
    linedata_1 ID_AI_TARGET_TIME, 60
    linedata_1 ID_UNK_505B, 1000
    linedata_3 ID_AI_PATH, ID_UNK_0CEB
    linedata_1 ID_AI_PATH_SPEED, 1024
    linedata_1 ID_UNK_F0F8, 3
    linedata_1 ID_AI_RECHARGE_RATE, 2

