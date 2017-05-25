	.include "asm/common.inc"

	thumb_func_start sub_804ABE4
sub_804ABE4:
	push	{r4, lr}
	add	r4, r0, #0
	ldr	r0, [r4, #0xc]
	cmp	r0, #0
	beq	.L1	@cond_branch
	bl	deallocateBlock
.L1:
	mov	r0, #0x0
	str	r0, [r4, #0xc]
	pop	{r4}
	pop	{r0}
	bx	r0
	thumb_func_end sub_804ABE4

.align 2, 0 @ Don't pad with nop.
