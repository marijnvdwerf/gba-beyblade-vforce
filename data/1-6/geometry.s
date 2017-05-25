    .include "asm/common.inc"

    .section ".rodata"

global Geometry_E01S06
    geometry_header 51, 2, 27

points:
    geometry_point 6208, -1472, 192
    geometry_point 7232, 2112, 192
    geometry_point 2496, 960, 768
    geometry_point 2496, 960, 768
    geometry_point 4416, -448, 640
    geometry_point 3648, -2240, 640
    geometry_point 5952, 1344, 192
    geometry_point 4672, 2112, 512
    geometry_point 3904, 64, 512
    geometry_point 2880, 832, 768
    geometry_point 2112, 64, 768
    geometry_point 2880, 1344, 768
    geometry_point 3904, -1984, 640
    geometry_point 4160, -1728, 640
    geometry_point 4160, 320, 512
    geometry_point 4416, 576, 512
    geometry_point 6208, 1600, 192
    geometry_point 6464, 1856, 192
    geometry_point 6464, 320, 192
    geometry_point 6720, 576, 192
    geometry_point 6464, -960, 192
    geometry_point 6720, -704, 192
    geometry_point 6720, -192, 192
    geometry_point 6976, 64, 192
    geometry_point 6560, 736, 192
    geometry_point 6688, 864, 192
    geometry_point 6624, 800, 192
    geometry_point 6656, 1792, 192
    geometry_point 6624, 800, 192
    geometry_point 6912, -384, 192
    geometry_point 7040, -256, 192
    geometry_point 6976, -320, 192
    geometry_point 6976, -1216, 192
    geometry_point 6976, -1472, 192
    geometry_point 7232, -1216, 192
    geometry_point 2240, 704, 768
    geometry_point 2240, 704, 768
    geometry_point 1344, -704, 0
    geometry_point 4672, 64, 768
    geometry_point 2112, 1344, 768
    geometry_point 3392, 832, 0
    geometry_point 3904, 2112, 512
    geometry_point 6208, 704, 0
    geometry_point 4672, 1344, 512
    geometry_point 5952, -448, 0
    geometry_point 6208, 1344, 192
    geometry_point 7232, -2112, 0
    geometry_point 4416, -1472, 640
    geometry_point 3008, -2880, 0
    geometry_point 3648, -448, 640
    geometry_point 4416, -2240, 640

splines:
    .4byte 3
    .4byte 76
    .byte 0x01, 0x00, 0x00, 0x10
    .2byte 0xECF5
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .4byte 26, 27, 28
    .byte 4
    .byte 0x7E, 0x00, 0x00, 0x10, 0x7C, 0x00, 0x00
    .2byte 0x003E
    .2byte 0x003E
    .4byte 0x00000840
    .byte -4
    .byte 0x82, 0x00, 0x00, 0x10, 0x7C, 0x00, 0x00
    .2byte 0x00BE
    .2byte 0x007E
    .4byte 0x00000840

    .4byte 3
    .4byte 76
    .byte 0x01, 0x00, 0x00, 0x10
    .2byte 0x32FC
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .4byte 31, 32, 31
    .byte 0
    .byte 0x81, 0x00, 0x00, 0x00, 0x70, 0x00, 0x00
    .2byte 0x00C0
    .2byte 0x00C0
    .4byte 0x00000924
    .byte 0
    .byte 0x7F, 0x00, 0x00, 0x00, 0x70, 0x00, 0x00
    .2byte 0x0040
    .2byte 0x0080
    .4byte 0x00000924


lines:
    geometry_line 0, 1
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x99, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00
    geometry_line 2, 3
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x86, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    geometry_line 4, 5
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x99, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xAA, 0x0A, 0x00, 0x00, 0x00, 0x00
    geometry_line 0, 4
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x99, 0x03, 0xC0, 0xFF, 0x00, 0x00, 0x00, 0x00, 0xF7, 0x00, 0x92, 0x04, 0x00, 0x00, 0x00, 0x00
    geometry_line 6, 7
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x99, 0x03, 0xC0, 0xFF, 0x00, 0x00, 0x00, 0x00, 0xF7, 0x00, 0x66, 0x06, 0x00, 0x00, 0x00, 0x00
    geometry_line 8, 9
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x99, 0x03, 0xC0, 0xFF, 0x00, 0x00, 0x00, 0x00, 0xF7, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00
    geometry_line 7, 8
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x99, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00
    geometry_line 10, 11
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x99, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x66, 0x06, 0x00, 0x00, 0x00, 0x00
    geometry_line 12, 13
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x8B, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x00
    geometry_line 1, 6
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x99, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xAA, 0x0A, 0x00, 0x00, 0x00, 0x00
    geometry_line 14, 15
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x8C, 0x99, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x00
    geometry_line 16, 17
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x9A, 0x99, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x00
    geometry_line 18, 19
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x9A, 0x99, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x00
    geometry_line 20, 21
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x9A, 0x99, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x00
    geometry_line 22, 23
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x9A, 0x99, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x00
    geometry_line 24, 25
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x86, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0x00
    geometry_line 29, 30
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x86, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0x00
    geometry_line 33, 34
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x8C, 0x99, 0x01, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x00
    geometry_line 35, 36
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x99, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    geometry_line 37, 38
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x03, 0x00, 0x80, 0x00, 0x01, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0xAA, 0x0A, 0x00, 0x00, 0x00, 0x00
    geometry_line 37, 39
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x03, 0x00, 0x80, 0x00, 0x03, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0xAA, 0x0A, 0x00, 0x00, 0x00, 0x00
    geometry_line 40, 41
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x03, 0x00, 0x80, 0x00, 0x03, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00
    geometry_line 42, 43
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x03, 0x00, 0x80, 0x00, 0x01, 0xCC, 0x00, 0x00, 0x00, 0x00, 0x00, 0x1B, 0x00, 0xCC, 0x0C, 0x00, 0x00, 0x00, 0x00
    geometry_line 44, 45
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x03, 0x00, 0x80, 0x00, 0x03, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x1A, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x00
    geometry_line 46, 47
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x03, 0x00, 0x80, 0x00, 0x01, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0xCC, 0x0C, 0x00, 0x00, 0x00, 0x00
    geometry_line 48, 49
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x03, 0x00, 0x80, 0x00, 0x03, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0xCC, 0x0C, 0x00, 0x00, 0x00, 0x00
    geometry_line 48, 50
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x03, 0x00, 0x80, 0x00, 0x01, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0xCC, 0x0C, 0x00, 0x00, 0x00, 0x00

