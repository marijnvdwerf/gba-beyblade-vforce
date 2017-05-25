	.include "asm/common.inc"

	thumb_func_start sub_8051744
sub_8051744:
	push	{r4, lr}
	mov	r4, #0x0
.L3:
	add	r0, r4, #0
	bl	sub_8051720
	mov	r1, #0x1
	ldrh	r0, [r0]
	and	r1, r1, r0
	cmp	r1, #0
	bne	.L1	@cond_branch
	mov	r0, #0x0
	b	.L2
.L1:
	add	r4, r4, #0x1
	cmp	r4, #0x37
	ble	.L3	@cond_branch
	mov	r0, #0x1
.L2:
	pop	{r4}
	pop	{r1}
	bx	r1
	thumb_func_end sub_8051744

.align 2, 0 @ Don't pad with nop.
