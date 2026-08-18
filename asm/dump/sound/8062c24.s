	.include "asm/common.inc"

	thumb_func_start sub_8062C24
sub_8062C24:
	push	{r4, r5, r6, r7, lr}
	ldr	r0, .L8062C6C
	ldr	r0, [r0]
	cmp	r0, #0x1
	beq	.L8062C30	@cond_branch
	b	.L8062E4A
.L8062C30:
	ldr	r2, .L8062C6C + 4
	ldr	r1, .L8062C6C + 8
	ldr	r0, [r2]
	ldr	r1, [r1]
	sub	r0, r0, r1
	str	r0, [r2]
	cmp	r0, #0
	ble	.L8062C42	@cond_branch
	b	.L8062E4A
.L8062C42:
	ldr	r3, .L8062C6C + 12
	ldr	r2, [r3]
	ldrb	r5, [r2]
	add	r2, r2, #0x1
	str	r2, [r3]
	mov	r0, #0x80
	and	r0, r0, r5
	add	r4, r3, #0
	cmp	r0, #0
	bne	.L8062C58	@cond_branch
	b	.L8062E2C
.L8062C58:
	lsr	r0, r5, #0x4
	sub	r0, r0, #0x8
	cmp	r0, #0x5
	bls	.L8062C62	@cond_branch
	b	.L8062E40
.L8062C62:
	lsl	r0, r0, #0x2
	ldr	r1, .L8062C6C + 16
	add	r0, r0, r1
	ldr	r0, [r0]
	mov	pc, r0
.L8062C6C:
	.align	2, 0

	.word	_unk3005E0C
	.word	_unk3005E08
	.word	_unk3005E10
	.word	_unk3005E00
	.word	.L8062C80
.L8062C80:
	.word	.L8062C98
	.word	.L8062CE0
	.word	.L8062E40
	.word	.L8062D86
	.word	.L8062DF4
	.word	.L8062E24
.L8062C98:
	ldr	r0, [r4]
	ldrb	r3, [r0]
	add	r0, r0, #0x2
	str	r0, [r4]
	ldr	r2, .L8062CB8
	mov	r0, #0xf
	and	r0, r0, r5
	lsl	r1, r0, #0x3
	add	r1, r1, r0
	lsl	r1, r1, #0x2
	ldr	r0, [r2]
	add	r0, r0, r1
	add	r4, r0, #4
	mov	r1, #0x4
	b	.L8062CBE
.L8062CB6:
	.align	2, 0
.L8062CB8:
	.word	_unk3005E28
.L8062CBC:
	add	r4, r4, #0x8
.L8062CBE:
	add	r0, r1, #0
	sub	r1, r1, #0x1
	cmp	r0, #0
	bne	.L8062CC8	@cond_branch
	b	.L8062E40
