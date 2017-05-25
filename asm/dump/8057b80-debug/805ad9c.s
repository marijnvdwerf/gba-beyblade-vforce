	.include "asm/common.inc"

	thumb_func_start sub_805AD9C
sub_805AD9C:
	push	{r4, r5, r6, lr}
	add	r6, r0, #0
	ldr	r5, [r6, #0xc]
	ldr	r4, [r6, #0x18]
	b	.L1
.L2:
	add	r0, r5, #0
	bl	sub_8061204
	add	r5, r5, #0x4c
.L1:
	add	r0, r4, #0
	sub	r4, r4, #0x1
	cmp	r0, #0
	bne	.L2	@cond_branch
	ldr	r0, [r6, #0x10]
	cmp	r0, #0
	beq	.L3	@cond_branch
	bl	deallocateBlock
	mov	r0, #0x0
	str	r0, [r6, #0x10]
.L3:
	mov	r0, #0x0
	str	r0, [r6, #0x14]
	str	r0, [r6, #0x18]
	strb	r0, [r6, #0x9]
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
	thumb_func_end sub_805AD9C

.align 2, 0 @ Don't pad with nop.
