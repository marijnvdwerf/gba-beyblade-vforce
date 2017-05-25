    .include "asm/common.inc"

    .section ".rodata"

global Geometry_E02S06
    geometry_header 89, 8, 46

points:
    geometry_point 8320, 4096, 192
    geometry_point 9856, 4864, 192
    geometry_point 2560, 896, 960
    geometry_point 2560, 896, 960
    geometry_point 9856, 3072, 576
    geometry_point 9088, 3840, 192
    geometry_point 8064, 3072, 320
    geometry_point 9088, 2304, 576
    geometry_point 7296, 2304, 320
    geometry_point 4480, 1024, 320
    geometry_point 5248, 3072, 320
    geometry_point 3456, 1024, 960
    geometry_point 4224, 1792, 384
    geometry_point 2176, 1792, 960
    geometry_point 3456, 256, 960
    geometry_point 4480, 512, 704
    geometry_point 5248, 256, 704
    geometry_point 5248, 512, 704
    geometry_point 4992, 768, 512
    geometry_point 5504, 768, 320
    geometry_point 5248, 1024, 512
    geometry_point 6528, 1024, 320
    geometry_point 8576, 4352, 192
    geometry_point 8832, 4608, 192
    geometry_point 3008, 192, 0
    geometry_point 3104, 1888, 0
    geometry_point 6528, 2560, 320
    geometry_point 5504, 2560, 320
    geometry_point 5504, 1536, 320
    geometry_point 4768, 1248, 320
    geometry_point 4896, 1376, 320
    geometry_point 4832, 1312, 320
    geometry_point 4832, 2848, 320
    geometry_point 4832, 1312, 320
    geometry_point 4992, 2560, 320
    geometry_point 5248, 2816, 320
    geometry_point 7360, 2368, 320
    geometry_point 7488, 2496, 320
    geometry_point 7872, 2624, 320
    geometry_point 8000, 2752, 320
    geometry_point 5056, 320, 704
    geometry_point 5184, 448, 704
    geometry_point 7936, 2688, 320
    geometry_point 5120, 384, 704
    geometry_point 7424, 2432, 320
    geometry_point 6272, 768, 320
    geometry_point 6528, 1024, 320
    geometry_point 8896, 4160, 192
    geometry_point 9024, 4288, 192
    geometry_point 9184, 4640, 192
    geometry_point 9312, 4768, 192
    geometry_point 9408, 4160, 192
    geometry_point 9536, 4288, 192
    geometry_point 8960, 4224, 192
    geometry_point 9248, 4704, 192
    geometry_point 9472, 4224, 192
    geometry_point 2560, 640, 960
    geometry_point 2560, 640, 960
    geometry_point 1216, -704, 0
    geometry_point 2176, 1792, 960
    geometry_point 5248, 256, 960
    geometry_point 4096, 1792, 0
    geometry_point 4480, 3072, 320
    geometry_point 3840, 256, 0
    geometry_point 3456, 1024, 960
    geometry_point 4480, 256, 0
    geometry_point 3840, 1024, 640
    geometry_point 4992, 512, 0
    geometry_point 4480, 1024, 320
    geometry_point 4224, 1024, 0
    geometry_point 4992, 512, 704
    geometry_point 6528, 256, 0
    geometry_point 5248, 768, 512
    geometry_point 6848, 1728, 0
    geometry_point 9856, 2304, 576
    geometry_point 7296, 3072, 320
    geometry_point 8128, 3904, 0
    geometry_point 8320, 4864, 192
    geometry_point 9088, 4096, 192
    geometry_point 8448, 3072, 0
    geometry_point 9088, 4096, 576
    geometry_point 7040, 2304, 320
    geometry_point 7296, 2816, 320
    geometry_point 6528, 2304, 320
    geometry_point 7040, 2816, 320
    geometry_point 6528, 2560, 320
    geometry_point 7040, 2816, 320
    geometry_point 5248, 1280, 320
    geometry_point 5504, 1792, 320

