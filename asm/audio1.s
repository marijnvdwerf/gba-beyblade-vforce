    .include "asm/common.inc"

	.section .rodata

    .align 2, 0
BgmA_segments:
    .4byte Bgm_807DC80

    .align 2, 0
BgmA_order:
    .2byte  0
    .2byte -1


    .align 2, 0
BgmB_segments:
    .4byte Bgm_80BE210

    .align 2, 0
BgmB_order:
    .2byte  0
    .2byte -1

    .align 2, 0
Bgm0_segments:
    .4byte Bgm_810B9A0
    .4byte Bgm_810CAB0
    .4byte Bgm_810DBC0
    .4byte Bgm_810ECD0
    .4byte Bgm_810FDE0
    .4byte Bgm_8111FF0
    .4byte Bgm_8113980
    .4byte Bgm_8115310
    .4byte Bgm_8115BA0
    .4byte Bgm_8117DB0
    .4byte Bgm_8118EC0
    .4byte Bgm_81205D0
    .4byte Bgm_81216E0
    .4byte Bgm_8125AF0
    .4byte Bgm_8126C00
    .4byte Bgm_8129F10

    .align 2, 0
Bgm0_order:
    .2byte  0,  1,  2,  1,  0,  1,  2,  3
    .2byte  4,  7,  5,  4,  7,  6,  4,  8
    .2byte  4,  7,  6,  9, 10, 11, 10,  4
    .2byte  7,  5,  4,  7,  6,  4,  8,  4
    .2byte  7,  6, 12, 13, 14, 12, 13, 14
    .2byte 12, 13, 14, 12, 13, 15
    .2byte -1


    .align 2, 0
Bgm1_segments:
    .4byte Bgm_812D220
    .4byte Bgm_812F5D4
    .4byte Bgm_8131988
    .4byte Bgm_8138D70
    .4byte Bgm_813A83C
    .4byte Bgm_813C308
    .4byte Bgm_813E6BC
    .4byte Bgm_8140A70
    .4byte Bgm_8141C54
    .4byte Bgm_8142E38
    .4byte Bgm_814401C
    .4byte Bgm_814B404
    .4byte Bgm_814CED0
    .4byte Bgm_814E99C
    .4byte Bgm_8150D50
    .4byte Bgm_8153104
    .4byte Bgm_81554B8
    .4byte Bgm_8159C10
    .4byte Bgm_8162AB4

    .align 2, 0
Bgm1_order:
    .2byte  0,  0,  0,  1,  2,  3,  2,  3
    .2byte  2,  4,  5,  6,  6,  7,  8,  5
    .2byte  6,  6,  7,  8,  5,  6,  6,  7
    .2byte  8,  5,  6,  6,  7,  9, 10, 11
    .2byte 10, 12,  5,  6,  6,  7,  8,  5
    .2byte  6,  6,  7,  9, 13, 14, 15, 14
    .2byte 13, 14, 15, 14, 16, 17, 17, 16
    .2byte 18
    .2byte -1


    .align 2, 0
Bgm2_segments:
    .4byte Bgm_8164E68
    .4byte Bgm_8166DCC
    .4byte Bgm_8167D88
    .4byte Bgm_816C414
    .4byte Bgm_816EB4C
    .4byte Bgm_816FB08
    .4byte Bgm_8172240
    .4byte Bgm_81760F4
    .4byte Bgm_8179FA8
    .4byte Bgm_817DE5C
    .4byte Bgm_8185BB8
    .4byte Bgm_8187B1C
    .4byte Bgm_8188AD8
    .4byte Bgm_8189A94
    .4byte Bgm_818AA50
    .4byte Bgm_818C9B4
    .4byte Bgm_818E144
    .4byte Bgm_819087C
    .4byte Bgm_8191064
    .align 2, 0

    .align 2, 0
Bgm2_order:
    .2byte  0,  1,  2,  3,  4,  2,  5,  6
    .2byte  7,  6,  8,  1,  2,  3,  4,  2
    .2byte  5,  9, 10, 11, 12, 11, 12, 11
    .2byte 13, 14, 15, 16, 15, 17, 14, 15
    .2byte 16, 15, 17, 18
    .2byte -1


    .align 2, 0
Bgm3_segments:
    .4byte Bgm_8192020
    .4byte Bgm_8193058
    .4byte Bgm_81968F0
    .4byte Bgm_8197114
    .4byte Bgm_8197938
    .4byte Bgm_819B9E4
    .4byte Bgm_81A12C8
    .4byte Bgm_81A3B38
    .4byte Bgm_81A63A8
    .4byte Bgm_81A8408
    .4byte Bgm_81AA468
    .4byte Bgm_81AC4C8
    .4byte Bgm_81B0574

    .align 2, 0
Bgm3_order:
    .2byte  0,  1,  2,  1,  3,  1,  2,  1
    .2byte  3,  4,  4,  4,  4,  5,  6,  5
    .2byte  7,  4,  4,  4,  4,  8,  9, 10
    .2byte  9,  8,  9, 11, 12
    .2byte -1


    .align 2, 0
