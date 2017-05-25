	.include "asm/common.inc"

	thumb_func_start sub_804A110
sub_804A110:
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	ldr	r1, .L7
	mov	r2, #0x8e
	lsl	r2, r2, #0x3
	add	r0, r1, r2
	ldr	r6, [r0]
	add	r0, r1, #0
	add	r0, r0, #0xb4
	ldr	r0, [r0]
	ldr	r0, [r0, #0x4]
	ldr	r2, [r0, #0x18]
	mov	r8, r2
	ldr	r7, [r0, #0x14]
	sub	r7, r7, #0x1
	mov	r0, #0x1
	NEG	r0, r0
	cmp	r7, r0
	beq	.L1	@cond_branch
	mov	sl, r1
	mov	r0, #0x80
	ADD r0, sl
	mov	r9, r0
.L11:
	mov	r2, r8
	ldr	r0, .L7 + 4
	ADD r0, sl
	ldrb	r0, [r0]
	lsl	r0, r0, #0x18
	asr	r0, r0, #0x18
	cmp	r0, #0
	bgt	.L2	@cond_branch
	add	r2, r2, #0x4
.L2:
	mov	r1, #0x0
	ldsh	r0, [r2, r1]
	lsl	r0, r0, #0x8
	ldr	r1, [r6]
	sub	r3, r0, r1
	mov	r1, #0x2
	ldsh	r0, [r2, r1]
	lsl	r0, r0, #0x8
	ldr	r1, [r6, #0x4]
	sub	r4, r0, r1
	ldr	r0, .L7 + 8
	and	r3, r3, r0
	and	r4, r4, r0
	cmp	r3, #0
	bne	.L3	@cond_branch
	cmp	r4, #0
	beq	.L4	@cond_branch
.L3:
	mov	r0, #0x20
	mov	r2, r9
	ldrb	r2, [r2]
	and	r0, r0, r2
	cmp	r0, #0
	bne	.L5	@cond_branch
	add	r0, r3, #0
	mov	r1, #0x10
	bl	sub_80491E0
	lsl	r0, r0, #0x10
	asr	r5, r0, #0x10
	b	.L6
.L8:
	.align	2, 0
.L7:
	.4byte	0x3000650
	.4byte	0x585
	.4byte	0xffffff00
.L5:
	mov	r5, #0x0
.L6:
	mov	r0, #0x10
	mov	r1, r9
	ldrb	r1, [r1]
	and	r0, r0, r1
	cmp	r0, #0
	bne	.L9	@cond_branch
	add	r0, r4, #0
	mov	r1, #0x10
	bl	sub_80491E0
	lsl	r0, r0, #0x10
	asr	r2, r0, #0x10
	b	.L10
.L9:
	mov	r2, #0x0
.L10:
	add	r0, r6, #0
	add	r1, r5, #0
	bl	sub_8061824
.L4:
	add	r6, r6, #0x30
	mov	r2, #0x2c
	ADD r8, r2
	sub	r7, r7, #0x1
	mov	r0, #0x1
	NEG	r0, r0
	cmp	r7, r0
	bne	.L11	@cond_branch
.L1:
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
	thumb_func_end sub_804A110

.align 2, 0 @ Don't pad with nop.
