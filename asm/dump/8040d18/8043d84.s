	.include "asm/common.inc"

	thumb_func_start sub_8043D84
sub_8043D84:
	push	{lr}
	cmp	r1, #0x1
	beq	.L1	@cond_branch
	cmp	r1, #0x1
	bcc	.L2	@cond_branch
	cmp	r1, #0x2
	beq	.L3	@cond_branch
	b	.L7
.L2:
	bl	sub_8049168
	b	.L7
.L1:
	add	r0, r0, #0xb8
	bl	sub_80439A0
	b	.L7
.L3:
	ldr	r0, .L8
	ldrh	r0, [r0]
	cmp	r0, #0x1
	bne	.L7	@cond_branch
	mov	r0, #0x14
	bl	sub_80490F8
.L7:
	pop	{r0}
	bx	r0
.L9:
	.align	2, 0
.L8:
	.4byte	0x3005da0
	thumb_func_end sub_8043D84

.align 2, 0 @ Don't pad with nop.
