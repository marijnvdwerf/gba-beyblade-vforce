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
	ble	.L1	@cond_branch
	mov	r2, #0x1
.L1:
	cmp	r7, r0
	ble	.L2	@cond_branch
	mov	r0, #0x2
	orr	r2, r2, r0
.L2:
	cmp	r2, #0x1
	beq	.L3	@cond_branch
	cmp	r2, #0x1
	bgt	.L4	@cond_branch
	cmp	r2, #0
	beq	.L5	@cond_branch
	b	.L25
.L4:
	cmp	r2, #0x2
	beq	.L7	@cond_branch
	cmp	r2, #0x3
	beq	.L8	@cond_branch
	b	.L25
.L5:
	ldr	r4, [r6, #0x14]
	b	.L25
.L3:
	ldr	r4, [r6, #0x18]
	b	.L25
.L7:
	ldr	r4, [r6, #0x1c]
	b	.L25
.L8:
	ldr	r4, [r6, #0x20]
	b	.L25
.L27:
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
	ble	.L14	@cond_branch
	mov	r2, #0x1
.L14:
	cmp	r7, r0
	ble	.L15	@cond_branch
	mov	r0, #0x2
	orr	r2, r2, r0
.L15:
	cmp	r2, #0x1
	beq	.L16	@cond_branch
	cmp	r2, #0x1
	bgt	.L17	@cond_branch
	cmp	r2, #0
	beq	.L18	@cond_branch
	b	.L25
.L17:
	cmp	r2, #0x2
	beq	.L20	@cond_branch
	cmp	r2, #0x3
	beq	.L21	@cond_branch
	b	.L25
.L18:
	ldr	r4, [r6]
	b	.L25
.L16:
	ldr	r4, [r6, #0x4]
	b	.L25
.L20:
	ldr	r4, [r6, #0x8]
	b	.L25
.L21:
	ldr	r4, [r6, #0xc]
.L25:
	cmp	r4, #0
	beq	.L26	@cond_branch
	add	r6, r4, #0
	ldrh	r0, [r4, #0x28]
	cmp	r0, #0
	beq	.L27	@cond_branch
.L26:
	add	r0, r4, #0
	pop	{r4, r5, r6, r7}
	pop	{r1}
	bx	r1
	thumb_func_end GetQuadTreeNodeForPos

.align 2, 0 @ Don't pad with nop.
