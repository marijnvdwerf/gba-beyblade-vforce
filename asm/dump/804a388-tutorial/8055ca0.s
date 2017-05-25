	.include "asm/common.inc"

	thumb_func_start sub_8055CA0
sub_8055CA0:
	push	{r4, lr}
	add	r4, r0, #0
	ldr	r0, [r4]
	cmp	r0, #0
	beq	.L1	@cond_branch
	bl	deallocateBlock
	mov	r0, #0x0
	str	r0, [r4]
.L1:
	pop	{r4}
	pop	{r0}
	bx	r0
	thumb_func_end sub_8055CA0

.align 2, 0 @ Don't pad with nop.
