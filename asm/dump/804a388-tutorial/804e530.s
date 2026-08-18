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
	beq	.L804E558	@cond_branch
	lsl	r6, r1, #0x10
.L804E542:
	ldr	r0, [r5]
	cmp	r0, #0
	beq	.L804E54E	@cond_branch
	lsr	r1, r6, #0x10
	bl	sub_8061078
.L804E54E:
	add	r5, r5, #0x24
	add	r0, r4, #0
	sub	r4, r4, #0x1
	cmp	r0, #0
	bne	.L804E542	@cond_branch
.L804E558:
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
	thumb_func_end sub_804E530

.align 2, 0 @ Don't pad with nop.
