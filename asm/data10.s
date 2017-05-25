    .include "asm/common.inc"

	.section .rodata

global ShadowFontMeta
    .byte 2, 2, 2, 2, 3, 3, 2, 2
    .byte 4, 2, 2, 3, 2, 2, 2, 2
    .byte 1, 2, 2, 2, 2, 2, 2, 2
    .byte 2, 1, 2, 3, 4, 3, 3, 3
    .byte 3, 3, 4, 3, 3, 4, 2, 3
    .byte 3, 3, 3, 4, 3, 4, 3, 2
    .byte 2, 2, 3, 3, 3, 4, 3, 3
    .byte 3, 3, 3, 3, 3, 3, 6, 4
    .byte 2, 6, 6, 4, 4, 5, 4, 5
    .byte 4, 2, 2, 1, 4, 6, 3, 2
    .byte 4, 3, 3, 0, 5, 4, 5, 4
    .byte 1, 5, 3, 6, 3, 0, 0, 0
    .byte 0, 0, 0, 0, 0, 2, 3, 5
    .byte 3, 2, 2, 3, 4, 2, 2, 2
    .byte 3, 2, 2, 3, 2, 2, 3, 2
    .byte 5, 0, 0, 0, 0, 0, 0, 0
    .byte 0, 0, 0, 0, 0, 0, 0, 0
    .byte 0, 0, 0, 0, 0, 0, 0, 0
    .byte 0, 4, 3, 2, 2, 0, 3, 4
    .byte 3

global NormalFontMeta
    .byte  8,  8,  8,  8,  8,  8,  8,  8
    .byte  8,  8,  8,  8,  7,  8,  8,  8
    .byte  8,  8,  8,  8,  8,  8,  7,  8
    .byte  8,  8,  8,  8,  8,  8,  8,  8
    .byte  8,  8,  8,  8,  8,  8,  7,  8
    .byte  8,  8,  8,  8,  8,  8,  8,  8
    .byte  7,  8,  8,  8,  8, 11,  8,  8
    .byte  8,  8,  8,  9,  8,  8, 12,  9
    .byte  9, 12, 12, 14, 12, 12, 11, 14
    .byte 12, 10, 10,  9, 10, 14, 10, 12
    .byte 14, 11, 11,  8, 12, 11, 12, 10
    .byte 12, 14, 11, 13, 11, 10, 10,  9
    .byte  9,  9, 12, 10,  6,  9,  9, 13
    .byte  9,  9,  9,  9, 13,  9,  9,  9
    .byte  9,  9,  9,  9,  9,  9,  9,  9
    .byte  9,  9, 14,  3,  9, 13, 13,  9
    .byte  8,  9,  9, 10,  9, 10,  9,  9
    .byte  1,  1,  6,  6,  3,  3,  6,  6
    .byte 12,  8,  4,  0

global LargeFontMeta
    .byte  6,  6,  7,  6,  6,  6,  6,  4
    .byte 10,  6,  4,  7,  4,  4,  6,  6
    .byte  5,  5,  7,  6,  5,  6,  3,  4
    .byte  5,  5,  6,  6,  7,  6,  6,  6
    .byte  6,  4, 10,  6,  4,  7,  4,  4
    .byte  6,  6,  5,  5,  7,  6,  5,  6
    .byte  3,  4,  5,  5,  8, 10,  8,  8
    .byte  7,  8,  8,  7,  8,  8, 10,  9
    .byte  7,  9,  9, 11, 11, 12, 11, 10
    .byte  8,  8,  7,  8,  4, 11,  7,  8
    .byte 11,  8,  8,  0,  9, 11,  9,  9
    .byte  8, 11,  9, 13,  9,  8,  8,  4
    .byte  4,  2,  5,  8,  3,  6,  6, 10
    .byte  6,  6,  5,  6,  9,  5,  6,  4
    .byte  6,  6,  5,  6,  5,  6,  7,  6
    .byte 10,  1,  0,  0,  0,  0,  9,  9
    .byte  9,  9,  9,  9,  9,  9,  1,  1
    .byte  5,  5,  3,  3,  0,  0,  0,  0
    .byte  0,  0,  8,  6,  7,  0,  6,  0
    .byte  0,  1,  2,  2,  1,  3,  3,  1
    .byte  1, 12,  4,  2,  4,  1,  1,  1
    .byte  1,  1,  1,  2,  2,  1,  1,  0
    .byte  0,  1,  2,  3,  3,  3,  3,  3
    .byte  3,  3,  3, 12,  3,  3,  3,  3
    .byte  3,  3,  3,  3,  3,  4,  4,  3
    .byte  3,  3,  4,  4,  4,  2, 10,  2
    .byte  3,  2,  2,  2,  2,  2,  2, 12
    .byte  9,  2, 11, 11, 11,  8, 12,  7
    .byte 12,  4,  5,  3,  3,  3, 12,  4
    .byte  4, 12,  3,  3,  2,  9,  7,  9
    .byte  3,  4, 12,  9, 12,  9,  4,  4
    .byte  0,  0,  1,  5,  7,  5,  3,  3
    .byte 11,  3,  3,  3,  3, 11,  3,  3
    .byte  3,  3,  3,  3,  3,  3,  3,  3
    .byte  3,  3,  3, 12,  1,  3, 11, 11
    .byte  3,  8,  8,  8,  9,  8,  9,  8
    .byte  8,  0,  0, 16, 16,  2,  2,  6
    .byte  6, 12,  8,  4,  0,  6,  0

