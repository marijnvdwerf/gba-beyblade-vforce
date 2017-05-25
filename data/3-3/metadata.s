    .include "asm/common.inc"

global LineDataE03S03
    .4byte NULL
    .4byte NULL
    .4byte NULL
    .4byte NULL
    .4byte NULL
    .4byte NULL
    .4byte LineDataE03S03_6
    .4byte NULL
    .4byte NULL
    .4byte NULL
    .4byte NULL
    .4byte NULL
    .4byte NULL
    .4byte NULL
    .4byte NULL
    .4byte NULL
    .4byte LineDataE03S03_16
    .4byte LineDataE03S03_17
    .4byte LineDataE03S03_18

LineDataE03S03_6:
    .2byte 11
    .align 2, 0
    linedata_1 0xD368, 275
    linedata_1 0x6ACE, 10
    linedata_1 0x5BBE, 10
    linedata_1 0x215D, 100
    linedata_1 0x3AB4, 200
    linedata_1 0x505B, 1000
    linedata_1 0xD271, 0
    linedata_3 0x59C3, 27661
    linedata_1 0xCF2C, 1024
    linedata_1 0xF0F8, 1
    linedata_1 0x05CF, 9

LineDataE03S03_16:
    .2byte 9
    .align 2, 0
    linedata_2 0xD679, 0x08227CEC
    linedata_6 0x1998
    linedata_18 0x1998
    linedata_8 0x002D, 1, 2
    linedata_13 0x002D, 0, 0x00, 0x30, 0x00, 0x00, 0x00, 0x00, 0x00
    linedata_1 0x2A39, 0
    linedata_7 0x1998, 3, 3

LineDataE03S03_17:
    .2byte 9
    .align 2, 0
    linedata_2 0xD679, 0x08227CEC
    linedata_6 0xB32A
    linedata_18 0xB32A
    linedata_8 0x002D, 1, 2
    linedata_13 0x002D, 0, 0x00, 0x30, 0x00, 0x00, 0x00, 0x00, 0x00
    linedata_1 0x2A39, 0
    linedata_7 0xB32A, 3, 3

LineDataE03S03_18:
    .2byte 8
    .align 2, 0
    linedata_2 0xD679, 0x082309EC
    linedata_6 0x0B41
    linedata_18 0x0B41
    linedata_8 0x002D, 1, 0
    linedata_4 0xB396, 0, 0, 900
    linedata_7 0x0B41, 3, 2

