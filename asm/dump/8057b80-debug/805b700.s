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
	ldr	r6, .L805B7A4
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
	bne	.L805B746	@cond_branch
	sub	r6, r6, #0x1
	mov	r0, #0x30
	strb	r0, [r6]
	mov	r0, #0x1
	mov	r8, r0
	cmp	r5, #0
	beq	.L805B76E	@cond_branch
.L805B746:
	add	r0, r5, #0
	mov	r1, #0xa
	bl	DivRem
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
	beq	.L805B78C	@cond_branch
	cmp	r5, #0
	bne	.L805B746	@cond_branch
.L805B76E:
	cmp	r7, #0
	beq	.L805B78C	@cond_branch
	mov	r0, r8
	cmp	r0, #0x1
	bne	.L805B780	@cond_branch
	sub	r6, r6, #0x1
	mov	r0, #0x30
	strb	r0, [r6]
	sub	r7, r7, #0x1
.L805B780:
	cmp	r7, #0
	beq	.L805B78C	@cond_branch
	sub	r6, r6, #0x1
	mov	r0, #0x3a
	strb	r0, [r6]
	sub	r7, r7, #0x1
.L805B78C:
	mov	r0, r9
	mov	r1, #0x3c
	bl	__udivsi3
	add	r5, r0, #0
	cmp	r5, #0
	bne	.L805B7C2	@cond_branch
	sub	r6, r6, #0x1
	mov	r0, #0x30
	strb	r0, [r6]
	b	.L805B7C2
.L805B7A2:
	.align	2, 0
.L805B7A4:
	.4byte	_unk3000D90
.L805B7A8:
	add	r0, r5, #0
	mov	r1, #0xa
	bl	DivRem
	add	r4, r0, #0
	add	r0, r5, #0
	mov	r1, #0xa
	bl	Div
	add	r5, r0, #0
	sub	r6, r6, #0x1
	add	r4, r4, #0x30
	strb	r4, [r6]
.L805B7C2:
	add	r0, r7, #0
	sub	r7, r7, #0x1
	cmp	r0, #0
	beq	.L805B7CE	@cond_branch
	cmp	r5, #0
	bne	.L805B7A8	@cond_branch
.L805B7CE:
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
