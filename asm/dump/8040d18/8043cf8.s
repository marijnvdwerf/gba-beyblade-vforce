	.include "asm/common.inc"

	thumb_func_start sub_8043CF8
sub_8043CF8:
	push	{lr}
	cmp	r1, #0x1
	beq	.L1	@cond_branch
	cmp	r1, #0x1
	bcc	.L2	@cond_branch
	cmp	r1, #0x2
	beq	.L3	@cond_branch
	cmp	r1, #0x5
	beq	.L4	@cond_branch
	b	.L9
.L2:
	bl	sub_8049168
	b	.L9
.L1:
	add	r0, r0, #0xb8
	bl	sub_80439A0
	b	.L9
.L3:
	ldr	r0, .L10
	ldrh	r0, [r0]
	cmp	r0, #0x2
	bne	.L9	@cond_branch
	mov	r0, #0xa
	bl	sub_80490F8
	b	.L9
.L11:
	.align	2, 0
.L10:
	.4byte	0x3005da0
.L4:
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
	beq	.L12	@cond_branch
	mov	r0, #0x12
	bl	sub_804924C
	b	.L16
.L12:
	mov	r0, #0x80
	lsl	r0, r0, #0x1
	bl	sub_8051780
	cmp	r0, #0
	beq	.L14	@cond_branch
	mov	r0, #0x11
	bl	sub_804924C
	b	.L16
.L14:
	mov	r0, #0x4
	bl	sub_8051780
	cmp	r0, #0
	beq	.L16	@cond_branch
	mov	r0, #0x13
	bl	sub_804924C
.L16:
	mov	r0, #0x9
	bl	sub_80490F8
.L9:
	pop	{r0}
	bx	r0
	thumb_func_end sub_8043CF8

.align 2, 0 @ Don't pad with nop.
