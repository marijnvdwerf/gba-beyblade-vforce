	.include "asm/common.inc"

	thumb_func_start sub_805100C
sub_805100C:
	push	{r4, lr}
	add	r4, r0, #0
	ldr	r2, [r4, #0x28]
	mov	r3, #0x0
	b	.L1
.L2:
	str	r1, [r2, #0x14]
	add	r2, r2, #0x1c
	add	r3, r3, #0x1
.L1:
	ldr	r0, [r4]
	cmp	r3, r0
	blt	.L2	@cond_branch
	pop	{r4}
	pop	{r0}
	bx	r0
	thumb_func_end sub_805100C

.align 2, 0 @ Don't pad with nop.
