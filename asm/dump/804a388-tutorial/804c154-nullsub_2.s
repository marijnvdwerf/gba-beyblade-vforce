	.include "asm/common.inc"

	thumb_func_start nullsub_2
nullsub_2:
	bx	lr
	thumb_func_end nullsub_2

.align 2, 0 @ Don't pad with nop.
