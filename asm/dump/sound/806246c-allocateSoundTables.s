	.include "asm/common.inc"

	thumb_func_start allocateSoundTables
allocateSoundTables:
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	add	sp, sp, #0xfffffffc
	mov	r8, r0
	add	r4, r1, #0
	bl	sub_806234C
	cmp	r4, #0x10
	bls	_1	@cond_branch
	mov	r4, #0x10
_1:
	ldr	r0, _5
	cmp	r8, r0
	bls	_2	@cond_branch
	mov	r8, r0
_2:
	ldr	r1, _5 + 4
	mov	r0, r8
	str	r0, [r1]
	mov	r0, #0x1
	str	r0, [r1, #0x4]
	mov	r2, #0x0
	str	r2, [r1, #0x8]
	ldr	r6, _5 + 8
	mov	r9, r6
	mov	r0, r8
	mov	r1, #0x28
	bl	__udivsi3
	add	r0, r0, #0xf
	ldr	r2, _5 + 12
	add	r1, r2, #0
	and	r0, r0, r1
	strh	r0, [r6]
	neg	r0, r0
	ldr	r6, _5 + 16
	strh	r0, [r6]
	mov	r0, r9
	ldrh	r0, [r0]
	lsl	r1, r0, #0x1
	mov	r2, r9
	ldrh	r2, [r2]
	add	r1, r1, r2
	lsl	r0, r4, #0x2
	add	r0, r0, r4
	lsl	r0, r0, #0x3
	add	r5, r1, r0
	add	r0, r5, #0
	bl	fastAllocate
	ldr	r6, _5 + 20
	str	r0, [r6]
	cmp	r0, #0
	bne	_3	@cond_branch
	ldr	r0, _5 + 24
	add	r1, r5, #0
	bl	printf
_3:
	ldr	r0, _5 + 28
	mov	sl, r0
	ldr	r0, [r6]
	ldr	r0, [r0]
	mov	r1, sl
	str	r0, [r1]
	mov	r6, #0x88
	lsl	r6, r6, #0x3
	add	r0, r6, #0
	bl	slowAllocate
	ldr	r7, _5 + 32
	str	r0, [r7]
	cmp	r0, #0
	bne	_4	@cond_branch
	ldr	r0, _5 + 36
	add	r1, r6, #0
	bl	printf
_4:
	ldr	r1, _5 + 40
	ldr	r0, [r7]
	ldr	r0, [r0]
	str	r0, [r1]
	ldr	r1, _5 + 44
	mov	r2, #0x80
	lsl	r2, r2, #0x2
	add	r0, r0, r2
	str	r0, [r1]
	ldr	r0, _5 + 48
	mov	r6, sl
	ldr	r3, [r6]
	mov	r2, r9
	ldrh	r2, [r2]
	add	r1, r2, r3
	str	r1, [r0]
	ldr	r0, _5 + 52
	strb	r4, [r0]
	ldr	r2, _5 + 56
	mov	r4, r9
	ldrh	r4, [r4]
	lsl	r0, r4, #0x1
	add	r1, r1, r0
	str	r1, [r2]
	mov	r6, #0x0
	str	r6, [sp]
	ldr	r2, _5 + 60
	mov	r0, sp
	str	r0, [r2]
	str	r3, [r2, #0x4]
	lsr	r0, r5, #0x2
	mov	r1, #0x85
	lsl	r1, r1, #0x18
	orr	r0, r0, r1
	str	r0, [r2, #0x8]
	ldr	r0, [r2, #0x8]
	mov	r0, r8
	bl	sub_80623A8
	ldr	r1, _5 + 64
	mov	r0, #0x80
	strh	r0, [r1]
	sub	r1, r1, #0x2
	ldr	r2, _5 + 68
	add	r0, r2, #0
	strh	r0, [r1]
	add	r1, r1, #0x3a
	mov	r4, sl
	ldr	r0, [r4]
	str	r0, [r1]
	add	r1, r1, #0x4
	ldr	r0, _5 + 72
	str	r0, [r1]
	add	r1, r1, #0x4
	mov	r0, #0xb6
	lsl	r0, r0, #0x18
	str	r0, [r1]
	ldr	r2, _5 + 76
	ldr	r6, _5 + 16
	ldrh	r0, [r6]
	sub	r0, r0, #0x2
	mov	r1, #0xc4
	lsl	r1, r1, #0x10
	orr	r0, r0, r1
	str	r0, [r2]
	ldr	r4, _5 + 80
	ldr	r0, _5 + 84
	mov	r1, r8
	bl	__udivsi3
	mov	r1, #0x80
	lsl	r1, r1, #0x9
	sub	r1, r1, r0
	mov	r0, #0x80
	lsl	r0, r0, #0x10
	orr	r1, r1, r0
	str	r1, [r4]
	ldr	r0, _5 + 88
	mov	r1, #0x0
	str	r1, [r0]
	ldr	r0, _5 + 92
	str	r1, [r0]
	add	sp, sp, #0x4
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
_6:
	.align	2, 0
_5:
	.word	0xabea
	.word	_unk3005E40
	.word	_unk3005E4C
	.word	0xfff0
	.word	_unk3005E18
	.word	_soundMixerBlock
	.word	Str_8755D90
	.word	_soundMixer
	.word	_soundTableBlock
	.word	Str_8755DC4
	.word	_soundTables
	.word	_unk3005E28
	.word	_soundMixerPlus
	.word	_unk3005E04
	.word	_unk3005E24
	.word	0x40000d4
	.word	0x4000084
	.word	0xb04
	.word	0x40000a0
	.word	0x4000104
	.word	0x4000100
	.word	0x1000ae0
	.word	_unk3005E00
	.word	_unk3005E0C
	thumb_func_end allocateSoundTables

.align 2, 0 @ Don't pad with nop.
