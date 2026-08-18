	.include "asm/common.inc"

	thumb_func_start sub_8043A0C
sub_8043A0C:
	push	{lr}
	add	r3, r0, #0
	cmp	r1, #0
	beq	.L8043A1A	@cond_branch
	cmp	r1, #0x8
	beq	.L8043A20	@cond_branch
	b	.L8043A4A
.L8043A1A:
	bl	sub_8049168
	b	.L8043A4A
.L8043A20:
	ldr	r1, .L8043A50
	add	r0, r3, r1
	ldrb	r0, [r0]
	lsl	r0, r0, #0x18
	asr	r0, r0, #0x18
	cmp	r0, #0
	bne	.L8043A4A	@cond_branch
	ldr	r1, .L8043A50 + 4
	mov	r0, #0x9
	ldrh	r1, [r1]
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L8043A3E	@cond_branch
	cmp	r2, #0x7c
	bhi	.L8043A42	@cond_branch
.L8043A3E:
	cmp	r2, #0xf0
	bne	.L8043A4A	@cond_branch
.L8043A42:
	ldr	r0, [r3]
	add	r0, r0, #0x1
	bl	sub_80490F8
.L8043A4A:
	pop	{r0}
	bx	r0
.L8043A4E:
	.align	2, 0
.L8043A50:
	.4byte	0x584
	.4byte	0x3005da0
	thumb_func_end sub_8043A0C

.align 2, 0 @ Don't pad with nop.
