    .include "asm/common.inc"

    .section ".rodata"

global Geometry_E03S06
    geometry_header 36, 1, 20

points:
    geometry_point 4800, 832, 192
    geometry_point 4800, 832, 192
    geometry_point 2880, 2240, 512
    geometry_point 6720, 2752, 640
    geometry_point 2880, 1472, 192
    geometry_point 6720, 1856, 256
    geometry_point 3392, 2752, 512
    geometry_point 2880, -1088, 640
    geometry_point 4160, 2752, 192
    geometry_point 3904, -1088, 256
    geometry_point 6208, 2752, 512
    geometry_point 6720, -1088, 640
    geometry_point 5440, 2752, 192
    geometry_point 5824, -1088, 256
    geometry_point 2880, -576, 512
    geometry_point 6720, -1088, 640
    geometry_point 2880, 192, 192
    geometry_point 6720, -64, 256
    geometry_point 4160, -1088, 192
    geometry_point 5440, 2752, 192
    geometry_point 4800, 1216, 192
    geometry_point 4928, 1344, 192
    geometry_point 4160, 1472, 192
    geometry_point 4160, 192, 192
    geometry_point 5440, 192, 192
    geometry_point 5440, 1472, 192
    geometry_point 4800, 576, 192
    geometry_point 4800, 576, 192
    geometry_point 2240, -1984, 0
    geometry_point 2880, 2752, 640
    geometry_point 2112, -1728, 0
    geometry_point 6720, -1088, 640
    geometry_point 4160, 704, 192
    geometry_point 4416, 960, 192
    geometry_point 5184, 704, 192
    geometry_point 5440, 960, 192

splines:
    .4byte 5
    .4byte 116
    .byte 0x01, 0x00, 0x00, 0x10
    .2byte 0x6C0D
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .4byte 22, 23, 24, 25, 22
    .byte 0
    .byte 0x81, 0x00, 0x00, 0x00, 0xA0, 0x00, 0x00
    .2byte 0x00C0
    .2byte 0x00C0
    .4byte 0x00000666
    .byte 127
    .byte 0x00, 0x00, 0x00, 0x00, 0xA0, 0x00, 0x00
    .2byte 0x0000
    .2byte 0x0060
    .4byte 0x00000666
    .byte 0
    .byte 0x7F, 0x00, 0x00, 0x00, 0xA0, 0x00, 0x00
    .2byte 0x0040
    .2byte 0x0020
    .4byte 0x00000666
    .byte -127
    .byte 0x00, 0x00, 0x00, 0x00, 0xA0, 0x00, 0x00
    .2byte 0x0080
    .2byte 0x0060
    .4byte 0x00000666


lines:
    geometry_line 0, 1
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x86, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    geometry_line 2, 3
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x99, 0x01, 0x40, 0x00, 0x00, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00
    geometry_line 4, 5
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x99, 0x01, 0x2A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x06, 0x00, 0x55, 0x15, 0x00, 0x00, 0x00, 0x00
    geometry_line 2, 5
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x99, 0x01, 0xAA, 0x00, 0x00, 0x00, 0x00, 0x00, 0x17, 0x00, 0x55, 0x15, 0x00, 0x00, 0x00, 0x00
    geometry_line 6, 7
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x99, 0x03, 0xC0, 0xFF, 0x00, 0x00, 0x00, 0x00, 0xF7, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00
    geometry_line 8, 9
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x99, 0x03, 0xC0, 0xFF, 0x00, 0x00, 0x00, 0x00, 0xF7, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x00
    geometry_line 6, 9
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x99, 0x03, 0x80, 0xFF, 0x00, 0x00, 0x00, 0x00, 0xEE, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00
    geometry_line 10, 11
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x99, 0x03, 0x40, 0x00, 0x00, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00
    geometry_line 12, 13
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x99, 0x03, 0x2A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x06, 0x00, 0x55, 0x15, 0x00, 0x00, 0x00, 0x00
    geometry_line 10, 13
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x99, 0x03, 0xAA, 0x00, 0x00, 0x00, 0x00, 0x00, 0x17, 0x00, 0x55, 0x15, 0x00, 0x00, 0x00, 0x00
    geometry_line 14, 15
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x99, 0x01, 0xC0, 0xFF, 0x00, 0x00, 0x00, 0x00, 0xF7, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00
    geometry_line 16, 17
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x99, 0x01, 0xC0, 0xFF, 0x00, 0x00, 0x00, 0x00, 0xF7, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x00
    geometry_line 14, 17
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x99, 0x01, 0x80, 0xFF, 0x00, 0x00, 0x00, 0x00, 0xEE, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00
    geometry_line 18, 19
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x99, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x22, 0x02, 0x00, 0x00, 0x00, 0x00
    geometry_line 20, 21
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x86, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x19, 0x00, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0x00
    geometry_line 26, 27
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x99, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    geometry_line 28, 29
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x03, 0x00, 0x80, 0x00, 0x03, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0xCC, 0x0C, 0x00, 0x00, 0x00, 0x00
    geometry_line 30, 31
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x03, 0x00, 0x80, 0x00, 0x01, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0xCC, 0x0C, 0x00, 0x00, 0x00, 0x00
    geometry_line 32, 33
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x8C, 0x99, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x00
    geometry_line 34, 35
    .byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x8C, 0x99, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x00

