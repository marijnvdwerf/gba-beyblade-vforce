	.include "asm/common.inc"

	thumb_func_start nullsub_5
nullsub_5:
	bx	lr
	thumb_func_end nullsub_5

.align 2, 0 @ Don't pad with nop.
