	.include "asm/common.inc"

	thumb_func_start initQuadTreeNode
initQuadTreeNode:
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	add	sp, sp, #0xffffffd0
	mov	r8, r0
	add	r7, r1, #0
	mov	sl, r2
	mov	r9, r3
	ldr	r0, [r0, #0x10]
	str	r0, [sp, #0xc]
	ldr	r6, [r0, #0xc]
	ldr	r1, [r0, #0x4]
	str	r1, [sp, #0x10]
	mov	r2, #0x0
	str	r2, [sp, #0x20]
	mov	r0, r8
	ldrh	r0, [r0, #0x3a]
	str	r0, [sp, #0x24]
	mov	r1, #0x0
	str	r1, [sp, #0x28]
	mov	r2, sl
	str	r2, [r7, #0x18]
	ldr	r0, [sp, #0x50]
	str	r0, [r7, #0x20]
	str	r3, [r7, #0x1c]
	ldr	r1, [sp, #0x54]
	str	r1, [r7, #0x24]
	sub	r2, r0, r2
	str	r2, [sp, #0x14]
	mov	r2, r9
	sub	r2, r1, r2
	str	r2, [sp, #0x18]
	mov	r0, #0x0
	str	r0, [sp, #0x1c]
	ldr	r1, [sp, #0xc]
	ldr	r0, [r1]
	ldr	r0, [r0, #0x8]
	ldr	r2, [sp, #0x20]
	cmp	r2, r0
	blt	.L32	@cond_branch
	b	.L31
.L32:
	ldr	r0, [r6]
	lsl	r0, r0, #0x4
	ldr	r1, [sp, #0x10]
	add	r4, r1, r0
	ldr	r0, [r6, #0x4]
	lsl	r0, r0, #0x4
	add	r5, r1, r0
	mov	r0, #0x8
	ldrb	r2, [r6, #0x11]
	and	r0, r0, r2
	cmp	r0, #0
	bne	.L28	@cond_branch
	ldr	r0, [sp, #0x58]
	cmp	r0, #0
	beq	.L4	@cond_branch
	ldr	r0, [sp, #0xc]
	add	r1, r6, #0
	ldr	r2, [sp, #0x58]
	bl	call_via_r2
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L28	@cond_branch
.L4:
	ldr	r0, [r6]
	cmp	r0, #0
	blt	.L28	@cond_branch
	ldr	r0, [r6, #0x4]
	cmp	r0, #0
	blt	.L28	@cond_branch
	ldr	r2, [r4]
	ldr	r4, [r4, #0x4]
	ldr	r3, [r5]
	ldr	r5, [r5, #0x4]
	cmp	r2, r3
	ble	.L8	@cond_branch
	add	r0, r3, #0
	add	r3, r2, #0
	add	r2, r0, #0
.L8:
	cmp	r4, r5
	ble	.L9	@cond_branch
	add	r0, r5, #0
	add	r5, r4, #0
	add	r4, r0, #0
.L9:
	sub	r2, r2, #0x10
	add	r3, r3, #0x10
	sub	r4, r4, #0x10
	add	r5, r5, #0x10
	mov	r1, #0x0
	cmp	r2, sl
	blt	.L11	@cond_branch
	ldr	r0, [sp, #0x50]
	cmp	r2, r0
	bgt	.L11	@cond_branch
	mov	r1, #0x1
.L11:
	cmp	r3, sl
	blt	.L13	@cond_branch
	ldr	r0, [sp, #0x50]
	cmp	r3, r0
	bgt	.L13	@cond_branch
	mov	r0, #0x1
	orr	r1, r1, r0
.L13:
	cmp	r4, r9
	blt	.L15	@cond_branch
	ldr	r0, [sp, #0x54]
	cmp	r4, r0
	bgt	.L15	@cond_branch
	mov	r0, #0x2
	orr	r1, r1, r0
	lsl	r0, r1, #0x10
	lsr	r1, r0, #0x10
.L15:
	cmp	r5, r9
	blt	.L17	@cond_branch
	ldr	r0, [sp, #0x54]
	cmp	r5, r0
	bgt	.L17	@cond_branch
	mov	r0, #0x2
	orr	r1, r1, r0
	lsl	r0, r1, #0x10
	lsr	r1, r0, #0x10
.L17:
	cmp	r2, sl
	bgt	.L20	@cond_branch
	ldr	r0, [sp, #0x50]
	cmp	r3, r0
	blt	.L20	@cond_branch
	mov	r0, #0x2
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L20	@cond_branch
	mov	r1, #0x3
.L20:
	cmp	r4, r9
	bgt	.L23	@cond_branch
	ldr	r0, [sp, #0x54]
	cmp	r5, r0
	blt	.L23	@cond_branch
	mov	r0, #0x1
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L23	@cond_branch
	mov	r1, #0x3
.L23:
	cmp	r2, sl
	bgt	.L27	@cond_branch
	ldr	r2, [sp, #0x50]
	cmp	r3, r2
	blt	.L27	@cond_branch
	cmp	r4, r9
	bgt	.L27	@cond_branch
	ldr	r0, [sp, #0x54]
	cmp	r5, r0
	blt	.L27	@cond_branch
	mov	r1, #0x3
	ldr	r2, [sp, #0x28]
	add	r2, r2, #0x1
	str	r2, [sp, #0x28]
.L27:
	cmp	r1, #0x3
	bne	.L28	@cond_branch
	mov	r0, r8
	add	r0, r0, #0x40
	ldr	r1, [sp, #0x24]
	ldrh	r0, [r0]
	cmp	r1, r0
	bge	.L29	@cond_branch
	mov	r2, r8
	ldr	r1, [r2, #0x30]
	ldr	r2, [sp, #0x24]
	lsl	r0, r2, #0x2
	add	r0, r0, r1
	str	r6, [r0]
	add	r2, r2, #0x1
	str	r2, [sp, #0x24]
	b	.L30
.L29:
	ldr	r0, .L39
	bl	printf
.L30:
	ldr	r0, [sp, #0x20]
	add	r0, r0, #0x1
	str	r0, [sp, #0x20]
.L28:
	add	r6, r6, #0x20
	ldr	r1, [sp, #0x1c]
	add	r1, r1, #0x1
	str	r1, [sp, #0x1c]
	ldr	r2, [sp, #0xc]
	ldr	r0, [r2]
	ldr	r0, [r0, #0x8]
	cmp	r1, r0
	bge	.L31	@cond_branch
	b	.L32
.L31:
	mov	r1, r8
	ldrh	r0, [r1, #0x3c]
	ldr	r2, [sp, #0x20]
	cmp	r2, r0
	ble	.L36	@cond_branch
	ldr	r1, [sp, #0x28]
	cmp	r1, r0
	bge	.L36	@cond_branch
	ldr	r2, [sp, #0x14]
	cmp	r2, #0x7f
	ble	.L36	@cond_branch
	ldr	r0, [sp, #0x18]
	cmp	r0, #0x7f
	ble	.L36	@cond_branch
	ldr	r1, [sp, #0x50]
	mov	r2, sl
	sub	r0, r1, r2
	asr	r0, r0, #0x1
	ADD r0, sl
	str	r0, [sp, #0x2c]
	ldr	r1, [sp, #0x54]
	mov	r2, r9
	sub	r0, r1, r2
	asr	r0, r0, #0x1
	add	r6, r2, r0
	mov	r0, #0x0
	str	r0, [r7, #0x10]
	str	r0, [r7, #0x14]
	strh	r0, [r7, #0x28]
	strh	r0, [r7, #0x2a]
	mov	r1, r8
	ldrh	r0, [r1, #0x38]
	add	r0, r0, #0x4
	ldrh	r2, [r1, #0x3e]
	cmp	r0, r2
	blt	.L37	@cond_branch
	ldr	r0, .L39 + 4
	bl	printf
.L37:
	mov	r0, r8
	ldrh	r1, [r0, #0x38]
	add	r0, r1, #1
	mov	r5, #0x2c
	add	r2, r1, #0
	mul	r2, r2, r5
	add	r1, r2, #0
	mov	r2, r8
	ldr	r4, [r2, #0x2c]
	add	r1, r4, r1
	str	r1, [r7]
	add	r2, r0, #1
	lsl	r0, r0, #0x10
	lsr	r0, r0, #0x10
	mul	r0, r0, r5
	add	r0, r4, r0
	str	r0, [r7, #0x4]
	add	r3, r2, #1
	lsl	r2, r2, #0x10
	lsr	r2, r2, #0x10
	add	r0, r2, #0
	mul	r0, r0, r5
	add	r0, r4, r0
	str	r0, [r7, #0x8]
	add	r0, r3, #1
	mov	r2, r8
	strh	r0, [r2, #0x38]
	lsl	r3, r3, #0x10
	lsr	r3, r3, #0x10
	add	r0, r3, #0
	mul	r0, r0, r5
	add	r4, r4, r0
	str	r4, [r7, #0xc]
	ldr	r0, [sp, #0x2c]
	str	r0, [sp]
	str	r6, [sp, #0x4]
	ldr	r2, [sp, #0x58]
	str	r2, [sp, #0x8]
	mov	r0, r8
	mov	r2, sl
	mov	r3, r9
	bl	initQuadTreeNode
	str	r0, [r7]
	ldr	r1, [r7, #0x4]
	ldr	r0, [sp, #0x50]
	str	r0, [sp]
	str	r6, [sp, #0x4]
	ldr	r2, [sp, #0x58]
	str	r2, [sp, #0x8]
	mov	r0, r8
	ldr	r2, [sp, #0x2c]
	mov	r3, r9
	bl	initQuadTreeNode
	str	r0, [r7, #0x4]
	ldr	r1, [r7, #0x8]
	ldr	r0, [sp, #0x2c]
	str	r0, [sp]
	ldr	r2, [sp, #0x54]
	str	r2, [sp, #0x4]
	ldr	r0, [sp, #0x58]
	str	r0, [sp, #0x8]
	mov	r0, r8
	mov	r2, sl
	add	r3, r6, #0
	bl	initQuadTreeNode
	str	r0, [r7, #0x8]
	ldr	r1, [r7, #0xc]
	ldr	r2, [sp, #0x50]
	str	r2, [sp]
	ldr	r0, [sp, #0x54]
	str	r0, [sp, #0x4]
	ldr	r2, [sp, #0x58]
	str	r2, [sp, #0x8]
	mov	r0, r8
	ldr	r2, [sp, #0x2c]
	add	r3, r6, #0
	bl	initQuadTreeNode
	str	r0, [r7, #0xc]
	add	r0, r7, #0
	b	.L43
.L40:
	.align	2, 0
.L39:
	.4byte	0x875557c
	.4byte	0x87555a8
.L36:
	mov	r0, #0x0
	mov	r1, sp
	ldrh	r1, [r1, #0x20]
	strh	r1, [r7, #0x28]
	strh	r0, [r7, #0x2a]
	str	r0, [r7, #0x14]
	mov	r2, r8
	ldrh	r2, [r2, #0x3a]
	lsl	r1, r2, #0x2
	mov	r2, r8
	ldr	r0, [r2, #0x30]
	add	r0, r0, r1
	str	r0, [r7, #0x10]
	mov	r0, sp
	ldrh	r0, [r0, #0x24]
	strh	r0, [r2, #0x3a]
	ldr	r1, [sp, #0x20]
	cmp	r1, #0x20
	ble	.L41	@cond_branch
	ldr	r0, .L44
	mov	r2, #0x20
	bl	printf
.L41:
	ldr	r2, [sp, #0x20]
	cmp	r2, #0
	beq	.L42	@cond_branch
	add	r0, r7, #0
	b	.L43
.L45:
	.align	2, 0
.L44:
	.4byte	0x87555f0
.L42:
	mov	r0, #0x0
.L43:
	add	sp, sp, #0x30
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6, r7}
	pop	{r1}
	bx	r1
	thumb_func_end initQuadTreeNode

.align 2, 0 @ Don't pad with nop.
