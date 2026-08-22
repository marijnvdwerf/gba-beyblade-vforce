	.include "asm/common.inc"

	thumb_func_start sub_805B668
sub_805B668:
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	add	sp, sp, #0xfffffff4
	mov	sl, r0
	str	r1, [sp, #0x4]
	str	r2, [sp, #0x8]
	add	r5, r3, #0
	ldr	r0, [sp, #0x2c]
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	mov	r9, r0
	ldr	r4, .L805B6FC
	mov	r7, #0x3
	sub	r4, r4, #0x1
	mov	r0, #0x0
	strb	r0, [r4]
	cmp	r5, #0
	bne	.L805B698	@cond_branch
	sub	r4, r4, #0x1
	mov	r0, #0x30
	strb	r0, [r4]
.L805B698:
	mov	r0, #0xe
	mov	r8, r0
	cmp	r5, #0
	beq	.L805B6DC	@cond_branch
.L805B6A0:
	add	r0, r5, #0
	mov	r1, #0xa
	bl	DivRem
	add	r6, r0, #0
	add	r0, r5, #0
	mov	r1, #0xa
	bl	Div
	add	r5, r0, #0
	add	r0, r7, #0
	sub	r7, r7, #0x1
	cmp	r0, #0
	bne	.L805B6C4	@cond_branch
	sub	r4, r4, #0x1
	mov	r0, #0x2c
	strb	r0, [r4]
	mov	r7, #0x2
.L805B6C4:
	sub	r4, r4, #0x1
	add	r0, r6, #0
	add	r0, r0, #0x30
	strb	r0, [r4]
	mov	r0, r8
	mov	r1, #0x1
	neg	r1, r1
	add r8, r1
	cmp	r0, #0
	beq	.L805B6DC	@cond_branch
	cmp	r5, #0
	bne	.L805B6A0	@cond_branch
.L805B6DC:
	mov	r0, r9
	str	r0, [sp]
	mov	r0, sl
	ldr	r1, [sp, #0x4]
	ldr	r2, [sp, #0x8]
	add	r3, r4, #0
	bl	sub_805B41C
	add	sp, sp, #0xc
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L805B6FC:
	.align	2, 0

	.4byte	_unk3000D80
	thumb_func_end sub_805B668

.align 2, 0 @ Don't pad with nop.
