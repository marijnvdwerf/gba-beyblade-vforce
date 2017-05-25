	.include "asm/common.inc"

	thumb_func_start sub_804E6A4
sub_804E6A4:
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	add	sp, sp, #0xfffffff4
	mov	sl, r0
	ldr	r0, [sp, #0x2c]
	ldr	r4, [sp, #0x34]
	mov	ip, r4
	lsl	r0, r0, #0x10
	lsr	r5, r0, #0x10
	str	r5, [sp]
	mov	r6, ip
	lsl	r6, r6, #0x10
	mov	ip, r6
	mov	r0, sl
	mov	r4, #0x6
	ldsh	r5, [r0, r4]
	lsl	r0, r5, #0x3
	add	r0, r0, r5
	lsl	r0, r0, #0x2
	mov	r6, sl
	ldr	r4, [r6, #0x8]
	add	r7, r4, r0
	ldr	r0, .L5
	ldr	r4, [r0]
	lsr	r4, r4, #0x3
	add	r4, r4, r5
	mov	r0, #0x1f
	and	r4, r4, r0
	ldr	r5, .L5 + 4
	lsl	r0, r4, #0x1
	add	r0, r0, r5
	mov	r6, #0x0
	ldsh	r0, [r0, r6]
	lsl	r2, r2, #0x10
	asr	r2, r2, #0x10
	add	r6, r0, #0
	mul	r6, r6, r2
	asr	r6, r6, #0x8
	mov	r8, r6
	add	r0, r4, #1
	lsl	r0, r0, #0x1
	add	r0, r0, r5
	mov	r6, #0x0
	ldsh	r0, [r0, r6]
	add	r6, r0, #0
	mul	r6, r6, r2
	asr	r6, r6, #0x8
	mov	r9, r6
	add	r4, r4, #0x2
	lsl	r4, r4, #0x1
	add	r4, r4, r5
	mov	r5, #0x0
	ldsh	r0, [r4, r5]
	add	r4, r0, #0
	mul	r4, r4, r2
	asr	r4, r4, #0x8
	ldr	r6, [r7]
	str	r6, [sp, #0x8]
	ldr	r0, [sp, #0x30]
	lsl	r6, r0, #0x10
	asr	r6, r6, #0xd
	add	r6, r6, #0x20
	mov	r2, sl
	ldr	r0, [r2]
	add	r5, r0, r6
	mov	r0, #0x0
	strh	r3, [r7, #0x1a]
	str	r0, [r7, #0xc]
	str	r0, [r7, #0x8]
	str	r0, [r7, #0x4]
	ldr	r0, [r2, #0x1c]
	strh	r0, [r7, #0x16]
	ldr	r0, [r2, #0x20]
	strh	r0, [r7, #0x18]
	ldr	r2, [r2, #0x10]
	mov	r3, sl
	ldr	r0, [r3, #0x24]
	sub	r2, r2, r0
	lsl	r1, r1, #0x10
	asr	r1, r1, #0x10
	add	r0, r2, #0
	mul	r0, r0, r1
	asr	r0, r0, #0x8
	ADD r8, r0
	mov	r6, r8
	strh	r6, [r7, #0x10]
	ldr	r0, [r3, #0x14]
	ldr	r2, [r3, #0x28]
	sub	r0, r0, r2
	mul	r0, r0, r1
	asr	r0, r0, #0x8
	ADD r9, r0
	mov	r0, r9
	strh	r0, [r7, #0x12]
	ldr	r0, [r3, #0x18]
	ldr	r2, [r3, #0x2c]
	sub	r0, r0, r2
	mul	r0, r0, r1
	asr	r0, r0, #0x8
	add	r4, r4, r0
	strh	r4, [r7, #0x14]
	mov	r1, sp
	ldrh	r1, [r1]
	strh	r1, [r7, #0x22]
	mov	r2, sp
	ldrh	r2, [r2]
	strh	r2, [r7, #0x20]
	ldrh	r0, [r5]
	mov	r3, ip
	lsr	r1, r3, #0x10
	asr	r3, r3, #0x10
	mov	ip, r3
	ldrh	r4, [r5, #0x2]
	cmp	ip, r4
	bge	.L1	@cond_branch
	add	r0, r0, #0x1
.L1:
	cmp	r0, #0
	bne	.L2	@cond_branch
	mov	r1, #0x0
.L2:
	strh	r1, [r7, #0x1c]
	ldrh	r0, [r5, #0x2]
	strh	r0, [r7, #0x1e]
	ldr	r5, [sp, #0x8]
	cmp	r5, #0
	beq	.L3	@cond_branch
	strh	r1, [r5, #0x18]
.L3:
	mov	r6, sl
	ldrh	r0, [r6, #0x6]
	add	r0, r0, #0x1
	strh	r0, [r6, #0x6]
	lsl	r0, r0, #0x10
	ldrh	r2, [r6, #0x4]
	lsl	r1, r2, #0x10
	cmp	r0, r1
	blt	.L4	@cond_branch
	mov	r0, #0x0
	strh	r0, [r6, #0x6]
.L4:
	add	sp, sp, #0xc
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L6:
	.align	2, 0
.L5:
	.4byte	0x3000e30
	.4byte	0x8074d64
	thumb_func_end sub_804E6A4

.align 2, 0 @ Don't pad with nop.
