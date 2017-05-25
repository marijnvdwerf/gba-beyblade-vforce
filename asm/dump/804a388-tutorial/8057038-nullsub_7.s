	.include "asm/common.inc"

	thumb_func_start nullsub_7
nullsub_7:
	bx	lr
	thumb_func_end nullsub_7

.align 2, 0 @ Don't pad with nop.
