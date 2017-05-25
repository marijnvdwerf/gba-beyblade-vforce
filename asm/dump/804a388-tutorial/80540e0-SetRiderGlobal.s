	.include "asm/common.inc"

	thumb_func_start SetRiderGlobal
SetRiderGlobal:
	ldr	r1, .L1
	str	r0, [r1]
	bx	lr
.L2:
	.align	2, 0
.L1:
	.4byte	0x3000c10
	thumb_func_end SetRiderGlobal

.align 2, 0 @ Don't pad with nop.
