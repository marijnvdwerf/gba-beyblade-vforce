	.include "asm/common.inc"

	thumb_func_start sub_804B624
sub_804B624:
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	add	sp, sp, #0xfffffff8
	mov	r7, sp
	mov	r1, sp
	add	r0, r1, #0
	str	r0, [r7]
	mov	r4, #0x1
	ldr	r2, .L4
	mov	r8, r2
	ldr	r0, [r2]
	mov	r6, #0x86
	lsl	r6, r6, #0x3
	add	r0, r0, r6
	ldr	r1, [r0]
	add	r1, r1, #0x1
	lsl	r0, r1, #0x5
	lsr	r0, r0, #0x3
	mov	r2, sp
	sub	r2, r2, r0
	mov	sp, r2
	mov	sl, sp
	mov	r2, #0x0
	cmp	r2, r1
	bge	.L1	@cond_branch
	ldr	r5, .L4
	mov	r9, sp
	mov	r3, #0x0
.L7:
	cmp	r2, #0
	beq	.L2	@cond_branch
	ldr	r0, [r5]
	ldr	r6, .L4 + 4
	add	r0, r0, r6
	ldr	r6, .L4 + 8
	add	r1, r3, r6
	ldr	r0, [r0]
	add	r0, r0, r1
	b	.L3
.L5:
	.align	2, 0
.L4:
	.4byte	0x3000fb0
	.4byte	0x42c
	.4byte	0xfffffbd8
.L2:
	ldr	r0, [r5]
.L3:
	add	r6, r0, #0
	mov	r0, #0xf3
	lsl	r0, r0, #0x2
	add	r1, r6, r0
	mov	r0, #0x4
	ldrh	r1, [r1]
	and	r0, r0, r1
	mov	r1, #0x0
	cmp	r0, #0
	bne	.L6	@cond_branch
	add	r1, r6, #0
.L6:
	mov	r6, r9
	add	r6, r6, #0x4
	mov	r9, r6
	sub	r6, r6, #0x4
	stmia	r6!, {r1}
	mov	r0, #0x85
	lsl	r0, r0, #0x3
	add	r3, r3, r0
	add	r2, r2, #0x1
	mov	r1, r8
	ldr	r0, [r1]
	mov	r6, #0x86
	lsl	r6, r6, #0x3
	add	r0, r0, r6
	ldr	r0, [r0]
	add	r0, r0, #0x1
	cmp	r2, r0
	blt	.L7	@cond_branch
.L1:
	ldr	r3, .L14
	ldr	r0, [r3]
	mov	r1, #0x86
	lsl	r1, r1, #0x3
	add	r0, r0, r1
	ldr	r0, [r0]
	mov	r2, #0x0
	cmp	r2, r0
	bge	.L8	@cond_branch
.L13:
	lsl	r0, r2, #0x2
	ADD r0, sl
	ldr	r6, [r0]
	add	r2, r2, #0x1
	mov	r9, r2
	cmp	r6, #0
	beq	.L9	@cond_branch
	add	r2, r4, #0
	ldr	r0, [r3]
	add	r0, r0, r1
	ldr	r0, [r0]
	add	r0, r0, #0x1
	add	r1, r4, #1
	mov	r8, r1
	cmp	r4, r0
	bge	.L10	@cond_branch
	lsl	r0, r4, #0x2
	mov	r1, sl
	add	r5, r0, r1
.L12:
	ldr	r4, [r5]
	cmp	r4, #0
	beq	.L11	@cond_branch
	add	r0, r6, #0
	add	r1, r4, #0
	str	r2, [r7, #0x4]
	bl	rider_vs_rider_collision_804DB94
	add	r0, r6, #0
	add	r1, r4, #0
	bl	sub_804DAA0
	ldr	r2, [r7, #0x4]
.L11:
	add	r5, r5, #0x4
	add	r2, r2, #0x1
	ldr	r0, .L14
	ldr	r0, [r0]
	mov	r1, #0x86
	lsl	r1, r1, #0x3
	add	r0, r0, r1
	ldr	r0, [r0]
	add	r0, r0, #0x1
	cmp	r2, r0
	blt	.L12	@cond_branch
.L10:
	mov	r4, r8
.L9:
	mov	r2, r9
	ldr	r3, .L14
	ldr	r0, [r3]
	mov	r1, #0x86
	lsl	r1, r1, #0x3
	add	r0, r0, r1
	ldr	r0, [r0]
	cmp	r2, r0
	blt	.L13	@cond_branch
.L8:
	ldr	r2, [r7]
	mov	sp, r2
	add	sp, sp, #0x8
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L15:
	.align	2, 0
.L14:
	.4byte	0x3000fb0
	thumb_func_end sub_804B624

.align 2, 0 @ Don't pad with nop.
