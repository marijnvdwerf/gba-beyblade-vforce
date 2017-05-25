	.include "asm/common.inc"

	thumb_func_start sub_804C484
sub_804C484:
	push	{r4, r5, r6, lr}
	add	r6, r0, #0
	mov	r0, #0x4
	ldsh	r4, [r6, r0]
	ldr	r5, [r6, #0x8]
	b	.L1
.L2:
	ldr	r0, [r5, #0x30]
	bl	sub_804ABE4
	add	r5, r5, #0x34
.L1:
	add	r0, r4, #0
	sub	r4, r4, #0x1
	cmp	r0, #0
	bne	.L2	@cond_branch
	ldr	r0, [r6]
	cmp	r0, #0
	beq	.L3	@cond_branch
	bl	deallocateBlock
	mov	r0, #0x0
	str	r0, [r6]
.L3:
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
	thumb_func_end sub_804C484

.align 2, 0 @ Don't pad with nop.
