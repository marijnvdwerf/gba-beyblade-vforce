	.include "asm/common.inc"

	thumb_func_start sub_8055C30
sub_8055C30:
	push	{r4, r5, lr}
	add	r4, r0, #0
	ldr	r0, [r4]
	bl	sub_8060A94
	mov	r5, #0x0
	str	r5, [r4]
	ldr	r0, [r4, #0x4]
	bl	sub_8060A94
	str	r5, [r4, #0x4]
	pop	{r4, r5}
	pop	{r0}
	bx	r0
	thumb_func_end sub_8055C30

.align 2, 0 @ Don't pad with nop.
