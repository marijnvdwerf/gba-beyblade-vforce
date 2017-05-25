	.include "asm/common.inc"

	thumb_func_start sub_804DDF8
sub_804DDF8:
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	add	sp, sp, #0xffffff90
	add	r7, r0, #0
	str	r1, [sp, #0x68]
	mov	r1, #0xff
	ldr	r4, .L6
	mov	r2, #0xb6
	lsl	r2, r2, #0x1
	add	r0, r7, r2
	ldr	r3, [r0]
	NEG	r0, r3
	and	r0, r0, r1
	lsr	r0, r0, #0x1
	lsl	r1, r0, #0x1
	add	r1, r1, r4
	mov	r5, #0x0
	ldsh	r2, [r1, r5]
	add	r0, r0, #0x40
	lsl	r0, r0, #0x1
	add	r0, r0, r4
	mov	r1, #0x0
	ldsh	r6, [r0, r1]
	mov	sl, r6
	mov	r5, #0xb8
	lsl	r5, r5, #0x1
	add	r0, r7, r5
	ldr	r0, [r0]
	asr	r0, r0, #0x1
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	lsl	r1, r0, #0x1
	add	r1, r1, r4
	mov	r5, #0x0
	ldsh	r6, [r1, r5]
	str	r6, [sp, #0x6c]
	add	r0, r0, #0x40
	lsl	r0, r0, #0x1
	add	r0, r0, r4
	mov	r1, #0x0
	ldsh	r6, [r0, r1]
	asr	r3, r3, #0x1
	lsl	r3, r3, #0x18
	lsr	r3, r3, #0x18
	lsl	r0, r3, #0x1
	add	r0, r0, r4
	mov	r1, #0x0
	ldsh	r5, [r0, r1]
	mov	r9, r5
	add	r3, r3, #0x40
	lsl	r3, r3, #0x1
	add	r3, r3, r4
	mov	r0, #0x0
	ldsh	r5, [r3, r0]
	add	r1, sp, #0x28
	mov	r8, r1
	mov	r0, sl
	str	r0, [sp]
	mov	r0, r8
	mov	r1, #0x0
	mov	r3, #0x0
	bl	sub_8059FF8
	add	r4, sp, #0x38
	str	r6, [sp]
	add	r0, r4, #0
	mov	r1, #0x0
	mov	r2, #0x0
	ldr	r3, [sp, #0x6c]
	bl	sub_8059FF8
	add	r6, sp, #0x48
	str	r5, [sp]
	add	r0, r6, #0
	mov	r1, #0x0
	mov	r2, r9
	mov	r3, #0x0
	bl	sub_8059FF8
	add	r5, sp, #0x58
	mov	r0, r8
	add	r1, r4, #0
	add	r2, r5, #0
	bl	sub_805A148
	mov	r1, #0xbc
	lsl	r1, r1, #0x1
	add	r4, r7, r1
	add	r0, r5, #0
	add	r1, r6, #0
	add	r2, r4, #0
	bl	sub_805A148
	add	r0, r4, #0
	add	r1, sp, #0x4
	bl	sub_805A1DC
	add	r0, r7, #0
	mov	r1, #0x2
	bl	sub_804E440
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L2	@cond_branch
	add	r0, r7, #0
	mov	r1, #0x2
	bl	RiderHasFlag
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L2	@cond_branch
	ldr	r2, [sp, #0x68]
	ldr	r0, [r2, #0x40]
	str	r0, [r7, #0x40]
	ldr	r0, [r2, #0x44]
	NEG	r0, r0
	str	r0, [r7, #0x44]
.L2:
	add	r0, r7, #0
	mov	r1, #0x2
	bl	RiderHasFlag
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L3	@cond_branch
	ldr	r2, [r7, #0x40]
	lsl	r2, r2, #0x8
	ldr	r3, [r7, #0x44]
	lsl	r3, r3, #0x8
	ldr	r0, [sp, #0x4]
	mul	r0, r0, r2
	ldr	r1, [sp, #0x1c]
	mul	r1, r1, r3
	add	r0, r0, r1
	asr	r0, r0, #0x10
	str	r0, [r7, #0x78]
	add	r4, r7, #0
	add	r4, r4, #0x80
	ldr	r0, [sp, #0x8]
	mul	r0, r0, r2
	ldr	r1, [sp, #0x20]
	mul	r1, r1, r3
	add	r0, r0, r1
	NEG	r0, r0
	asr	r0, r0, #0x10
	str	r0, [r4]
	ldr	r0, [sp, #0xc]
	mul	r0, r0, r2
	ldr	r1, [sp, #0x24]
	mul	r1, r1, r3
	add	r0, r0, r1
	NEG	r0, r0
	asr	r0, r0, #0x10
	str	r0, [r7, #0x7c]
.L3:
	add	r0, r7, #0
	mov	r1, #0x2
	bl	RiderHasFlag
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L4	@cond_branch
	ldr	r0, [r7, #0x78]
	ldr	r5, [sp, #0x68]
	str	r0, [r5, #0x40]
	ldr	r0, [r7, #0x7c]
	str	r0, [r5, #0x44]
	add	r0, r7, #0
	add	r0, r0, #0x80
	ldr	r1, [r0]
	ldr	r0, [r5, #0x54]
	add	r1, r1, r0
	add	r0, r7, #0
	add	r0, r0, #0x88
	ldr	r0, [r0]
	sub	r0, r0, #0x78
	add	r1, r1, r0
	str	r1, [r5, #0x48]
	b	.L8
.L7:
	.align	2, 0
.L6:
	.4byte	0x874cc3c
.L4:
	add	r0, r7, #0
	add	r0, r0, #0x88
	ldr	r4, [r0]
	cmp	r4, #0
	beq	.L8	@cond_branch
	ldr	r6, [sp, #0x68]
	ldr	r0, [r6, #0x48]
	add	r0, r0, r4
	str	r0, [r6, #0x48]
.L8:
	add	sp, sp, #0x70
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
	thumb_func_end sub_804DDF8

.align 2, 0 @ Don't pad with nop.
