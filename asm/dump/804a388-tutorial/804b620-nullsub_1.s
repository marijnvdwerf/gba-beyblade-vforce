	.include "asm/common.inc"

	thumb_func_start nullsub_1
nullsub_1:
	bx	lr
	thumb_func_end nullsub_1

.align 2, 0 @ Don't pad with nop.
