    .include "asm/common.inc"

    .section ".rodata"

global Geometry_E02S02
    geometry_header 58, 0, 35

points:
    geometry_point 3296, 2208, 192
    geometry_point 6112, 3232, 192
    geometry_point 4704, 544, 192
    geometry_point 4704, 544, 192
    geometry_point 3296, 1184, 384
    geometry_point 4320, 1952, 192
    geometry_point 4320, 160, 384
    geometry_point 4320, 160, 192
    geometry_point 6112, 1184, 192
    geometry_point 6368, 160, 320
    geometry_point 6880, 160, 192
    geometry_point 8672, 1184, 192
    geometry_point 8928, 160, 320
    geometry_point 9440, 1184, 192
    geometry_point 11232, 160, 192
    geometry_point 9952, 2208, 192
    geometry_point 12000, 3232, 192
    geometry_point 9696, 3232, 320
    geometry_point 9440, -96, 320
    geometry_point 10976, 416, 320
    geometry_point 10464, -1120, 320
    geometry_point 9184, 2208, 192
    geometry_point 6880, 3232, 192
    geometry_point 6624, 2208, 320
    geometry_point 3808, 416, 384
    geometry_point 4064, 672, 384
    geometry_point 5600, 672, 192
    geometry_point 5856, 928, 192
    geometry_point 10208, 2720, 192
    geometry_point 10464, 2976, 192
    geometry_point 10720, -1120, 320
    geometry_point 10976, -864, 320
    geometry_point 4704, 288, 192
    geometry_point 4704, 288, 192
    geometry_point 2912, -224, 0
    geometry_point 8928, 160, 384
    geometry_point 9120, -416, 0
    geometry_point 9440, 1184, 320
    geometry_point 6688, -32, 0
    geometry_point 6880, 1184, 192
    geometry_point 9120, -416, 0
    geometry_point 10464, -96, 320
    geometry_point 10144, -1696, 0
    geometry_point 10976, -1120, 320
    geometry_point 6176, 1888, 0
    geometry_point 11232, 2208, 320
    geometry_point 4320, 1952, 0
    geometry_point 6112, 2208, 192
    geometry_point 10976, 1184, 0
    geometry_point 11232, 2208, 192
    geometry_point 9312, 2208, 0
    geometry_point 9696, 3232, 320
    geometry_point 6240, 2208, 0
    geometry_point 6624, 3232, 320
    geometry_point 10976, -96, 0
    geometry_point 12000, 160, 192
    geometry_point 2912, -480, 0
    geometry_point 3296, 3232, 384

splines:

lines:
    geometry_line 0, 1
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x99, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00
    geometry_line 2, 3
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x86, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    geometry_line 4, 5
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x99, 0x01, 0xC0, 0xFF, 0x00, 0x00, 0x00, 0x00, 0xF7, 0x00, 0xAA, 0x0A, 0x00, 0x00, 0x00, 0x00
    geometry_line 0, 5
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x99, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x00
    geometry_line 4, 6
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x99, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00
    geometry_line 7, 8
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x99, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00
    geometry_line 8, 9
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x99, 0x03, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x12, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x00
    geometry_line 10, 11
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x99, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00
    geometry_line 11, 12
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x99, 0x03, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x12, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x00
    geometry_line 13, 14
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x99, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00
    geometry_line 15, 16
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x99, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00
    geometry_line 14, 16
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x99, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xAA, 0x02, 0x00, 0x00, 0x00, 0x00
    geometry_line 15, 17
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x99, 0x03, 0x80, 0xFF, 0x00, 0x00, 0x00, 0x00, 0xEE, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x00
    geometry_line 18, 19
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x99, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00
    geometry_line 19, 20
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x99, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x55, 0x05, 0x00, 0x00, 0x00, 0x00
    geometry_line 21, 22
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x99, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00
    geometry_line 22, 23
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x99, 0x03, 0x80, 0xFF, 0x00, 0x00, 0x00, 0x00, 0xEE, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x00
    geometry_line 24, 25
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x8B, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x00
    geometry_line 26, 27
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x8C, 0x99, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x00
    geometry_line 28, 29
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x8C, 0x99, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x00
    geometry_line 30, 31
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x8C, 0x99, 0x01, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x00
    geometry_line 32, 33
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x99, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    geometry_line 34, 35
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x03, 0x00, 0x92, 0x00, 0x01, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x55, 0x15, 0x00, 0x00, 0x00, 0x00
    geometry_line 36, 37
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x03, 0x00, 0x80, 0x00, 0x03, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x99, 0x19, 0x00, 0x00, 0x00, 0x00
    geometry_line 38, 39
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x03, 0x00, 0x80, 0x00, 0x03, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0xAA, 0x2A, 0x00, 0x00, 0x00, 0x00
    geometry_line 40, 41
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x03, 0x00, 0x80, 0x00, 0x01, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x99, 0x19, 0x00, 0x00, 0x00, 0x00
    geometry_line 41, 42
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x99, 0x03, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x99, 0x19, 0x00, 0x00, 0x00, 0x00
    geometry_line 42, 43
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x99, 0x01, 0x8E, 0x00, 0x00, 0x00, 0x00, 0x00, 0x14, 0x00, 0x38, 0x0E, 0x00, 0x00, 0x00, 0x00
    geometry_line 44, 45
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x03, 0x00, 0x80, 0x00, 0x01, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x99, 0x19, 0x00, 0x00, 0x00, 0x00
    geometry_line 46, 47
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x03, 0x00, 0x80, 0x00, 0x01, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x1A, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x00
    geometry_line 48, 49
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x03, 0x00, 0x80, 0x00, 0x03, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x1A, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x00
    geometry_line 50, 51
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x03, 0x00, 0x80, 0x00, 0x03, 0xD5, 0x00, 0x00, 0x00, 0x00, 0x00, 0x1C, 0x00, 0x55, 0x15, 0x00, 0x00, 0x00, 0x00
    geometry_line 52, 53
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x03, 0x00, 0x80, 0x00, 0x03, 0xD5, 0x00, 0x00, 0x00, 0x00, 0x00, 0x1C, 0x00, 0x55, 0x15, 0x00, 0x00, 0x00, 0x00
    geometry_line 54, 55
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x03, 0x00, 0x80, 0x00, 0x01, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x1A, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x00
    geometry_line 56, 57
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x03, 0x00, 0x92, 0x00, 0x03, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x55, 0x15, 0x00, 0x00, 0x00, 0x00

