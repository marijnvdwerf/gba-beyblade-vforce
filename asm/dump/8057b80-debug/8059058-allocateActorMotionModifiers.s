	.include "asm/common.inc"

	thumb_func_start allocateActorMotionModifiers
allocateActorMotionModifiers:
	push	{r4, r5, r6, r7, lr}
	mov	r7, r9
	mov	r6, r8
	push	{r6, r7}
	add	r4, r0, #0
	add	r7, r1, #0
	mov	r8, r2
	mov	r9, r3
	add	r2, r4, #0
	add	r2, r2, #0x80
	ldr	r1, [r2]
	mov	r0, #0x1
	NEG	r0, r0
	cmp	r1, r0
	bne	.L1	@cond_branch
	mov	r0, #0x0
	str	r0, [r2]
	mov	r0, #0x10
	bl	fastAllocate
	cmp	r0, #0
	bne	.L2	@cond_branch
	ldr	r0, .L4
	bl	nullsub_8
	b	.L3
.L5:
	.align	2, 0
.L4:
	.4byte	0x872cc00
.L2:
	add	r1, r4, #0
	add	r1, r1, #0x84
	ldr	r0, [r0]
	str	r0, [r1]
.L1:
	add	r0, r4, #0
	add	r0, r0, #0x80
	ldr	r1, [r0]
	add	r6, r0, #0
	cmp	r1, #0
	ble	.L6	@cond_branch
	mov	r1, #0x1
	NEG	r1, r1
	mov	r5, #0x0
	mov	r3, #0x0
	add	r4, r4, #0x84
	ldr	r2, [r4]
.L9:
	ldr	r0, [r2]
	cmp	r0, #0
	bne	.L7	@cond_branch
	cmp	r1, #0
	bge	.L8	@cond_branch
	add	r1, r3, #0
.L8:
	add	r5, r5, #0x1
.L7:
	add	r2, r2, #0x10
	add	r3, r3, #0x1
	cmp	r3, #0
	ble	.L9	@cond_branch
	mov	r0, #0x1
	NEG	r0, r0
	cmp	r1, r0
	bne	.L10	@cond_branch
	ldr	r1, [r4]
	b	.L11
.L10:
	lsl	r1, r1, #0x4
	ldr	r0, [r4]
	add	r1, r0, r1
.L11:
	cmp	r5, #0x1
	bne	.L13	@cond_branch
	mov	r0, #0x0
	str	r0, [r6]
	ldr	r1, [r4]
	b	.L13
.L6:
	add	r0, r4, #0
	add	r0, r0, #0x84
	lsl	r1, r1, #0x4
	ldr	r0, [r0]
	add	r1, r0, r1
.L13:
	str	r7, [r1, #0x8]
	mov	r0, r8
	str	r0, [r1]
	mov	r0, r9
	str	r0, [r1, #0x4]
	ldr	r0, [sp, #0x1c]
	str	r0, [r1, #0xc]
	ldr	r0, [r6]
	add	r0, r0, #0x1
	str	r0, [r6]
.L3:
	pop	{r3, r4}
	mov	r8, r3
	mov	r9, r4
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
	thumb_func_end allocateActorMotionModifiers

.align 2, 0 @ Don't pad with nop.
