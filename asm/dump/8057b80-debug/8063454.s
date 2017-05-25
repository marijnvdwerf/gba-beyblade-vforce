	.include "asm/common.inc"

	thumb_func_start sub_8063454
sub_8063454:
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	add	sp, sp, #0xffffffe8
	add	r6, r0, #0
	str	r1, [sp]
	mov	r0, #0x8
	ldsh	r4, [r6, r0]
	mov	r0, #0x80
	lsl	r0, r0, #0x3
	add	r1, r4, #0
	bl	sub_8066084
	str	r0, [sp, #0x4]
	mov	r1, #0x0
	mov	r9, r1
	ldr	r2, [r6, #0xc]
	mov	ip, r2
	cmp	r1, r4
	bge	.L1	@cond_branch
.L7:
	ldr	r3, [r6]
	str	r3, [sp, #0x14]
	ldrh	r4, [r6, #0x4]
	lsl	r0, r4, #0x1
	ldr	r7, [sp]
	add	r0, r7, r0
	str	r0, [sp, #0x8]
	mov	r0, #0x0
	mov	r8, r0
	ldr	r2, [sp, #0x4]
	ADD r2, r9
	str	r2, [sp, #0x10]
	add	r1, r1, #0x1
	str	r1, [sp, #0xc]
	ldrh	r3, [r6, #0x6]
	cmp	r8, r3
	bge	.L2	@cond_branch
	mov	r4, #0xf8
	lsl	r4, r4, #0x7
	mov	sl, r4
.L6:
	ldr	r7, [sp, #0x14]
	ldrh	r1, [r7]
	ldr	r0, [sp, #0x8]
	ldrh	r2, [r0]
	add	r3, r1, #0
	mov	r4, #0x1f
	and	r3, r3, r4
	add	r0, r1, #0
	mov	r7, #0xf8
	lsl	r7, r7, #0x2
	and	r0, r0, r7
	lsr	r5, r0, #0x5
	mov	r0, sl
	and	r1, r1, r0
	lsr	r4, r1, #0xa
	add	r0, r2, #0
	mov	r1, #0x1f
	and	r0, r0, r1
	add	r1, r2, #0
	and	r1, r1, r7
	lsr	r1, r1, #0x5
	mov	r7, sl
	and	r2, r2, r7
	lsr	r2, r2, #0xa
	sub	r0, r0, r3
	mov	r3, r9
	mul	r3, r3, r0
	add	r0, r3, #0
	asr	r3, r0, #0xa
	sub	r1, r1, r5
	mov	r0, r9
	mul	r0, r0, r1
	asr	r5, r0, #0xa
	sub	r2, r2, r4
	mov	r0, r9
	mul	r0, r0, r2
	asr	r4, r0, #0xa
	cmp	r3, #0x1f
	ble	.L3	@cond_branch
	mov	r3, #0x1f
.L3:
	cmp	r5, #0x1f
	ble	.L4	@cond_branch
	mov	r5, #0x1f
.L4:
	cmp	r4, #0x1f
	ble	.L5	@cond_branch
	mov	r4, #0x1f
.L5:
	lsl	r0, r5, #0x5
	add	r0, r3, r0
	lsl	r1, r4, #0xa
	add	r0, r0, r1
	mov	r4, ip
	strh	r0, [r4]
	mov	r7, #0x2
	ADD ip, r7
	ldr	r0, [sp, #0x14]
	add	r0, r0, #0x2
	str	r0, [sp, #0x14]
	mov	r1, #0x1
	ADD r8, r1
	ldrh	r2, [r6, #0x6]
	cmp	r8, r2
	blt	.L6	@cond_branch
.L2:
	ldr	r3, [sp, #0x10]
	mov	r9, r3
	ldr	r1, [sp, #0xc]
	mov	r4, #0x8
	ldsh	r0, [r6, r4]
	cmp	r1, r0
	blt	.L7	@cond_branch
.L1:
	add	sp, sp, #0x18
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
	thumb_func_end sub_8063454

.align 2, 0 @ Don't pad with nop.
