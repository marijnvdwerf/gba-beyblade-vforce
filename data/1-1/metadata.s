    .include "asm/common.inc"

global LineDataE01S01
    .4byte NULL
    .4byte NULL
    .4byte NULL
    .4byte NULL
    .4byte NULL
    .4byte NULL
    .4byte NULL
    .4byte LineDataE01S01_7
    .4byte LineDataE01S01_8
    .4byte LineDataE01S01_9
    .4byte LineDataE01S01_10
    .4byte NULL
    .4byte NULL
    .4byte NULL
    .4byte NULL

LineDataE01S01_7:
    .2byte 11
    .align 2, 0
    linedata_2 0xD679, 0x0822D814
    linedata_6 0xB9DE
    linedata_18 0xB9DE
    linedata_8 0x002D, 1, 2
    linedata_10 0xD679, 0, 960
    linedata_3 0x37AE, 44080
    linedata_1 0x37AE, 0
    linedata_13 0x002D, 0, 0x8C, 0x30, 0x00, 0x00, 0x00, 0x00, 0x00
    linedata_7 0xB9DE, 3, 5

LineDataE01S01_8:
    .2byte 4
    .align 2, 0
    linedata_6 0x9980
    linedata_18 0x9980
    linedata_1 0x8CEC, 0
    linedata_7 0x9980, 2, 1

LineDataE01S01_9:
    .2byte 4
    .align 2, 0
    linedata_6 0x2FB1
    linedata_18 0x2FB1
    linedata_1 0x8CEC, 1
    linedata_7 0x2FB1, 2, 1

LineDataE01S01_10:
    .2byte 4
    .align 2, 0
    linedata_6 0x2FB4
    linedata_18 0x2FB4
    linedata_1 0x8CEC, 3
    linedata_7 0x2FB4, 2, 1

