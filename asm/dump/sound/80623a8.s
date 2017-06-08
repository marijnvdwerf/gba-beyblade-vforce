	.include "asm/common.inc"

	thumb_func_start sub_80623A8
sub_80623A8:
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	mov	r8, r0
	ldr	r0, _2
	ldr	r7, [r0]
	ldr	r0, _2 + 4
	mov	r9, r0
	mov	r6, #0x7f
	ldr	r1, _2 + 8
	mov	sl, r1
_1:
	mov	r2, r9
	add	r2, r2, #0x4
	mov	r9, r2
	sub	r2, r2, #0x4
	ldmia	r2!, {r0}
	mov	r1, #0x0
	ldr	r2, _2 + 12
	ldr	r3, _2 + 16
	bl	__muldi3
	add	r3, r1, #0
	add	r2, r0, #0
	lsr	r5, r2, #0x14
	lsl	r4, r3, #0xc
	add	r1, r5, #0
	orr	r1, r1, r4
	lsl	r0, r2, #0xc
	ldr	r2, _2 + 20
	ldr	r3, _2 + 24
	bl	__divdi3
	mov	r2, r8
	mov	r3, #0x0
	bl	__divdi3
	stmia	r7!, {r0}
	sub	r6, r6, #0x1
	mov	r0, #0x1
	neg	r0, r0
	cmp	r6, r0
	bne	_1	@cond_branch
	mov	r1, sl
	ldr	r0, [r1]
	ldr	r2, _2 + 28
	str	r0, [r2]
	mov	r0, #0x80
	lsl	r0, r0, #0x9
	ldr	r1, _2 + 32
	ldrh	r1, [r1]
	sub	r0, r0, r1
	ldr	r2, _2 + 36
	str	r0, [r2]
	ldr	r1, _2 + 40
	add	r0, r1, #0
	ldr	r2, _2 + 44
	strh	r0, [r2]
	mov	r1, #0x80
	lsl	r1, r1, #0x1
	add	r0, r1, #0
	ldr	r2, _2 + 48
	strh	r0, [r2]
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
_3:
	.align	2, 0
_2:
	.word	_soundTables
	.word	Unk_8755B90
	.word	_soundMixer
	.word	0x2b11
	.word	0x0
	.word	0x105
	.word	0x0
	.word	_unk3000D90
	.word	_unk3005E4C
	.word	_unk3000D94
	.word	0xffff
	.word	_unk3000DA2
	.word	_unk3000DA0
	thumb_func_end sub_80623A8

.align 2, 0 @ Don't pad with nop.
