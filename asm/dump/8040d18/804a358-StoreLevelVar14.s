	.include "asm/common.inc"

	thumb_func_start StoreLevelVar14
StoreLevelVar14:
	ldr	r1, .L1
	str	r0, [r1]
	bx	lr
.L2:
	.align	2, 0
.L1:
	.4byte	0x3000c00
	thumb_func_end StoreLevelVar14

.align 2, 0 @ Don't pad with nop.
