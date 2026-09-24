    .include "asm/common.inc"

global LineDataE02S07
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
    .4byte LineDataE02S07_12
    .4byte NULL
    .4byte LineDataE02S07_14
    .4byte LineDataE02S07_15
    .4byte LineDataE02S07_16
    .4byte LineDataE02S07_17
    .4byte LineDataE02S07_18
    .4byte LineDataE02S07_19
    .4byte LineDataE02S07_20
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
    .4byte LineDataE02S07_32
    .4byte LineDataE02S07_33
    .4byte LineDataE02S07_34
    .4byte LineDataE02S07_35

LineDataE02S07_12:
    .2byte 6
    .align 2, 0
    linedata_6 ID_PLATFORM_1
    linedata_18 ID_PLATFORM_1
    linedata_13 ID_NONE, 0, 0x8C, 0x30, 0x00, 0x00, 0x00, 0x00, 0x00
    linedata_7 ID_PLATFORM_1, 2, 1

LineDataE02S07_14:
    .2byte 8
    .align 2, 0
    linedata_2 ID_ACTOR, SpriteSheet_82355DC
    linedata_6 ID_SPEEDX_3
    linedata_18 ID_SPEEDX_3
    linedata_8 ID_NONE, 1, 0
    linedata_4 ID_UNK_B396, 1024, 0, 0
    linedata_7 ID_SPEEDX_3, 3, 2

LineDataE02S07_15:
    .2byte 9
    .align 2, 0
    linedata_1 ID_WEIGHT, 256
    linedata_1 ID_ACCELERATION, 8
    linedata_1 ID_FRICTION, 8
    linedata_1 ID_AI_TARGET_RADIUS, 0
    linedata_1 ID_AI_TARGET_TIME, 60
    linedata_1 ID_UNK_505B, 1000
    linedata_3 ID_AI_PATH, ID_PATH
    linedata_1 ID_AI_PATH_SPEED, 1024
    linedata_1 ID_UNK_F0F8, 1

LineDataE02S07_16:
    .2byte 8
    .align 2, 0
    linedata_2 ID_ACTOR, SpriteSheet_822BC50
    linedata_6 ID_SPEEDDOWN_1
    linedata_18 ID_SPEEDDOWN_1
    linedata_8 ID_NONE, 1, 0
    linedata_4 ID_UNK_B396, 0, -1024, 0
    linedata_7 ID_SPEEDDOWN_1, 3, 2

LineDataE02S07_17:
    .2byte 9
    .align 2, 0
    linedata_2 ID_ACTOR, SpriteSheet_8227CEC
    linedata_6 ID_CHARGE_1
    linedata_18 ID_CHARGE_1
    linedata_8 ID_NONE, 1, 2
    linedata_13 ID_NONE, 0, 0x00, 0x30, 0x00, 0x00, 0x00, 0x00, 0x00
    linedata_1 ID_UNK_2A39, 0
    linedata_7 ID_CHARGE_1, 3, 3

LineDataE02S07_18:
    .2byte 9
    .align 2, 0
    linedata_1 ID_WEIGHT, 256
    linedata_1 ID_ACCELERATION, 8
    linedata_1 ID_FRICTION, 8
    linedata_1 ID_AI_TARGET_RADIUS, 0
    linedata_1 ID_AI_TARGET_TIME, 60
    linedata_1 ID_UNK_505B, 1000
    linedata_3 ID_AI_PATH, ID_PATH_2
    linedata_1 ID_AI_PATH_SPEED, 1024
    linedata_1 ID_UNK_F0F8, 1

LineDataE02S07_19:
    .2byte 11
    .align 2, 0
    linedata_2 ID_ACTOR, SpriteSheet_82371A0
    linedata_6 ID_COLLECT
    linedata_18 ID_COLLECT
    linedata_8 ID_NONE, 1, 2
    linedata_10 ID_ACTOR, 0, 960
    linedata_3 ID_COLLECTABLE, ID_COLLECTION
    linedata_1 ID_COLLECTABLE, 60
    linedata_13 ID_NONE, 0, 0x8C, 0x30, 0x00, 0x00, 0x00, 0x00, 0x00
    linedata_7 ID_COLLECT, 3, 5

LineDataE02S07_20:
    .2byte 11
    .align 2, 0
    linedata_2 ID_ACTOR, SpriteSheet_822D814
    linedata_6 ID_COLLECT_1
    linedata_18 ID_COLLECT_1
    linedata_8 ID_NONE, 1, 2
    linedata_10 ID_ACTOR, 0, 960
    linedata_3 ID_COLLECTABLE, ID_COLLECTION
    linedata_1 ID_COLLECTABLE, 55
    linedata_13 ID_NONE, 0, 0x8C, 0x30, 0x00, 0x00, 0x00, 0x00, 0x00
    linedata_7 ID_COLLECT_1, 3, 5

LineDataE02S07_32:
    .2byte 8
    .align 2, 0
    linedata_2 ID_ACTOR, SpriteSheet_822EC7C
    linedata_2 ID_SPRITE, SpriteSheet_822F00C
    linedata_4 ID_SPRITE, 0, 16, 0
    linedata_1 ID_UNK_BF84, 60
    linedata_11 ID_ACTOR, 0x00, 0x00, 0x00, 0x00
    linedata_18 ID_PLATFORM_1
    linedata_5 ID_UNK_A6B3, 0, 128, 0
    linedata_7 ID_PLATFORM_1, 6, 1

LineDataE02S07_33:
    .2byte 8
    .align 2, 0
    linedata_2 ID_ACTOR, SpriteSheet_822F4E0
    linedata_2 ID_SPRITE, SpriteSheet_822F830
    linedata_4 ID_SPRITE, 0, 16, 0
    linedata_1 ID_UNK_BF84, 60
    linedata_11 ID_ACTOR, 0x00, 0x00, 0x00, 0x00
    linedata_18 ID_PLATFORM_1
    linedata_5 ID_UNK_A6B3, 0, 128, 0
    linedata_7 ID_PLATFORM_1, 6, 1

LineDataE02S07_34:
    .2byte 3
    .align 2, 0
    linedata_2 ID_ACTOR, SpriteSheet_822FEC4
    linedata_2 ID_SPRITE, SpriteSheet_8230398
    linedata_4 ID_SPRITE, -64, 16, 0

LineDataE02S07_35:
    .2byte 3
    .align 2, 0
    linedata_2 ID_ACTOR, SpriteSheet_822FEC4
    linedata_2 ID_SPRITE, SpriteSheet_8230398
    linedata_4 ID_SPRITE, -64, 16, 0

