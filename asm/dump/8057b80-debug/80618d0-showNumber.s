	.include "asm/common.inc"

	thumb_func_start showNumber
showNumber:
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	add	sp, sp, #0xfffffff0
	mov	r8, r0
	add	r5, r1, #0
	lsl	r2, r2, #0x18
	lsr	r2, r2, #0x18
	mov	r9, r2
	mov	r0, #0x0
	mov	sl, r0
	mov	r7, #0x3
	mov	r6, #0xe
	cmp	r5, #0
	bge	.L80618F8	@cond_branch
	mov	r1, #0x1
	mov	sl, r1
	NEG	r5, r5
.L80618F8:
	mov	r4, sp
	add	r4, r4, #0xf
	mov	r0, #0x0
	strb	r0, [r4]
	cmp	r5, #0
	bne	.L806190C	@cond_branch
	sub	r4, r4, #0x1
	mov	r0, #0x30
	strb	r0, [r4]
	b	.L8061956
.L806190C:
	mov	r0, #0x40
	mov	r2, r8
	ldrh	r2, [r2, #0x8]
	and	r0, r0, r2
	cmp	r0, #0
	bne	.L8061930	@cond_branch
	sub	r0, r7, #1
	lsl	r0, r0, #0x18
	lsr	r7, r0, #0x18
	cmp	r7, #0xff
	bne	.L8061930	@cond_branch
	sub	r4, r4, #0x1
	mov	r0, #0x2c
	strb	r0, [r4]
	mov	r7, #0x2
	sub	r0, r6, #1
	lsl	r0, r0, #0x18
	lsr	r6, r0, #0x18
.L8061930:
	add	r0, r5, #0
	mov	r1, #0xa
	bl	Mod
	sub	r4, r4, #0x1
	add	r0, r0, #0x30
	strb	r0, [r4]
	add	r0, r5, #0
	mov	r1, #0xa
	bl	Div
	add	r5, r0, #0
	sub	r0, r6, #1
	lsl	r0, r0, #0x18
	lsr	r6, r0, #0x18
	cmp	r5, #0
	beq	.L8061956	@cond_branch
	cmp	r6, #0
	bne	.L806190C	@cond_branch
.L8061956:
	mov	r0, sl
	cmp	r0, #0
	beq	.L8061962	@cond_branch
	sub	r4, r4, #0x1
	mov	r0, #0x2d
	strb	r0, [r4]
.L8061962:
	mov	r0, r8
	add	r1, r4, #0
	mov	r2, r9
	bl	showString
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	add	sp, sp, #0x10
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6, r7}
	pop	{r1}
	bx	r1
	thumb_func_end showNumber

.align 2, 0 @ Don't pad with nop.
