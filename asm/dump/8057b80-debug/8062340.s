	.include "asm/common.inc"

	thumb_func_start sub_8062340
sub_8062340:
	ldr	r0, .L1
	ldrh	r0, [r0]
	bx	lr
.L2:
	.align	2, 0
.L1:
	.4byte	0x3000da0
	thumb_func_end sub_8062340

.align 2, 0 @ Don't pad with nop.
