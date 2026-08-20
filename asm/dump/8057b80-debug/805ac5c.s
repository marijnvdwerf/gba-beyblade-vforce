	.include "asm/common.inc"

	thumb_func_start sub_805AC5C
sub_805AC5C:
	ldr	r1, .L805AC64
	str	r0, [r1]
	bx	lr
.L805AC62:
	.align	2, 0
.L805AC64:
	.4byte	_unk3005DC0
	thumb_func_end sub_805AC5C

.align 2, 0 @ Don't pad with nop.
