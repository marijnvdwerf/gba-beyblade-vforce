	.include "asm/common.inc"

	thumb_func_start sub_8060CDC
sub_8060CDC:
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	add	sp, sp, #0xfffffffc
	add	r6, r0, #0
	ldr	r2, [r6, #0x8]
	cmp	r2, #0
	beq	.L8060D80	@cond_branch
	ldr	r0, [r6]
	mov	sl, r0
	ldr	r1, [r6, #0x4]
	str	r1, [sp]
	ldr	r3, [r0]
	mov	r9, r3
	ldr	r7, [r1, #0x4]
	ldr	r1, .L8060D50
	ldr	r0, [r1]
	add	r0, r0, r2
	str	r0, [r1]
	mov	r4, sl
	sub	r5, r2, #1
	mov	r0, #0x1
	NEG	r0, r0
	cmp	r5, r0
	beq	.L8060D42	@cond_branch
	mov	r8, r0
.L8060D14:
	ldr	r0, [r4, #0x30]
	cmp	r0, #0
	beq	.L8060D22	@cond_branch
	bl	sub_8060B38
	mov	r0, #0x0
	str	r0, [r4, #0x30]
.L8060D22:
	ldr	r2, [r4, #0x24]
	cmp	r2, #0
	blt	.L8060D36	@cond_branch
	ldrh	r0, [r4, #0x16]
	sub	r0, r0, #0x5
	mov	r1, #0x1
	LSL	r1, r0
	add	r0, r2, #0
	bl	freeSpriteVramLocation
.L8060D36:
	mov	r0, r8
	str	r0, [r4, #0x24]
	ldr	r4, [r4, #0x4]
	sub	r5, r5, #0x1
	cmp	r5, r8
	bne	.L8060D14	@cond_branch
.L8060D42:
	mov	r1, r9
	cmp	r1, #0
	beq	.L8060D58	@cond_branch
	str	r7, [r1, #0x4]
	ldr	r2, .L8060D50 + 4
	b	.L8060D5E
.L8060D4E:
	.align	2, 0
.L8060D50:
	.4byte	0x3005df4
	.4byte	0x3005de4
.L8060D58:
	ldr	r0, .L8060D90
	str	r7, [r0]
	add	r2, r0, #0
.L8060D5E:
	cmp	r7, #0
	beq	.L8060D66	@cond_branch
	mov	r3, r9
	str	r3, [r7]
.L8060D66:
	ldr	r1, .L8060D90 + 4
	ldr	r0, [r1]
	ldr	r3, [sp]
	str	r0, [r3, #0x4]
	mov	r0, sl
	str	r0, [r1]
	mov	r0, #0x0
	str	r0, [r6, #0x8]
	str	r0, [r6]
	str	r0, [r6, #0x4]
	ldr	r0, [r2]
	bl	sub_80604D4
.L8060D80:
	add	sp, sp, #0x4
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L8060D90:
	.align	2, 0

	.4byte	0x3005de4
	.4byte	0x3005dec
	thumb_func_end sub_8060CDC

.align 2, 0 @ Don't pad with nop.
