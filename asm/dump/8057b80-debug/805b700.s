	.include "asm/common.inc"

	thumb_func_start sub_805B700
sub_805B700:
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	add	sp, sp, #0xfffffff0
	str	r0, [sp, #0x4]
	str	r1, [sp, #0x8]
	str	r2, [sp, #0xc]
	mov	r9, r3
	ldr	r0, [sp, #0x30]
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	mov	sl, r0
	ldr	r6, .L10
	mov	r7, #0xf
	mov	r0, #0x0
	mov	r8, r0
	sub	r6, r6, #0x1
	mov	r0, r8
	strb	r0, [r6]
	mov	r0, r9
	mov	r1, #0x3c
	bl	__umodsi3
	add	r5, r0, #0
	cmp	r5, #0
	bne	.L4	@cond_branch
	sub	r6, r6, #0x1
	mov	r0, #0x30
	strb	r0, [r6]
	mov	r0, #0x1
	mov	r8, r0
	cmp	r5, #0
	beq	.L2	@cond_branch
.L4:
	add	r0, r5, #0
	mov	r1, #0xa
	bl	Mod
	add	r4, r0, #0
	add	r0, r5, #0
	mov	r1, #0xa
	bl	Div
	add	r5, r0, #0
	sub	r6, r6, #0x1
	add	r4, r4, #0x30
	strb	r4, [r6]
	mov	r0, #0x1
	ADD r8, r0
	sub	r7, r7, #0x1
	cmp	r7, #0
	beq	.L7	@cond_branch
	cmp	r5, #0
	bne	.L4	@cond_branch
.L2:
	cmp	r7, #0
	beq	.L7	@cond_branch
	mov	r0, r8
	cmp	r0, #0x1
	bne	.L6	@cond_branch
	sub	r6, r6, #0x1
	mov	r0, #0x30
	strb	r0, [r6]
	sub	r7, r7, #0x1
.L6:
	cmp	r7, #0
	beq	.L7	@cond_branch
	sub	r6, r6, #0x1
	mov	r0, #0x3a
	strb	r0, [r6]
	sub	r7, r7, #0x1
.L7:
	mov	r0, r9
	mov	r1, #0x3c
	bl	__udivsi3
	add	r5, r0, #0
	cmp	r5, #0
	bne	.L9	@cond_branch
	sub	r6, r6, #0x1
	mov	r0, #0x30
	strb	r0, [r6]
	b	.L9
.L11:
	.align	2, 0
.L10:
	.4byte	0x3000d90
.L13:
	add	r0, r5, #0
	mov	r1, #0xa
	bl	Mod
	add	r4, r0, #0
	add	r0, r5, #0
	mov	r1, #0xa
	bl	Div
	add	r5, r0, #0
	sub	r6, r6, #0x1
	add	r4, r4, #0x30
	strb	r4, [r6]
.L9:
	add	r0, r7, #0
	sub	r7, r7, #0x1
	cmp	r0, #0
	beq	.L12	@cond_branch
	cmp	r5, #0
	bne	.L13	@cond_branch
.L12:
	mov	r0, sl
	str	r0, [sp]
	ldr	r0, [sp, #0x4]
	ldr	r1, [sp, #0x8]
	ldr	r2, [sp, #0xc]
	add	r3, r6, #0
	bl	sub_805B41C
	add	sp, sp, #0x10
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
	thumb_func_end sub_805B700

.align 2, 0 @ Don't pad with nop.
