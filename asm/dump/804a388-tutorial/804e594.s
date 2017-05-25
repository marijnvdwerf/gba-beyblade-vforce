	.include "asm/common.inc"

	thumb_func_start sub_804E594
sub_804E594:
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	add	sp, sp, #0xfffffff8
	add	r7, r0, #0
	str	r3, [sp, #0x4]
	ldr	r0, [sp, #0x28]
	ldr	r3, [sp, #0x2c]
	mov	r8, r3
	lsl	r0, r0, #0x10
	lsr	r0, r0, #0x10
	mov	ip, r0
	mov	r3, #0x6
	ldsh	r6, [r7, r3]
	lsl	r0, r6, #0x3
	add	r0, r0, r6
	lsl	r0, r0, #0x2
	ldr	r5, [r7, #0x8]
	add	r5, r5, r0
	ldr	r0, .L3
	ldr	r4, [r0]
	lsr	r4, r4, #0x3
	add	r4, r4, r6
	mov	r0, #0x1f
	and	r4, r4, r0
	ldr	r6, .L3 + 4
	lsl	r0, r4, #0x1
	add	r0, r0, r6
	mov	r3, #0x0
	ldsh	r0, [r0, r3]
	lsl	r2, r2, #0x10
	asr	r2, r2, #0x10
	add	r3, r0, #0
	mul	r3, r3, r2
	asr	r3, r3, #0x8
	mov	r9, r3
	add	r0, r4, #1
	lsl	r0, r0, #0x1
	add	r0, r0, r6
	mov	r3, #0x0
	ldsh	r0, [r0, r3]
	add	r3, r0, #0
	mul	r3, r3, r2
	asr	r3, r3, #0x8
	mov	sl, r3
	add	r4, r4, #0x2
	lsl	r4, r4, #0x1
	add	r4, r4, r6
	mov	r3, #0x0
	ldsh	r0, [r4, r3]
	add	r4, r0, #0
	mul	r4, r4, r2
	asr	r4, r4, #0x8
	ldr	r0, [r5]
	str	r0, [sp]
	mov	r2, r8
	lsl	r2, r2, #0x10
	asr	r2, r2, #0xd
	mov	r8, r2
	mov	r3, #0x20
	ADD r8, r3
	ldr	r6, [r7]
	ADD r6, r8
	mov	r0, #0x0
	mov	r8, r0
	mov	r2, sp
	ldrh	r2, [r2, #0x4]
	strh	r2, [r5, #0x1a]
	str	r0, [r5, #0xc]
	str	r0, [r5, #0x8]
	str	r0, [r5, #0x4]
	ldr	r0, [r7, #0x1c]
	strh	r0, [r5, #0x16]
	ldr	r0, [r7, #0x20]
	strh	r0, [r5, #0x18]
	ldr	r2, [r7, #0x10]
	ldr	r0, [r7, #0x24]
	sub	r2, r2, r0
	lsl	r1, r1, #0x10
	asr	r1, r1, #0x10
	add	r0, r2, #0
	mul	r0, r0, r1
	asr	r0, r0, #0x8
	ADD r9, r0
	mov	r3, r9
	strh	r3, [r5, #0x10]
	ldr	r0, [r7, #0x14]
	ldr	r2, [r7, #0x28]
	sub	r0, r0, r2
	mul	r0, r0, r1
	asr	r0, r0, #0x8
	ADD sl, r0
	mov	r0, sl
	strh	r0, [r5, #0x12]
	ldr	r0, [r7, #0x18]
	ldr	r2, [r7, #0x2c]
	sub	r0, r0, r2
	mul	r0, r0, r1
	asr	r0, r0, #0x8
	add	r4, r4, r0
	strh	r4, [r5, #0x14]
	mov	r2, ip
	strh	r2, [r5, #0x22]
	strh	r2, [r5, #0x20]
	ldrh	r1, [r6]
	strh	r1, [r5, #0x1c]
	ldrh	r0, [r6, #0x2]
	strh	r0, [r5, #0x1e]
	ldr	r3, [sp]
	cmp	r3, #0
	beq	.L1	@cond_branch
	strh	r1, [r3, #0x18]
.L1:
	ldrh	r0, [r7, #0x6]
	add	r0, r0, #0x1
	strh	r0, [r7, #0x6]
	lsl	r0, r0, #0x10
	ldrh	r2, [r7, #0x4]
	lsl	r1, r2, #0x10
	cmp	r0, r1
	blt	.L2	@cond_branch
	mov	r3, r8
	strh	r3, [r7, #0x6]
.L2:
	add	sp, sp, #0x8
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L4:
	.align	2, 0
.L3:
	.4byte	0x3000e30
	.4byte	0x8074d64
	thumb_func_end sub_804E594

.align 2, 0 @ Don't pad with nop.
