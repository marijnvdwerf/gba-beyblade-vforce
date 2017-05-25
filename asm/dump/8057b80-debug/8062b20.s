	.include "asm/common.inc"

	thumb_func_start sub_8062B20
sub_8062B20:
	ldr	r1, .L1
	str	r0, [r1]
	bx	lr
.L2:
	.align	2, 0
.L1:
	.4byte	0x3005e14
	thumb_func_end sub_8062B20

.align 2, 0 @ Don't pad with nop.
