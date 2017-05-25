	.include "asm/common.inc"

	thumb_func_start allocQuadTree
allocQuadTree:
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	add	sp, sp, #0xffffffe4
	add	r6, r0, #0
	str	r1, [sp, #0xc]
	ldr	r4, [sp, #0x3c]
	ldr	r0, [sp, #0x40]
	lsl	r2, r2, #0x10
	lsr	r2, r2, #0x10
	str	r2, [sp, #0x10]
	lsl	r3, r3, #0x10
	lsr	r3, r3, #0x10
	lsl	r4, r4, #0x10
	lsr	r4, r4, #0x10
	lsl	r0, r0, #0x10
	lsr	r0, r0, #0x10
	str	r0, [sp, #0x14]
	mov	r7, #0xff
	lsl	r7, r7, #0x8
	mov	r8, r7
	ldr	r0, .L9
	mov	r9, r0
	mov	sl, r9
	mov	r0, #0x2c
	add	r1, r4, #0
	mul	r1, r1, r0
	str	r1, [sp, #0x18]
	lsl	r2, r3, #0x2
	mov	ip, r2
	ldr	r0, [sp, #0xc]
	ldr	r5, [r0, #0x4]
	str	r0, [r6, #0x10]
	mov	r1, #0x0
	strh	r4, [r6, #0x3e]
	add	r0, r6, #0
	add	r0, r0, #0x40
	strh	r3, [r0]
	str	r1, [r6, #0x50]
	str	r1, [r6, #0x4c]
	add	r0, r0, #0x8
	strh	r1, [r0]
	add	r0, r0, #0x2
	strh	r1, [r0]
	sub	r0, r0, #0x6
	mov	r2, sp
	ldrh	r2, [r2, #0x14]
	strh	r2, [r0]
	add	r0, r0, #0x2
	strh	r1, [r0]
	ldr	r3, [sp, #0xc]
	ldr	r0, [r3]
	ldr	r0, [r0]
	cmp	r0, #0
	ble	.L1	@cond_branch
.L6:
	ldr	r2, [r5]
	cmp	r2, r7
	bge	.L2	@cond_branch
	add	r7, r2, #0
.L2:
	ldr	r1, [r5, #0x4]
	cmp	r1, r8
	bge	.L3	@cond_branch
	mov	r8, r1
.L3:
	cmp	r2, sl
	ble	.L4	@cond_branch
	mov	sl, r2
.L4:
	cmp	r1, r9
	ble	.L5	@cond_branch
	mov	r9, r1
.L5:
	add	r5, r5, #0x10
	sub	r0, r0, #0x1
	cmp	r0, #0
	bne	.L6	@cond_branch
.L1:
	str	r7, [r6]
	mov	r0, sl
	str	r0, [r6, #0x8]
	mov	r1, r8
	str	r1, [r6, #0x4]
	mov	r2, r9
	str	r2, [r6, #0xc]
	ldr	r4, [sp, #0x18]
	ADD r4, ip
	add	r0, r4, #0
	bl	slowAllocate
	add	r2, r0, #0
	str	r2, [r6, #0x24]
	cmp	r2, #0
	bne	.L7	@cond_branch
	ldr	r0, .L9 + 4
	b	.L8
.L10:
	.align	2, 0
.L9:
	.4byte	0xffff0100
	.4byte	0x8755440
.L7:
	ldr	r0, .L13
	ldr	r1, [r2]
	ldr	r2, [r2, #0x4]
	ldr	r3, [r0]
	mov	r0, #0x0
	bl	call_via_r3
	ldr	r3, [sp, #0x14]
	lsl	r4, r3, #0x2
	add	r0, r4, #0
	bl	slowAllocate
	str	r0, [r6, #0x28]
	cmp	r0, #0
	bne	.L11	@cond_branch
	ldr	r0, .L13 + 4
.L8:
	add	r1, r4, #0
	bl	printf
	b	.L12
.L14:
	.align	2, 0
.L13:
	.4byte	0x807d970
	.4byte	0x8755474
.L11:
	ldr	r0, [r0]
	str	r0, [r6, #0x4c]
	ldr	r0, [r6, #0x24]
	ldr	r1, [r0]
	str	r1, [r6, #0x2c]
	ldr	r2, [sp, #0x18]
	add	r0, r1, r2
	str	r0, [r6, #0x30]
	str	r1, [r6, #0x14]
	add	r0, r1, #0
	add	r0, r0, #0x2c
	str	r0, [r6, #0x18]
	add	r0, r0, #0x2c
	str	r0, [r6, #0x1c]
	add	r0, r0, #0x2c
	str	r0, [r6, #0x20]
	mov	r2, #0x0
	mov	r0, #0x4
	strh	r0, [r6, #0x38]
	strh	r2, [r6, #0x3a]
	mov	r3, sp
	ldrh	r3, [r3, #0x10]
	strh	r3, [r6, #0x3c]
	mov	r0, sl
	sub	r5, r0, r7
	asr	r5, r5, #0x1
	add	r5, r7, r5
	mov	r2, r9
	mov	r3, r8
	sub	r4, r2, r3
	asr	r4, r4, #0x1
	ADD r4, r8
	str	r5, [sp]
	str	r4, [sp, #0x4]
	ldr	r0, [sp, #0x44]
	str	r0, [sp, #0x8]
	add	r0, r6, #0
	add	r2, r7, #0
	bl	initQuadTreeNode
	str	r0, [r6, #0x14]
	ldr	r1, [r6, #0x18]
	mov	r2, sl
	str	r2, [sp]
	str	r4, [sp, #0x4]
	ldr	r3, [sp, #0x44]
	str	r3, [sp, #0x8]
	add	r0, r6, #0
	add	r2, r5, #0
	mov	r3, r8
	bl	initQuadTreeNode
	str	r0, [r6, #0x18]
	ldr	r1, [r6, #0x1c]
	str	r5, [sp]
	mov	r0, r9
	str	r0, [sp, #0x4]
	ldr	r2, [sp, #0x44]
	str	r2, [sp, #0x8]
	add	r0, r6, #0
	add	r2, r7, #0
	add	r3, r4, #0
	bl	initQuadTreeNode
	str	r0, [r6, #0x1c]
	ldr	r1, [r6, #0x20]
	mov	r3, sl
	str	r3, [sp]
	mov	r0, r9
	str	r0, [sp, #0x4]
	ldr	r2, [sp, #0x44]
	str	r2, [sp, #0x8]
	add	r0, r6, #0
	add	r2, r5, #0
	add	r3, r4, #0
	bl	initQuadTreeNode
	str	r0, [r6, #0x20]
	add	r4, r6, #0
	add	r4, r4, #0x40
	ldrh	r3, [r6, #0x3a]
	ldrh	r0, [r4]
	cmp	r3, r0
	bcc	.L15	@cond_branch
	ldr	r0, .L17
	ldrh	r1, [r4]
	ldr	r2, .L17 + 4
	ldrh	r3, [r6, #0x3a]
	bl	nullsub_10
.L15:
	ldrh	r1, [r6, #0x38]
	ldrh	r2, [r6, #0x3e]
	cmp	r1, r2
	bcc	.L16	@cond_branch
	ldr	r0, .L17 + 8
	ldrh	r1, [r6, #0x38]
	bl	nullsub_9
.L16:
	add	r0, r6, #0
	ldr	r1, [sp, #0xc]
	bl	allocateDynamicBoundingAreas
	ldrh	r4, [r4]
	ldrh	r3, [r6, #0x3a]
	sub	r0, r4, r3
	asr	r0, r0, #0x1
	add	r1, r6, #0
	add	r1, r1, #0x42
	strh	r0, [r1]
	add	r0, r6, #0
	ldr	r1, [sp, #0xc]
	bl	sub_805BDBC
.L12:
	add	sp, sp, #0x1c
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L18:
	.align	2, 0
.L17:
	.4byte	0x87554b4
	.4byte	0x87554f0
	.4byte	0x87554f4
	thumb_func_end allocQuadTree

.align 2, 0 @ Don't pad with nop.
