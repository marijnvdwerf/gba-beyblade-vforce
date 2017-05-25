	.include "asm/common.inc"

	thumb_func_start initEventListeners
initEventListeners:
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	add	sp, sp, #0xfffffee4
	mov	r7, sp
	add	r4, r0, #0
	mov	r9, sp
	lsl	r4, r4, #0x10
	lsr	r4, r4, #0x10
	add	r0, r4, #0
	bl	loadLevelGeometry
	add	r5, r0, #0
	add	r0, r4, #0
	bl	getLevelMetadata
	add	r4, r0, #0
	mov	r0, #0x0
	mov	sl, r0
	mov	r6, #0x20
	add	sp, sp, #0xffffff80
	mov	r8, sp
	ldr	r0, .L10
	ldr	r0, [r0]
	ldr	r2, .L10 + 4
	add	r1, r0, r2
	mov	r2, sl
	str	r2, [r1]
	mov	r2, #0xca
	lsl	r2, r2, #0x4
	add	r1, r0, r2
	mov	r2, sl
	str	r2, [r1]
	ldr	r1, .L10 + 8
	add	r0, r0, r1
	str	r2, [r0]
	cmp	r4, #0
	beq	.L8	@cond_branch
	cmp	r5, #0
	beq	.L8	@cond_branch
	add	r0, r7, #0
	add	r1, r5, #0
	bl	getLevelGeometryAddresses
	add	r0, r7, #0
	add	r1, r4, #0
	bl	StoreMetadataAddr
	mov	r4, #0x0
	ldr	r0, [r7]
	ldr	r0, [r0, #0x8]
	cmp	sl, r0
	bge	.L3	@cond_branch
	mov	r5, sp
.L7:
	add	r0, r7, #0
	add	r1, r4, #0
	bl	GetLineMetaData
	add	r1, r0, #0
	cmp	r1, #0
	beq	.L6	@cond_branch
	add	r0, r7, #0
	mov	r2, #0x7
	bl	getLineMetaObjectBytype
	cmp	r0, #0
	beq	.L6	@cond_branch
	stmia	r5!, {r4}
	mov	r2, #0x1
	ADD sl, r2
	cmp	sl, r6
	ble	.L6	@cond_branch
	ldr	r0, .L10 + 12
	add	r1, r6, #0
	bl	printf
.L6:
	add	r4, r4, #0x1
	ldr	r0, [r7]
	ldr	r0, [r0, #0x8]
	cmp	r4, r0
	blt	.L7	@cond_branch
.L3:
	mov	r0, sl
	cmp	r0, #0
	beq	.L8	@cond_branch
	mov	r1, sl
	lsl	r5, r1, #0x2
	add	r0, r5, #0
	bl	slowAllocate
	add	r6, r0, #0
	cmp	r6, #0
	bne	.L9	@cond_branch
	ldr	r0, .L10 + 16
	add	r1, r5, #0
	bl	printf
.L9:
	ldr	r4, [r6]
	ldr	r0, .L10 + 20
	ldr	r3, [r0]
	mov	r0, r8
	add	r1, r4, #0
	add	r2, r5, #0
	bl	call_via_r3
	ldr	r0, .L10
	ldr	r0, [r0]
	mov	r2, #0xca
	lsl	r2, r2, #0x4
	add	r1, r0, r2
	str	r6, [r1]
	add	r2, r2, #0x4
	add	r1, r0, r2
	str	r4, [r1]
	ldr	r1, .L10 + 8
	add	r0, r0, r1
	mov	r2, sl
	str	r2, [r0]
	mov	r0, #0x0
	bl	SetRiderGlobal
.L8:
	mov	sp, r9
	add	sp, sp, #0x11c
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L11:
	.align	2, 0
.L10:
	.4byte	0x3000fb0
	.4byte	0xca4
	.4byte	0xca8
	.4byte	0x8729658
	.4byte	0x87296a4
	.4byte	0x807d974
	thumb_func_end initEventListeners

.align 2, 0 @ Don't pad with nop.
