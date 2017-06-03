	.include "asm/common.inc"

	thumb_func_start sub_805D488
sub_805D488:
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	add	sp, sp, #0xffffffdc
	mov	r8, r0
	add	r5, r1, #0
	mov	r9, r2
	mov	sl, r3
	add	r0, r0, #0x84
	ldr	r1, [r0]
	mov	r0, #0x1
	NEG	r0, r0
	cmp	r1, r0
	bne	.L6	@cond_branch
	mov	r6, #0x0
	b	.L2
.L7:
	lsl	r1, r6, #0x2
	add	r0, r5, #0
	add	r0, r0, #0x14
	add	r0, r0, r1
	ldr	r7, [r0]
	mov	r1, sl
	asr	r0, r1, #0x5
	str	r0, [sp]
	ldr	r4, [sp, #0x44]
	asr	r0, r4, #0x5
	str	r0, [sp, #0x4]
	ldr	r1, [sp, #0x48]
	asr	r0, r1, #0x5
	str	r0, [sp, #0x8]
	add	r0, r5, #0
	add	r1, r6, #0
	add	r2, sp, #0xc
	mov	r4, r9
	asr	r3, r4, #0x5
	bl	sub_805E18C
	lsl	r0, r0, #0x18
	lsr	r2, r0, #0x18
	cmp	r2, #0x1
	bne	.L3	@cond_branch
	ldr	r0, [r7]
	lsl	r0, r0, #0x2
	add	r0, r0, #0x20
	add	r0, r0, r7
	mov	r9, r0
	mov	r1, r8
	add	r1, r1, #0x8d
	add	r0, r2, #0
	ldrb	r1, [r1]
	and	r0, r0, r1
	cmp	r0, #0
	bne	.L4	@cond_branch
	ldr	r3, [sp, #0x1c]
	lsl	r3, r3, #0xa
	ldr	r0, [sp, #0x18]
	add	r3, r3, r0
	add	r0, r5, #0
	mov	r1, r8
	add	r2, r6, #0
	bl	sub_805C3BC
.L4:
	mov	r0, r8
	add	r0, r0, #0x90
	ldr	r4, [r0]
	cmp	r4, #0
	beq	.L6	@cond_branch
	ldr	r0, [sp, #0x1c]
	lsl	r0, r0, #0x4
	ADD r0, r9
	str	r0, [sp]
	add	r0, sp, #0xc
	str	r0, [sp, #0x4]
	ldr	r4, [r4]
	mov	r0, r8
	add	r1, r5, #0
	add	r2, r7, #0
	add	r3, r6, #0
	bl	_call_via_r4
	b	.L6
.L3:
	add	r6, r6, #0x1
.L2:
	ldr	r0, [r5]
	ldr	r0, [r0, #0x4]
	cmp	r6, r0
	blt	.L7	@cond_branch
.L6:
	add	sp, sp, #0x24
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
	thumb_func_end sub_805D488

.align 2, 0 @ Don't pad with nop.
