	.include "asm/common.inc"

	thumb_func_start sub_8050A50
sub_8050A50:
	push	{r4, r5, r6, lr}
	add	r6, r0, #0
	ldrh	r1, [r6, #0x2]
	ldrh	r2, [r6, #0x4]
	add	r0, r1, r2
	cmp	r0, #0
	beq	.L1	@cond_branch
	mov	r5, #0x0
	add	r4, r0, #0
.L2:
	ldr	r0, [r6, #0xc]
	add	r0, r0, r5
	bl	sub_8058EF4
	add	r5, r5, #0x88
	sub	r4, r4, #0x1
	cmp	r4, #0
	bne	.L2	@cond_branch
.L1:
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
	thumb_func_end sub_8050A50

.align 2, 0 @ Don't pad with nop.
