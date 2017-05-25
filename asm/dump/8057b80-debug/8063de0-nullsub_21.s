	.include "asm/common.inc"

	thumb_func_start nullsub_21
nullsub_21:
	bx	lr
	thumb_func_end nullsub_21

.align 2, 0 @ Don't pad with nop.
