	.include "asm/common.inc"

	thumb_func_start initLevelEnvironmentActors
initLevelEnvironmentActors:
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	ldr	r4, .L8054A4C
	ADD sp, r4
	add	r4, r0, #0
	lsl	r4, r4, #0x10
	lsr	r4, r4, #0x10
	ldr	r0, .L8054A4C + 4
	ldr	r7, [r0]
	ldr	r0, .L8054A4C + 8
	add	r0, r7, r0
	str	r0, [sp, #0x238]
	add	r0, r4, #0
	bl	loadLevelGeometry
	add	r5, r0, #0
	add	r0, r4, #0
	bl	getLevelMetadata
	add	r6, r0, #0
	mov	r1, #0x0
	str	r1, [sp, #0x240]
	mov	r2, #0x0
	str	r2, [sp, #0x244]
	cmp	r6, #0
	bne	.L80547A4	@cond_branch
	b	.L8054C84
.L80547A4:
	cmp	r5, #0
	bne	.L80547AA	@cond_branch
	b	.L8054C84
.L80547AA:
	add	r4, sp, #0x110
	add	r0, r4, #0
	add	r1, r5, #0
	bl	getLevelGeometryAddresses
	add	r0, r4, #0
	add	r1, r6, #0
	bl	StoreMetadataAddr
	mov	r3, #0xc9
	lsl	r3, r3, #0x4
	add	r0, r7, r3
	ldr	r3, .L8054A4C + 12
	ldr	r1, [sp, #0x240]
	str	r1, [sp]
	mov	r1, #0x0
	mov	r2, #0x0
	bl	sub_805E514
	add	r0, sp, #0x22c
	ldr	r2, .L8054A4C + 16
	ldr	r3, .L8054A4C + 20
	mov	r1, #0x0
	bl	sub_805E50C
	mov	r2, #0x0
	str	r2, [sp, #0x23c]
	ldr	r0, [r4]
	ldr	r0, [r0, #0x8]
	ldr	r3, [sp, #0x240]
	cmp	r3, r0
	bge	.L8054848	@cond_branch
	add	r4, sp, #0x110
	add	r6, sp, #0x10
.L80547EE:
	add	r0, r4, #0
	ldr	r1, [sp, #0x23c]
	bl	GetLineMetaData
	mov	r8, r0
	cmp	r0, #0
	beq	.L805483A	@cond_branch
	add	r0, r4, #0
	mov	r1, r8
	mov	r2, #0x2
	ldr	r3, .L8054A4C + 24
	bl	getLineMetaobjectByTypeAndId
	add	r5, r0, #0
	cmp	r5, #0
	beq	.L805483A	@cond_branch
	ldr	r0, [r5, #0x8]
	ldr	r2, [sp, #0x240]
	lsl	r1, r2, #0x2
	stmia	r6!, {r0}
	add	r0, sp, #0x90
	add	r0, r0, r1
	ldr	r3, [sp, #0x23c]
	str	r3, [r0]
	add	r2, r2, #0x1
	str	r2, [sp, #0x240]
	add	r0, r4, #0
	mov	r1, r8
	mov	r2, #0x1
	ldr	r3, .L8054A4C + 28
	bl	getLineMetaobjectByTypeAndId
	add	r5, r0, #0
	cmp	r5, #0
	beq	.L805483A	@cond_branch
	ldr	r0, [sp, #0x244]
	add	r0, r0, #0x1
	str	r0, [sp, #0x244]
.L805483A:
	ldr	r1, [sp, #0x23c]
	add	r1, r1, #0x1
	str	r1, [sp, #0x23c]
	ldr	r0, [r4]
	ldr	r0, [r0, #0x8]
	cmp	r1, r0
	blt	.L80547EE	@cond_branch
.L8054848:
	ldr	r2, [sp, #0x238]
	ldr	r4, [r2]
	cmp	r4, #0
	beq	.L8054856	@cond_branch
	add	r0, r4, #0
	bl	deallocateBlock
.L8054856:
	mov	r0, #0xc4
	ldr	r1, [sp, #0x240]
	add	r3, r1, #0
	mul	r3, r3, r0
	mov	r9, r3
	mov	r2, #0x88
	lsl	r2, r2, #0x1
	ADD r2, sp
	str	r2, [sp, #0x258]
	ldr	r2, [r2]
	ldr	r1, [r2, #0x8]
	mov	r0, #0x4c
	add	r3, r1, #0
	mul	r3, r3, r0
	mov	r8, r3
	ldr	r1, [sp, #0x244]
	lsl	r0, r1, #0x3
	sub	r0, r0, r1
	lsl	r5, r0, #0x2
	ldr	r0, [r2, #0x4]
	lsl	r0, r0, #0x3
	mov	sl, r0
	mov	r0, r9
	ADD r0, r8
	add	r0, r0, r5
	mov	r2, sl
	add	r6, r0, r2
	add	r0, r6, #0
	bl	slowAllocate
	add	r4, r0, #0
	ldr	r3, [sp, #0x238]
	str	r4, [r3]
	ldr	r0, [sp, #0x240]
	str	r0, [r3, #0x10]
	cmp	r4, #0
	bne	.L80548A8	@cond_branch
	ldr	r0, .L8054A4C + 32
	add	r1, r6, #0
	bl	printf
.L80548A8:
	ldr	r7, [r4]
	ldr	r1, [sp, #0x238]
	str	r7, [r1, #0x8]
	mov	r2, r9
	add	r2, r7, r2
	str	r2, [sp, #0x248]
	ADD r2, r8
	str	r2, [sp, #0x24c]
	add	r2, r2, r5
	mov	r9, r2
	ldr	r3, [sp, #0x248]
	str	r3, [r1, #0x14]
	str	r2, [r1, #0x18]
	ldr	r0, [sp, #0x24c]
	str	r0, [r1, #0x4]
	ldr	r2, [sp, #0x244]
	str	r2, [r1, #0xc]
	ldr	r0, .L8054A4C + 36
	mov	r3, r8
	add	r2, r3, r5
	ADD r2, sl
	ldr	r3, [r0]
	mov	r0, #0x0
	ldr	r1, [sp, #0x248]
	bl	_call_via_r3
	mov	r0, #0x0
	str	r0, [sp, #0x23c]
	ldr	r1, [sp, #0x258]
	ldr	r0, [r1]
	ldr	r0, [r0, #0x8]
	ldr	r2, [sp, #0x23c]
	cmp	r2, r0
	bge	.L8054932	@cond_branch
	add	r6, sp, #0x110
.L80548EE:
	ldr	r3, [sp, #0x23c]
	lsl	r1, r3, #0x5
	ldr	r0, [r6, #0xc]
	add	r4, r0, r1
	add	r0, r6, #0
	add	r1, r3, #0
	bl	GetLineMetaData
	mov	r8, r0
	cmp	r0, #0
	beq	.L8054924	@cond_branch
	add	r0, r6, #0
	mov	r1, r8
	mov	r2, #0x1
	ldr	r3, .L8054A4C + 40
	bl	getLineMetaobjectByTypeAndId
	add	r5, r0, #0
	cmp	r5, #0
	beq	.L8054924	@cond_branch
	ldr	r0, [r5, #0x8]
	lsl	r0, r0, #0x3
	ADD r0, r9
	str	r4, [r0, #0x4]
	add	r1, sp, #0x23c
	ldrh	r1, [r1]
	strh	r1, [r0]
.L8054924:
	ldr	r2, [sp, #0x23c]
	add	r2, r2, #0x1
	str	r2, [sp, #0x23c]
	ldr	r0, [r6]
	ldr	r0, [r0, #0x8]
	cmp	r2, r0
	blt	.L80548EE	@cond_branch
.L8054932:
	mov	r3, #0x0
	str	r3, [sp, #0x23c]
	ldr	r0, [sp, #0x240]
	cmp	r3, r0
	blt	.L805493E	@cond_branch
	b	.L8054C84
.L805493E:
	mov	r1, #0x88
	lsl	r1, r1, #0x1
	ADD r1, sp
	str	r1, [sp, #0x25c]
	mov	r2, #0x0
	str	r2, [sp, #0x260]
	add	r3, r7, #0
	add	r3, r3, #0x90
	str	r3, [sp, #0x264]
.L8054950:
	add	r6, sp, #0x90
	ldr	r0, [sp, #0x23c]
	lsl	r2, r0, #0x2
	add	r6, r6, r2
	ldr	r1, [r6]
	mov	r0, #0x4c
	mul	r0, r0, r1
	ldr	r3, [sp, #0x248]
	add	r0, r0, r3
	str	r7, [r0]
	mov	r9, r0
	lsl	r1, r1, #0x5
	ldr	r3, [sp, #0x25c]
	ldr	r0, [r3, #0xc]
	add	r4, r0, r1
	ldr	r0, [r4]
	lsl	r0, r0, #0x4
	ldr	r1, [r3, #0x4]
	add	r0, r1, r0
	str	r0, [sp, #0x250]
	ldr	r0, [r4, #0x4]
	lsl	r0, r0, #0x4
	add	r1, r1, r0
	str	r1, [sp, #0x254]
	mov	r0, #0x0
	mov	sl, r0
	ldr	r1, .L8054A4C + 4
	ldr	r0, [r1]
	ldr	r3, .L8054A4C + 44
	add	r4, r0, r3
	mov	r0, sp
	add	r0, r0, r2
	add	r0, r0, #0x10
	ldr	r1, [r0]
	ldr	r0, [sp, #0x250]
	ldr	r3, [r0]
	asr	r3, r3, #0x3
	ldr	r0, [r0, #0x4]
	asr	r0, r0, #0x3
	str	r0, [sp]
	ldr	r2, [sp, #0x250]
	ldr	r0, [r2, #0x8]
	asr	r0, r0, #0x3
	str	r0, [sp, #0x4]
	mov	r0, #0x1
	NEG	r0, r0
	str	r0, [sp, #0x8]
	add	r0, r7, #0
	add	r2, r4, #0
	bl	actor_8057C58
	add	r0, r7, #0
	add	r0, r0, #0x39
	mov	r3, sl
	strb	r3, [r0]
	ldr	r0, .L8054A4C + 48
	ldr	r1, [sp, #0x264]
	str	r0, [r1, #0x20]
	mov	r2, sl
	str	r2, [r7, #0x68]
	ldr	r3, [sp, #0x260]
	mov	r1, #0x80
	lsl	r1, r1, #0x2
	add	r0, r3, r1
	ldr	r2, [sp, #0x264]
	strh	r0, [r2, #0x2c]
	ldr	r0, [r6]
	str	r0, [r2, #0x24]
	ldr	r0, [sp, #0x238]
	add	r0, r0, #0x1c
	str	r0, [r2]
	ldr	r3, [sp, #0x250]
	ldr	r2, [r3]
	ldr	r1, [sp, #0x254]
	ldr	r0, [r1]
	add	r2, r2, r0
	lsl	r2, r2, #0x4
	ldr	r5, [r7, #0x4]
	ldr	r1, [r3, #0x4]
	ldr	r3, [sp, #0x254]
	ldr	r0, [r3, #0x4]
	add	r1, r1, r0
	lsl	r1, r1, #0x4
	ldr	r4, [r7, #0x8]
	sub	r5, r2, r5
	str	r2, [r7, #0x4]
	sub	r4, r1, r4
	str	r1, [r7, #0x8]
	add	r0, sp, #0x22c
	ldr	r1, [sp, #0x264]
	str	r0, [r1, #0x4]
	mov	r0, #0x1
	str	r0, [sp]
	add	r0, r7, #0
	mov	r1, #0x0
	mov	r2, #0x0
	mov	r3, #0x1
	bl	actor_80585F8
	add	r0, r7, #0
	ldr	r1, [sp, #0x25c]
	mov	r2, #0x0
	mov	r3, #0x0
	bl	actor_805C48C
	mov	r2, sl
	ldr	r3, [sp, #0x264]
	str	r2, [r3, #0x4]
	ldr	r0, [r7, #0x4]
	sub	r0, r0, r5
	str	r0, [r7, #0x4]
	ldr	r0, [r7, #0x8]
	sub	r0, r0, r4
	str	r0, [r7, #0x8]
	ldr	r1, [r6]
	ldr	r0, [sp, #0x25c]
	bl	GetLineMetaData
	mov	r8, r0
	cmp	r0, #0
	bne	.L8054A80	@cond_branch
	ldr	r0, [sp, #0x264]
	add	r0, r0, #0xc4
	str	r0, [sp, #0x264]
	b	.L8054C6E
.L8054A4A:
	.align	2, 0
.L8054A4C:
	.4byte	0xfffffd98
	.4byte	0x3000fb0
	.4byte	0xc74
	.4byte	sub_80550B8 + 1
	.4byte	sub_8056B54 + 1
	.4byte	_return_false + 1
	.4byte	0xd679
	.4byte	0xf4fa
	.4byte	0x8729738
	.4byte	0x807d970
	.4byte	0xaf90
	.4byte	0x434
	.4byte	convert3DCoordsto2DCoords + 1
.L8054A80:
	ldr	r0, [sp, #0x25c]
	mov	r1, r8
	mov	r2, #0x1
	ldr	r3, .L8054AB8
	bl	getLineMetaobjectByTypeAndId
	add	r5, r0, #0
	cmp	r5, #0
	beq	.L8054A96	@cond_branch
	ldr	r5, [r5, #0x8]
	mov	sl, r5
.L8054A96:
	mov	r1, sl
	lsl	r0, r1, #0x4
	ADD r0, sl
	lsl	r0, r0, #0x3
	ldr	r2, .L8054AB8 + 4
	add	r0, r0, r2
	ldr	r3, .L8054AB8 + 8
	ldr	r1, [r3]
	add	r4, r1, r0
	mov	r0, sl
	cmp	r0, #0x1
	beq	.L8054AC4	@cond_branch
	cmp	r0, #0x2
	beq	.L8054AC8	@cond_branch
	mov	r6, #0x0
	b	.L8054ACA
.L8054AB6:
	.align	2, 0
.L8054AB8:
	.4byte	0xf70c
	.4byte	0x434
	.4byte	0x3000fb0
.L8054AC4:
	mov	r6, #0x2
	b	.L8054ACA
.L8054AC8:
	mov	r6, #0x1
.L8054ACA:
	str	r4, [r7, #0x3c]
	mov	r1, #0x88
	lsl	r1, r1, #0x1
	ADD r1, sp
	mov	sl, r1
	mov	r0, sl
	mov	r1, r8
	mov	r2, #0x2
	ldr	r3, .L8054BC8
	bl	getLineMetaobjectByTypeAndId
	add	r5, r0, #0
	cmp	r5, #0
	beq	.L8054B34	@cond_branch
	ldr	r2, [sp, #0x260]
	mov	r3, #0x80
	lsl	r3, r3, #0x2
	add	r0, r2, r3
	lsl	r0, r0, #0x10
	lsr	r0, r0, #0x10
	bl	allocSprite
	add	r4, r0, #0
	ldr	r1, [r5, #0x8]
	mov	r0, #0x0
	str	r0, [sp]
	str	r6, [sp, #0x4]
	str	r0, [sp, #0x8]
	str	r0, [sp, #0xc]
	add	r0, r4, #0
	mov	r2, #0x0
	mov	r3, #0x0
	bl	LoadSpriteSheet
	mov	r1, r9
	str	r4, [r1, #0x4]
	mov	r2, #0x0
	str	r2, [r1, #0x8]
	str	r2, [r1, #0xc]
	mov	r0, sl
	mov	r1, r8
	mov	r2, #0x4
	ldr	r3, .L8054BC8
	bl	getLineMetaobjectByTypeAndId
	add	r5, r0, #0
	cmp	r5, #0
	beq	.L8054B34	@cond_branch
	ldr	r0, [r5, #0x8]
	mov	r3, r9
	str	r0, [r3, #0x8]
	ldr	r0, [r5, #0xc]
	str	r0, [r3, #0xc]
.L8054B34:
	add	r4, sp, #0x110
	add	r0, r4, #0
	mov	r1, r8
	mov	r2, #0x1
	ldr	r3, .L8054BC8 + 4
	bl	getLineMetaobjectByTypeAndId
	add	r5, r0, #0
	cmp	r5, #0
	beq	.L8054B7C	@cond_branch
	ldr	r1, [sp, #0x250]
	ldr	r0, [r1]
	ldr	r2, [sp, #0x254]
	ldr	r1, [r2]
	add	r0, r0, r1
	lsl	r0, r0, #0x4
	ldr	r3, [sp, #0x24c]
	str	r0, [r3, #0x4]
	ldr	r1, [sp, #0x250]
	ldr	r0, [r1, #0x4]
	ldr	r1, [r2, #0x4]
	add	r0, r0, r1
	lsl	r0, r0, #0x4
	str	r0, [r3, #0x8]
	mov	r2, r9
	ldrh	r2, [r2, #0x12]
	lsl	r0, r2, #0x8
	str	r0, [r3, #0xc]
	mov	r0, #0x0
	strh	r0, [r3, #0x12]
	strh	r0, [r3, #0x10]
	ldr	r0, .L8054BC8 + 8
	str	r0, [r3, #0x14]
	str	r7, [r3, #0x18]
	add	r3, r3, #0x1c
	str	r3, [sp, #0x24c]
.L8054B7C:
	add	r0, r4, #0
	mov	r1, r8
	mov	r2, #0x4
	ldr	r3, .L8054BC8 + 12
	bl	getLineMetaobjectByTypeAndId
	add	r5, r0, #0
	cmp	r5, #0
	beq	.L8054BAC	@cond_branch
	ldr	r1, [r5, #0x8]
	lsl	r1, r1, #0x8
	ldr	r0, [r7, #0x4]
	add	r0, r0, r1
	str	r0, [r7, #0x4]
	ldr	r1, [r5, #0xc]
	lsl	r1, r1, #0x8
	ldr	r0, [r7, #0x8]
	add	r0, r0, r1
	str	r0, [r7, #0x8]
	ldr	r1, [r5, #0x10]
	lsl	r1, r1, #0x8
	ldr	r0, [r7, #0xc]
	add	r0, r0, r1
	str	r0, [r7, #0xc]
.L8054BAC:
	add	r0, r4, #0
	mov	r1, r8
	mov	r2, #0x1
	ldr	r3, .L8054BC8 + 16
	bl	getLineMetaobjectByTypeAndId
	add	r5, r0, #0
	cmp	r5, #0
	beq	.L8054BDC	@cond_branch
	ldr	r0, [r5, #0x8]
	mov	r1, r9
	strh	r0, [r1, #0x3a]
	b	.L8054BE0
.L8054BC6:
	.align	2, 0
.L8054BC8:
	.4byte	0xfb93
	.4byte	0xf4fa
	.4byte	0x86faeac
	.4byte	0xd679
	.4byte	0xbf84
.L8054BDC:
	mov	r2, r9
	strh	r5, [r2, #0x3a]
.L8054BE0:
	add	r4, sp, #0x110
	add	r0, r4, #0
	mov	r1, r8
	mov	r2, #0xe
	ldr	r3, .L8054C98
	bl	getLineMetaobjectByTypeAndId
	add	r5, r0, #0
	cmp	r5, #0
	beq	.L8054C02	@cond_branch
	mov	r3, #0x8
	ldsh	r1, [r5, r3]
	mov	r0, #0xc
	ldsh	r2, [r5, r0]
	add	r0, r7, #0
	bl	ActorSetSpriteOffset
.L8054C02:
	add	r0, r4, #0
	mov	r1, r8
	mov	r2, #0xb
	bl	getLineMetaObjectBytype
	add	r5, r0, #0
	cmp	r5, #0
	beq	.L8054C1E	@cond_branch
	mov	r0, #0x1
	mov	r1, r9
	ldrh	r1, [r1, #0x10]
	orr	r0, r0, r1
	mov	r2, r9
	strh	r0, [r2, #0x10]
.L8054C1E:
	ldr	r1, [r7, #0x4]
	asr	r1, r1, #0x5
	ldr	r3, [sp, #0x250]
	ldr	r0, [r3]
	sub	r0, r0, r1
	mov	r1, r9
	str	r0, [r1, #0x14]
	ldr	r1, [r7, #0x8]
	asr	r1, r1, #0x5
	ldr	r0, [r3, #0x4]
	sub	r0, r0, r1
	mov	r2, r9
	str	r0, [r2, #0x18]
	ldr	r1, [r7, #0xc]
	asr	r1, r1, #0x5
	ldr	r0, [r3, #0x8]
	sub	r0, r0, r1
	str	r0, [r2, #0x1c]
	ldr	r1, [r7, #0x4]
	asr	r1, r1, #0x5
	ldr	r3, [sp, #0x254]
	ldr	r0, [r3]
	sub	r0, r0, r1
	str	r0, [r2, #0x20]
	ldr	r1, [r7, #0x8]
	asr	r1, r1, #0x5
	ldr	r0, [r3, #0x4]
	sub	r0, r0, r1
	str	r0, [r2, #0x24]
	ldr	r1, [r7, #0xc]
	asr	r1, r1, #0x5
	ldr	r0, [r3, #0x8]
	sub	r0, r0, r1
	str	r0, [r2, #0x28]
	mov	r0, #0x0
	strh	r0, [r2, #0x38]
	strh	r0, [r2, #0x3c]
	ldr	r1, [sp, #0x264]
	add	r1, r1, #0xc4
	str	r1, [sp, #0x264]
.L8054C6E:
	add	r7, r7, #0xc4
	ldr	r2, [sp, #0x260]
	add	r2, r2, #0x8
	str	r2, [sp, #0x260]
	ldr	r3, [sp, #0x23c]
	add	r3, r3, #0x1
	str	r3, [sp, #0x23c]
	ldr	r0, [sp, #0x240]
	cmp	r3, r0
	bge	.L8054C84	@cond_branch
	b	.L8054950
.L8054C84:
	mov	r3, #0x9a
	lsl	r3, r3, #0x2
	ADD sp, r3
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L8054C98:
	.align	2, 0

	.4byte	0xd679
	thumb_func_end initLevelEnvironmentActors

.align 2, 0 @ Don't pad with nop.
