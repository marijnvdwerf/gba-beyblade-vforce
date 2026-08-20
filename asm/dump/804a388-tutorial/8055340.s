	.include "asm/common.inc"

	thumb_func_start sub_8055340
sub_8055340:
	push	{r4, r5, lr}
	ldr	r0, .L8055398
	ldr	r4, [r0]
	ldr	r0, .L8055398 + 4
	add	r5, r4, r0
	add	r0, r5, #0
	bl	sub_804C208
	ldr	r2, .L8055398 + 8
	add	r1, r4, r2
	ldrh	r2, [r1]
	mov	r3, #0x0
	ldsh	r0, [r1, r3]
	cmp	r0, #0
	bne	.L8055360	@cond_branch
	b	.L8055480
.L8055360:
	mov	r3, #0x0
	sub	r0, r2, #1
	strh	r0, [r1]
	mov	r1, #0x1f
	and	r0, r0, r1
	cmp	r0, #0
	bne	.L805537A	@cond_branch
	ldr	r0, .L8055398 + 12
	add	r1, r4, r0
	ldr	r0, [r1]
	add	r0, r0, #0x1
	str	r0, [r1]
	mov	r3, #0x1
.L805537A:
	cmp	r3, #0
	bne	.L8055380	@cond_branch
	b	.L8055480
.L8055380:
	ldr	r1, .L8055398 + 12
	add	r0, r4, r1
	ldr	r0, [r0]
	sub	r0, r0, #0x1
	cmp	r0, #0x4
	bhi	.L805547A	@cond_branch
	lsl	r0, r0, #0x2
	ldr	r1, .L8055398 + 16
	add	r0, r0, r1
	ldr	r0, [r0]
	mov	pc, r0
.L8055396:
	.align	2, 0
.L8055398:
	.4byte	_gameData
	.4byte	0x1084
	.4byte	0x10fe
	.4byte	0x1108
	.4byte	.L80553AC
.L80553AC:
	.4byte	.L80553C0
	.4byte	.L80553EC
	.4byte	.L805540C
	.4byte	.L8055464
	.4byte	.L805546A
.L80553C0:
	add	r0, r5, #0
	add	r0, r0, #0x88
	ldr	r2, [r0]
	mov	r3, #0x8e
	lsl	r3, r3, #0x2
	add	r2, r2, r3
	mov	r0, #0x5
	mov	r1, #0x0
	bl	sub_8055734
	add	r1, r5, #0
	add	r1, r1, #0x74
	mov	r0, #0x8
	strh	r0, [r1]
	bl	sub_8051868
	bl	sub_804FC00
	mov	r0, #0x14
	bl	sub_804ABFC
	b	.L8055480
.L80553EC:
	add	r4, r5, #0
	add	r4, r4, #0x88
	ldr	r0, [r4]
	mov	r1, #0x80
	lsl	r1, r1, #0x6
	bl	SetRiderFlag
	ldr	r1, [r4]
	mov	r4, #0x8e
	lsl	r4, r4, #0x2
	add	r1, r1, r4
	mov	r0, #0x6
	mov	r2, #0x0
	bl	sub_8055734
	b	.L8055480
.L805540C:
	add	r0, r5, #0
	add	r0, r0, #0x88
	ldr	r4, [r0]
	add	r1, r5, #0
	add	r1, r1, #0x74
	mov	r0, #0x8
	strh	r0, [r1]
	bl	sub_8051868
	cmp	r0, #0x1
	beq	.L8055440	@cond_branch
	cmp	r0, #0x1
	bgt	.L805542C	@cond_branch
	cmp	r0, #0
	beq	.L8055436	@cond_branch
	b	.L805545C
.L805542C:
	cmp	r0, #0x2
	beq	.L805544A	@cond_branch
	cmp	r0, #0x3
	beq	.L8055454	@cond_branch
	b	.L805545C
.L8055436:
	add	r0, r4, #0
	mov	r1, #0x0
	bl	sub_804CEF4
	b	.L805545C
.L8055440:
	add	r0, r4, #0
	mov	r1, #0x2
	bl	sub_804CEF4
	b	.L805545C
.L805544A:
	add	r0, r4, #0
	mov	r1, #0x1
	bl	sub_804CEF4
	b	.L805545C
.L8055454:
	add	r0, r4, #0
	mov	r1, #0x4
	bl	sub_804CEF4
.L805545C:
	mov	r0, #0x1
	bl	sub_804ABFC
	b	.L8055480
.L8055464:
	bl	sub_80558D0
	b	.L8055480
.L805546A:
	add	r0, r5, #0
	add	r0, r0, #0x88
	ldr	r0, [r0]
	mov	r1, #0x80
	lsl	r1, r1, #0x6
	bl	UnsetRiderFlag
	b	.L8055480
.L805547A:
	mov	r0, #0x1
	bl	sub_804F84C
.L8055480:
	ldr	r0, .L80554C0
	ldr	r0, [r0]
	lsr	r0, r0, #0x4
	mov	r1, #0x3
	and	r0, r0, r1
	cmp	r0, #0
	bne	.L805555C	@cond_branch
	add	r4, r5, #0
	add	r4, r4, #0x74
	ldrh	r1, [r4]
	mov	r0, #0x0
	ldsh	r2, [r4, r0]
	cmp	r2, #0
	beq	.L80554C4	@cond_branch
	add	r3, r5, #0
	add	r3, r3, #0x34
	mov	r0, #0x1
	and	r0, r0, r1
	mov	r2, #0x0
	cmp	r0, #0
	bne	.L80554AC	@cond_branch
	mov	r2, #0x7
