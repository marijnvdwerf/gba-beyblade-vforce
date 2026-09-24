    .include "asm/common.inc"

global LineDataE02S02
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
    .4byte LineDataE02S02_18
    .4byte LineDataE02S02_19
    .4byte LineDataE02S02_20
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

LineDataE02S02_18:
    .2byte 8
    .align 2, 0
    linedata_2 ID_ACTOR, SpriteSheet_82355DC
    linedata_6 ID_SPEEDX_06
    linedata_18 ID_SPEEDX_06
    linedata_8 ID_NONE, 1, 0
    linedata_4 ID_UNK_B396, 1024, 0, 0
    linedata_7 ID_SPEEDX_06, 3, 2

LineDataE02S02_19:
    .2byte 8
    .align 2, 0
    linedata_2 ID_ACTOR, SpriteSheet_8238A5C
    linedata_6 ID_SPEED
    linedata_18 ID_SPEED
    linedata_8 ID_NONE, 1, 0
    linedata_4 ID_UNK_B396, -1024, 0, 0
    linedata_7 ID_SPEED, 3, 2

LineDataE02S02_20:
    .2byte 11
    .align 2, 0
    linedata_2 ID_ACTOR, SpriteSheet_822D814
    linedata_6 ID_COLLECT
    linedata_18 ID_COLLECT
    linedata_8 ID_NONE, 1, 2
    linedata_10 ID_ACTOR, 0, 960
    linedata_3 ID_COLLECTABLE, ID_COLLECTION
    linedata_1 ID_COLLECTABLE, 1
    linedata_13 ID_NONE, 0, 0x8C, 0x30, 0x00, 0x00, 0x00, 0x00, 0x00
    linedata_7 ID_COLLECT, 3, 5

