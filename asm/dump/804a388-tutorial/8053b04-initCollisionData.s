	.include "asm/common.inc"

	thumb_func_start initCollisionData
initCollisionData:
	push	{r4, r5, r6, r7, lr}
	mov	r7, r8
	push	{r7}
	add	sp, sp, #0xfffffff8
	bl	GetLevelDescriptionNo
	add	r4, r0, #0
	lsl	r4, r4, #0x10
	lsr	r4, r4, #0x10
	bl	getSomeLevelID
	lsl	r0, r0, #0x10
	lsr	r0, r0, #0x10
	bl	getLevelMetadata
	add	r7, r0, #0
	bl	getLevelDescription2
	mov	r8, r0
	ldr	r1, .L2
	lsl	r4, r4, #0x10
	asr	r4, r4, #0x10
	lsl	r0, r4, #0x5
	add	r0, r0, r4
	lsl	r0, r0, #0x2
	add	r1, r1, #0x80
	add	r0, r0, r1
	ldr	r1, [r0]
	ldr	r4, .L2 + 4
	ldr	r0, [r4]
	ldr	r5, .L2 + 8
	add	r6, r0, r5
	cmp	r1, #0
	beq	.L1	@cond_branch
	add	r0, r6, #0
	mov	r2, #0x3
	bl	newCollisionDataRam
.L1:
	ldr	r0, [r4]
	add	r0, r0, r5
	add	r1, r7, #0
	bl	StoreMetadataAddr
	ldr	r0, [r4]
	ldr	r1, .L2 + 12
	add	r0, r0, r1
	mov	r1, r8
	ldrh	r2, [r1, #0xc]
	mov	r3, #0x80
	lsl	r3, r3, #0x3
	mov	r1, #0x80
	str	r1, [sp]
	mov	r1, #0x20
	str	r1, [sp, #0x4]
	add	r1, r6, #0
	bl	initQuadTree
	add	sp, sp, #0x8
	pop	{r3}
	mov	r8, r3
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L3:
	.align	2, 0
.L2:
	.4byte	0x806b300
	.4byte	0x3000fb0
	.4byte	0x65c
	.4byte	0x7a4
	thumb_func_end initCollisionData

.align 2, 0 @ Don't pad with nop.
