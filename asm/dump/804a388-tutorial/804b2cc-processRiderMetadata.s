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
	bne	.L1	@cond_branch
	b	.L17
.L1:
	ldr	r3, .L18
	add	r0, r4, #0
	add	r1, r5, #0
	mov	r2, #0x1
	bl	getLineMetaobjectByTypeAndId
	add	r1, r0, #0
	cmp	r1, #0
	beq	.L3	@cond_branch
	ldr	r1, [r1, #0x8]
	mov	r2, #0x8a
	lsl	r2, r2, #0x2
	add	r0, r7, r2
	strh	r1, [r0]
.L3:
	ldr	r3, .L18 + 4
	add	r0, r4, #0
	add	r1, r5, #0
	mov	r2, #0x1
	bl	getLineMetaobjectByTypeAndId
	add	r1, r0, #0
	cmp	r1, #0
	beq	.L4	@cond_branch
	ldr	r1, [r1, #0x8]
	ldr	r2, .L18 + 8
	add	r0, r7, r2
	strh	r1, [r0]
.L4:
	ldr	r3, .L18 + 12
	add	r0, r4, #0
	add	r1, r5, #0
	mov	r2, #0x1
	bl	getLineMetaobjectByTypeAndId
	add	r1, r0, #0
	cmp	r1, #0
	beq	.L5	@cond_branch
	ldr	r1, [r1, #0x8]
	add	r0, r7, #0
	add	r0, r0, #0x52
	strh	r1, [r0]
	sub	r0, r0, #0x2
	strh	r1, [r0]
.L5:
	ldr	r3, .L18 + 16
	add	r0, r4, #0
	add	r1, r5, #0
	mov	r2, #0x1
	bl	getLineMetaobjectByTypeAndId
	add	r1, r0, #0
	cmp	r1, #0
	beq	.L6	@cond_branch
	mov	r2, #0x84
	lsl	r2, r2, #0x2
	add	r0, r7, r2
	ldr	r1, [r1, #0x8]
	add	r2, r1, #0
	mul	r2, r2, r1
	add	r1, r2, #0
	str	r1, [r0]
.L6:
	ldr	r3, .L18 + 20
	add	r0, r4, #0
	add	r1, r5, #0
	mov	r2, #0x1
	bl	getLineMetaobjectByTypeAndId
	add	r1, r0, #0
	cmp	r1, #0
	beq	.L7	@cond_branch
	ldr	r1, [r1, #0x8]
	mov	r2, #0x87
	lsl	r2, r2, #0x2
	add	r0, r7, r2
	strh	r1, [r0]
.L7:
	ldr	r3, .L18 + 24
	add	r0, r4, #0
	add	r1, r5, #0
	mov	r2, #0x1
	bl	getLineMetaobjectByTypeAndId
	add	r1, r0, #0
	cmp	r1, #0
	beq	.L8	@cond_branch
	ldr	r1, [r1, #0x8]
	ldr	r2, .L18 + 28
	add	r0, r7, r2
	strh	r1, [r0]
.L8:
	ldr	r3, .L18 + 32
	add	r0, r4, #0
	add	r1, r5, #0
	mov	r2, #0x3
	bl	getLineMetaobjectByTypeAndId
	add	r1, r0, #0
	cmp	r1, #0
	beq	.L10	@cond_branch
	ldrh	r1, [r1, #0x8]
	mov	ip, r1
	mov	r2, #0x0
	ldr	r1, [r4]
	ldr	r0, [r1, #0x4]
	cmp	r2, r0
	bge	.L10	@cond_branch
	mov	r0, #0x86
	lsl	r0, r0, #0x2
	add	r6, r7, r0
	add	r3, r1, #0
	add	r1, r4, #0
	add	r1, r1, #0x14
.L12:
	ldr	r0, [r1]
	ldrh	r0, [r0, #0xc]
	cmp	r0, ip
	bne	.L11	@cond_branch
	strh	r2, [r6]
.L11:
	add	r1, r1, #0x4
	add	r2, r2, #0x1
	ldr	r0, [r3, #0x4]
	cmp	r2, r0
	blt	.L12	@cond_branch
.L10:
	ldr	r3, .L18 + 36
	add	r0, r4, #0
	add	r1, r5, #0
	mov	r2, #0x1
	bl	getLineMetaobjectByTypeAndId
	add	r1, r0, #0
	cmp	r1, #0
	beq	.L13	@cond_branch
	ldr	r1, [r1, #0x8]
	ldr	r2, .L18 + 40
	add	r0, r7, r2
	strh	r1, [r0]
.L13:
	ldr	r3, .L18 + 44
	add	r0, r4, #0
	add	r1, r5, #0
	mov	r2, #0x1
	bl	getLineMetaobjectByTypeAndId
	add	r1, r0, #0
	cmp	r1, #0
	beq	.L14	@cond_branch
	add	r0, r7, #0
	mov	r1, #0x8
	bl	SetRiderFlag
.L14:
	ldr	r3, .L18 + 48
	add	r0, r4, #0
	add	r1, r5, #0
	mov	r2, #0x1
	bl	getLineMetaobjectByTypeAndId
	add	r1, r0, #0
	cmp	r1, #0
	beq	.L15	@cond_branch
	ldr	r1, [r1, #0x8]
	ldr	r0, .L18 + 52
	ADD r0, r8
	strh	r1, [r0]
.L15:
	ldr	r3, .L18 + 56
	add	r0, r4, #0
	add	r1, r5, #0
	mov	r2, #0x1
	bl	getLineMetaobjectByTypeAndId
	add	r1, r0, #0
	cmp	r1, #0
	beq	.L16	@cond_branch
	ldr	r1, [r1, #0x8]
	mov	r0, #0xf4
	lsl	r0, r0, #0x2
	ADD r0, r8
	strb	r1, [r0]
.L16:
	ldr	r3, .L18 + 60
	add	r0, r4, #0
	add	r1, r5, #0
	mov	r2, #0x1
	bl	getLineMetaobjectByTypeAndId
	add	r1, r0, #0
	cmp	r1, #0
	beq	.L17	@cond_branch
	ldr	r1, [r1, #0x8]
	mov	r2, #0x8b
	lsl	r2, r2, #0x2
	add	r0, r7, r2
	strh	r1, [r0]
.L17:
	pop	{r3}
	mov	r8, r3
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L19:
	.align	2, 0
.L18:
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
