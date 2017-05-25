	.include "asm/common.inc"

	thumb_func_start sub_805AC5C
sub_805AC5C:
	ldr	r1, .L1
	str	r0, [r1]
	bx	lr
.L2:
	.align	2, 0
.L1:
	.4byte	0x3005dc0
	thumb_func_end sub_805AC5C

.align 2, 0 @ Don't pad with nop.
