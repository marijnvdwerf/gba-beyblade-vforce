	.include "asm/common.inc"

	thumb_func_start sub_805AAE0
sub_805AAE0:
	ldr	r1, .L1
	mov	r0, #0x0
	strh	r0, [r1]
	bx	lr
.L2:
	.align	2, 0
.L1:
	.4byte	0x3005ca4
	thumb_func_end sub_805AAE0

.align 2, 0 @ Don't pad with nop.
