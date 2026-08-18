	.include "asm/common.inc"

	thumb_func_start sub_8050FF0
sub_8050FF0:
	push	{r4, lr}
	add	r4, r0, #0
	ldr	r2, [r4, #0x28]
	mov	r3, #0x0
	b	.L8051000
.L8050FFA:
	str	r1, [r2, #0x10]
	add	r2, r2, #0x1c
	add	r3, r3, #0x1
.L8051000:
	ldr	r0, [r4]
	cmp	r3, r0
	blt	.L8050FFA	@cond_branch
	pop	{r4}
	pop	{r0}
	bx	r0
	thumb_func_end sub_8050FF0

.align 2, 0 @ Don't pad with nop.
