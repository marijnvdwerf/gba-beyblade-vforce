	.include "asm/common.inc"

	thumb_func_start initTutorialManagement
initTutorialManagement:
	push	{r4, r5, r6, r7, lr}
	mov	r7, r8
	push	{r7}
	add	sp, sp, #0xfffffed8
	add	r4, r0, #0
	lsl	r4, r4, #0x10
	lsr	r4, r4, #0x10
	ldr	r0, .L4
	ldr	r0, [r0]
	ldr	r1, .L4 + 4
	add	r7, r0, r1
	add	r1, r1, #0x4
	add	r5, r0, r1
	add	r0, r4, #0
	bl	loadLevelGeometry
	mov	r8, r0
	add	r0, r4, #0
	bl	getLevelMetadata
	add	r4, r0, #0
	bl	sub_8051734
	mov	r6, #0x0
	ldr	r0, .L4 + 8
	mov	r2, #0xa0
	lsl	r2, r2, #0x1
	ldr	r3, [r0]
	mov	r0, #0x0
	add	r1, r7, #0
	bl	call_via_r3
	cmp	r4, #0
	beq	.L2	@cond_branch
	mov	r0, r8
	cmp	r0, #0
	beq	.L2	@cond_branch
	add	r0, sp, #0xc
	mov	r1, r8
	bl	getLevelGeometryAddresses
	add	r0, sp, #0xc
	add	r1, r4, #0
	bl	StoreMetadataAddr
	mov	r4, #0x0
	b	.L7
.L5:
	.align	2, 0
.L4:
	.4byte	0x3000fb0
	.4byte	0x13fc
	.4byte	0x807d970
.L9:
	add	r4, r4, #0x1
	cmp	r1, #0
	beq	.L7	@cond_branch
	add	r0, sp, #0xc
	mov	r2, #0x1
	ldr	r3, .L10
	bl	getLineMetaobjectByTypeAndId
	cmp	r0, #0
	beq	.L7	@cond_branch
	str	r4, [r5]
	ldr	r1, [r0, #0x8]
	mov	r0, #0xb4
	mul	r0, r0, r1
	ldr	r1, .L10 + 4
	add	r0, r0, r1
	str	r0, [r5, #0x4]
	add	r6, r6, #0x1
	add	r5, r5, #0x8
.L7:
	ldr	r0, [sp, #0xc]
	ldr	r0, [r0, #0x8]
	cmp	r4, r0
	bge	.L8	@cond_branch
	add	r0, sp, #0xc
	add	r1, r4, #0
	bl	GetLineMetaData
	add	r1, r0, #0
	cmp	r6, #0x1f
	ble	.L9	@cond_branch
	ldr	r0, .L10 + 8
	bl	printf
.L8:
	mov	r1, #0x82
	lsl	r1, r1, #0x1
	add	r0, r7, r1
	mov	r4, #0x0
	str	r4, [r0]
	str	r6, [r7]
	add	r1, r1, #0x4
	add	r0, r7, r1
	ldr	r1, .L10 + 12
	ldr	r2, .L10 + 16
	mov	r3, #0x73
	str	r3, [sp]
	mov	r3, #0xba
	str	r3, [sp, #0x4]
	str	r4, [sp, #0x8]
	mov	r3, #0x24
	bl	allocFont
	mov	r1, #0x9c
	lsl	r1, r1, #0x1
	add	r0, r7, r1
	str	r4, [r0]
	add	r1, r1, #0x4
	add	r0, r7, r1
	str	r4, [r0]
.L2:
	add	sp, sp, #0x128
	pop	{r3}
	mov	r8, r3
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L11:
	.align	2, 0
.L10:
	.4byte	0x8cec
	.4byte	0x806cfe0
	.4byte	0x87233e8
	.4byte	0x82b05ec
	.4byte	0x8067ae0
	thumb_func_end initTutorialManagement

.align 2, 0 @ Don't pad with nop.
