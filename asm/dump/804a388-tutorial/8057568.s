	.include "asm/common.inc"

	thumb_func_start sub_8057568
sub_8057568:
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	add	sp, sp, #0xfffffffc
	add	r7, r1, #0
	lsl	r0, r0, #0x10
	lsr	r6, r0, #0x10
	mov	r0, #0x1
	str	r0, [sp]
	add	r2, r2, #0x7
	asr	r5, r2, #0x3
	sub	r5, r5, #0x1
	sub	r0, r0, #0x2
	cmp	r5, r0
	beq	.L1	@cond_branch
	ldr	r1, .L6
	mov	sl, r1
.L5:
	mov	r4, #0x7
	mov	r0, #0x8
	add	r0, r0, r7
	mov	r8, r0
	add	r1, r6, #1
	mov	r9, r1
.L3:
	add	r0, r6, #0
	add	r1, r7, #0
	bl	sub_80659F0
	lsl	r0, r0, #0x10
	lsr	r1, r0, #0x10
	cmp	r1, #0
	bne	.L2	@cond_branch
	mov	r4, #0x0
.L2:
	sub	r0, r4, #1
	lsl	r0, r0, #0x10
	lsr	r4, r0, #0x10
	cmp	r4, sl
	bne	.L3	@cond_branch
	cmp	r1, #0
	beq	.L4	@cond_branch
	ldr	r0, .L6 + 4
	add	r1, r6, #0
	bl	printf
	mov	r0, #0x0
	str	r0, [sp]
	mov	r5, #0x0
.L4:
	mov	r7, r8
	mov	r1, r9
	lsl	r0, r1, #0x10
	lsr	r6, r0, #0x10
	sub	r5, r5, #0x1
	mov	r0, #0x1
	NEG	r0, r0
	cmp	r5, r0
	bne	.L5	@cond_branch
.L1:
	ldr	r0, [sp]
	add	sp, sp, #0x4
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6, r7}
	pop	{r1}
	bx	r1
.L7:
	.align	2, 0
.L6:
	.4byte	0xffff
	.4byte	0x872c960
	thumb_func_end sub_8057568

.align 2, 0 @ Don't pad with nop.
