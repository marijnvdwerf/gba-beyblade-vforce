	.include "asm/common.inc"

	thumb_func_start sub_8063704
sub_8063704:
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	add	sp, sp, #0xfffffffc
	add	r5, r0, #0
	lsl	r0, r1, #0xa
	asr	r0, r0, #0x8
	mov	r1, #0x8
	ldsh	r4, [r5, r1]
	add	r1, r4, #0
	bl	__divsi3
	str	r0, [sp]
	mov	r2, #0x0
	mov	ip, r2
	ldr	r6, [r5, #0xc]
	cmp	r2, r4
	bge	.L1	@cond_branch
.L7:
	ldrh	r0, [r5, #0x4]
	lsl	r1, r0, #0x1
	ldr	r0, [r5]
	add	r4, r0, r1
	mov	r7, #0x0
	ldr	r1, [sp]
	ADD r1, ip
	mov	r8, r1
	add	r2, r2, #0x1
	mov	r9, r2
	ldrh	r2, [r5, #0x6]
	cmp	r7, r2
	bge	.L2	@cond_branch
	mov	r0, #0xf8
	lsl	r0, r0, #0x7
	mov	sl, r0
.L6:
	ldrh	r1, [r4]
	mov	r3, #0x1f
	and	r3, r3, r1
	add	r0, r1, #0
	mov	r2, #0xf8
	lsl	r2, r2, #0x2
	and	r0, r0, r2
	lsr	r2, r0, #0x5
	mov	r0, sl
	and	r1, r1, r0
	lsr	r1, r1, #0xa
	mov	r0, ip
	mul	r0, r0, r3
	asr	r0, r0, #0xa
	mul	r0, r0, r3
	asr	r0, r0, #0x5
	add	r3, r3, r0
	mov	r0, ip
	mul	r0, r0, r2
	asr	r0, r0, #0xa
	mul	r0, r0, r2
	asr	r0, r0, #0x5
	add	r2, r2, r0
	mov	r0, ip
	mul	r0, r0, r1
	asr	r0, r0, #0xa
	mul	r0, r0, r1
	asr	r0, r0, #0x5
	add	r1, r1, r0
	cmp	r3, #0x1f
	ble	.L3	@cond_branch
	mov	r3, #0x1f
.L3:
	cmp	r2, #0x1f
	ble	.L4	@cond_branch
	mov	r2, #0x1f
.L4:
	cmp	r1, #0x1f
	ble	.L5	@cond_branch
	mov	r1, #0x1f
.L5:
	lsl	r0, r2, #0x5
	add	r0, r3, r0
	lsl	r1, r1, #0xa
	add	r0, r0, r1
	strh	r0, [r6]
	add	r6, r6, #0x2
	add	r4, r4, #0x2
	add	r7, r7, #0x1
	ldrh	r1, [r5, #0x6]
	cmp	r7, r1
	blt	.L6	@cond_branch
.L2:
	mov	ip, r8
	mov	r2, r9
	mov	r1, #0x8
	ldsh	r0, [r5, r1]
	cmp	r2, r0
	blt	.L7	@cond_branch
.L1:
	add	sp, sp, #0x4
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
	thumb_func_end sub_8063704

.align 2, 0 @ Don't pad with nop.
