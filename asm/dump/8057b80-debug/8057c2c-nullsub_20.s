	.include "asm/common.inc"

	thumb_func_start nullsub_20
nullsub_20:
	bx	lr
	thumb_func_end nullsub_20

.align 2, 0 @ Don't pad with nop.
