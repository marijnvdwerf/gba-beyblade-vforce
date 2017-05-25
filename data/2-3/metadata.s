    .include "asm/common.inc"

global LineDataE02S03
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
    .4byte LineDataE02S03_15
    .4byte NULL
    .4byte NULL
    .4byte NULL
    .4byte NULL
    .4byte LineDataE02S03_20
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
    .4byte LineDataE02S03_33
    .4byte LineDataE02S03_34

LineDataE02S03_15:
    .2byte 11
    .align 2, 0
    linedata_1 0xD368, 300
    linedata_1 0x6ACE, 11
    linedata_1 0x5BBE, 9
    linedata_1 0x215D, 100
    linedata_1 0x3AB4, 9000
    linedata_1 0x505B, 1000
    linedata_1 0xD271, 0
    linedata_3 0x59C3, 40467
    linedata_1 0xCF2C, 1024
    linedata_1 0xF0F8, 1
    linedata_1 0x05CF, 8

LineDataE02S03_20:
    .2byte 11
    .align 2, 0
    linedata_2 0xD679, 0x0822D814
    linedata_6 0xB9DE
    linedata_18 0xB9DE
    linedata_8 0x002D, 1, 2
    linedata_10 0xD679, 0, 960
    linedata_3 0x37AE, 15360
    linedata_1 0x37AE, 20
    linedata_13 0x002D, 0, 0x8C, 0x30, 0x00, 0x00, 0x00, 0x00, 0x00
    linedata_7 0xB9DE, 3, 5

LineDataE02S03_33:
    .2byte 9
    .align 2, 0
    linedata_2 0xD679, 0x08227CEC
    linedata_6 0x1998
    linedata_18 0x1998
    linedata_8 0x002D, 1, 2
    linedata_13 0x002D, 0, 0x00, 0x30, 0x00, 0x00, 0x00, 0x00, 0x00
    linedata_1 0x2A39, 0
    linedata_7 0x1998, 3, 3

LineDataE02S03_34:
    .2byte 9
    .align 2, 0
    linedata_2 0xD679, 0x08227CEC
    linedata_6 0xB329
    linedata_18 0xB329
    linedata_8 0x002D, 1, 2
    linedata_13 0x002D, 0, 0x00, 0x30, 0x00, 0x00, 0x00, 0x00, 0x00
    linedata_1 0x2A39, 0
    linedata_7 0xB329, 3, 3