Bgm4_segments:
    .4byte Bgm_81B15AC
    .4byte Bgm_81B847C
    .4byte Bgm_81BA978
    .4byte Bgm_81BC538
    .4byte Bgm_81C4FB8
    .4byte Bgm_81C5904
    .4byte Bgm_81C6B8C
    .4byte Bgm_81C7E14
    .4byte Bgm_81CA310
    .4byte Bgm_81CB598
    .4byte Bgm_81CC820
    .4byte Bgm_81CED1C
    .4byte Bgm_81CFFA4
    .4byte Bgm_81D122C
    .4byte Bgm_81D24B4
    .4byte Bgm_81D373C
    .4byte Bgm_81D49C4
    .4byte Bgm_81D5C4C
    .4byte Bgm_81D6598
    .4byte Bgm_81DDDA0
    .4byte Bgm_81DF960
    .4byte Bgm_81E0BE8
    .4byte Bgm_81E1E70
    .4byte Bgm_81E30F8
    .4byte Bgm_81E55F4
    .4byte Bgm_81E687C
    .4byte Bgm_81E7B04
    .4byte Bgm_81EA000
    .4byte Bgm_81EC4FC
    .4byte Bgm_81ED784
    .4byte Bgm_81EEA0C
    .4byte Bgm_81EFC94

    .align 2, 0
Bgm4_order:
    .2byte  0,  1,  0,  2,  3,  4,  3,  5
    .2byte  6,  7,  8,  9, 10, 11,  6,  7
    .2byte  8,  9, 10, 12, 13,  7, 14, 15
    .2byte 10, 12, 13,  7, 14, 15, 10, 16
    .2byte 17, 18, 19, 18, 20, 21, 22, 22
    .2byte 23, 24, 24, 25, 21, 22, 22, 23
    .2byte 24, 24, 25, 21, 22, 22, 23, 24
    .2byte 24, 25, 26, 27, 27, 27, 28, 29
    .2byte 28, 29, 28, 29, 28, 30, 13,  7
    .2byte 14, 15, 10, 12, 13,  7, 14, 15
    .2byte 10, 16, 17, 18, 19, 18, 20, 31
    .2byte -1


    .align 2, 0
Bgm5_segments:
    .4byte Bgm_81F2190
    .4byte Bgm_81F9EEC
    .4byte Bgm_81FBE50
    .4byte Bgm_81FD5E0
    .4byte Bgm_81FED70
    .4byte Bgm_8200CD4
    .4byte Bgm_8208A30
    .4byte Bgm_820C8E4

    .align 2, 0
Bgm5_order:
    .2byte  0,  0,  1,  2,  1,  2,  1,  2
    .2byte  1,  3,  1,  2,  1,  2,  1,  2
    .2byte  1,  2,  4,  5,  5,  6,  6,  6
    .2byte  6,  0,  0,  7,  7,  1,  2,  1
    .2byte  2,  1,  2,  1,  3,  1,  2,  1
    .2byte  2,  1,  2,  1,  2,  4,  5,  5
    .2byte -1


    .align 2, 0
Bgm6_segments:
    .4byte Bgm_8214640
    .4byte Bgm_821AAD0

    .align 2, 0
