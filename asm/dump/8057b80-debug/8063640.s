	.include "asm/common.inc"

	thumb_func_start sub_8063640
sub_8063640:
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	add	sp, sp, #0xfffffff8
	add	r5, r0, #0
	lsl	r0, r1, #0xa
	asr	r0, r0, #0x8
	mov	r1, #0x8
	ldsh	r4, [r5, r1]
	add	r1, r4, #0
	bl	__divsi3
	str	r0, [sp]
	mov	r7, #0x0
	mov	r8, r7
	ldr	r0, [r5, #0xc]
	str	r0, [sp, #0x4]
	mov	r2, #0x0
	cmp	r2, r4
	bge	.L1	@cond_branch
.L4:
	ldrh	r7, [r5, #0x4]
	lsl	r1, r7, #0x1
	ldr	r0, [r5]
	add	r4, r0, r1
	mov	r0, #0x0
	mov	ip, r0
	ldr	r1, [sp]
	ADD r1, r8
	mov	r9, r1
	add	r2, r2, #0x1
	mov	sl, r2
	ldrh	r7, [r5, #0x6]
	cmp	ip, r7
	bge	.L2	@cond_branch
	mov	r6, #0x1f
.L3:
	ldrh	r2, [r4]
	add	r3, r2, #0
	and	r3, r3, r6
	add	r1, r2, #0
	mov	r0, #0xf8
	lsl	r0, r0, #0x2
	and	r1, r1, r0
	lsr	r1, r1, #0x5
	mov	r7, #0xf8
	lsl	r7, r7, #0x7
	and	r2, r2, r7
	lsr	r2, r2, #0xa
	sub	r0, r6, r3
	sub	r0, r0, r3
	mov	r7, r8
	mul	r7, r7, r0
	add	r0, r7, #0
	asr	r0, r0, #0xa
	add	r3, r3, r0
	sub	r0, r6, r1
	sub	r0, r0, r1
	mov	r7, r8
	mul	r7, r7, r0
	add	r0, r7, #0
	asr	r0, r0, #0xa
	add	r1, r1, r0
	sub	r0, r6, r2
	sub	r0, r0, r2
	mov	r7, r8
	mul	r7, r7, r0
	add	r0, r7, #0
	asr	r0, r0, #0xa
	add	r2, r2, r0
	lsl	r1, r1, #0x5
	add	r3, r3, r1
	lsl	r2, r2, #0xa
	add	r3, r3, r2
	ldr	r0, [sp, #0x4]
	strh	r3, [r0]
	add	r0, r0, #0x2
	str	r0, [sp, #0x4]
	add	r4, r4, #0x2
	mov	r1, #0x1
	ADD ip, r1
	ldrh	r7, [r5, #0x6]
	cmp	ip, r7
	blt	.L3	@cond_branch
.L2:
	mov	r8, r9
	mov	r2, sl
	mov	r1, #0x8
	ldsh	r0, [r5, r1]
	cmp	r2, r0
	blt	.L4	@cond_branch
.L1:
	add	sp, sp, #0x8
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
	thumb_func_end sub_8063640

.align 2, 0 @ Don't pad with nop.
