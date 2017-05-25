	.include "asm/common.inc"

	thumb_func_start initCollectables
initCollectables:
	push	{r4, r5, r6, r7, lr}
	mov	r7, r9
	mov	r6, r8
	push	{r6, r7}
	add	sp, sp, #0xfffffee4
	add	r4, r0, #0
	lsl	r4, r4, #0x10
	lsr	r4, r4, #0x10
	ldr	r0, .L4
	ldr	r0, [r0]
	mov	r9, r0
	ldr	r0, .L4 + 4
	ADD r0, r9
	mov	r8, r0
	add	r0, r4, #0
	bl	loadLevelGeometry
	add	r5, r0, #0
	add	r0, r4, #0
	bl	getLevelMetadata
	add	r4, r0, #0
	bl	sub_8051734
	add	r6, r0, #0
	mov	r7, #0x0
	ldr	r0, .L4 + 8
	mov	r2, #0x84
	lsl	r2, r2, #0x1
	ldr	r3, [r0]
	mov	r0, #0x0
	mov	r1, r8
	bl	call_via_r3
	cmp	r4, #0
	beq	.L2	@cond_branch
	cmp	r5, #0
	beq	.L2	@cond_branch
	mov	r0, sp
	add	r1, r5, #0
	bl	getLevelGeometryAddresses
	mov	r0, sp
	add	r1, r4, #0
	bl	StoreMetadataAddr
	ldr	r4, .L4 + 12
	ADD r4, r9
	mov	r5, #0x0
	add	r6, r6, #0x10
	mov	r9, r6
	b	.L3
.L5:
	.align	2, 0
.L4:
	.4byte	0x3000fb0
	.4byte	0x12f4
	.4byte	0x807d970
	.4byte	0x12f8
.L9:
	cmp	r1, #0
	beq	.L7	@cond_branch
	ldr	r3, .L10
	mov	r0, sp
	mov	r2, #0x3
	bl	getLineMetaobjectByTypeAndId
	cmp	r0, #0
	beq	.L7	@cond_branch
	str	r6, [r4]
	str	r5, [r4, #0x4]
	add	r7, r7, #0x1
	add	r4, r4, #0x8
.L7:
	add	r5, r5, #0x1
.L3:
	ldr	r0, [sp]
	ldr	r0, [r0, #0x8]
	cmp	r5, r0
	bge	.L8	@cond_branch
	lsl	r1, r5, #0x5
	ldr	r0, [sp, #0xc]
	add	r6, r0, r1
	mov	r0, sp
	add	r1, r5, #0
	bl	GetLineMetaData
	add	r1, r0, #0
	cmp	r7, #0x1f
	ble	.L9	@cond_branch
	ldr	r0, .L10 + 4
	bl	printf
.L8:
	mov	r0, r8
	str	r7, [r0]
	ldr	r0, .L10 + 8
	mov	r1, #0x82
	lsl	r1, r1, #0x1
	ADD r1, r8
	ldr	r3, [r0]
	mov	r0, r9
	mov	r2, #0x4
	bl	call_via_r3
.L2:
	add	sp, sp, #0x11c
	pop	{r3, r4}
	mov	r8, r3
	mov	r9, r4
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L11:
	.align	2, 0
.L10:
	.4byte	0x37ae
	.4byte	0x8729804
	.4byte	0x807d974
	thumb_func_end initCollectables

.align 2, 0 @ Don't pad with nop.
