	.include "asm/common.inc"

	thumb_func_start sub_804E910
sub_804E910:
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	add	sp, sp, #0xffffffdc
	ldr	r4, [sp, #0x44]
	ldr	r5, [sp, #0x48]
	ldr	r6, [sp, #0x4c]
	lsl	r2, r2, #0x10
	lsr	r2, r2, #0x10
	mov	r8, r2
	lsl	r3, r3, #0x10
	lsr	r3, r3, #0x10
	mov	r9, r3
	lsl	r4, r4, #0x10
	lsr	r4, r4, #0x10
	lsl	r5, r5, #0x10
	lsr	r5, r5, #0x10
	str	r5, [sp]
	mov	r3, #0x4
	ldsh	r2, [r0, r3]
	mov	ip, r2
	ldr	r7, [r0, #0x8]
	ldr	r2, .L4
	ldr	r2, [r2]
	lsr	r5, r2, #0x3
	mov	r2, #0x1f
	and	r5, r5, r2
	ldr	r3, [r0, #0x10]
	ldr	r2, [r0, #0x24]
	sub	r3, r3, r2
	lsl	r1, r1, #0x10
	asr	r1, r1, #0x10
	add	r2, r3, #0
	mul	r2, r2, r1
	asr	r2, r2, #0x8
	str	r2, [sp, #0x4]
	ldr	r2, [r0, #0x14]
	ldr	r3, [r0, #0x28]
	sub	r2, r2, r3
	mul	r2, r2, r1
	asr	r2, r2, #0x8
	str	r2, [sp, #0x8]
	ldr	r2, [r0, #0x18]
	ldr	r3, [r0, #0x2c]
	sub	r2, r2, r3
	mul	r1, r1, r2
	asr	r1, r1, #0x8
	str	r1, [sp, #0xc]
	lsl	r6, r6, #0x10
	asr	r6, r6, #0xd
	add	r6, r6, #0x20
	ldr	r0, [r0]
	add	r0, r0, r6
	str	r0, [sp, #0x10]
	mov	r0, ip
	mov	r1, #0x1
	NEG	r1, r1
	ADD ip, r1
	cmp	r0, #0
	beq	.L1	@cond_branch
	ldr	r6, .L4 + 4
	mov	r2, r8
	lsl	r0, r2, #0x10
	asr	r0, r0, #0x10
	mov	sl, r0
	mov	r3, r9
	lsl	r0, r3, #0x10
	asr	r0, r0, #0x10
	mov	r9, r0
	lsl	r0, r4, #0x10
	asr	r0, r0, #0x10
	str	r0, [sp, #0x14]
	ldr	r4, [sp]
	str	r4, [sp, #0x18]
.L3:
	ldr	r0, [r7]
	mov	r8, r0
	lsl	r0, r5, #0x1
	add	r0, r0, r6
	mov	r1, #0x0
	ldsh	r0, [r0, r1]
	mov	r4, sl
	mul	r4, r4, r0
	asr	r4, r4, #0x8
	str	r4, [sp, #0x1c]
	add	r5, r5, #0x1
	lsl	r0, r5, #0x1
	add	r0, r0, r6
	mov	r2, #0x0
	ldsh	r0, [r0, r2]
	mov	r3, sl
	mul	r3, r3, r0
	asr	r3, r3, #0x8
	str	r3, [sp, #0x20]
	add	r5, r5, #0x1
	lsl	r0, r5, #0x1
	add	r0, r0, r6
	mov	r3, #0x0
	ldsh	r0, [r0, r3]
	mov	r2, sl
	mul	r2, r2, r0
	asr	r2, r2, #0x8
	add	r5, r5, #0x1
	mov	r4, #0x1f
	and	r5, r5, r4
	lsl	r1, r5, #0x1
	add	r1, r1, r6
	ldrh	r3, [r1]
	ldr	r4, [sp, #0x14]
	add	r0, r3, r4
	strh	r0, [r7, #0x1a]
	mov	r3, #0x0
	ldsh	r0, [r1, r3]
	mov	r4, r9
	mul	r4, r4, r0
	add	r0, r4, #0
	asr	r0, r0, #0x8
	str	r0, [r7, #0x4]
	add	r5, r5, #0x1
	lsl	r0, r5, #0x1
	add	r0, r0, r6
	mov	r1, #0x0
	ldsh	r0, [r0, r1]
	mov	r3, r9
	mul	r3, r3, r0
	add	r0, r3, #0
	asr	r0, r0, #0x8
	str	r0, [r7, #0x8]
	add	r5, r5, #0x1
	lsl	r0, r5, #0x1
	add	r0, r0, r6
	mov	r4, #0x0
	ldsh	r0, [r0, r4]
	mov	r1, r9
	mul	r1, r1, r0
	add	r0, r1, #0
	asr	r0, r0, #0x8
	str	r0, [r7, #0xc]
	add	r5, r5, #0x1
	mov	r3, #0x1f
	and	r5, r5, r3
	ldr	r0, [sp, #0x1c]
	ldr	r1, [sp, #0x4]
	add	r4, r0, r1
	strh	r4, [r7, #0x10]
	ldr	r4, [sp, #0x20]
	ldr	r0, [sp, #0x8]
	add	r3, r4, r0
	strh	r3, [r7, #0x12]
	ldr	r1, [sp, #0xc]
	add	r2, r2, r1
	strh	r2, [r7, #0x14]
	mov	r2, sp
	ldrh	r2, [r2]
	strh	r2, [r7, #0x22]
	mov	r3, sp
	ldrh	r3, [r3, #0x18]
	strh	r3, [r7, #0x20]
	ldr	r4, [sp, #0x10]
	ldrh	r1, [r4]
	strh	r1, [r7, #0x1c]
	ldrh	r0, [r4, #0x2]
	strh	r0, [r7, #0x1e]
	mov	r0, r8
	cmp	r0, #0
	beq	.L2	@cond_branch
	strh	r1, [r0, #0x18]
.L2:
	add	r7, r7, #0x24
	mov	r0, ip
	mov	r1, #0x1
	NEG	r1, r1
	ADD ip, r1
	cmp	r0, #0
	bne	.L3	@cond_branch
.L1:
	add	sp, sp, #0x24
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L5:
	.align	2, 0
.L4:
	.4byte	0x3000e30
	.4byte	0x8074d64
	thumb_func_end sub_804E910

.align 2, 0 @ Don't pad with nop.
