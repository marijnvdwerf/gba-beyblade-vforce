	.include "asm/common.inc"

	thumb_func_start sub_8049258
sub_8049258:
	ldr	r0, .L1
	ldr	r0, [r0, #0x10]
	bx	lr
.L2:
	.align	2, 0
.L1:
	.4byte	0x3000650
	thumb_func_end sub_8049258

.align 2, 0 @ Don't pad with nop.
