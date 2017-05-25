	.include "asm/common.inc"

	thumb_func_start sub_80574D0
sub_80574D0:
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	add	sp, sp, #0xfffffffc
	add	r7, r0, #0
	lsl	r1, r1, #0x10
	lsr	r4, r1, #0x10
	mov	r0, #0x1
	str	r0, [sp]
	add	r2, r2, #0x7
	asr	r6, r2, #0x3
	b	.L1
.L6:
	mov	r5, #0x7
	mov	r1, #0x8
	add	r1, r1, r7
	mov	sl, r1
	add	r0, r4, #1
	mov	r9, r0
.L4:
	add	r0, r4, #0
	add	r1, r7, #0
	bl	sub_8065AA0
	lsl	r0, r0, #0x10
	cmp	r0, #0
	bne	.L3	@cond_branch
	add	r0, r4, #0
	add	r1, r7, #0
	bl	writeToBatteryBackup
	lsl	r0, r0, #0x10
	lsr	r0, r0, #0x10
	mov	r8, r0
	cmp	r0, #0
	bne	.L3	@cond_branch
	mov	r5, #0x0
.L3:
	sub	r0, r5, #1
	lsl	r0, r0, #0x10
	lsr	r5, r0, #0x10
	ldr	r1, .L7
	cmp	r5, r1
	bne	.L4	@cond_branch
	mov	r0, r8
	cmp	r0, #0
	beq	.L5	@cond_branch
	ldr	r0, .L7 + 4
	add	r1, r4, #0
	bl	printf
	mov	r1, #0x0
	str	r1, [sp]
	mov	r6, #0x0
.L5:
	mov	r7, sl
	mov	r1, r9
	lsl	r0, r1, #0x10
	lsr	r4, r0, #0x10
.L1:
	sub	r6, r6, #0x1
	mov	r0, #0x1
	NEG	r0, r0
	cmp	r6, r0
	bne	.L6	@cond_branch
	ldr	r0, [sp]
	add	sp, sp, #0x4
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6, r7}
	pop	{r1}
	bx	r1
.L8:
	.align	2, 0
.L7:
	.4byte	0xffff
	.4byte	0x872c928
	thumb_func_end sub_80574D0

.align 2, 0 @ Don't pad with nop.
