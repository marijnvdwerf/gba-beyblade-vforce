	.include "asm/common.inc"

	thumb_func_start printf
printf:
	push	{r0, r1, r2, r3}
	add	sp, sp, #0x10
	bx	lr
	thumb_func_end printf

.align 2, 0 @ Don't pad with nop.