.L8062CC8:
	ldrb	r0, [r4]
	cmp	r0, #0
	beq	.L8062CBC	@cond_branch
	ldrb	r0, [r4, #0x1]
	cmp	r0, r3
	bne	.L8062CBC	@cond_branch
	ldr	r0, [r4, #0x4]
	bl	Sound_8062A90
	mov	r0, #0x0
	strb	r0, [r4]
	b	.L8062E40
.L8062CE0:
	ldr	r0, [r4]
	ldrb	r6, [r0]
	add	r0, r0, #0x1
	str	r0, [r4]
	ldrb	r7, [r0]
	add	r0, r0, #0x1
	str	r0, [r4]
	mov	r1, #0xf
	and	r1, r1, r5
	ldr	r3, .L8062D74
	ldr	r2, [r3]
	lsl	r0, r1, #0x3
	add	r0, r0, r1
	lsl	r0, r0, #0x2
	add	r0, r0, r2
	ldr	r2, [r0]
	mov	ip, r3
	cmp	r2, #0
	bne	.L8062D08	@cond_branch
	b	.L8062E40
.L8062D08:
	add	r4, r0, #4
	mov	r3, #0x0
	mov	r1, #0x3
	ldrb	r0, [r0, #0x4]
	cmp	r0, #0
	beq	.L8062D1C	@cond_branch
	ldrb	r0, [r4, #0x1]
	cmp	r0, r6
	bne	.L8062D1C	@cond_branch
	b	.L8062E40
.L8062D1C:
	add	r4, r4, #0x8
	sub	r1, r1, #0x1
	mov	r0, #0x1
	neg	r0, r0
	cmp	r1, r0
	beq	.L8062D36	@cond_branch
	ldrb	r0, [r4]
	cmp	r0, #0
	beq	.L8062D1C	@cond_branch
	ldrb	r0, [r4, #0x1]
	cmp	r0, r6
	bne	.L8062D1C	@cond_branch
	mov	r3, #0x1
.L8062D36:
	cmp	r3, #0
	beq	.L8062D3C	@cond_branch
	b	.L8062E40
.L8062D3C:
	mov	r0, #0xf
	and	r0, r0, r5
	lsl	r1, r0, #0x3
	add	r1, r1, r0
	lsl	r1, r1, #0x2
	mov	r3, ip
	ldr	r0, [r3]
	add	r0, r0, r1
	add	r4, r0, #4
	mov	r1, #0x3
.L8062D50:
	ldrb	r0, [r4]
	cmp	r0, #0
	bne	.L8062D78	@cond_branch
	cmp	r2, #0
	beq	.L8062E40	@cond_branch
	add	r0, r2, #0
	add	r1, r6, #0
	bl	Sound_80629F0
	str	r0, [r4, #0x4]
	add	r1, r7, #0
	bl	Sound_8062AD4
	mov	r0, #0x1
	strb	r0, [r4]
	strb	r6, [r4, #0x1]
	b	.L8062E40
.L8062D72:
	.align	2, 0
.L8062D74:
	.word	_unk3005E28
.L8062D78:
	add	r4, r4, #0x8
	sub	r1, r1, #0x1
	mov	r0, #0x1
	neg	r0, r0
	cmp	r1, r0
	bne	.L8062D50	@cond_branch
	b	.L8062E40
.L8062D86:
	mov	r0, #0xf
	and	r0, r0, r5
	cmp	r0, #0x1
	beq	.L8062E24	@cond_branch
	cmp	r0, #0x1
	bgt	.L8062D98	@cond_branch
	cmp	r0, #0
	beq	.L8062DA2	@cond_branch
	b	.L8062E40
.L8062D98:
	cmp	r0, #0x2
	beq	.L8062DB0	@cond_branch
	cmp	r0, #0x3
	beq	.L8062DE8	@cond_branch
	b	.L8062E40
.L8062DA2:
	ldr	r0, .L8062DAC
	ldr	r0, [r0]
	str	r0, [r4]
	b	.L8062E40
.L8062DAA:
	.align	2, 0
.L8062DAC:
	.word	_unk3005E20
.L8062DB0:
	ldr	r3, .L8062DE4
	ldr	r0, [r4]
	ldrb	r5, [r0]
	lsl	r2, r5, #0x18
	str	r2, [r3]
	add	r0, r0, #0x1
	str	r0, [r4]
	ldrb	r5, [r0]
	lsl	r1, r5, #0x10
	orr	r1, r1, r2
	str	r1, [r3]
	add	r2, r0, #1
	str	r2, [r4]
	ldrb	r0, [r0, #0x1]
	lsl	r0, r0, #0x8
	orr	r0, r0, r1
	str	r0, [r3]
	add	r1, r2, #1
	str	r1, [r4]
	ldrb	r2, [r2, #0x1]
	orr	r0, r0, r2
	str	r0, [r3]
	add	r1, r1, #0x1
	str	r1, [r4]
	b	.L8062E40
.L8062DE2:
	.align	2, 0
.L8062DE4:
	.word	_unk3005E10
.L8062DE8:
	ldr	r0, .L8062DF0
	bl	printf
	b	.L8062E40
.L8062DF0:
	.align	2, 0

	.word	Str_8755E14
.L8062DF4:
	ldr	r0, [r4]
	ldrb	r3, [r0]
	add	r0, r0, #0x1
	str	r0, [r4]
	mov	r2, #0xf
	and	r2, r2, r5
	ldr	r0, .L8062E1C
	ldr	r0, [r0]
	lsl	r1, r2, #0x3
	add	r1, r1, r2
	lsl	r1, r1, #0x2
	add	r1, r1, r0
	ldr	r0, .L8062E1C + 4
	ldr	r0, [r0]
	ldr	r0, [r0, #0xc]
	lsl	r3, r3, #0x2
	add	r3, r3, r0
	ldr	r0, [r3]
	str	r0, [r1]
	b	.L8062E40
.L8062E1C:
	.align	2, 0

	.word	_unk3005E28
	.word	_unk3005E14
.L8062E24:
	ldr	r0, [r4]
	add	r0, r0, #0x1
	str	r0, [r4]
	b	.L8062E40
.L8062E2C:
	lsl	r1, r5, #0x8
	ldrb	r0, [r2]
	orr	r1, r1, r0
	add	r0, r2, #1
	str	r0, [r3]
	ldr	r2, .L8062E50
	lsl	r1, r1, #0x10
	ldr	r0, [r2]
	add	r0, r0, r1
	str	r0, [r2]
.L8062E40:
	ldr	r0, .L8062E50
	ldr	r0, [r0]
	cmp	r0, #0
	bgt	.L8062E4A	@cond_branch
	b	.L8062C42
.L8062E4A:
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L8062E50:
	.align	2, 0

	.word	_unk3005E08
	thumb_func_end sub_8062C24

.align 2, 0 @ Don't pad with nop.