.L80554AC:
	add	r0, r3, #0
	mov	r1, #0xa0
	lsl	r1, r1, #0x13
	bl	sub_80631EC
	ldrh	r0, [r4]
	sub	r0, r0, #0x1
	strh	r0, [r4]
	b	.L8055554
.L80554BE:
	.align	2, 0
.L80554C0:
	.4byte	_unk3000E30
.L80554C4:
	add	r3, r5, #0
	add	r3, r3, #0x76
	ldrh	r0, [r3]
	mov	r1, #0x0
	ldsh	r4, [r3, r1]
	cmp	r4, #0
	beq	.L8055508	@cond_branch
	add	r1, r5, #0
	add	r1, r1, #0x78
	ldrh	r4, [r1]
	add	r0, r4, r0
	strh	r0, [r3]
	lsl	r0, r0, #0x10
	asr	r0, r0, #0x10
	cmp	r0, #0x7
	ble	.L80554F6	@cond_branch
	mov	r0, #0x7
	strh	r0, [r3]
	strh	r2, [r1]
	add	r2, r5, #0
	add	r2, r2, #0x80
	ldr	r0, [r2]
	mov	r1, #0x1
	orr	r0, r0, r1
	str	r0, [r2]
.L80554F6:
	add	r0, r5, #0
	add	r0, r0, #0x5c
	mov	r1, #0xa0
	lsl	r1, r1, #0x13
	mov	r4, #0x0
	ldsh	r2, [r3, r4]
	bl	sub_80631EC
	b	.L8055554
.L8055508:
	add	r2, r5, #0
	add	r2, r2, #0x70
	ldrh	r1, [r2]
	mov	r3, #0x0
	ldsh	r0, [r2, r3]
	cmp	r0, #0
	beq	.L8055532	@cond_branch
	sub	r0, r1, #1
	strh	r0, [r2]
	add	r0, r5, #0
	add	r0, r0, #0x34
	mov	r1, #0xa0
	lsl	r1, r1, #0x13
	mov	r3, #0x0
	ldsh	r2, [r2, r3]
	bl	sub_80631EC
	add	r0, r5, #0
	add	r0, r0, #0x72
	strh	r4, [r0]
	b	.L8055554
.L8055532:
	add	r2, r5, #0
	add	r2, r2, #0x72
	ldrh	r1, [r2]
	mov	r4, #0x0
	ldsh	r0, [r2, r4]
	cmp	r0, #0
	beq	.L8055554	@cond_branch
	sub	r0, r1, #1
	strh	r0, [r2]
	add	r0, r5, #0
	add	r0, r0, #0x48
	mov	r1, #0xa0
	lsl	r1, r1, #0x13
	mov	r3, #0x0
	ldsh	r2, [r2, r3]
	bl	sub_80631EC
.L8055554:
	mov	r1, #0xa0
	lsl	r1, r1, #0x13
	mov	r0, #0x0
	strh	r0, [r1]
.L805555C:
	ldr	r0, [r5, #0x7c]
	cmp	r0, #0
	beq	.L80555D2	@cond_branch
	add	r3, r5, #0
	add	r3, r3, #0x7c
	add	r0, r5, #0
	add	r0, r0, #0x7e
	mov	r4, #0x0
	ldsh	r0, [r0, r4]
	mov	r2, #0x0
	ldsh	r1, [r3, r2]
	sub	r0, r0, r1
	asr	r0, r0, #0x3
	ldrh	r4, [r3]
	add	r0, r4, r0
	mov	r1, #0x0
	strh	r0, [r3]
	ldr	r0, .L80555D8
	strh	r1, [r0]
	ldr	r1, .L80555D8 + 4
	ldr	r2, .L80555D8 + 8
	add	r0, r2, #0
	strh	r0, [r1]
	ldr	r0, .L80555D8 + 12
	mov	r1, #0xf0
	strh	r1, [r0]
	add	r0, r0, #0x2
	strh	r1, [r0]
	ldr	r1, .L80555D8 + 16
	ldrh	r4, [r3]
	lsl	r0, r4, #0x10
	asr	r0, r0, #0x14
	strh	r0, [r1]
	ldr	r2, .L80555D8 + 20
	ldrh	r1, [r3]
	lsl	r0, r1, #0x10
	asr	r0, r0, #0x14
	mov	r1, #0xa0
	sub	r0, r1, r0
	lsl	r0, r0, #0x8
	orr	r0, r0, r1
	strh	r0, [r2]
	sub	r2, r2, #0x46
	ldrh	r0, [r2]
	mov	r4, #0xc0
	lsl	r4, r4, #0x7
	add	r1, r4, #0
	orr	r0, r0, r1
	strh	r0, [r2]
	ldrh	r1, [r3]
	lsl	r0, r1, #0x10
	asr	r0, r0, #0x14
	cmp	r0, #0
	bne	.L80555D2	@cond_branch
	strh	r0, [r3]
	ldrh	r1, [r2]
	ldr	r0, .L80555D8 + 24
	and	r0, r0, r1
	strh	r0, [r2]
.L80555D2:
	pop	{r4, r5}
	pop	{r0}
	bx	r0
.L80555D8:
	.align	2, 0

	.4byte	0x4000048
	.4byte	0x400004a
	.4byte	0xffff
	.4byte	0x4000040
	.4byte	0x4000044
	.4byte	0x4000046
	.4byte	0x9fff
	thumb_func_end sub_8055340

.align 2, 0 @ Don't pad with nop.
