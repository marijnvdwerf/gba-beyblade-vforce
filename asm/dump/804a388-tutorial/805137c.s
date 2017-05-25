	.include "asm/common.inc"

	thumb_func_start sub_805137C
sub_805137C:
	push	{r4, r5, r6, lr}
	mov	r6, #0x0
	mov	r5, #0x0
.L2:
	add	r0, r5, #0
	bl	sub_8051720
	add	r4, r0, #0
	add	r0, r5, #0
	bl	getLevelDescription
	mov	r0, #0x2
	ldrh	r4, [r4]
	and	r0, r0, r4
	cmp	r0, #0
	beq	.L1	@cond_branch
	add	r6, r5, #0
.L1:
	add	r5, r5, #0x1
	cmp	r5, #0x37
	ble	.L2	@cond_branch
	add	r0, r6, #0
	pop	{r4, r5, r6}
	pop	{r1}
	bx	r1
	thumb_func_end sub_805137C

.align 2, 0 @ Don't pad with nop.
