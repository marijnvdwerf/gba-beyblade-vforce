	.include "asm/common.inc"

	thumb_func_start printf_2
printf_2:
	push	{r0, r1, r2, r3}
	add	sp, sp, #0x10
	bx	lr
	thumb_func_end printf_2

.align 2, 0 @ Don't pad with nop.
