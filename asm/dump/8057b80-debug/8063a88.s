	.include "asm/common.inc"

	thumb_func_start sub_8063A88
sub_8063A88:
	ldr	r0, .L1
	ldr	r0, [r0]
	bx	lr
.L2:
	.align	2, 0
.L1:
	.4byte	0x3005e98
	thumb_func_end sub_8063A88

.align 2, 0 @ Don't pad with nop.
