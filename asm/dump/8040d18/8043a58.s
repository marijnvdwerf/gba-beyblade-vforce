	.include "asm/common.inc"

	thumb_func_start sub_8043A58
sub_8043A58:
	push	{lr}
	cmp	r1, #0
	beq	.L8043A64	@cond_branch
	cmp	r1, #0x8
	beq	.L8043A6A	@cond_branch
	b	.L8043A92
.L8043A64:
	bl	sub_8049168
	b	.L8043A92
.L8043A6A:
	ldr	r1, .L8043A98
	add	r0, r0, r1
	ldrb	r0, [r0]
	lsl	r0, r0, #0x18
	asr	r0, r0, #0x18
	cmp	r0, #0
	bne	.L8043A92	@cond_branch
	ldr	r1, .L8043A98 + 4
	mov	r0, #0x9
	ldrh	r1, [r1]
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L8043A88	@cond_branch
	cmp	r2, #0x7c
	bhi	.L8043A8C	@cond_branch
.L8043A88:
	cmp	r2, #0xf0
	bne	.L8043A92	@cond_branch
.L8043A8C:
	mov	r0, #0x7
	bl	sub_80490F8
.L8043A92:
	pop	{r0}
	bx	r0
.L8043A96:
	.align	2, 0
.L8043A98:
	.4byte	0x584
	.4byte	0x3005da0
	thumb_func_end sub_8043A58

.align 2, 0 @ Don't pad with nop.