Bgm6_order:
    .2byte  0,  1,  1,  1,  1,  1,  1,  1
    .2byte  1,  1,  1,  1,  1,  1,  1,  1
    .2byte  1,  1,  1,  1,  1,  1,  1,  1
    .2byte  1,  1,  1,  1,  1,  1,  1,  1
    .2byte  1,  1,  1,  1,  1,  1,  1,  1
    .2byte  1,  1,  1,  1,  1,  1,  1,  1
    .2byte  1,  1,  1,  1,  1,  1,  1,  1
    .2byte  1,  1,  1,  1,  1,  1,  1,  1
    .2byte  1,  1,  1,  1,  1,  1,  1,  1
    .2byte  1,  1,  1,  1,  1,  1,  1,  1
    .2byte  1,  1,  1,  1,  1,  1,  1,  1
    .2byte  1,  1,  1,  1,  1,  1,  1,  1
    .2byte  1,  1,  1,  1,  1,  1,  1,  1
    .2byte  1,  1,  1,  1,  1,  1,  1,  1
    .2byte  1,  1,  1,  1,  1,  1,  1,  1
    .2byte  1,  1,  1,  1,  1,  1,  1,  1
    .2byte  1,  1,  1,  1,  1,  1,  1,  1
    .2byte  1,  1,  1,  1,  1,  1,  1,  1
    .2byte  1,  1,  1,  1,  1,  1,  1,  1
    .2byte  1,  1,  1,  1,  1,  1,  1,  1
    .2byte  1,  1,  1,  1,  1,  1,  1,  1
    .2byte  1,  1,  1,  1,  1,  1,  1,  1
    .2byte  1,  1,  1,  1,  1,  1,  1,  1
    .2byte  1,  1,  1,  1,  1,  1,  1,  1
    .2byte  1,  1,  1,  1,  1,  1,  1,  1
    .2byte  1,  1,  1,  1,  1,  1,  1,  1
    .2byte  1,  1,  1,  1,  1,  1,  1,  1
    .2byte  1,  1,  1,  1,  1,  1,  1,  1
    .2byte  1,  1,  1,  1,  1,  1,  1,  1
    .2byte  1,  1,  1,  1,  1,  1,  1,  1
    .2byte  1,  1,  1,  1,  1,  1,  1,  1
    .2byte  1,  1,  1,  1,  1,  1,  1,  1
    .2byte  1,  1,  1,  1,  1,  1,  1,  1
    .2byte  1,  1,  1,  1,  1,  1,  1,  1
    .2byte  1,  1,  1,  1,  1,  1,  1,  1
    .2byte  1,  1,  1,  1,  1,  1,  1,  1
    .2byte  1,  1,  1,  1,  1,  1,  1,  1
    .2byte  1,  1,  1,  1,  1,  1,  1,  1
    .2byte  1,  1,  1,  1,  1,  1,  1,  1
    .2byte  1,  1,  1,  1,  1,  1,  1,  1
    .2byte  1,  1,  1,  1,  1,  1,  1,  1
    .2byte  1,  1,  1,  1,  1,  1,  1,  1
    .2byte  1,  1,  1,  1,  1,  1,  1,  1
    .2byte  1,  1,  1,  1,  1,  1,  1,  1
    .2byte  1,  1,  1,  1,  1,  1,  1,  1
    .2byte  1,  1,  1,  1,  1,  1,  1,  1
    .2byte  1,  1,  1,  1,  1,  1,  1,  1
    .2byte  1,  1,  1,  1,  1,  1,  1,  1
    .2byte  1,  1,  1,  1,  1,  1,  1,  1
    .2byte  1,  1,  1,  1,  1,  1,  1,  1
    .2byte  1,  1,  1,  1,  1,  1,  1,  1
    .2byte  1,  1,  1,  1,  1,  1,  1,  1
    .2byte  1,  1,  1,  1,  1,  1,  1,  1
    .2byte  1,  1,  1,  1,  1,  1,  1,  1
    .2byte  1,  1,  1,  1,  1,  1,  1,  1
    .2byte  1,  1,  1,  1,  1,  1,  1,  1
    .2byte  1,  1,  1,  1,  1,  1,  1,  1
    .2byte  1,  1,  1,  1,  1,  1,  1,  1
    .2byte  1,  1,  1,  1,  1,  1,  1,  1
    .2byte  1,  1,  1,  1,  1,  1,  1,  1
    .2byte  1,  1,  1,  1,  1,  1,  1,  1
    .2byte  1,  1,  1,  1,  1,  1,  1,  1
    .2byte  1,  1,  1,  1,  1,  1,  1,  1
    .2byte  1,  1,  1,  1,  1,  1,  1,  1
    .2byte  1,  1,  1,  1,  1,  1,  1,  1
    .2byte  1,  1,  1,  1,  1,  1,  1,  1
    .2byte  1,  1,  1,  1,  1,  1,  1,  1
    .2byte  1,  1,  1,  1,  1
    .2byte -1

global _807561C
    .4byte Bgm0_segments, Bgm0_order
    .4byte Bgm1_segments, Bgm1_order
    .4byte Bgm2_segments, Bgm2_order
    .4byte Bgm3_segments, Bgm3_order
    .4byte Bgm4_segments, Bgm4_order
    .4byte Bgm5_segments, Bgm5_order
    .4byte Bgm6_segments, Bgm6_order
    .4byte BgmA_segments, BgmA_order
    .4byte BgmB_segments, BgmB_order
    .4byte BgmA_segments, BgmA_order
    .4byte BgmB_segments, BgmB_order
    .4byte BgmA_segments, BgmA_order
    .4byte BgmB_segments, BgmB_order
    .4byte BgmA_segments, BgmA_order
    .4byte BgmB_segments, BgmB_order
    .4byte BgmA_segments, BgmA_order
    .4byte BgmB_segments, BgmB_order
    .4byte BgmA_segments, BgmA_order
    .4byte BgmB_segments, BgmB_order
    .4byte BgmA_segments, BgmA_order
    .4byte BgmB_segments, BgmB_order
    .4byte BgmA_segments, BgmA_order
    .4byte BgmB_segments, BgmB_order
    .4byte BgmA_segments, BgmA_order
    .4byte BgmB_segments, BgmB_order
    .4byte BgmA_segments, BgmA_order
    .4byte BgmB_segments, BgmB_order
    .4byte BgmA_segments, BgmA_order
    .4byte BgmB_segments, BgmB_order
    .4byte BgmA_segments, BgmA_order
    .4byte BgmB_segments, BgmB_order
    .4byte BgmA_segments, BgmA_order
    .4byte BgmB_segments, BgmB_order
    .4byte BgmA_segments, BgmA_order
