	.include "asm/common.inc"

	thumb_func_start sub_804E7D4
sub_804E7D4:
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	add	sp, sp, #0xfffffff0
	add	r7, r0, #0
	ldr	r0, [sp, #0x30]
	mov	ip, r0
	ldr	r4, [sp, #0x34]
	mov	r8, r4
	ldr	r0, [sp, #0x3c]
	ldr	r5, [sp, #0x40]
	mov	r9, r5
	lsl	r0, r0, #0x10
	lsr	r0, r0, #0x10
	str	r0, [sp]
	mov	r0, #0x6
	ldsh	r6, [r7, r0]
	lsl	r0, r6, #0x3
	add	r0, r0, r6
	lsl	r0, r0, #0x2
	ldr	r4, [r7, #0x8]
	add	r0, r4, r0
	str	r0, [sp, #0x4]
	ldr	r0, .L3
	ldr	r4, [r0]
	lsr	r4, r4, #0x3
	add	r4, r4, r6
	mov	r0, #0x1f
	and	r4, r4, r0
	lsl	r0, r4, #0x1
	ldr	r5, .L3 + 4
	add	r0, r0, r5
	mov	r5, #0x0
	ldsh	r0, [r0, r5]
	mov	r5, r8
	lsl	r5, r5, #0x10
	asr	r5, r5, #0x10
	mov	r8, r5
	mov	r6, r8
	mul	r6, r6, r0
	asr	r6, r6, #0x8
	add	r0, r4, #1
	lsl	r0, r0, #0x1
	ldr	r5, .L3 + 4
	add	r0, r0, r5
	mov	r5, #0x0
	ldsh	r0, [r0, r5]
	mov	r5, r8
	mul	r5, r5, r0
	asr	r5, r5, #0x8
	mov	sl, r5
	add	r4, r4, #0x2
	lsl	r4, r4, #0x1
	ldr	r0, .L3 + 4
	add	r4, r4, r0
	mov	r5, #0x0
	ldsh	r0, [r4, r5]
	mov	r4, r8
	mul	r4, r4, r0
	asr	r4, r4, #0x8
	mov	r8, r4
	ldr	r5, [sp, #0x4]
	ldr	r5, [r5]
	str	r5, [sp, #0x8]
	mov	r0, r9
	lsl	r0, r0, #0x10
	asr	r0, r0, #0xd
	mov	r9, r0
	mov	r4, #0x20
	ADD r9, r4
	ldr	r5, [r7]
	ADD r5, r9
	str	r5, [sp, #0xc]
	mov	r0, #0x0
	mov	r9, r0
	mov	r4, sp
	ldrh	r5, [r4, #0x38]
	ldr	r4, [sp, #0x4]
	strh	r5, [r4, #0x1a]
	str	r0, [r4, #0xc]
	str	r0, [r4, #0x8]
	str	r0, [r4, #0x4]
	ldr	r0, [r7, #0x1c]
	strh	r0, [r4, #0x16]
	ldr	r0, [r7, #0x20]
	strh	r0, [r4, #0x18]
	ldr	r4, [r7, #0x10]
	ldr	r0, [r7, #0x24]
	sub	r4, r4, r0
	mov	r5, ip
	lsl	r0, r5, #0x10
	asr	r5, r0, #0x10
	add	r0, r4, #0
	mul	r0, r0, r5
	asr	r0, r0, #0x8
	add	r6, r6, r0
	add	r6, r6, r1
	ldr	r0, [sp, #0x4]
	strh	r6, [r0, #0x10]
	ldr	r0, [r7, #0x14]
	ldr	r1, [r7, #0x28]
	sub	r0, r0, r1
	mul	r0, r0, r5
	asr	r0, r0, #0x8
	ADD sl, r0
	ADD sl, r2
	mov	r2, sl
	ldr	r1, [sp, #0x4]
	strh	r2, [r1, #0x12]
	ldr	r0, [r7, #0x18]
	ldr	r1, [r7, #0x2c]
	sub	r0, r0, r1
	mul	r0, r0, r5
	asr	r0, r0, #0x8
	ADD r8, r0
	ADD r8, r3
	mov	r5, r8
	ldr	r4, [sp, #0x4]
	strh	r5, [r4, #0x14]
	mov	r0, sp
	ldrh	r0, [r0]
	strh	r0, [r4, #0x22]
	mov	r1, sp
	ldrh	r1, [r1]
	strh	r1, [r4, #0x20]
	ldr	r2, [sp, #0xc]
	ldrh	r1, [r2]
	strh	r1, [r4, #0x1c]
	ldrh	r0, [r2, #0x2]
	strh	r0, [r4, #0x1e]
	ldr	r4, [sp, #0x8]
	cmp	r4, #0
	beq	.L1	@cond_branch
	strh	r1, [r4, #0x18]
.L1:
	ldrh	r0, [r7, #0x6]
	add	r0, r0, #0x1
	strh	r0, [r7, #0x6]
	lsl	r0, r0, #0x10
	ldrh	r5, [r7, #0x4]
	lsl	r1, r5, #0x10
	cmp	r0, r1
	blt	.L2	@cond_branch
	mov	r0, r9
	strh	r0, [r7, #0x6]
.L2:
	add	sp, sp, #0x10
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
	thumb_func_end sub_804E7D4

.align 2, 0 @ Don't pad with nop.
