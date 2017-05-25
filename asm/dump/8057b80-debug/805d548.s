	.include "asm/common.inc"

	thumb_func_start sub_805D548
sub_805D548:
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	add	sp, sp, #0xffffffd0
	add	r7, r0, #0
	mov	sl, r1
	str	r2, [sp, #0x28]
	str	r3, [sp, #0x2c]
	ldr	r6, [r2, #0x14]
	add	r0, r0, #0x84
	ldr	r1, [r0]
	mov	r0, #0x1
	NEG	r0, r0
	cmp	r1, r0
	bne	.L2	@cond_branch
	mov	r0, #0x0
	mov	r9, r0
	ldrh	r1, [r2, #0x2a]
	cmp	r9, r1
	bge	.L2	@cond_branch
.L6:
	ldr	r5, [r6]
	ldr	r3, [sp, #0x54]
	asr	r0, r3, #0x5
	str	r0, [sp]
	ldr	r4, [sp, #0x58]
	asr	r0, r4, #0x5
	str	r0, [sp, #0x4]
	str	r5, [sp, #0x8]
	mov	r1, #0x4
	ldsh	r0, [r6, r1]
	str	r0, [sp, #0xc]
	mov	r0, sl
	add	r1, sp, #0x10
	ldr	r3, [sp, #0x2c]
	asr	r2, r3, #0x5
	ldr	r4, [sp, #0x50]
	asr	r3, r4, #0x5
	bl	sub_805E320
	lsl	r0, r0, #0x18
	lsr	r2, r0, #0x18
	cmp	r2, #0x1
	bne	.L5	@cond_branch
	ldr	r0, [r5]
	lsl	r0, r0, #0x2
	add	r0, r0, #0x20
	add	r0, r0, r5
	mov	r8, r0
	add	r1, r7, #0
	add	r1, r1, #0x8d
	add	r0, r2, #0
	ldrb	r1, [r1]
	and	r0, r0, r1
	cmp	r0, #0
	bne	.L4	@cond_branch
	ldr	r3, [sp, #0x20]
	lsl	r3, r3, #0xa
	ldr	r0, [sp, #0x1c]
	add	r3, r3, r0
	mov	r0, sl
	add	r1, r7, #0
	mov	r2, r9
	bl	sub_805C3BC
.L4:
	add	r0, r7, #0
	add	r0, r0, #0x90
	ldr	r4, [r0]
	cmp	r4, #0
	beq	.L5	@cond_branch
	mov	r0, #0x6
	ldsh	r3, [r6, r0]
	ldr	r0, [sp, #0x20]
	lsl	r0, r0, #0x4
	ADD r0, r8
	str	r0, [sp]
	add	r1, sp, #0x10
	str	r1, [sp, #0x4]
	ldr	r4, [r4]
	add	r0, r7, #0
	mov	r1, sl
	add	r2, r5, #0
	bl	call_via_r4
.L5:
	add	r6, r6, #0x8
	mov	r3, #0x1
	ADD r9, r3
	ldr	r4, [sp, #0x28]
	ldrh	r4, [r4, #0x2a]
	cmp	r9, r4
	blt	.L6	@cond_branch
.L2:
	add	sp, sp, #0x30
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
	thumb_func_end sub_805D548

.align 2, 0 @ Don't pad with nop.
