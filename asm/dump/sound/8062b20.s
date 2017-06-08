	.include "asm/common.inc"

	thumb_func_start sub_8062B20
sub_8062B20:
	ldr	r1, _1
	str	r0, [r1]
	bx	lr
_2:
	.align	2, 0
_1:
	.word	_unk3005E14
	thumb_func_end sub_8062B20

.align 2, 0 @ Don't pad with nop.
