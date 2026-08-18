	.include "asm/common.inc"

	thumb_func_start sub_8063A88
sub_8063A88:
	ldr	r0, .L8063A90
	ldr	r0, [r0]
	bx	lr
.L8063A8E:
	.align	2, 0
.L8063A90:
	.4byte	0x3005e98
	thumb_func_end sub_8063A88

.align 2, 0 @ Don't pad with nop.
