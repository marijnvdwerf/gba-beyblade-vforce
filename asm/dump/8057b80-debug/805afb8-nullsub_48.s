	.include "asm/common.inc"

	thumb_func_start nullsub_48
nullsub_48:
	bx	lr
	thumb_func_end nullsub_48

.align 2, 0 @ Don't pad with nop.
