	.include "asm/common.inc"

	thumb_func_start sub_805F9AC
sub_805F9AC:
	push	{r4, lr}
	add	r4, r0, #0
	ldr	r0, [r4, #0xc]
	cmp	r0, #0
	beq	.L805F9BA	@cond_branch
	bl	deallocateBlock
.L805F9BA:
	ldr	r0, [r4, #0x5c]
	cmp	r0, #0
	beq	.L805F9C4	@cond_branch
	bl	deallocateBlock
.L805F9C4:
	mov	r0, #0x0
	str	r0, [r4, #0xc]
	str	r0, [r4, #0x10]
	str	r0, [r4, #0x5c]
	pop	{r4}
	pop	{r0}
	bx	r0
	thumb_func_end sub_805F9AC

.align 2, 0 @ Don't pad with nop.