global _8067D3C
    .4byte 0x8
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x806E664
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x806892C

global Credits
    .4byte Str_86FCEC0
    .2byte 0
    .2byte 24
    .byte 14
    .byte 0, 0, 0 @ padding

    .4byte Str_86FCEB4
    .2byte 0
    .2byte 16
    .byte 14
    .byte 0, 0, 0 @ padding

    .4byte Str_86FCEA4
    .2byte 0
    .2byte 10
    .byte 15
    .byte 0, 0, 0 @ padding

    .4byte NULL
    .2byte 0
    .2byte 0
    .byte 0
    .byte 0, 0, 0 @ padding

    .4byte Str_86FCE90
    .2byte 0
    .2byte 16
    .byte 14
    .byte 0, 0, 0 @ padding

    .4byte Str_86FCE7C
    .2byte 0
    .2byte 10
    .byte 15
    .byte 0, 0, 0 @ padding

    .4byte NULL
    .2byte 0
    .2byte 0
    .byte 0
    .byte 0, 0, 0 @ padding

    .4byte Str_86FCE6C
    .2byte 0
    .2byte 24
    .byte 14
    .byte 0, 0, 0 @ padding

    .4byte Str_86FCE5C
    .2byte 0
    .2byte 16
    .byte 14
    .byte 0, 0, 0 @ padding

    .4byte Str_86FCE4C
    .2byte 0
    .2byte 10
    .byte 15
    .byte 0, 0, 0 @ padding

    .4byte NULL
    .2byte 0
    .2byte 0
    .byte 0
    .byte 0, 0, 0 @ padding

    .4byte Str_86FCE40
    .2byte 0
    .2byte 16
    .byte 14
    .byte 0, 0, 0 @ padding

    .4byte Str_86FCE34
    .2byte 0
    .2byte 10
    .byte 15
    .byte 0, 0, 0 @ padding

    .4byte NULL
    .2byte 0
    .2byte 0
    .byte 0
    .byte 0, 0, 0 @ padding

    .4byte Str_86FCE2C
    .2byte 0
    .2byte 24
    .byte 14
    .byte 0, 0, 0 @ padding

    .4byte Str_86FCDF8
    .2byte 0
    .2byte 24
    .byte 14
    .byte 0, 0, 0 @ padding

    .4byte Str_86FCDEC
    .2byte 0
    .2byte 10
    .byte 15
    .byte 0, 0, 0 @ padding

    .4byte NULL
    .2byte 0
    .2byte 0
    .byte 0
    .byte 0, 0, 0 @ padding

    .4byte Str_86FCDC8
    .2byte 0
    .2byte 16
    .byte 14
    .byte 0, 0, 0 @ padding

    .4byte Str_86FCDB4
    .2byte 0
    .2byte 10
    .byte 15
    .byte 0, 0, 0 @ padding

    .4byte NULL
    .2byte 0
    .2byte 0
    .byte 0
    .byte 0, 0, 0 @ padding

    .4byte Str_86FCDA4
    .2byte 0
    .2byte 16
    .byte 14
    .byte 0, 0, 0 @ padding

    .4byte Str_86FCD98
    .2byte 0
    .2byte 10
    .byte 15
    .byte 0, 0, 0 @ padding

    .4byte NULL
    .2byte 0
    .2byte 0
    .byte 0
    .byte 0, 0, 0 @ padding

    .4byte Str_86FCD80
    .2byte 0
    .2byte 16
    .byte 14
    .byte 0, 0, 0 @ padding

    .4byte Str_86FCD74
    .2byte 0
    .2byte 10
    .byte 15
    .byte 0, 0, 0 @ padding

    .4byte NULL
    .2byte 0
    .2byte 0
    .byte 0
    .byte 0, 0, 0 @ padding

    .4byte Str_86FCD54
    .2byte 0
    .2byte 16
    .byte 14
    .byte 0, 0, 0 @ padding

    .4byte Str_86FCD44
    .2byte 0
    .2byte 10
    .byte 15
    .byte 0, 0, 0 @ padding

    .4byte NULL
    .2byte 0
    .2byte 0
    .byte 0
    .byte 0, 0, 0 @ padding

    .4byte Str_86FCD28
    .2byte 0
    .2byte 16
    .byte 14
    .byte 0, 0, 0 @ padding

    .4byte Str_86FCD1C
    .2byte 0
    .2byte 10
    .byte 15
    .byte 0, 0, 0 @ padding

    .4byte NULL
    .2byte 0
    .2byte 0
    .byte 0
    .byte 0, 0, 0 @ padding

    .4byte Str_86FCD10
    .2byte 0
    .2byte 16
    .byte 14
    .byte 0, 0, 0 @ padding

    .4byte Str_86FCD00
    .2byte 0
    .2byte 10
    .byte 15
    .byte 0, 0, 0 @ padding

    .4byte Str_86FCCEC
    .2byte 0
    .2byte 10
    .byte 15
    .byte 0, 0, 0 @ padding

    .4byte Str_86FCCDC
    .2byte 0
    .2byte 10
    .byte 15
    .byte 0, 0, 0 @ padding

    .4byte NULL
    .2byte 0
    .2byte 0
    .byte 0
    .byte 0, 0, 0 @ padding

    .4byte Str_86FCCD4
    .2byte 0
    .2byte 16
    .byte 14
    .byte 0, 0, 0 @ padding

    .4byte Str_86FCCC4
    .2byte 0
    .2byte 10
    .byte 15
    .byte 0, 0, 0 @ padding

    .4byte NULL
    .2byte 0
    .2byte 0
    .byte 0
    .byte 0, 0, 0 @ padding

    .4byte Str_86FCCB8
    .2byte 0
    .2byte 16
    .byte 14
    .byte 0, 0, 0 @ padding

    .4byte Str_86FCCA8
    .2byte 0
    .2byte 10
    .byte 15
    .byte 0, 0, 0 @ padding

    .4byte NULL
    .2byte 0
    .2byte 0
    .byte 0
    .byte 0, 0, 0 @ padding

    .4byte Str_86FCC98
    .2byte 0
    .2byte 16
    .byte 14
    .byte 0, 0, 0 @ padding

    .4byte Str_86FCC8C
    .2byte 0
    .2byte 10
    .byte 15
    .byte 0, 0, 0 @ padding

    .4byte Str_86FCC80
    .2byte 0
    .2byte 10
    .byte 15
    .byte 0, 0, 0 @ padding

    .4byte NULL
    .2byte 0
    .2byte 0
    .byte 0
    .byte 0, 0, 0 @ padding

    .4byte Str_86FCE40
    .2byte 0
    .2byte 16
    .byte 14
    .byte 0, 0, 0 @ padding

    .4byte Str_86FCCC4
    .2byte 0
    .2byte 10
    .byte 15
    .byte 0, 0, 0 @ padding

    .4byte NULL
    .2byte 0
    .2byte 0
    .byte 0
    .byte 0, 0, 0 @ padding

    .4byte Str_86FCC70
    .2byte 0
    .2byte 16
    .byte 14
    .byte 0, 0, 0 @ padding

    .4byte Str_86FCCC4
    .2byte 0
    .2byte 10
    .byte 15
    .byte 0, 0, 0 @ padding

    .4byte NULL
    .2byte 0
    .2byte 0
    .byte 0
    .byte 0, 0, 0 @ padding

    .4byte Str_86FCC48
    .2byte 0
    .2byte 16
    .byte 14
    .byte 0, 0, 0 @ padding

    .4byte Str_86FCD00
    .2byte 0
    .2byte 10
    .byte 15
    .byte 0, 0, 0 @ padding

    .4byte NULL
    .2byte 0
    .2byte 0
    .byte 0
    .byte 0, 0, 0 @ padding

    .4byte Str_86FCC34
    .2byte 0
    .2byte 16
    .byte 14
    .byte 0, 0, 0 @ padding

    .4byte Str_86FCC8C
    .2byte 0
    .2byte 10
    .byte 15
    .byte 0, 0, 0 @ padding

    .4byte NULL
    .2byte 0
    .2byte 0
    .byte 0
    .byte 0, 0, 0 @ padding

    .4byte Str_86FCC28
    .2byte 0
    .2byte 24
    .byte 14
    .byte 0, 0, 0 @ padding

    .4byte Str_86FCC00
    .2byte 0
    .2byte 16
    .byte 14
    .byte 0, 0, 0 @ padding

    .4byte Str_86FCBEC
    .2byte 0
    .2byte 10
    .byte 15
    .byte 0, 0, 0 @ padding

    .4byte NULL
    .2byte 0
    .2byte 0
    .byte 0
    .byte 0, 0, 0 @ padding

    .4byte Str_86FCC34
    .2byte 0
    .2byte 16
    .byte 14
    .byte 0, 0, 0 @ padding

    .4byte Str_86FCBD8
    .2byte 0
    .2byte 10
    .byte 15
    .byte 0, 0, 0 @ padding

    .4byte NULL
    .2byte 0
    .2byte 0
    .byte 0
    .byte 0, 0, 0 @ padding

    .4byte Str_86FCBC8
    .2byte 0
    .2byte 16
    .byte 14
    .byte 0, 0, 0 @ padding

    .4byte Str_86FCBB4
    .2byte 0
    .2byte 10
    .byte 15
    .byte 0, 0, 0 @ padding

    .4byte NULL
    .2byte 0
    .2byte 0
    .byte 0
    .byte 0, 0, 0 @ padding

    .4byte Str_86FCB9C
    .2byte 0
    .2byte 16
    .byte 14
    .byte 0, 0, 0 @ padding

    .4byte Str_86FCB8C
    .2byte 0
    .2byte 10
    .byte 15
    .byte 0, 0, 0 @ padding

    .4byte NULL
    .2byte 0
    .2byte 0
    .byte 0
    .byte 0, 0, 0 @ padding

    .4byte Str_86FCD80
    .2byte 0
    .2byte 16
    .byte 14
    .byte 0, 0, 0 @ padding

    .4byte Str_86FCB7C
    .2byte 0
    .2byte 10
    .byte 15
    .byte 0, 0, 0 @ padding

    .4byte NULL
    .2byte 0
    .2byte 0
    .byte 0
    .byte 0, 0, 0 @ padding

    .4byte Str_86FCB5C
    .2byte 0
    .2byte 16
    .byte 14
    .byte 0, 0, 0 @ padding

    .4byte Str_86FCB4C
    .2byte 0
    .2byte 10
    .byte 15
    .byte 0, 0, 0 @ padding

    .4byte NULL
    .2byte 0
    .2byte 0
    .byte 0
    .byte 0, 0, 0 @ padding

    .4byte Str_86FCB34
    .2byte 0
    .2byte 10
    .byte 14
    .byte 0, 0, 0 @ padding

    .4byte Str_86FCB1C
    .2byte 0
    .2byte 16
    .byte 14
    .byte 0, 0, 0 @ padding

    .4byte Str_86FCB08
    .2byte 0
    .2byte 10
    .byte 15
    .byte 0, 0, 0 @ padding

    .4byte NULL
    .2byte 0
    .2byte 0
    .byte 0
    .byte 0, 0, 0 @ padding

    .4byte Str_86FCAF8
    .2byte 0
    .2byte 16
    .byte 14
    .byte 0, 0, 0 @ padding

    .4byte Str_86FCAE8
    .2byte 0
    .2byte 10
    .byte 15
    .byte 0, 0, 0 @ padding

    .4byte NULL
    .2byte 0
    .2byte 0
    .byte 0
    .byte 0, 0, 0 @ padding

    .4byte Str_86FCAD4
    .2byte 0
    .2byte 16
    .byte 14
    .byte 0, 0, 0 @ padding

    .4byte Str_86FCAC4
    .2byte 0
    .2byte 10
    .byte 15
    .byte 0, 0, 0 @ padding

    .4byte NULL
    .2byte 0
    .2byte 0
    .byte 0
    .byte 0, 0, 0 @ padding

    .4byte Str_86FCAA8
    .2byte 0
    .2byte 16
    .byte 14
    .byte 0, 0, 0 @ padding

    .4byte Str_86FCA98
    .2byte 0
    .2byte 10
    .byte 15
    .byte 0, 0, 0 @ padding

    .4byte Str_86FCA88
    .2byte 0
    .2byte 10
    .byte 15
    .byte 0, 0, 0 @ padding

    .4byte NULL
    .2byte 0
    .2byte 0
    .byte 0
    .byte 0, 0, 0 @ padding

    .4byte Str_86FCA7C
    .2byte 0
    .2byte 16
    .byte 14
    .byte 0, 0, 0 @ padding

    .4byte Str_86FCA6C
    .2byte 0
    .2byte 10
    .byte 15
    .byte 0, 0, 0 @ padding

    .4byte NULL
    .2byte 0
    .2byte 0
    .byte 0
    .byte 0, 0, 0 @ padding

    .4byte Str_86FCA4C
    .2byte 0
    .2byte 16
    .byte 14
    .byte 0, 0, 0 @ padding

    .4byte Str_86FCA38
    .2byte 0
    .2byte 10
    .byte 15
    .byte 0, 0, 0 @ padding

    .4byte NULL
    .2byte 0
    .2byte 0
    .byte 0
    .byte 0, 0, 0 @ padding

    .4byte Str_86FCA18
    .2byte 0
    .2byte 10
    .byte 14
    .byte 0, 0, 0 @ padding

    .4byte Str_86FCA08
    .2byte 0
    .2byte 16
    .byte 14
    .byte 0, 0, 0 @ padding

    .4byte Str_86FC9F4
    .2byte 0
    .2byte 10
    .byte 15
    .byte 0, 0, 0 @ padding

    .4byte NULL
    .2byte 0
    .2byte 0
    .byte 0
    .byte 0, 0, 0 @ padding

    .4byte Str_86FC9D8
    .2byte 0
    .2byte 16
    .byte 14
    .byte 0, 0, 0 @ padding

    .4byte Str_86FC9CC
    .2byte 0
    .2byte 10
    .byte 15
    .byte 0, 0, 0 @ padding

    .4byte NULL
    .2byte 0
    .2byte 0
    .byte 0
    .byte 0, 0, 0 @ padding

    .4byte Str_86FC9AC
    .2byte 0
    .2byte 16
    .byte 14
    .byte 0, 0, 0 @ padding

    .4byte Str_86FC99C
    .2byte 0
    .2byte 10
    .byte 15
    .byte 0, 0, 0 @ padding

    .4byte NULL
    .2byte 0
    .2byte 0
    .byte 0
    .byte 0, 0, 0 @ padding

    .4byte Str_86FC990
    .2byte 0
    .2byte 16
    .byte 14
    .byte 0, 0, 0 @ padding

    .4byte Str_86FC984
    .2byte 0
    .2byte 10
    .byte 15
    .byte 0, 0, 0 @ padding

    .4byte Str_86FC96C
    .2byte 0
    .2byte 10
    .byte 15
    .byte 0, 0, 0 @ padding

    .4byte Str_86FC960
    .2byte 0
    .2byte 10
    .byte 15
    .byte 0, 0, 0 @ padding

    .4byte Str_86FC954
    .2byte 0
    .2byte 10
    .byte 15
    .byte 0, 0, 0 @ padding

    .4byte Str_86FC948
    .2byte 0
    .2byte 10
    .byte 15
    .byte 0, 0, 0 @ padding

    .4byte Str_86FC938
    .2byte 0
    .2byte 10
    .byte 15
    .byte 0, 0, 0 @ padding

    .4byte NULL
    .2byte 0
    .2byte 0
    .byte 0
    .byte 0, 0, 0 @ padding

    .4byte Str_86FC924
    .2byte 0
    .2byte 16
    .byte 14
    .byte 0, 0, 0 @ padding

    .4byte Str_86FC910
    .2byte 0
    .2byte 10
    .byte 15
    .byte 0, 0, 0 @ padding

    .4byte Str_86FC8FC
    .2byte 0
    .2byte 10
    .byte 15
    .byte 0, 0, 0 @ padding

    .4byte Str_86FC8E8
    .2byte 0
    .2byte 10
    .byte 15
    .byte 0, 0, 0 @ padding

    .4byte Str_86FC8DC
    .2byte 0
    .2byte 10
    .byte 15
    .byte 0, 0, 0 @ padding

    .4byte Str_86FC8CC
    .2byte 0
    .2byte 10
    .byte 15
    .byte 0, 0, 0 @ padding

    .4byte Str_86FC8C0
    .2byte 0
    .2byte 10
    .byte 15
    .byte 0, 0, 0 @ padding

    .4byte NULL
    .2byte 0
    .2byte 0
    .byte 0
    .byte 0, 0, 0 @ padding

    .4byte Str_86FC8A8
    .2byte 0
    .2byte 16
    .byte 14
    .byte 0, 0, 0 @ padding

    .4byte Str_86FC898
    .2byte 0
    .2byte 10
    .byte 15
    .byte 0, 0, 0 @ padding

    .4byte Str_86FC888
    .2byte 0
    .2byte 10
    .byte 15
    .byte 0, 0, 0 @ padding

    .4byte Str_86FC878
    .2byte 0
    .2byte 10
    .byte 15
    .byte 0, 0, 0 @ padding

    .4byte NULL
    .2byte 0
    .2byte 0
    .byte 0
    .byte 0, 0, 0 @ padding

    .4byte Str_86FC860
    .2byte 0
    .2byte 16
    .byte 14
    .byte 0, 0, 0 @ padding

    .4byte Str_86FC848
    .2byte 0
    .2byte 10
    .byte 15
    .byte 0, 0, 0 @ padding

    .4byte NULL
    .2byte 0
    .2byte 0
    .byte 0
    .byte 0, 0, 0 @ padding

    .4byte Str_86FC830
    .2byte 0
    .2byte 16
    .byte 14
    .byte 0, 0, 0 @ padding

    .4byte Str_86FC820
    .2byte 0
    .2byte 10
    .byte 15
    .byte 0, 0, 0 @ padding

    .4byte Str_86FC80C
    .2byte 0
    .2byte 10
    .byte 15
    .byte 0, 0, 0 @ padding

    .4byte Str_86FC7FC
    .2byte 0
    .2byte 10
    .byte 15
    .byte 0, 0, 0 @ padding

    .4byte NULL
    .2byte 0
    .2byte 0
    .byte 0
    .byte 0, 0, 0 @ padding

    .4byte Str_86FC7E0
    .2byte 0
    .2byte 16
    .byte 14
    .byte 0, 0, 0 @ padding

    .4byte Str_86FC7D0
    .2byte 0
    .2byte 10
    .byte 15
    .byte 0, 0, 0 @ padding

    .4byte Str_86FC7C4
    .2byte 0
    .2byte 10
    .byte 15
    .byte 0, 0, 0 @ padding

    .4byte Str_86FC7B4
    .2byte 0
    .2byte 10
    .byte 15
    .byte 0, 0, 0 @ padding

    .4byte Str_86FC7A0
    .2byte 0
    .2byte 10
    .byte 15
    .byte 0, 0, 0 @ padding

    .4byte NULL
    .2byte 0
    .2byte 0
    .byte 0
    .byte 0, 0, 0 @ padding

    .4byte Str_86FC788
    .2byte 0
    .2byte 16
    .byte 14
    .byte 0, 0, 0 @ padding

    .4byte Str_86FC774
    .2byte 0
    .2byte 10
    .byte 15
    .byte 0, 0, 0 @ padding

    .4byte Str_86FC768
    .2byte 0
    .2byte 10
    .byte 15
    .byte 0, 0, 0 @ padding

    .4byte Str_86FC764
    .2byte 0
    .2byte 10
    .byte 15
    .byte 0, 0, 0 @ padding

    .4byte Str_86FC758
    .2byte 0
    .2byte 10
    .byte 15
    .byte 0, 0, 0 @ padding

    .4byte NULL
    .2byte 0
    .2byte 0
    .byte 0
    .byte 0, 0, 0 @ padding

    .4byte Str_86FC72C
    .2byte 0
    .2byte 16
    .byte 14
    .byte 0, 0, 0 @ padding

    .4byte Str_86FC71C
    .2byte 0
    .2byte 10
    .byte 15
    .byte 0, 0, 0 @ padding

    .4byte Str_86FC708
    .2byte 0
    .2byte 10
    .byte 15
    .byte 0, 0, 0 @ padding

    .4byte NULL
    .2byte 0
    .2byte 0
    .byte 0
    .byte 0, 0, 0 @ padding

    .4byte Str_86FC6E8
    .2byte 0
    .2byte 16
    .byte 14
    .byte 0, 0, 0 @ padding

    .4byte Str_86FC6D8
    .2byte 0
    .2byte 10
    .byte 15
    .byte 0, 0, 0 @ padding

    .4byte Str_86FC6C8
    .2byte 0
    .2byte 10
    .byte 15
    .byte 0, 0, 0 @ padding

    .4byte Str_86FC6B8
    .2byte 0
    .2byte 10
    .byte 15
    .byte 0, 0, 0 @ padding

    .4byte NULL
    .2byte 0
    .2byte 0
    .byte 0
    .byte 0, 0, 0 @ padding

    .4byte Str_86FC6A0
    .2byte 0
    .2byte 16
    .byte 14
    .byte 0, 0, 0 @ padding

    .4byte Str_86FC690
    .2byte 0
    .2byte 10
    .byte 15
    .byte 0, 0, 0 @ padding

    .4byte Str_86FC680
    .2byte 0
    .2byte 10
    .byte 15
    .byte 0, 0, 0 @ padding

    .4byte Str_86FC670
    .2byte 0
    .2byte 10
    .byte 15
    .byte 0, 0, 0 @ padding

    .4byte Str_86FC664
    .2byte 0
    .2byte 10
    .byte 15
    .byte 0, 0, 0 @ padding

    .4byte Str_86FC650
    .2byte 0
    .2byte 10
    .byte 15
    .byte 0, 0, 0 @ padding

    .4byte NULL
    .2byte 0
    .2byte 0
    .byte 0
    .byte 0, 0, 0 @ padding

    .4byte Str_86FC640
    .2byte 0
    .2byte 10
    .byte 15
    .byte 0, 0, 0 @ padding

    .4byte Str_86FC630
    .2byte 0
    .2byte 10
    .byte 15
    .byte 0, 0, 0 @ padding

    .4byte Str_86FC624
    .2byte 0
    .2byte 10
    .byte 15
    .byte 0, 0, 0 @ padding

    .4byte Str_86FC614
    .2byte 0
    .2byte 10
    .byte 15
    .byte 0, 0, 0 @ padding

    .4byte Str_86FC604
    .2byte 0
    .2byte 10
    .byte 15
    .byte 0, 0, 0 @ padding

    .4byte Str_86FC5F8
    .2byte 0
    .2byte 10
    .byte 15
    .byte 0, 0, 0 @ padding

    .4byte Str_86FC5E8
    .2byte 0
    .2byte 10
    .byte 15
    .byte 0, 0, 0 @ padding

    .4byte NULL
    .2byte 0
    .2byte 0
    .byte 0
    .byte 0, 0, 0 @ padding

    .4byte Str_86FC5D4
    .2byte 0
    .2byte 16
    .byte 14
    .byte 0, 0, 0 @ padding

    .4byte Str_86FC5B8
    .2byte 0
    .2byte 10
    .byte 15
    .byte 0, 0, 0 @ padding

    .4byte NULL
    .2byte 0
    .2byte 0
    .byte 0
    .byte 0, 0, 0 @ padding

    .4byte Str_86FC5A8
    .2byte 0
    .2byte 16
    .byte 14
    .byte 0, 0, 0 @ padding

    .4byte Str_86FC594
    .2byte 0
    .2byte 10
    .byte 15
    .byte 0, 0, 0 @ padding

    .4byte NULL
    .2byte 0
    .2byte 0
    .byte 0
    .byte 0, 0, 0 @ padding

    .4byte NULL
    .2byte 1
    .2byte 0
    .byte 0
    .byte 0, 0, 0 @ padding


