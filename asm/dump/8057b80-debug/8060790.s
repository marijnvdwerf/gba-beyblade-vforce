	.include "asm/common.inc"

	thumb_func_start sub_8060790
sub_8060790:
	push	{r4, r5, r6, lr}
	add	r1, r0, #0
	ldr	r0, .L80607C4
	ldr	r2, [r0]
	mov	r3, #0x0
	add	r5, r0, #0
	cmp	r2, #0
	beq	.L80607B8	@cond_branch
	ldrh	r0, [r2, #0x2]
	cmp	r0, r1
	bge	.L80607B4	@cond_branch
.L80607A6:
	add	r3, r2, #0
	ldr	r2, [r2, #0x4]
	cmp	r2, #0
	beq	.L80607B8	@cond_branch
	ldrh	r6, [r2, #0x2]
	cmp	r6, r1
	blt	.L80607A6	@cond_branch
.L80607B4:
	cmp	r2, #0
	bne	.L80607CC	@cond_branch
.L80607B8:
	ldr	r0, .L80607C4 + 4
	bl	printf
	mov	r0, #0x1
	neg	r0, r0
	b	.L80607FE
.L80607C4:
	.align	2, 0

	.4byte	_unk3005DC8
	.4byte	0x87559c0
.L80607CC:
	ldrh	r4, [r2]
	add	r0, r4, r1
	strh	r0, [r2]
	ldrh	r6, [r2, #0x2]
	sub	r0, r6, r1
	strh	r0, [r2, #0x2]
	lsl	r0, r0, #0x10
	cmp	r0, #0
	bne	.L80607FC	@cond_branch
	ldr	r0, [r5]
	ldr	r1, [r2, #0x4]
	cmp	r0, r2
	bne	.L80607EA	@cond_branch
	cmp	r1, #0
	beq	.L80607FC	@cond_branch
.L80607EA:
	cmp	r3, #0
	beq	.L80607F2	@cond_branch
	str	r1, [r3, #0x4]
	b	.L80607F4
.L80607F2:
	str	r1, [r5]
.L80607F4:
	ldr	r1, .L8060804
	ldr	r0, [r1]
	str	r0, [r2, #0x4]
	str	r2, [r1]
.L80607FC:
	add	r0, r4, #0
.L80607FE:
	pop	{r4, r5, r6}
	pop	{r1}
	bx	r1
.L8060804:
	.align	2, 0

	.4byte	_unk3005DD8
	thumb_func_end sub_8060790

.align 2, 0 @ Don't pad with nop.
