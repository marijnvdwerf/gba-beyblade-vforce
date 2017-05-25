	.include "asm/common.inc"

	thumb_func_start deallocate_80637CC
deallocate_80637CC:
	push	{r4, lr}
	add	r4, r0, #0
	ldr	r0, [r4, #0x10]
	cmp	r0, #0
	beq	.L1	@cond_branch
	bl	deallocateBlock
	mov	r0, #0x0
	str	r0, [r4, #0x10]
.L1:
	pop	{r4}
	pop	{r0}
	bx	r0
	thumb_func_end deallocate_80637CC

.align 2, 0 @ Don't pad with nop.
