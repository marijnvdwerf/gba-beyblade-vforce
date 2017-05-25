	.include "asm/common.inc"

	thumb_func_start sub_80493C8
sub_80493C8:
	push	{r4, r5, r6, r7, lr}
	mov	r5, #0x0
	ldr	r4, .L8
	add	r7, r4, #0
	add	r7, r7, #0x7f
	ldrb	r0, [r7]
	cmp	r0, #0
	beq	.L7	@cond_branch
	bl	sub_805FFE4
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L7	@cond_branch
	ldr	r1, .L8 + 4
	add	r0, r4, r1
	ldrb	r0, [r0]
	cmp	r0, #0x40
	beq	.L7	@cond_branch
	ldr	r4, .L8 + 8
	ldr	r1, [r4]
	ldr	r6, .L8 + 12
	add	r0, r1, r6
	ldrb	r0, [r0]
	cmp	r0, #0x1
	beq	.L7	@cond_branch
	ldr	r2, .L8 + 16
	add	r0, r1, r2
	sub	r2, r2, #0x10
	add	r1, r1, r2
	mov	r2, #0x1
	bl	sub_806014C
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L6	@cond_branch
	bl	sub_806008C
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L6	@cond_branch
	ldr	r0, [r4]
	ldr	r1, .L8 + 20
	add	r0, r0, r1
	strb	r5, [r0]
	ldr	r0, [r4]
	add	r0, r0, r6
	mov	r1, #0x1
	strb	r1, [r0]
	strb	r5, [r7]
	mov	r0, #0x1d
	bl	sub_80490F8
	b	.L7
.L9:
	.align	2, 0
.L8:
	.4byte	0x3000650
	.4byte	0x584
	.4byte	0x3000fb0
	.4byte	0x1619
	.4byte	0x15d4
	.4byte	0x1618
.L6:
	mov	r5, #0x1
.L7:
	add	r0, r5, #0
	pop	{r4, r5, r6, r7}
	pop	{r1}
	bx	r1
	thumb_func_end sub_80493C8

.align 2, 0 @ Don't pad with nop.
