	.include "asm/common.inc"

	thumb_func_start sub_805DBF0
sub_805DBF0:
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	add	sp, sp, #0xfffffff0
	str	r0, [sp]
	mov	r9, r1
	str	r2, [sp, #0x4]
	lsl	r3, r3, #0x10
	lsr	r3, r3, #0x10
	str	r3, [sp, #0x8]
	mov	r0, #0x0
	mov	r8, r0
	mov	r1, #0x0
	str	r1, [sp, #0xc]
	b	.L1
.L12:
	ldr	r2, [sp, #0x4]
	cmp	r3, r2
	beq	.L3	@cond_branch
	ldr	r1, [r3]
	lsl	r0, r1, #0x2
	add	r0, r0, #0x20
	add	r2, r3, r0
	add	r0, r3, #0
	add	r0, r0, #0x20
	mov	r5, #0x0
	add	r4, r1, #0
	cmp	r5, r4
	bge	.L3	@cond_branch
	mov	sl, r5
	add	r6, r2, #0
	mov	r1, #0x10
	NEG	r1, r1
	add	r1, r1, r6
	mov	ip, r1
	add	r7, r0, #0
.L10:
	ldr	r0, [r7]
	ldr	r2, [sp, #0x30]
	cmp	r2, r0
	bne	.L4	@cond_branch
	mov	r0, r8
	lsl	r1, r0, #0x2
	add	r0, r1, r0
	lsl	r0, r0, #0x2
	ADD r0, r9
	str	r3, [r0]
	str	r5, [r0, #0x4]
	ldr	r2, [sp, #0xc]
	str	r2, [r0, #0x8]
	add	r2, r1, #0
	cmp	r5, #0
	ble	.L5	@cond_branch
	mov	r1, ip
	b	.L6
.L5:
	mov	r1, sl
.L6:
	str	r1, [r0, #0xc]
	ldr	r0, [r3]
	sub	r1, r0, #1
	add	r4, r0, #0
	cmp	r5, r1
	bge	.L7	@cond_branch
	mov	r1, r8
	add	r0, r2, r1
	lsl	r0, r0, #0x2
	ADD r0, r9
	str	r6, [r0, #0x10]
	b	.L8
.L7:
	mov	r1, r8
	add	r0, r2, r1
	lsl	r0, r0, #0x2
	ADD r0, r9
	mov	r2, sl
	str	r2, [r0, #0x10]
.L8:
	mov	r0, r8
	add	r0, r0, #0x1
	lsl	r0, r0, #0x10
	lsr	r0, r0, #0x10
	mov	r8, r0
	ldr	r0, [sp, #0x8]
	cmp	r8, r0
	bcs	.L11	@cond_branch
.L4:
	add	r6, r6, #0x10
	mov	r1, #0x10
	ADD ip, r1
	add	r7, r7, #0x4
	add	r5, r5, #0x1
	cmp	r5, r4
	blt	.L10	@cond_branch
.L3:
	ldr	r2, [sp, #0xc]
	add	r2, r2, #0x1
	str	r2, [sp, #0xc]
.L1:
	ldr	r1, [sp]
	ldr	r0, [r1]
	ldr	r0, [r0, #0x4]
	ldr	r2, [sp, #0xc]
	cmp	r2, r0
	bge	.L11	@cond_branch
	add	r0, r1, #0
	add	r1, r2, #0
	bl	GetSplineAtIndex
	add	r3, r0, #0
	cmp	r3, #0
	bne	.L12	@cond_branch
.L11:
	mov	r0, r8
	add	sp, sp, #0x10
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6, r7}
	pop	{r1}
	bx	r1
	thumb_func_end sub_805DBF0

.align 2, 0 @ Don't pad with nop.
