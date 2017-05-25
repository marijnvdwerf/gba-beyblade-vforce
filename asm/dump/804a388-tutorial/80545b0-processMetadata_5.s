	.include "asm/common.inc"

	thumb_func_start processMetadata_5
processMetadata_5:
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	mov	r8, r0
	add	r0, r2, #0
	bl	GetStruct4
	ldr	r7, [r0]
	mov	r4, #0x0
	cmp	r7, #0
	beq	.L11	@cond_branch
	mov	r2, #0x0
	mov	r1, r8
	ldr	r0, [r1]
	ldr	r1, [r0, #0x4]
	add	r5, r0, #0
	cmp	r4, r1
	bge	.L5	@cond_branch
	mov	r3, r8
	ldr	r1, [r3, #0x14]
	ldr	r3, [sp, #0x20]
	ldrh	r0, [r3, #0x4]
	add	r3, r0, #0
	ldrh	r0, [r1, #0xc]
	cmp	r0, r3
	bne	.L6	@cond_branch
	add	r4, r1, #0
	b	.L4
.L6:
	add	r2, r2, #0x1
	ldr	r0, [r5, #0x4]
	cmp	r2, r0
	bge	.L5	@cond_branch
	lsl	r1, r2, #0x2
	mov	r0, r8
	add	r0, r0, #0x14
	add	r0, r0, r1
	ldr	r0, [r0]
	ldrh	r1, [r0, #0xc]
	cmp	r1, r3
	bne	.L6	@cond_branch
	add	r4, r0, #0
.L4:
	mov	sl, r2
.L5:
	cmp	r4, #0
	bne	.L7	@cond_branch
	ldr	r0, .L9
	bl	printf
	b	.L11
.L10:
	.align	2, 0
.L9:
	.4byte	0x87296e8
.L7:
	ldr	r3, [sp, #0x20]
	ldr	r3, [r3, #0x10]
	mov	r9, r3
	mov	r0, r8
	mov	r1, sl
	mov	r2, r9
	bl	GetPointAtSplineIndex
	add	r1, r0, #0
	cmp	r1, #0
	beq	.L11	@cond_branch
	ldr	r6, [r1]
	lsl	r6, r6, #0x5
	ldr	r0, [r7, #0x4]
	sub	r6, r6, r0
	ldr	r5, [r1, #0x4]
	lsl	r5, r5, #0x5
	ldr	r0, [r7, #0x8]
	sub	r5, r5, r0
	ldr	r4, [r1, #0x8]
	lsl	r4, r4, #0x5
	ldr	r0, [r7, #0xc]
	sub	r4, r4, r0
	mov	r0, r9
	lsl	r3, r0, #0xa
	mov	r0, r8
	add	r1, r7, #0
	mov	r2, sl
	bl	sub_805C3BC
	ldr	r1, [sp, #0x20]
	ldr	r0, [r1, #0xc]
	str	r0, [r7, #0x40]
	add	r0, r7, #0
	mov	r1, #0xa
	bl	actor_80585F0
	asr	r6, r6, #0x8
	add	r0, r7, #0
	add	r0, r0, #0x9a
	strh	r6, [r0]
	asr	r5, r5, #0x8
	add	r0, r0, #0x2
	strh	r5, [r0]
	asr	r4, r4, #0x8
	add	r0, r0, #0x2
	strh	r4, [r0]
.L11:
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
	thumb_func_end processMetadata_5

.align 2, 0 @ Don't pad with nop.
