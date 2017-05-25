	.include "asm/common.inc"

	thumb_func_start sub_8060790
sub_8060790:
	push	{r4, r5, r6, lr}
	add	r1, r0, #0
	ldr	r0, .L7
	ldr	r2, [r0]
	mov	r3, #0x0
	add	r5, r0, #0
	cmp	r2, #0
	beq	.L3	@cond_branch
	ldrh	r0, [r2, #0x2]
	cmp	r0, r1
	bge	.L2	@cond_branch
.L4:
	add	r3, r2, #0
	ldr	r2, [r2, #0x4]
	cmp	r2, #0
	beq	.L3	@cond_branch
	ldrh	r6, [r2, #0x2]
	cmp	r6, r1
	blt	.L4	@cond_branch
.L2:
	cmp	r2, #0
	bne	.L5	@cond_branch
.L3:
	ldr	r0, .L7 + 4
	bl	printf
	mov	r0, #0x1
	NEG	r0, r0
	b	.L6
.L8:
	.align	2, 0
.L7:
	.4byte	0x3005dc8
	.4byte	0x87559c0
.L5:
	ldrh	r4, [r2]
	add	r0, r4, r1
	strh	r0, [r2]
	ldrh	r6, [r2, #0x2]
	sub	r0, r6, r1
	strh	r0, [r2, #0x2]
	lsl	r0, r0, #0x10
	cmp	r0, #0
	bne	.L11	@cond_branch
	ldr	r0, [r5]
	ldr	r1, [r2, #0x4]
	cmp	r0, r2
	bne	.L10	@cond_branch
	cmp	r1, #0
	beq	.L11	@cond_branch
.L10:
	cmp	r3, #0
	beq	.L12	@cond_branch
	str	r1, [r3, #0x4]
	b	.L13
.L12:
	str	r1, [r5]
.L13:
	ldr	r1, .L14
	ldr	r0, [r1]
	str	r0, [r2, #0x4]
	str	r2, [r1]
.L11:
	add	r0, r4, #0
.L6:
	pop	{r4, r5, r6}
	pop	{r1}
	bx	r1
.L15:
	.align	2, 0
.L14:
	.4byte	0x3005dd8
	thumb_func_end sub_8060790

.align 2, 0 @ Don't pad with nop.
