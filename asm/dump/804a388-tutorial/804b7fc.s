	.include "asm/common.inc"

	thumb_func_start sub_804B7FC
sub_804B7FC:
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	add	sp, sp, #0xfffffff4
	str	r0, [sp, #0x8]
	mov	r0, #0x0
	mov	r8, r0
	ldr	r2, [sp, #0x8]
	ldr	r1, [r2]
	ldr	r0, [r1, #0x4]
	asr	r0, r0, #0x8
	str	r0, [sp]
	ldr	r0, [r1, #0x8]
	asr	r0, r0, #0x8
	mov	sl, r0
	ldr	r0, [r1, #0xc]
	asr	r0, r0, #0x8
	mov	r9, r0
	ldr	r3, .L4
	mov	r5, #0x0
	ldr	r1, .L4 + 4
	ldr	r0, [r1]
	mov	r7, #0x86
	lsl	r7, r7, #0x3
	add	r0, r0, r7
	ldr	r0, [r0]
	add	r0, r0, #0x1
	cmp	r8, r0
	bge	.L1	@cond_branch
	ldr	r6, .L4 + 8
.L10:
	cmp	r5, #0
	beq	.L2	@cond_branch
	ldr	r0, [r1]
	ldr	r1, .L4 + 12
	add	r0, r0, r1
	ldr	r0, [r0]
	add	r4, r0, r6
	b	.L3
.L5:
	.align	2, 0
.L4:
	.4byte	0x7ffffff
	.4byte	0x3000fb0
	.4byte	0xfffffbd8
	.4byte	0x42c
.L2:
	ldr	r0, .L11
	ldr	r4, [r0]
.L3:
	ldr	r2, [sp, #0x8]
	cmp	r4, r2
	beq	.L9	@cond_branch
	mov	r7, #0xf3
	lsl	r7, r7, #0x2
	add	r1, r4, r7
	mov	r0, #0xc
	ldrh	r1, [r1]
	and	r0, r0, r1
	cmp	r0, #0
	bne	.L9	@cond_branch
	add	r0, r4, #0
	mov	r1, #0x2
	str	r3, [sp, #0x4]
	bl	RiderHasFlag
	lsl	r0, r0, #0x18
	ldr	r3, [sp, #0x4]
	cmp	r0, #0
	bne	.L9	@cond_branch
	ldr	r1, [r4]
	ldr	r2, [r1, #0x4]
	asr	r2, r2, #0x8
	ldr	r0, [sp]
	sub	r2, r2, r0
	ldr	r0, [r1, #0x8]
	asr	r0, r0, #0x8
	mov	r7, sl
	sub	r0, r0, r7
	ldr	r1, [r1, #0xc]
	asr	r1, r1, #0x8
	mov	r7, r9
	sub	r1, r1, r7
	add	r7, r2, #0
	mul	r7, r7, r2
	add	r2, r7, #0
	add	r7, r0, #0
	mul	r7, r7, r0
	add	r0, r7, #0
	add	r2, r2, r0
	add	r0, r1, #0
	mul	r0, r0, r1
	add	r2, r2, r0
	cmp	r2, r3
	bge	.L9	@cond_branch
	add	r3, r2, #0
	mov	r8, r4
.L9:
	mov	r0, #0x85
	lsl	r0, r0, #0x3
	add	r6, r6, r0
	add	r5, r5, #0x1
	ldr	r1, .L11
	ldr	r0, [r1]
	mov	r2, #0x86
	lsl	r2, r2, #0x3
	add	r0, r0, r2
	ldr	r0, [r0]
	add	r0, r0, #0x1
	cmp	r5, r0
	blt	.L10	@cond_branch
.L1:
	mov	r0, r8
	add	sp, sp, #0xc
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6, r7}
	pop	{r1}
	bx	r1
.L12:
	.align	2, 0
.L11:
	.4byte	0x3000fb0
	thumb_func_end sub_804B7FC

.align 2, 0 @ Don't pad with nop.
