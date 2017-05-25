	.include "asm/common.inc"

	thumb_func_start sub_805ABB4
sub_805ABB4:
	ldr	r0, .L1
	ldrh	r0, [r0]
	bx	lr
.L2:
	.align	2, 0
.L1:
	.4byte	0x3005db8
	thumb_func_end sub_805ABB4

.align 2, 0 @ Don't pad with nop.
