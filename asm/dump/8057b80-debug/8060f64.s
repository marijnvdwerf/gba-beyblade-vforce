	.include "asm/common.inc"

	thumb_func_start sub_8060F64
sub_8060F64:
	push	{r4, r5, r6, lr}
	add	r6, r0, #0
	lsl	r1, r1, #0x10
	lsr	r1, r1, #0x10
	lsl	r2, r2, #0x10
	lsr	r5, r2, #0x10
	lsl	r3, r3, #0x18
	lsr	r3, r3, #0x18
	ldr	r2, [r6, #0x30]
	ldr	r4, [r6, #0x10]
	cmp	r2, #0
	beq	.L8060FA0	@cond_branch
	add	r0, r2, #0
	add	r2, r5, #0
	bl	sub_8060E8C
	str	r0, [r6, #0x30]
	add	r2, r0, #0
	cmp	r2, #0
	bne	.L8060FCA	@cond_branch
	ldr	r0, .L8060F9C
	and	r4, r4, r0
	mov	r0, #0x3
	ldrh	r1, [r6, #0x1c]
	and	r0, r0, r1
	lsl	r0, r0, #0x1c
	b	.L8060FC4
.L8060F9A:
	.align	2, 0
.L8060F9C:
	.4byte	0xc1fffcff
.L8060FA0:
	mov	r0, #0x0
	add	r2, r5, #0
	bl	sub_8060E8C
	str	r0, [r6, #0x30]
	add	r2, r0, #0
	cmp	r2, #0
	beq	.L8061000	@cond_branch
	ldr	r0, .L8060FE0
	and	r4, r4, r0
	ldr	r0, [r2, #0x8]
	mov	r1, #0xf8
	lsl	r1, r1, #0x2
	and	r0, r0, r1
	lsl	r0, r0, #0x14
	mov	r1, #0x80
	lsl	r1, r1, #0x1
	orr	r0, r0, r1
.L8060FC4:
	orr	r4, r4, r0
	cmp	r2, #0
	beq	.L8061000	@cond_branch
.L8060FCA:
	ldrb	r0, [r2, #0x18]
	cmp	r0, #0
	beq	.L8060FE4	@cond_branch
	ldrh	r0, [r2, #0x14]
	cmp	r0, #0xb0
	bhi	.L8060FF4	@cond_branch
	ldrh	r2, [r2, #0x16]
	cmp	r2, #0xb0
	bhi	.L8060FF4	@cond_branch
	b	.L8060FFC
.L8060FDE:
	.align	2, 0
.L8060FE0:
	.4byte	0xc1fffdff
.L8060FE4:
	mov	r0, #0x80
	lsl	r0, r0, #0x1
	ldrh	r1, [r2, #0x14]
	cmp	r1, r0
	bhi	.L8060FF4	@cond_branch
	ldrh	r2, [r2, #0x16]
	cmp	r2, r0
	bls	.L8060FFC	@cond_branch
.L8060FF4:
	mov	r0, #0x80
	lsl	r0, r0, #0x2
	orr	r4, r4, r0
	b	.L8061000
.L8060FFC:
	ldr	r0, .L8061008
	and	r4, r4, r0
.L8061000:
	str	r4, [r6, #0x10]
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
.L8061008:
	.align	2, 0

	.4byte	0xfffffdff
	thumb_func_end sub_8060F64

.align 2, 0 @ Don't pad with nop.
