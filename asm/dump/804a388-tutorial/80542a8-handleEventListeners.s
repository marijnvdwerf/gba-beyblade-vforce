	.include "asm/common.inc"

	thumb_func_start handleEventListeners
handleEventListeners:
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	add	sp, sp, #0xffffffec
	str	r0, [sp, #0x4]
	lsl	r1, r1, #0x10
	lsr	r1, r1, #0x10
	str	r1, [sp, #0x8]
	ldr	r0, .L8054328
	ldr	r0, [r0]
	ldr	r2, .L8054328 + 4
	add	r1, r0, r2
	ldr	r4, [r1]
	ldr	r1, .L8054328 + 8
	add	r0, r0, r1
	ldr	r0, [r0]
	mov	r8, r0
	cmp	r0, #0
	beq	.L8054372	@cond_branch
	mov	r2, #0x1
	NEG	r2, r2
	ADD r8, r2
.L80542D8:
	ldr	r0, [r4]
	mov	sl, r0
	ldr	r0, [sp, #0x4]
	mov	r1, sl
	bl	GetLineMetaData
	mov	r9, r0
	cmp	r0, #0
	beq	.L805431E	@cond_branch
	ldr	r0, [sp, #0x4]
	mov	r1, r9
	mov	r2, #0x7
	ldr	r3, [sp, #0x8]
	bl	getLineMetaobjectByTypeAndId
	add	r3, r0, #0
	cmp	r3, #0
	beq	.L805431E	@cond_branch
	mov	r1, sl
	lsl	r0, r1, #0x5
	ldr	r2, [sp, #0x4]
	ldr	r1, [r2, #0xc]
	add	r1, r1, r0
	str	r1, [sp, #0xc]
	mov	r0, #0x8
	ldsh	r2, [r3, r0]
	mov	r1, #0xa
	ldsh	r6, [r3, r1]
	ldr	r0, [sp, #0x4]
	mov	r1, r9
	bl	getLineMetaAtIndex
	add	r5, r0, #0
	cmp	r5, #0
	bne	.L8054334	@cond_branch
.L805431E:
	add	r4, r4, #0x4
	mov	r7, r8
	sub	r7, r7, #0x1
	b	.L805436A
.L8054326:
	.align	2, 0
.L8054328:
	.4byte	0x3000fb0
	.4byte	0xca4
	.4byte	0xca8
.L8054334:
	add	r0, r6, #0
	sub	r6, r6, #0x1
	mov	r7, r8
	sub	r7, r7, #0x1
	add	r4, r4, #0x4
	str	r4, [sp, #0x10]
	cmp	r0, #0
	beq	.L8054368	@cond_branch
.L8054344:
	ldrh	r2, [r5, #0x2]
	lsl	r0, r2, #0x2
	ldr	r1, .L8054384
	add	r0, r0, r1
	str	r5, [sp]
	ldr	r4, [r0]
	ldr	r0, [sp, #0x4]
	ldr	r1, [sp, #0xc]
	mov	r2, sl
	mov	r3, r9
	bl	_call_via_r4
	ldrh	r2, [r5]
	add	r5, r2, r5
	add	r0, r6, #0
	sub	r6, r6, #0x1
	cmp	r0, #0
	bne	.L8054344	@cond_branch
.L8054368:
	ldr	r4, [sp, #0x10]
.L805436A:
	mov	r0, r8
	mov	r8, r7
	cmp	r0, #0
	bne	.L80542D8	@cond_branch
.L8054372:
	add	sp, sp, #0x14
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L8054382:
	.align	2, 0
.L8054384:
	.4byte	0x8078990
	thumb_func_end handleEventListeners

.align 2, 0 @ Don't pad with nop.
