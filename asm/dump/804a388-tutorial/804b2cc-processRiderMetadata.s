	.include "asm/common.inc"

	thumb_func_start processRiderMetadata
processRiderMetadata:
	push	{r4, r5, r6, r7, lr}
	mov	r7, r8
	push	{r7}
	mov	r8, r0
	add	r4, r1, #0
	add	r1, r2, #0
	mov	r7, r8
	add	r0, r4, #0
	bl	GetLineMetaData
	add	r5, r0, #0
	cmp	r5, #0
	bne	.L804B2E8	@cond_branch
	b	.L804B45A
.L804B2E8:
	ldr	r3, .L804B464
	add	r0, r4, #0
	add	r1, r5, #0
	mov	r2, #0x1
	bl	getLineMetaobjectByTypeAndId
	add	r1, r0, #0
	cmp	r1, #0
	beq	.L804B304	@cond_branch
	ldr	r1, [r1, #0x8]
	mov	r2, #0x8a
	lsl	r2, r2, #0x2
	add	r0, r7, r2
	strh	r1, [r0]
.L804B304:
	ldr	r3, .L804B464 + 4
	add	r0, r4, #0
	add	r1, r5, #0
	mov	r2, #0x1
	bl	getLineMetaobjectByTypeAndId
	add	r1, r0, #0
	cmp	r1, #0
	beq	.L804B31E	@cond_branch
	ldr	r1, [r1, #0x8]
	ldr	r2, .L804B464 + 8
	add	r0, r7, r2
	strh	r1, [r0]
.L804B31E:
	ldr	r3, .L804B464 + 12
	add	r0, r4, #0
	add	r1, r5, #0
	mov	r2, #0x1
	bl	getLineMetaobjectByTypeAndId
	add	r1, r0, #0
	cmp	r1, #0
	beq	.L804B33C	@cond_branch
	ldr	r1, [r1, #0x8]
	add	r0, r7, #0
	add	r0, r0, #0x52
	strh	r1, [r0]
	sub	r0, r0, #0x2
	strh	r1, [r0]
.L804B33C:
	ldr	r3, .L804B464 + 16
	add	r0, r4, #0
	add	r1, r5, #0
	mov	r2, #0x1
	bl	getLineMetaobjectByTypeAndId
	add	r1, r0, #0
	cmp	r1, #0
	beq	.L804B35E	@cond_branch
	mov	r2, #0x84
	lsl	r2, r2, #0x2
	add	r0, r7, r2
	ldr	r1, [r1, #0x8]
	add	r2, r1, #0
	mul	r2, r2, r1
	add	r1, r2, #0
	str	r1, [r0]
.L804B35E:
	ldr	r3, .L804B464 + 20
	add	r0, r4, #0
	add	r1, r5, #0
	mov	r2, #0x1
	bl	getLineMetaobjectByTypeAndId
	add	r1, r0, #0
	cmp	r1, #0
	beq	.L804B37A	@cond_branch
	ldr	r1, [r1, #0x8]
	mov	r2, #0x87
	lsl	r2, r2, #0x2
	add	r0, r7, r2
	strh	r1, [r0]
.L804B37A:
	ldr	r3, .L804B464 + 24
	add	r0, r4, #0
	add	r1, r5, #0
	mov	r2, #0x1
	bl	getLineMetaobjectByTypeAndId
	add	r1, r0, #0
	cmp	r1, #0
	beq	.L804B394	@cond_branch
	ldr	r1, [r1, #0x8]
	ldr	r2, .L804B464 + 28
	add	r0, r7, r2
	strh	r1, [r0]
.L804B394:
	ldr	r3, .L804B464 + 32
	add	r0, r4, #0
	add	r1, r5, #0
	mov	r2, #0x3
	bl	getLineMetaobjectByTypeAndId
	add	r1, r0, #0
	cmp	r1, #0
	beq	.L804B3D4	@cond_branch
	ldrh	r1, [r1, #0x8]
	mov	ip, r1
	mov	r2, #0x0
	ldr	r1, [r4]
	ldr	r0, [r1, #0x4]
	cmp	r2, r0
	bge	.L804B3D4	@cond_branch
	mov	r0, #0x86
	lsl	r0, r0, #0x2
	add	r6, r7, r0
	add	r3, r1, #0
	add	r1, r4, #0
	add	r1, r1, #0x14
.L804B3C0:
	ldr	r0, [r1]
	ldrh	r0, [r0, #0xc]
	cmp	r0, ip
	bne	.L804B3CA	@cond_branch
	strh	r2, [r6]
.L804B3CA:
	add	r1, r1, #0x4
	add	r2, r2, #0x1
	ldr	r0, [r3, #0x4]
	cmp	r2, r0
	blt	.L804B3C0	@cond_branch
.L804B3D4:
	ldr	r3, .L804B464 + 36
	add	r0, r4, #0
	add	r1, r5, #0
	mov	r2, #0x1
	bl	getLineMetaobjectByTypeAndId
	add	r1, r0, #0
	cmp	r1, #0
	beq	.L804B3EE	@cond_branch
	ldr	r1, [r1, #0x8]
	ldr	r2, .L804B464 + 40
	add	r0, r7, r2
	strh	r1, [r0]
.L804B3EE:
	ldr	r3, .L804B464 + 44
	add	r0, r4, #0
	add	r1, r5, #0
	mov	r2, #0x1
	bl	getLineMetaobjectByTypeAndId
	add	r1, r0, #0
	cmp	r1, #0
	beq	.L804B408	@cond_branch
	add	r0, r7, #0
	mov	r1, #0x8
	bl	SetRiderFlag
.L804B408:
	ldr	r3, .L804B464 + 48
	add	r0, r4, #0
	add	r1, r5, #0
	mov	r2, #0x1
	bl	getLineMetaobjectByTypeAndId
	add	r1, r0, #0
	cmp	r1, #0
	beq	.L804B422	@cond_branch
	ldr	r1, [r1, #0x8]
	ldr	r0, .L804B464 + 52
	ADD r0, r8
	strh	r1, [r0]
.L804B422:
	ldr	r3, .L804B464 + 56
	add	r0, r4, #0
	add	r1, r5, #0
	mov	r2, #0x1
	bl	getLineMetaobjectByTypeAndId
	add	r1, r0, #0
	cmp	r1, #0
	beq	.L804B43E	@cond_branch
	ldr	r1, [r1, #0x8]
	mov	r0, #0xf4
	lsl	r0, r0, #0x2
	ADD r0, r8
	strb	r1, [r0]
.L804B43E:
	ldr	r3, .L804B464 + 60
	add	r0, r4, #0
	add	r1, r5, #0
	mov	r2, #0x1
	bl	getLineMetaobjectByTypeAndId
	add	r1, r0, #0
	cmp	r1, #0
	beq	.L804B45A	@cond_branch
	ldr	r1, [r1, #0x8]
	mov	r2, #0x8b
	lsl	r2, r2, #0x2
	add	r0, r7, r2
	strh	r1, [r0]
.L804B45A:
	pop	{r3}
	mov	r8, r3
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L804B464:
	.align	2, 0

	.4byte	0xd368
	.4byte	0x6ace
	.4byte	0x22a
	.4byte	0x5bbe
	.4byte	0x215d
	.4byte	0x3ab4
	.4byte	0x505b
	.4byte	0x222
	.4byte	0x59c3
	.4byte	0xcf2c
	.4byte	0x21a
	.4byte	0xd271
	.4byte	0x37ae
	.4byte	0x424
	.4byte	0xf0f8
	.4byte	0x5cf
	thumb_func_end processRiderMetadata

.align 2, 0 @ Don't pad with nop.
