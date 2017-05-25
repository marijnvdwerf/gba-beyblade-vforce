	.include "asm/common.inc"

	thumb_func_start nullsub_24
nullsub_24:
	bx	lr
	thumb_func_end nullsub_24

.align 2, 0 @ Don't pad with nop.