splines:
    .4byte 3
    .4byte 76
    .byte 0x01, 0x00, 0x00, 0x10
    .2byte 0xA6B3
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .4byte 26, 27, 28
    .byte -127
    .byte 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00
    .2byte 0x0080
    .2byte 0x0080
    .4byte 0x00000800
    .byte 0
    .byte 0x81, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00
    .2byte 0x00C0
    .2byte 0x00A0
    .4byte 0x00000800

    .4byte 3
    .4byte 76
    .byte 0x01, 0x00, 0x00, 0x10
    .2byte 0xECF5
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .4byte 31, 32, 33
    .byte 0
    .byte 0x7F, 0x00, 0x00, 0x00, 0xC0, 0x00, 0x00
    .2byte 0x0040
    .2byte 0x0040
    .4byte 0x00000555
    .byte 0
    .byte 0x81, 0x00, 0x00, 0x00, 0xC0, 0x00, 0x00
    .2byte 0x00C0
    .2byte 0x0080
    .4byte 0x00000555

    .4byte 2
    .4byte 56
    .byte 0x01, 0x00, 0x00, 0x10
    .2byte 0x3F9C
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .4byte 42, 42
    .byte 96
    .byte 0xAE, 0x00, 0x00, 0x89, 0xBA, 0x01, 0x00
    .2byte 0x00E3
    .2byte 0x00E3
    .4byte 0x00000250

    .4byte 2
    .4byte 56
    .byte 0x01, 0x00, 0x00, 0x10
    .2byte 0x3F9E
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .4byte 43, 43
    .byte 28
    .byte 0x85, 0x00, 0x00, 0x77, 0xD5, 0x00, 0x00
    .2byte 0x00C9
    .2byte 0x00C9
    .4byte 0x000004CC

    .4byte 2
    .4byte 56
    .byte 0x01, 0x00, 0x00, 0x10
    .2byte 0x3F9B
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .4byte 44, 44
    .byte 94
    .byte 0xAC, 0x00, 0x00, 0xEB, 0x97, 0x01, 0x00
    .2byte 0x00E2
    .2byte 0x00E2
    .4byte 0x00000282

    .4byte 2
    .4byte 56
    .byte 0x01, 0x00, 0x00, 0x10
    .2byte 0x58B8
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .4byte 53, 53
    .byte 112
    .byte 0xC6, 0x00, 0x00, 0xF1, 0x51, 0x02, 0x00
    .2byte 0x00EC
    .2byte 0x00EC
    .4byte 0x000001B9

    .4byte 2
    .4byte 56
    .byte 0x01, 0x00, 0x00, 0x10
    .2byte 0x58B7
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .4byte 54, 54
    .byte 116
    .byte 0xCD, 0x00, 0x00, 0xEB, 0x82, 0x02, 0x00
    .2byte 0x00EF
    .2byte 0x00EF
    .4byte 0x00000197

    .4byte 2
    .4byte 56
    .byte 0x01, 0x00, 0x00, 0x10
    .2byte 0xF48E
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .4byte 55, 55
    .byte 110
    .byte 0xC1, 0x00, 0x00, 0x43, 0x61, 0x02, 0x00
    .2byte 0x00EA
    .2byte 0x00EA
    .4byte 0x000001AE


