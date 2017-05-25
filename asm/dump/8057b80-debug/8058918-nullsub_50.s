	.include "asm/common.inc"

	thumb_func_start nullsub_50
nullsub_50:
	bx	lr
	thumb_func_end nullsub_50

.align 2, 0 @ Don't pad with nop.
