	.include "asm/common.inc"

	thumb_func_start sub_8063A7C
sub_8063A7C:
	ldr	r1, .L1
	str	r0, [r1]
	bx	lr
.L2:
	.align	2, 0
.L1:
	.4byte	0x3005e98
	thumb_func_end sub_8063A7C

.align 2, 0 @ Don't pad with nop.
