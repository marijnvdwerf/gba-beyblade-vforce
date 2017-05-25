	.include "asm/common.inc"

	thumb_func_start sub_8063A94
sub_8063A94:
	ldr	r1, .L1
	add	r0, r0, r1
	ldrb	r0, [r0]
	bx	lr
.L2:
	.align	2, 0
.L1:
	.4byte	0x3005e80
	thumb_func_end sub_8063A94

.align 2, 0 @ Don't pad with nop.
