	.include "asm/common.inc"

	thumb_func_start sub_804C208
sub_804C208:
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	add	r6, r0, #0
	mov	r0, #0x4
	ldsh	r7, [r6, r0]
	ldr	r1, [r6, #0x10]
	mov	sl, r1
	ldr	r2, [r6, #0x14]
	mov	r9, r2
	ldr	r3, [r6, #0x18]
	mov	r8, r3
	ldr	r4, [r6, #0x8]
	b	.L1
.L12:
	ldrh	r1, [r4, #0x2c]
	mov	r2, #0x2c
	ldsh	r0, [r4, r2]
	cmp	r0, #0
	bne	.L2	@cond_branch
	ldr	r1, [r4]
	ldr	r0, [r4, #0xc]
	add	r1, r1, r0
	str	r1, [r4]
	ldr	r3, [r4, #0x4]
	ldr	r0, [r4, #0x10]
	add	r3, r3, r0
	str	r3, [r4, #0x4]
	ldr	r2, [r4, #0x8]
	ldr	r0, [r4, #0x14]
	add	r2, r2, r0
	str	r2, [r4, #0x8]
	sub	r5, r1, r3
	add	r1, r1, r3
	asr	r1, r1, #0x1
	sub	r2, r1, r2
	ldrh	r1, [r4, #0x2a]
	mov	r3, #0x2a
	ldsh	r0, [r4, r3]
	cmp	r0, #0
	beq	.L4	@cond_branch
	sub	r0, r1, #1
	strh	r0, [r4, #0x2a]
	lsl	r0, r0, #0x10
	cmp	r0, #0
	beq	.L4	@cond_branch
	ldr	r0, [r4, #0x30]
	add	r1, r5, #0
	bl	sub_804ABD0
.L4:
	ldr	r0, [r4, #0xc]
	ldr	r1, [r4, #0x18]
	add	r0, r0, r1
	str	r0, [r4, #0xc]
	ldr	r0, [r4, #0x10]
	ldr	r1, [r4, #0x1c]
	add	r0, r0, r1
	str	r0, [r4, #0x10]
	ldr	r0, [r4, #0x14]
	ldr	r1, [r4, #0x20]
	add	r0, r0, r1
	str	r0, [r4, #0x14]
	ldrh	r3, [r4, #0x28]
	mov	r0, #0x1
	and	r0, r0, r3
	add	r2, r3, #0
	cmp	r0, #0
	beq	.L5	@cond_branch
	ldr	r0, [r4]
	mov	r1, sl
	sub	r0, r1, r0
	ldr	r1, [r4, #0x24]
	mul	r0, r0, r1
	asr	r0, r0, #0xc
	str	r0, [r4, #0x18]
.L5:
	mov	r0, #0x2
	and	r0, r0, r2
	cmp	r0, #0
	beq	.L6	@cond_branch
	ldr	r0, [r4, #0x4]
	mov	r1, r9
	sub	r0, r1, r0
	ldr	r1, [r4, #0x24]
	mul	r0, r0, r1
	asr	r0, r0, #0xc
	str	r0, [r4, #0x1c]
.L6:
	mov	r0, #0x4
	and	r0, r0, r2
	cmp	r0, #0
	beq	.L7	@cond_branch
	ldr	r0, [r4, #0x8]
	mov	r1, r8
	sub	r0, r1, r0
	ldr	r1, [r4, #0x24]
	mul	r0, r0, r1
	asr	r0, r0, #0xc
	str	r0, [r4, #0x20]
.L7:
	mov	r0, #0x8
	and	r0, r0, r2
	cmp	r0, #0
	beq	.L8	@cond_branch
	ldr	r0, [r4]
	mov	r1, sl
	sub	r0, r1, r0
	ldr	r1, [r4, #0x24]
	mul	r0, r0, r1
	asr	r0, r0, #0xc
	str	r0, [r4, #0xc]
.L8:
	mov	r0, #0x10
	and	r0, r0, r2
	cmp	r0, #0
	beq	.L9	@cond_branch
	ldr	r0, [r4, #0x4]
	mov	r2, r9
	sub	r0, r2, r0
	ldr	r1, [r4, #0x24]
	mul	r0, r0, r1
	asr	r0, r0, #0xc
	str	r0, [r4, #0x10]
.L9:
	mov	r0, #0x20
	and	r0, r0, r3
	cmp	r0, #0
	beq	.L11	@cond_branch
	ldr	r0, [r4, #0x8]
	mov	r3, r8
	sub	r0, r3, r0
	ldr	r1, [r4, #0x24]
	mul	r0, r0, r1
	asr	r0, r0, #0xc
	str	r0, [r4, #0x14]
	b	.L11
.L2:
	sub	r0, r1, #1
	strh	r0, [r4, #0x2c]
.L11:
	ldr	r0, [r4, #0x30]
	bl	sub_804A908
	add	r4, r4, #0x34
.L1:
	add	r0, r7, #0
	sub	r7, r7, #0x1
	cmp	r0, #0
	bne	.L12	@cond_branch
	ldr	r0, [r6, #0x10]
	ldr	r1, [r6, #0x1c]
	add	r0, r0, r1
	str	r0, [r6, #0x10]
	ldr	r0, [r6, #0x14]
	ldr	r1, [r6, #0x20]
	add	r0, r0, r1
	str	r0, [r6, #0x14]
	ldr	r0, [r6, #0x18]
	ldr	r1, [r6, #0x24]
	add	r0, r0, r1
	str	r0, [r6, #0x18]
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
	thumb_func_end sub_804C208

.align 2, 0 @ Don't pad with nop.
