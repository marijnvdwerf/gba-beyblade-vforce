	.include "asm/common.inc"

	thumb_func_start nullsub_3
nullsub_3:
	bx	lr
	thumb_func_end nullsub_3

.align 2, 0 @ Don't pad with nop.