lines:
    geometry_line 0, 1
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x99, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xAA, 0x0A, 0x00, 0x00, 0x00, 0x00
    geometry_line 2, 3
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x86, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    geometry_line 4, 5
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x99, 0x01, 0x80, 0xFF, 0x00, 0x00, 0x00, 0x00, 0xEE, 0x00, 0xAA, 0x0A, 0x00, 0x00, 0x00, 0x00
    geometry_line 1, 5
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x99, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00
    geometry_line 6, 7
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x99, 0x03, 0x40, 0x00, 0x00, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00
    geometry_line 4, 7
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x99, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xAA, 0x0A, 0x00, 0x00, 0x00, 0x00
    geometry_line 6, 8
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x99, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xAA, 0x0A, 0x00, 0x00, 0x00, 0x00
    geometry_line 9, 10
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x99, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xAA, 0x0A, 0x00, 0x00, 0x00, 0x00
    geometry_line 11, 12
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x99, 0x03, 0x40, 0xFF, 0x00, 0x00, 0x00, 0x00, 0xE6, 0x00, 0xAA, 0x0A, 0x00, 0x00, 0x00, 0x00
    geometry_line 9, 12
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x99, 0x03, 0xC0, 0xFF, 0x00, 0x00, 0x00, 0x00, 0xF7, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x00
    geometry_line 13, 14
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x99, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x55, 0x05, 0x00, 0x00, 0x00, 0x00
    geometry_line 15, 16
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x99, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xAA, 0x0A, 0x00, 0x00, 0x00, 0x00
    geometry_line 14, 15
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x99, 0x03, 0xC0, 0xFF, 0x00, 0x00, 0x00, 0x00, 0xF7, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00
    geometry_line 17, 18
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x99, 0x01, 0x40, 0xFF, 0x00, 0x00, 0x00, 0x00, 0xE6, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x00
    geometry_line 19, 20
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x99, 0x03, 0x40, 0xFF, 0x00, 0x00, 0x00, 0x00, 0xE6, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x00
    geometry_line 18, 20
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x99, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x00
    geometry_line 19, 21
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x99, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x00
    geometry_line 22, 23
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x8B, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x00
    geometry_line 24, 25
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x8C, 0x99, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xD4, 0x04, 0x00, 0x00, 0x00, 0x00
    geometry_line 29, 30
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x86, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x12, 0x00, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0x00
    geometry_line 34, 35
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x8C, 0x99, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x00
    geometry_line 36, 37
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x86, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x11, 0x00, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0x00
    geometry_line 38, 39
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x86, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x11, 0x00, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0x00
    geometry_line 40, 41
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x86, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x11, 0x00, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0x00
    geometry_line 45, 46
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x8C, 0x99, 0x01, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x00
    geometry_line 47, 48
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x86, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x11, 0x00, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0x00
    geometry_line 49, 50
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x86, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x11, 0x00, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0x00
    geometry_line 51, 52
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x86, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x11, 0x00, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0x00
    geometry_line 56, 57
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x99, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    geometry_line 58, 59
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x03, 0x00, 0x80, 0x00, 0x03, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x88, 0x08, 0x00, 0x00, 0x00, 0x00
    geometry_line 58, 60
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x03, 0x00, 0x80, 0x00, 0x01, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x88, 0x08, 0x00, 0x00, 0x00, 0x00
    geometry_line 61, 62
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x03, 0x00, 0x80, 0x00, 0x03, 0xD5, 0x00, 0x00, 0x00, 0x00, 0x00, 0x1C, 0x00, 0x55, 0x15, 0x00, 0x00, 0x00, 0x00
    geometry_line 63, 64
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x03, 0x00, 0x80, 0x00, 0x01, 0x40, 0x01, 0x00, 0x00, 0x00, 0x00, 0x24, 0x00, 0xAA, 0x0A, 0x00, 0x00, 0x00, 0x00
    geometry_line 65, 66
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x03, 0x00, 0x80, 0x00, 0x01, 0xD5, 0x00, 0x00, 0x00, 0x00, 0x00, 0x1C, 0x00, 0xAA, 0x0A, 0x00, 0x00, 0x00, 0x00
    geometry_line 67, 68
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x03, 0x00, 0x80, 0x00, 0x01, 0xA0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x16, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00
    geometry_line 69, 70
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x03, 0x00, 0x80, 0x00, 0x03, 0xEA, 0x00, 0x00, 0x00, 0x00, 0x00, 0x1E, 0x00, 0xAA, 0x0A, 0x00, 0x00, 0x00, 0x00
    geometry_line 71, 72
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x03, 0x00, 0x80, 0x00, 0x01, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00
    geometry_line 73, 74
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x03, 0x00, 0x80, 0x00, 0x01, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x38, 0x0E, 0x00, 0x00, 0x00, 0x00
    geometry_line 73, 75
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x03, 0x00, 0x80, 0x00, 0x03, 0xB6, 0x00, 0x00, 0x00, 0x00, 0x00, 0x19, 0x00, 0x49, 0x12, 0x00, 0x00, 0x00, 0x00
    geometry_line 76, 77
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x03, 0x00, 0x80, 0x00, 0x03, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0xAA, 0x2A, 0x00, 0x00, 0x00, 0x00
    geometry_line 76, 78
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x03, 0x00, 0x80, 0x00, 0x01, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0xAA, 0x2A, 0x00, 0x00, 0x00, 0x00
    geometry_line 79, 80
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x03, 0x00, 0x80, 0x00, 0x03, 0xE6, 0x00, 0x00, 0x00, 0x00, 0x00, 0x1D, 0x00, 0xCC, 0x0C, 0x00, 0x00, 0x00, 0x00
    geometry_line 81, 82
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x8D, 0x99, 0x01, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00
    geometry_line 83, 84
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x8D, 0x99, 0x09, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00
    geometry_line 85, 86
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x8D, 0x99, 0x09, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x00
    geometry_line 87, 88
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x8D, 0x99, 0x01, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00

