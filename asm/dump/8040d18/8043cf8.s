	.include "asm/common.inc"

	thumb_func_start sub_8043CF8
sub_8043CF8:
	push	{lr}
	cmp	r1, #0x1
	beq	.L8043D12	@cond_branch
	cmp	r1, #0x1
	bcc	.L8043D0C	@cond_branch
	cmp	r1, #0x2
	beq	.L8043D1A	@cond_branch
	cmp	r1, #0x5
	beq	.L8043D30	@cond_branch
	b	.L8043D80
.L8043D0C:
	bl	sub_8049168
	b	.L8043D80
.L8043D12:
	add	r0, r0, #0xb8
	bl	sub_80439A0
	b	.L8043D80
.L8043D1A:
	ldr	r0, .L8043D2C
	ldrh	r0, [r0]
	cmp	r0, #0x2
	bne	.L8043D80	@cond_branch
	mov	r0, #0xa
	bl	sub_80490F8
	b	.L8043D80
.L8043D2A:
	.align	2, 0
.L8043D2C:
	.4byte	0x3005da0
.L8043D30:
	mov	r1, #0x8f
	lsl	r1, r1, #0x3
	add	r0, r0, r1
	bl	sub_805B210
	bl	sub_8051688
	mov	r0, #0x8
	bl	sub_8049234
	mov	r0, #0x1
	bl	sub_8051780
	cmp	r0, #0
	beq	.L8043D56	@cond_branch
	mov	r0, #0x12
	bl	sub_804924C
	b	.L8043D7A
.L8043D56:
	mov	r0, #0x80
	lsl	r0, r0, #0x1
	bl	sub_8051780
	cmp	r0, #0
	beq	.L8043D6A	@cond_branch
	mov	r0, #0x11
	bl	sub_804924C
	b	.L8043D7A
.L8043D6A:
	mov	r0, #0x4
	bl	sub_8051780
	cmp	r0, #0
	beq	.L8043D7A	@cond_branch
	mov	r0, #0x13
	bl	sub_804924C
.L8043D7A:
	mov	r0, #0x9
	bl	sub_80490F8
.L8043D80:
	pop	{r0}
	bx	r0
	thumb_func_end sub_8043CF8

.align 2, 0 @ Don't pad with nop.
