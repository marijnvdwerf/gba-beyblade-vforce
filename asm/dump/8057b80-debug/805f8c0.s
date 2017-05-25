	.include "asm/common.inc"

	thumb_func_start sub_805F8C0
sub_805F8C0:
	push	{lr}
	add	r1, r0, #0
	add	r1, r1, #0x42
	ldrh	r2, [r1]
	add	r1, r2, #0
	bl	sub_805F784
	pop	{r0}
	bx	r0
	thumb_func_end sub_805F8C0

.align 2, 0 @ Don't pad with nop.
