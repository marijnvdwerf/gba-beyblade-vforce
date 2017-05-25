    .include "asm/common.inc"

    .section ".rodata"

global Geometry_E01S03
    geometry_header 52, 0, 34

points:
    geometry_point 8000, 3776, 192
    geometry_point 9280, 2496, 192
    geometry_point 9024, 1728, 576
    geometry_point 9280, 1472, 576
    geometry_point 10304, 448, 576
    geometry_point 9024, 1472, 576
    geometry_point 9792, -1344, 576
    geometry_point 9024, -832, 576
    geometry_point 7488, -832, 768
    geometry_point 9024, -1856, 768
    geometry_point 6720, -1856, 960
    geometry_point 5440, 192, 960
    geometry_point 4672, 960, 768
    geometry_point 5440, 1984, 768
    geometry_point 6720, 192, 768
    geometry_point 3904, 1984, 960
    geometry_point 2368, 960, 960
    geometry_point 2752, 1600, 960
    geometry_point 2752, 1600, 960
    geometry_point 6208, 448, 768
    geometry_point 6464, 704, 768
    geometry_point 5952, 704, 768
    geometry_point 6208, 960, 768
    geometry_point 5696, 448, 768
    geometry_point 5952, 704, 768
    geometry_point 9664, 576, 576
    geometry_point 10176, 1088, 576
    geometry_point 8512, 3008, 192
    geometry_point 8768, 3264, 192
    geometry_point 5184, 1472, 768
    geometry_point 5440, 1728, 768
    geometry_point 5408, 864, 0
    geometry_point 6816, 1376, 0
    geometry_point 8224, -1952, 0
    geometry_point 8576, -768, 0
    geometry_point 8256, 3264, 192
    geometry_point 8512, 3520, 192
    geometry_point 2752, 1344, 960
    geometry_point 2752, 1344, 960
    geometry_point 1408, 0, 0
    geometry_point 5440, 960, 960
    geometry_point 2368, 1984, 960
    geometry_point 9024, -1856, 960
    geometry_point 4480, -2816, 0
    geometry_point 8960, -1920, 0
    geometry_point 10304, -1344, 576
    geometry_point 9216, -896, 0
    geometry_point 9792, 448, 576
    geometry_point 8448, -128, 0
    geometry_point 9024, 2496, 576
    geometry_point 7424, 1920, 0
    geometry_point 8000, 3776, 576

splines:

lines:
    geometry_line 0, 1
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x99, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x66, 0x06, 0x00, 0x00, 0x00, 0x00
    geometry_line 1, 2
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x99, 0x01, 0x80, 0xFF, 0x00, 0x00, 0x00, 0x00, 0xEE, 0x00, 0xAA, 0x0A, 0x00, 0x00, 0x00, 0x00
    geometry_line 2, 3
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x99, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x00
    geometry_line 4, 5
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x99, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00
    geometry_line 4, 6
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x99, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x92, 0x04, 0x00, 0x00, 0x00, 0x00
    geometry_line 6, 7
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x99, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00
    geometry_line 8, 9
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x99, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00
    geometry_line 8, 10
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x99, 0x03, 0xC0, 0xFF, 0x00, 0x00, 0x00, 0x00, 0xF7, 0x00, 0xAA, 0x0A, 0x00, 0x00, 0x00, 0x00
    geometry_line 10, 11
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x99, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00
    geometry_line 13, 14
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x99, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x92, 0x04, 0x00, 0x00, 0x00, 0x00
    geometry_line 12, 13
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x99, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00
    geometry_line 12, 15
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x99, 0x03, 0xC0, 0xFF, 0x00, 0x00, 0x00, 0x00, 0xF7, 0x00, 0xAA, 0x0A, 0x00, 0x00, 0x00, 0x00
    geometry_line 15, 16
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x99, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x55, 0x05, 0x00, 0x00, 0x00, 0x00
    geometry_line 17, 18
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x86, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    geometry_line 19, 20
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x8C, 0x99, 0x01, 0x00, 0x00, 0x00, 0x00, 0xF0, 0xFF, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x00
    geometry_line 21, 22
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x8C, 0x99, 0x01, 0x00, 0x00, 0x00, 0x00, 0xF0, 0xFF, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x00
    geometry_line 23, 24
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x8C, 0x99, 0x01, 0x00, 0x00, 0x00, 0x00, 0xF0, 0xFF, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x00
    geometry_line 25, 26
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x8B, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00
    geometry_line 27, 28
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x8C, 0x99, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x00
    geometry_line 29, 30
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x8C, 0x99, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x00
    geometry_line 31, 32
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x8C, 0x99, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00
    geometry_line 33, 34
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x8C, 0x99, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xEB, 0x06, 0x00, 0x00, 0x00, 0x00
    geometry_line 35, 36
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x8C, 0x99, 0x01, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x00
    geometry_line 37, 38
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x99, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    geometry_line 39, 40
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x03, 0x00, 0x80, 0x00, 0x01, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x88, 0x08, 0x00, 0x00, 0x00, 0x00
    geometry_line 39, 41
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x03, 0x00, 0x80, 0x00, 0x03, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x88, 0x08, 0x00, 0x00, 0x00, 0x00
    geometry_line 42, 43
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x03, 0x00, 0x80, 0x00, 0x01, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x88, 0x08, 0x00, 0x00, 0x00, 0x00
    geometry_line 40, 43
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x03, 0x00, 0x80, 0x00, 0x03, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x88, 0x08, 0x00, 0x00, 0x00, 0x00
    geometry_line 44, 45
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x03, 0x00, 0x80, 0x00, 0x01, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x38, 0x0E, 0x00, 0x00, 0x00, 0x00
    geometry_line 46, 47
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x03, 0x00, 0x80, 0x00, 0x03, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x38, 0x0E, 0x00, 0x00, 0x00, 0x00
    geometry_line 47, 48
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x03, 0x00, 0x80, 0x00, 0x01, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x38, 0x0E, 0x00, 0x00, 0x00, 0x00
    geometry_line 48, 49
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x03, 0x00, 0x80, 0x00, 0x03, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x38, 0x0E, 0x00, 0x00, 0x00, 0x00
    geometry_line 49, 50
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x03, 0x00, 0x80, 0x00, 0x01, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x38, 0x0E, 0x00, 0x00, 0x00, 0x00
    geometry_line 50, 51
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x03, 0x00, 0x80, 0x00, 0x03, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x38, 0x0E, 0x00, 0x00, 0x00, 0x00

