	.include "asm/common.inc"

	thumb_func_start sub_80518F0
sub_80518F0:
	push	{lr}
	bl	sub_8051734
	ldr	r1, [r0, #0x10]
	mov	r2, #0x0
	cmp	r1, #0
	beq	.L8051910	@cond_branch
	mov	r3, #0x1
.L8051900:
	add	r0, r1, #0
	and	r0, r0, r3
	cmp	r0, #0
	beq	.L805190A	@cond_branch
	add	r2, r2, #0x1
.L805190A:
	lsr	r1, r1, #0x1
	cmp	r1, #0
	bne	.L8051900	@cond_branch
.L8051910:
	add	r0, r2, #0
	pop	{r1}
	bx	r1
	thumb_func_end sub_80518F0

.align 2, 0 @ Don't pad with nop.
