	.include "asm/common.inc"

	thumb_func_start sub_8051028
sub_8051028:
	push	{r4, r5, r6, r7, lr}
	add	r5, r0, #0
	ldr	r4, [r5, #0x28]
	mov	r6, #0x0
	ldr	r0, [r5]
	cmp	r6, r0
	bge	.L1	@cond_branch
	mov	r7, #0x0
.L3:
	ldr	r0, [r4, #0x4]
	cmp	r0, #0
	beq	.L2	@cond_branch
	bl	sub_8060A94
	str	r7, [r4, #0x4]
.L2:
	add	r4, r4, #0x1c
	add	r6, r6, #0x1
	ldr	r0, [r5]
	cmp	r6, r0
	blt	.L3	@cond_branch
.L1:
	ldr	r0, [r5, #0x30]
	cmp	r0, #0
	beq	.L4	@cond_branch
	bl	deallocateBlock
	mov	r0, #0x0
	str	r0, [r5, #0x30]
.L4:
	add	r0, r5, #0
	add	r0, r0, #0x40
	bl	sub_8061204
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
	thumb_func_end sub_8051028

.align 2, 0 @ Don't pad with nop.
