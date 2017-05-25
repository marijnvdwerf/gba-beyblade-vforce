	.include "asm/common.inc"

	thumb_func_start nullsub_4
nullsub_4:
	bx	lr
	thumb_func_end nullsub_4

.align 2, 0 @ Don't pad with nop.
