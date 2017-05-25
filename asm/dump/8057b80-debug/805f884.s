	.include "asm/common.inc"

	thumb_func_start sub_805F884
sub_805F884:
	push	{r4, lr}
	add	r4, r0, #0
	lsl	r1, r1, #0x10
	lsr	r1, r1, #0x10
	lsl	r2, r2, #0x10
	lsr	r2, r2, #0x10
	mov	r3, #0x28
	ldsh	r0, [r4, r3]
	cmp	r1, r0
	bne	.L2	@cond_branch
	mov	r0, #0x4
	ldrh	r3, [r4, #0x32]
	and	r0, r0, r3
	cmp	r0, #0
	beq	.L2	@cond_branch
	add	r0, r4, #0
	add	r0, r0, #0x42
	strh	r2, [r0]
	b	.L3
.L2:
	add	r0, r4, #0
	bl	sub_805F784
	mov	r0, #0x4
	ldrh	r1, [r4, #0x32]
	orr	r0, r0, r1
	strh	r0, [r4, #0x32]
.L3:
	pop	{r4}
	pop	{r0}
	bx	r0
	thumb_func_end sub_805F884

.align 2, 0 @ Don't pad with nop.
