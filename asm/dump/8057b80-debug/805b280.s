	.include "asm/common.inc"

	thumb_func_start sub_805B280
sub_805B280:
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	add	sp, sp, #0xfffffff8
	add	r6, r0, #0
	add	r7, r1, #0
	str	r2, [sp]
	mov	r9, r3
	ldr	r0, [sp, #0x28]
	mov	sl, r0
	mov	r1, r9
	asr	r1, r1, #0x3
	str	r1, [sp, #0x4]
	cmp	r0, #0x98
	bhi	.L805B382	@cond_branch
	mov	r0, r9
	add	r0, r0, #0x7
	cmp	r0, #0xf6
	bhi	.L805B382	@cond_branch
	ldrh	r1, [r6]
	add	r0, r7, #0
	bl	sub_805B270
	add	r5, r0, #0
	ldrh	r1, [r6, #0x2]
	add	r0, r7, #0
	bl	sub_805B270
	add	r4, r0, #0
	add	r0, r6, #0
	add	r0, r0, #0x40
	ldrh	r1, [r0]
	add	r0, r7, #0
	bl	sub_805B270
	mov	r8, r0
	add	r0, r6, #0
	add	r0, r0, #0x42
	ldrh	r1, [r0]
	add	r0, r7, #0
	bl	sub_805B270
	add	r7, r0, #0
	mov	r0, #0x7
	mov	r1, r9
	and	r1, r1, r0
	mov	r9, r1
	mov	r1, sl
	and	r1, r1, r0
	mov	sl, r1
	lsl	r0, r1, #0x2
	add	r5, r5, r0
	add	r4, r4, r0
	mov	r0, r9
	lsl	r0, r0, #0x2
	mov	r9, r0
	mov	r0, #0x20
	mov	r1, r9
	sub	r1, r0, r1
	mov	ip, r1
	mov	r0, sl
	mvn	r3, r0
	mov	r6, sl
	add	r3, r3, #0x8
	mov	r0, #0x1
	neg	r0, r0
	cmp	r3, r0
	beq	.L805B340	@cond_branch
	mov	sl, r0
.L805B30E:
	ldr	r1, [sp]
	ldmia	r1!, {r2}
	str	r1, [sp]
	add	r1, r2, #0
	mov	r0, r9
	lsl	r1, r0
	mov	r0, ip
	lsr	r2, r0
	ldr	r0, [sp, #0x4]
	cmp	r0, #0
	blt	.L805B32A	@cond_branch
	ldr	r0, [r5]
	orr	r0, r0, r1
	str	r0, [r5]
.L805B32A:
	ldr	r1, [sp, #0x4]
	cmp	r1, #0x1c
	bgt	.L805B336	@cond_branch
	ldr	r0, [r4]
	orr	r0, r0, r2
	str	r0, [r4]
.L805B336:
	add	r5, r5, #0x4
	add	r4, r4, #0x4
	sub	r3, r3, #0x1
	cmp	r3, sl
	bne	.L805B30E	@cond_branch
.L805B340:
	sub	r6, r6, #0x1
	mov	r0, #0x1
	neg	r0, r0
	cmp	r6, r0
	beq	.L805B382	@cond_branch
	add	r3, r0, #0
.L805B34C:
	ldr	r4, [sp]
	ldmia	r4!, {r2}
	str	r4, [sp]
	add	r1, r2, #0
	mov	r0, r9
	lsl	r1, r0
	mov	r4, ip
	lsr	r2, r4
	ldr	r0, [sp, #0x4]
	cmp	r0, #0
	blt	.L805B36A	@cond_branch
	mov	r4, r8
	ldr	r0, [r4]
	orr	r0, r0, r1
	str	r0, [r4]
.L805B36A:
	ldr	r0, [sp, #0x4]
	cmp	r0, #0x1c
	bgt	.L805B376	@cond_branch
	ldr	r0, [r7]
	orr	r0, r0, r2
	str	r0, [r7]
.L805B376:
	mov	r1, #0x4
	add r8, r1
	add	r7, r7, #0x4
	sub	r6, r6, #0x1
	cmp	r6, r3
	bne	.L805B34C	@cond_branch
.L805B382:
	add	sp, sp, #0x8
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
	thumb_func_end sub_805B280

.align 2, 0 @ Don't pad with nop.
