	.include "asm/common.inc"

	thumb_func_start sub_80627F0
sub_80627F0:
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	ldr	r0, .L8062844
	ldr	r6, [r0]
	ldr	r0, .L8062844 + 4
	ldrb	r4, [r0]
	ldr	r0, .L8062844 + 8
	ldr	r0, [r0]
	cmp	r0, #0
	beq	.L80628E4	@cond_branch
	ldr	r5, .L8062844 + 12
	ldr	r0, [r5, #0x4]
	cmp	r0, #0
	beq	.L80628E4	@cond_branch
	bl	sub_8062C24
	ldr	r7, .L8062844 + 16
	ldr	r2, [r7]
	ldr	r0, [r5, #0x8]
	add	r0, r0, #0x1
	mov	r5, #0x2
	neg	r5, r5
	and	r0, r0, r5
	mov	r3, #0x80
	lsl	r3, r3, #0x9
	ldr	r0, .L8062844 + 20
	ldrh	r0, [r0]
	add	r1, r0, #1
	and	r1, r1, r5
	cmp	r1, r3
	bne	.L8062838	@cond_branch
	ldr	r0, .L8062844 + 24
	ldrh	r1, [r0]
.L8062838:
	str	r1, [r7]
	cmp	r1, r2
	bls	.L8062860	@cond_branch
	sub	r5, r1, r2
	mov	r0, #0x0
	b	.L806286C
.L8062844:
	.align	2, 0

	.word	_unk3005E24
	.word	_unk3005E04
	.word	_soundMixer
	.word	_unk3005E40
	.word	_unk3000D94
	.word	0x4000104
	.word	_unk3005E18
.L8062860:
	sub	r5, r3, r2
	ldr	r0, .L80628F4
	ldrh	r0, [r0]
	ldr	r2, .L80628F4 + 4
	add	r0, r0, r2
	add	r0, r0, r1
.L806286C:
	mov	sl, r0
	mov	r0, sl
	add	r7, r5, r0
	ldr	r1, .L80628F4 + 8
	mov	r0, #0x0
	strb	r0, [r1]
	sub	r4, r4, #0x1
	mov	r0, #0x1
	neg	r0, r0
	cmp	r4, r0
	beq	.L806289C	@cond_branch
	ldr	r1, .L80628F4 + 12
	mov	r9, r1
	mov	r8, r0
.L8062888:
	mov	r0, r9
	ldrh	r2, [r0]
	add	r0, r6, #0
	add	r1, r7, #0
	bl	Sound_80627A8
	add	r6, r6, #0x28
	sub	r4, r4, #0x1
	cmp	r4, r8
	bne	.L8062888	@cond_branch
.L806289C:
	ldr	r6, .L80628F4 + 16
	ldr	r4, .L80628F4 + 20
	ldr	r0, [r4]
	ldr	r3, [r6]
	add	r1, r5, #0
	mov	r2, #0x0
	bl	_call_via_r3
	ldr	r0, [r4]
	add	r1, r0, r5
	str	r1, [r4]
	mov	r2, sl
	cmp	r2, #0
	beq	.L80628D0	@cond_branch
	ldr	r0, .L80628F4
	ldrh	r0, [r0]
	sub	r0, r1, r0
	str	r0, [r4]
	ldr	r3, [r6]
	mov	r1, sl
	add	r2, r5, #0
	bl	_call_via_r3
	ldr	r0, [r4]
	add r0, r0, sl
	str	r0, [r4]
.L80628D0:
	ldr	r1, .L80628F4 + 24
	ldr	r0, .L80628F4
	ldrh	r2, [r0]
	ldr	r0, [r1]
	add	r0, r0, r2
	ldr	r1, [r4]
	cmp	r1, r0
	bne	.L80628E4	@cond_branch
	sub	r0, r1, r2
	str	r0, [r4]
.L80628E4:
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L80628F2:
	.align	2, 0
.L80628F4:
	.word	_unk3005E4C
	.word	0xffff0000
	.word	_unk3005E78
	.word	_unk3000DA0
	.word	__sound_8757A64
	.word	_unk3000D90
	.word	_soundMixer
	thumb_func_end sub_80627F0

.align 2, 0 @ Don't pad with nop.
