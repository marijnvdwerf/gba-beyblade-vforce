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
	blt	.L805C096	@cond_branch
	b	.L805C1BA
.L805C096:
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
	bne	.L805C1A6	@cond_branch
	ldr	r0, [sp, #0x58]
	cmp	r0, #0
	beq	.L805C0C4	@cond_branch
	ldr	r0, [sp, #0xc]
	add	r1, r6, #0
	ldr	r2, [sp, #0x58]
	bl	_call_via_r2
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L805C1A6	@cond_branch
.L805C0C4:
	ldr	r0, [r6]
	cmp	r0, #0
	blt	.L805C1A6	@cond_branch
	ldr	r0, [r6, #0x4]
	cmp	r0, #0
	blt	.L805C1A6	@cond_branch
	ldr	r2, [r4]
	ldr	r4, [r4, #0x4]
	ldr	r3, [r5]
	ldr	r5, [r5, #0x4]
	cmp	r2, r3
	ble	.L805C0E2	@cond_branch
	add	r0, r3, #0
	add	r3, r2, #0
	add	r2, r0, #0
.L805C0E2:
	cmp	r4, r5
	ble	.L805C0EC	@cond_branch
	add	r0, r5, #0
	add	r5, r4, #0
	add	r4, r0, #0
.L805C0EC:
	sub	r2, r2, #0x10
	add	r3, r3, #0x10
	sub	r4, r4, #0x10
	add	r5, r5, #0x10
	mov	r1, #0x0
	cmp	r2, sl
	blt	.L805C102	@cond_branch
	ldr	r0, [sp, #0x50]
	cmp	r2, r0
	bgt	.L805C102	@cond_branch
	mov	r1, #0x1
.L805C102:
	cmp	r3, sl
	blt	.L805C110	@cond_branch
	ldr	r0, [sp, #0x50]
	cmp	r3, r0
	bgt	.L805C110	@cond_branch
	mov	r0, #0x1
	orr	r1, r1, r0
.L805C110:
	cmp	r4, r9
	blt	.L805C122	@cond_branch
	ldr	r0, [sp, #0x54]
	cmp	r4, r0
	bgt	.L805C122	@cond_branch
	mov	r0, #0x2
	orr	r1, r1, r0
	lsl	r0, r1, #0x10
	lsr	r1, r0, #0x10
.L805C122:
	cmp	r5, r9
	blt	.L805C134	@cond_branch
	ldr	r0, [sp, #0x54]
	cmp	r5, r0
	bgt	.L805C134	@cond_branch
	mov	r0, #0x2
	orr	r1, r1, r0
	lsl	r0, r1, #0x10
	lsr	r1, r0, #0x10
.L805C134:
	cmp	r2, sl
	bgt	.L805C148	@cond_branch
	ldr	r0, [sp, #0x50]
	cmp	r3, r0
	blt	.L805C148	@cond_branch
	mov	r0, #0x2
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L805C148	@cond_branch
	mov	r1, #0x3
.L805C148:
	cmp	r4, r9
	bgt	.L805C15C	@cond_branch
	ldr	r0, [sp, #0x54]
	cmp	r5, r0
	blt	.L805C15C	@cond_branch
	mov	r0, #0x1
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L805C15C	@cond_branch
	mov	r1, #0x3
.L805C15C:
	cmp	r2, sl
	bgt	.L805C178	@cond_branch
	ldr	r2, [sp, #0x50]
	cmp	r3, r2
	blt	.L805C178	@cond_branch
	cmp	r4, r9
	bgt	.L805C178	@cond_branch
	ldr	r0, [sp, #0x54]
	cmp	r5, r0
	blt	.L805C178	@cond_branch
	mov	r1, #0x3
	ldr	r2, [sp, #0x28]
	add	r2, r2, #0x1
	str	r2, [sp, #0x28]
.L805C178:
	cmp	r1, #0x3
	bne	.L805C1A6	@cond_branch
	mov	r0, r8
	add	r0, r0, #0x40
	ldr	r1, [sp, #0x24]
	ldrh	r0, [r0]
	cmp	r1, r0
	bge	.L805C19A	@cond_branch
	mov	r2, r8
	ldr	r1, [r2, #0x30]
	ldr	r2, [sp, #0x24]
	lsl	r0, r2, #0x2
	add	r0, r0, r1
	str	r6, [r0]
	add	r2, r2, #0x1
	str	r2, [sp, #0x24]
	b	.L805C1A0
.L805C19A:
	ldr	r0, .L805C2B0
	bl	printf
.L805C1A0:
	ldr	r0, [sp, #0x20]
	add	r0, r0, #0x1
	str	r0, [sp, #0x20]
.L805C1A6:
	add	r6, r6, #0x20
	ldr	r1, [sp, #0x1c]
	add	r1, r1, #0x1
	str	r1, [sp, #0x1c]
	ldr	r2, [sp, #0xc]
	ldr	r0, [r2]
	ldr	r0, [r0, #0x8]
	cmp	r1, r0
	bge	.L805C1BA	@cond_branch
	b	.L805C096
.L805C1BA:
	mov	r1, r8
	ldrh	r0, [r1, #0x3c]
	ldr	r2, [sp, #0x20]
	cmp	r2, r0
	ble	.L805C2B8	@cond_branch
	ldr	r1, [sp, #0x28]
	cmp	r1, r0
	bge	.L805C2B8	@cond_branch
	ldr	r2, [sp, #0x14]
	cmp	r2, #0x7f
	ble	.L805C2B8	@cond_branch
	ldr	r0, [sp, #0x18]
	cmp	r0, #0x7f
	ble	.L805C2B8	@cond_branch
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
	blt	.L805C208	@cond_branch
	ldr	r0, .L805C2B0 + 4
	bl	printf
.L805C208:
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
	b	.L805C2F6
.L805C2B0:
	.align	2, 0

	.4byte	0x875557c
	.4byte	0x87555a8
.L805C2B8:
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
	ble	.L805C2E6	@cond_branch
	ldr	r0, .L805C2F0
	mov	r2, #0x20
	bl	printf
.L805C2E6:
	ldr	r2, [sp, #0x20]
	cmp	r2, #0
	beq	.L805C2F4	@cond_branch
	add	r0, r7, #0
	b	.L805C2F6
.L805C2F0:
	.align	2, 0

	.4byte	0x87555f0
.L805C2F4:
	mov	r0, #0x0
.L805C2F6:
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
