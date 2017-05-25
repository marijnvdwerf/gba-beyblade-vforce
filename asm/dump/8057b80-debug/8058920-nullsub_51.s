	.include "asm/common.inc"

	thumb_func_start nullsub_51
nullsub_51:
	bx	lr
	thumb_func_end nullsub_51

.align 2, 0 @ Don't pad with nop.
