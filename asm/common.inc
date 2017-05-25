    .set NULL, 0

	.set DISPCNT     , 0x4000000
	.set DISPSTAT    , 0x4000004
	.set VCOUNT      , 0x4000006
	.set BG0CNT      , 0x4000008
	.set BG1CNT      , 0x400000A
	.set BG2CNT      , 0x400000C
	.set BG3CNT      , 0x400000E
	.set BG_0_HOFS   , 0x4000010
	.set BG_0_VOFS   , 0x4000012
	.set BG_1_HOFS   , 0x4000014
	.set BG_1_VOFS   , 0x4000016
	.set BG_2_HOFS   , 0x4000018
	.set BG_2_VOFS   , 0x400001A
	.set BG_3_HOFS   , 0x400001C
	.set BG_3_VOFS   , 0x400001E
	.set BG2PA       , 0x4000020
	.set BG2PB       , 0x4000022
	.set BG2PC       , 0x4000024
	.set BG2PD       , 0x4000026
	.set BG2X        , 0x4000028
	.set BG2Y        , 0x400002C
	.set BG3PA       , 0x4000030
	.set BG3PB       , 0x4000032
	.set BG3PC       , 0x4000034
	.set BG3PD       , 0x4000036
	.set BG3X        , 0x4000038
	.set BG3Y        , 0x400003C
	.set WIN0H       , 0x4000040
	.set WIN1H       , 0x4000042
	.set WIN0V       , 0x4000044
	.set WIN1V       , 0x4000046
	.set WININ       , 0x4000048
	.set WINOUT      , 0x400004A
	.set BLDCNT      , 0x4000050
	.set BLDALPHA    , 0x4000052
	.set BLDY        , 0x4000054
	.set SOUNDCNT_H  , 0x4000082
	.set SOUNDCNT_X  , 0x4000084
	.set FIFO_A      , 0x40000A0
	.set DMA1SAD     , 0x40000BC
	.set DMA1DAD     , 0x40000C0
	.set DMA1CNT     , 0x40000C4
	.set DMA3SAD     , 0x40000D4
	.set DMA3DAD     , 0x40000D8
	.set DMA3CNT     , 0x40000DC
	.set TM0CNT_L    , 0x4000100
	.set TM1CNT_L    , 0x4000104
	.set TM2CNT_L    , 0x4000108
	.set TM3CNT_L    , 0x400010E
	.set SIOMULTI0   , 0x4000120
	.set SIOMULTI1   , 0x4000122
	.set SIOMULTI2   , 0x4000124
	.set SIOMULTI3   , 0x4000126
	.set SIOCNT      , 0x4000128
	.set SIOMLT_SEND , 0x400012A
	.set KEYINPUT    , 0x4000130
	.set RCNT        , 0x4000134
	.set REG_IE      , 0x4000200
	.set REG_IF      , 0x4000202
	.set WAITCNT     , 0x4000204
	.set IME         , 0x4000208
	.set VRAM    , 0x6000000
    .set VRAM_OBJ, 0x6010000
    .set OAM     , 0x7000000

	.macro arm_func_start name
	.align 2, 0
	.global \name
	.arm
	.type \name, function
	.endm

	.macro arm_func_end name
	.size \name, .-\name
	.endm

	.macro thumb_func_start name
	.align 2, 0
	.global \name
	.thumb
	.thumb_func
	.type \name, function
	.endm

	.macro non_word_aligned_thumb_func_start name
	.global \name
	.thumb
	.thumb_func
	.type \name, function
	.endm

	.macro thumb_func_end name
	.size \name, .-\name
	.endm

	.macro _linedata type, name, size
	.2byte 8 + \size
	.2byte \type
	.2byte \name
	.2byte 0 @ pad
	.endm

	.macro _linedata_32 type, name, value
	_linedata \type, \name, 4
    .4byte \value
	.endm

	.macro _linedata_16_16 type, name, value1, value2
	_linedata \type, \name, (2*2)
    .2byte \value1
    .2byte \value2
	.endm

	.macro _linedata_32_32 type, name, value1, value2
	_linedata \type, \name, (4*2)
    .4byte \value1
    .4byte \value2
	.endm

	.macro _linedata_32_32_32 type, name, value1, value2, value3
	_linedata \type, \name, (4*3)
    .4byte \value1
    .4byte \value2
    .4byte \value3
	.endm

	.macro linedata_1 name, value
	_linedata_32 1 \name, \value
	.endm

	.macro linedata_2 name, value
	_linedata_32 2 \name, \value
	.endm

	.macro linedata_3 name, value
	_linedata_32 3 \name, \value
	.endm

	.macro linedata_4 name, value1, value2, value3
	_linedata_32_32_32 4, \name, \value1, \value2, \value3
	.endm

	.macro linedata_5 name, value1, value2, value3
	_linedata_32_32_32 5 \name, \value1, \value2, \value3
	.endm

	.macro linedata_6 name
	_linedata 6, \name, 0
	.endm

	.macro linedata_7 name, value1, value2
	_linedata_16_16 7 \name, \value1, \value2
	.endm

	.macro linedata_8 name, value1, value2
	_linedata_16_16 8 \name, \value1, \value2
	.endm

	.macro linedata_11 name, b1, b2, b3, b4
	_linedata 11, \name, 4
	.byte \b1, \b2, \b3, \b4
	.endm

	.macro linedata_10 name, value1, value2
	_linedata_32_32 10 \name, \value1, \value2
	.endm

	.macro linedata_12 name, value1, value2, value3
	_linedata_32_32_32 12 \name, \value1, \value2, \value3
	.endm

	.macro linedata_13 name, b1, b2, b3, b4, b5, b6, b7, b8
	_linedata 13, \name, 8
	.byte \b1, \b2, \b3, \b4, \b5, \b6, \b7, \b8
	.endm

	.macro linedata_18 name
	_linedata 18, \name, 0
	.endm

	.macro global label
	.global \label
	\label:
	.endm

	.macro geometry_header points, splines, lines
	header:
    .4byte \points
    .4byte \splines
    .4byte \lines
    .4byte 0 @pad
    .4byte points-header
    .4byte splines-header
    .4byte lines-header
    .4byte 0 @pad
    .endm

	.macro geometry_point x, y, z
	.4byte \x
	.4byte \y
	.4byte \z
	.4byte 0 @ pad
	.endm

	.macro geometry_line from, to
	.4byte \from
	.4byte \to
	.endm
