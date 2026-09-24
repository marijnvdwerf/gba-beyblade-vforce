    .include "asm/common.inc"

global LineDataE06S03
    .4byte NULL
    .4byte NULL
    .4byte NULL
    .4byte NULL
    .4byte NULL
    .4byte LineDataE06S03_5
    .4byte LineDataE06S03_6
    .4byte LineDataE06S03_7
    .4byte LineDataE06S03_8
    .4byte LineDataE06S03_9
    .4byte NULL
    .4byte NULL
    .4byte NULL
    .4byte NULL
    .4byte LineDataE06S03_14
    .4byte LineDataE06S03_15
    .4byte NULL
    .4byte NULL
    .4byte NULL
    .4byte NULL
    .4byte NULL
    .4byte NULL

LineDataE06S03_5:
    .2byte 8
    .align 2, 0
    linedata_2 ID_ACTOR, SpriteSheet_82309EC
    linedata_6 ID_LAUNCH_3
    linedata_18 ID_LAUNCH_3
    linedata_8 ID_NONE, 1, 0
    linedata_4 ID_UNK_B396, 0, 0, 900
    linedata_7 ID_LAUNCH_3, 3, 2

LineDataE06S03_6:
    .2byte 8
    .align 2, 0
    linedata_2 ID_ACTOR, SpriteSheet_82309EC
    linedata_6 ID_LAUNCH_2
    linedata_18 ID_LAUNCH_2
    linedata_8 ID_NONE, 1, 0
    linedata_4 ID_UNK_B396, 0, 0, 900
    linedata_7 ID_LAUNCH_2, 3, 2

LineDataE06S03_7:
    .2byte 8
    .align 2, 0
    linedata_2 ID_ACTOR, SpriteSheet_82309EC
    linedata_6 ID_LAUNCH_4
    linedata_18 ID_LAUNCH_4
    linedata_8 ID_NONE, 1, 0
    linedata_4 ID_UNK_B396, 0, 0, 900
    linedata_7 ID_LAUNCH_4, 3, 2

LineDataE06S03_8:
    .2byte 9
    .align 2, 0
    linedata_2 ID_ACTOR, SpriteSheet_8227CEC
    linedata_6 ID_CHARGE_2
    linedata_18 ID_CHARGE_2
    linedata_8 ID_NONE, 1, 2
    linedata_13 ID_NONE, 0, 0x00, 0x30, 0x00, 0x00, 0x00, 0x00, 0x00
    linedata_1 ID_UNK_2A39, 0
    linedata_7 ID_CHARGE_2, 3, 3

LineDataE06S03_9:
    .2byte 11
    .align 2, 0
    linedata_1 ID_WEIGHT, 190
    linedata_1 ID_ACCELERATION, 10
    linedata_1 ID_FRICTION, 10
    linedata_1 ID_AI_TARGET_RADIUS, 200
    linedata_1 ID_AI_TARGET_TIME, 100
    linedata_1 ID_UNK_505B, 1000
    linedata_1 ID_AI_BOSS, 0
    linedata_3 ID_AI_PATH, ID_PATH_3
    linedata_1 ID_AI_PATH_SPEED, 1024
    linedata_1 ID_UNK_F0F8, 1
    linedata_1 ID_AI_RECHARGE_RATE, 12

LineDataE06S03_14:
    .2byte 11
    .align 2, 0
    linedata_2 ID_ACTOR, SpriteSheet_822D814
    linedata_6 ID_COLLECT_23
    linedata_18 ID_COLLECT_23
    linedata_8 ID_NONE, 1, 2
    linedata_10 ID_ACTOR, 0, 960
    linedata_3 ID_COLLECTABLE, ID_COLLECTION
    linedata_1 ID_COLLECTABLE, 12
    linedata_13 ID_NONE, 0, 0x8C, 0x30, 0x00, 0x00, 0x00, 0x00, 0x00
    linedata_7 ID_COLLECT_23, 3, 5

LineDataE06S03_15:
    .2byte 8
    .align 2, 0
    linedata_2 ID_ACTOR, SpriteSheet_82309EC
    linedata_6 ID_LAUNCH_21
    linedata_18 ID_LAUNCH_21
    linedata_8 ID_NONE, 1, 0
    linedata_4 ID_UNK_B396, 0, 0, 900
    linedata_7 ID_LAUNCH_21, 3, 2

