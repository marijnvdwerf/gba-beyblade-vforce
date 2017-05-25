	.include "asm/common.inc"

	thumb_func_start sub_8048FCC
sub_8048FCC:
	ldr	r0, .L1
	bx	lr
.L2:
	.align	2, 0
.L1:
	.4byte	0x3000650
	thumb_func_end sub_8048FCC

.align 2, 0 @ Don't pad with nop.
