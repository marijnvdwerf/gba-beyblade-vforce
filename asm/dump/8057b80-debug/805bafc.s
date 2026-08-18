	.include "asm/common.inc"

	thumb_func_start sub_805BAFC
sub_805BAFC:
	push	{r4, lr}
	add	r4, r2, #0
	mov	r2, #0x0
	add	r3, r1, #4
	cmp	r1, #0
	bne	.L805BB0E	@cond_branch
	b	.L805BB24
.L805BB0A:
	add	r0, r3, #0
	b	.L805BB26
.L805BB0E:
	ldrh	r1, [r1]
	cmp	r2, r1
	bge	.L805BB24	@cond_branch
.L805BB14:
	ldrh	r0, [r3, #0x4]
	cmp	r0, r4
	beq	.L805BB0A	@cond_branch
	ldrh	r0, [r3]
	add	r3, r0, r3
	add	r2, r2, #0x1
	cmp	r2, r1
	blt	.L805BB14	@cond_branch
.L805BB24:
	mov	r0, #0x0
.L805BB26:
	pop	{r4}
	pop	{r1}
	bx	r1
	thumb_func_end sub_805BAFC

.align 2, 0 @ Don't pad with nop.
