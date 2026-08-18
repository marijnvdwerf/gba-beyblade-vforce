	.include "asm/common.inc"

	thumb_func_start sub_8043D84
sub_8043D84:
	push	{lr}
	cmp	r1, #0x1
	beq	.L8043D9A	@cond_branch
	cmp	r1, #0x1
	bcc	.L8043D94	@cond_branch
	cmp	r1, #0x2
	beq	.L8043DA2	@cond_branch
	b	.L8043DB0
.L8043D94:
	bl	sub_8049168
	b	.L8043DB0
.L8043D9A:
	add	r0, r0, #0xb8
	bl	sub_80439A0
	b	.L8043DB0
.L8043DA2:
	ldr	r0, .L8043DB4
	ldrh	r0, [r0]
	cmp	r0, #0x1
	bne	.L8043DB0	@cond_branch
	mov	r0, #0x14
	bl	sub_80490F8
.L8043DB0:
	pop	{r0}
	bx	r0
.L8043DB4:
	.align	2, 0

	.4byte	0x3005da0
	thumb_func_end sub_8043D84

.align 2, 0 @ Don't pad with nop.
