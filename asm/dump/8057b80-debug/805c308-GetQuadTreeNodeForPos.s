	.include "asm/common.inc"

	thumb_func_start GetQuadTreeNodeForPos
GetQuadTreeNodeForPos:
	push	{r4, r5, r6, r7, lr}
	add	r6, r0, #0
	mov	ip, r1
	add	r7, r2, #0
	mov	r2, #0x0
	ldr	r3, [r6]
	ldr	r0, [r6, #0x8]
	ldr	r1, [r6, #0x4]
	ldr	r5, [r6, #0xc]
	sub	r0, r0, r3
	asr	r0, r0, #0x1
	add	r3, r3, r0
	sub	r0, r5, r1
	asr	r0, r0, #0x1
	add	r0, r1, r0
	cmp	ip, r3
	ble	.L805C32C	@cond_branch
	mov	r2, #0x1
.L805C32C:
	cmp	r7, r0
	ble	.L805C334	@cond_branch
	mov	r0, #0x2
	orr	r2, r2, r0
.L805C334:
	cmp	r2, #0x1
	beq	.L805C350	@cond_branch
	cmp	r2, #0x1
	bgt	.L805C342	@cond_branch
	cmp	r2, #0
	beq	.L805C34C	@cond_branch
	b	.L805C3A6
.L805C342:
	cmp	r2, #0x2
	beq	.L805C354	@cond_branch
	cmp	r2, #0x3
	beq	.L805C358	@cond_branch
	b	.L805C3A6
.L805C34C:
	ldr	r4, [r6, #0x14]
	b	.L805C3A6
.L805C350:
	ldr	r4, [r6, #0x18]
	b	.L805C3A6
.L805C354:
	ldr	r4, [r6, #0x1c]
	b	.L805C3A6
.L805C358:
	ldr	r4, [r6, #0x20]
	b	.L805C3A6
.L805C35C:
	ldr	r3, [r4, #0x18]
	ldr	r0, [r4, #0x20]
	ldr	r1, [r4, #0x1c]
	ldr	r5, [r4, #0x24]
	sub	r0, r0, r3
	asr	r0, r0, #0x1
	add	r3, r3, r0
	sub	r0, r5, r1
	asr	r0, r0, #0x1
	add	r0, r1, r0
	mov	r2, #0x0
	cmp	ip, r3
	ble	.L805C378	@cond_branch
	mov	r2, #0x1
.L805C378:
	cmp	r7, r0
	ble	.L805C380	@cond_branch
	mov	r0, #0x2
	orr	r2, r2, r0
.L805C380:
	cmp	r2, #0x1
	beq	.L805C39C	@cond_branch
	cmp	r2, #0x1
	bgt	.L805C38E	@cond_branch
	cmp	r2, #0
	beq	.L805C398	@cond_branch
	b	.L805C3A6
.L805C38E:
	cmp	r2, #0x2
	beq	.L805C3A0	@cond_branch
	cmp	r2, #0x3
	beq	.L805C3A4	@cond_branch
	b	.L805C3A6
.L805C398:
	ldr	r4, [r6]
	b	.L805C3A6
.L805C39C:
	ldr	r4, [r6, #0x4]
	b	.L805C3A6
.L805C3A0:
	ldr	r4, [r6, #0x8]
	b	.L805C3A6
.L805C3A4:
	ldr	r4, [r6, #0xc]
.L805C3A6:
	cmp	r4, #0
	beq	.L805C3B2	@cond_branch
	add	r6, r4, #0
	ldrh	r0, [r4, #0x28]
	cmp	r0, #0
	beq	.L805C35C	@cond_branch
.L805C3B2:
	add	r0, r4, #0
	pop	{r4, r5, r6, r7}
	pop	{r1}
	bx	r1
	thumb_func_end GetQuadTreeNodeForPos

.align 2, 0 @ Don't pad with nop.
