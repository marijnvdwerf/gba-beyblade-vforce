	.include "asm/common.inc"

	thumb_func_start sub_804E530
sub_804E530:
	push	{r4, r5, r6, lr}
	mov	r2, #0x4
	ldsh	r4, [r0, r2]
	ldr	r5, [r0, #0x8]
	add	r0, r4, #0
	sub	r4, r4, #0x1
	cmp	r0, #0
	beq	.L1	@cond_branch
	lsl	r6, r1, #0x10
.L3:
	ldr	r0, [r5]
	cmp	r0, #0
	beq	.L2	@cond_branch
	lsr	r1, r6, #0x10
	bl	sub_8061078
.L2:
	add	r5, r5, #0x24
	add	r0, r4, #0
	sub	r4, r4, #0x1
	cmp	r0, #0
	bne	.L3	@cond_branch
.L1:
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
	thumb_func_end sub_804E530

.align 2, 0 @ Don't pad with nop.
