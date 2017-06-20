	.include "asm/common.inc"

	thumb_func_start sub_8062C24
sub_8062C24:
	push	{r4, r5, r6, r7, lr}
	ldr	r0, _9
	ldr	r0, [r0]
	cmp	r0, #0x1
	beq	_1	@cond_branch
	b	_63
_1:
	ldr	r2, _9 + 4
	ldr	r1, _9 + 8
	ldr	r0, [r2]
	ldr	r1, [r1]
	sub	r0, r0, r1
	str	r0, [r2]
	cmp	r0, #0
	ble	_64	@cond_branch
	b	_63
_64:
	ldr	r3, _9 + 12
	ldr	r2, [r3]
	ldrb	r5, [r2]
	add	r2, r2, #0x1
	str	r2, [r3]
	mov	r0, #0x80
	and	r0, r0, r5
	add	r4, r3, #0
	cmp	r0, #0
	bne	_5	@cond_branch
	b	_6
_5:
	lsr	r0, r5, #0x4
	sub	r0, r0, #0x8
	cmp	r0, #0x5
	bls	_7	@cond_branch
	b	_62
_7:
	lsl	r0, r0, #0x2
	ldr	r1, _9 + 16
	add	r0, r0, r1
	ldr	r0, [r0]
	mov	pc, r0
_10:
	.align	2, 0
_9:
	.word	_unk3005E0C
	.word	_unk3005E08
	.word	_unk3005E10
	.word	_unk3005E00
	.word	_11
_11:
	.word	_12
	.word	_13
	.word	_62
	.word	_15
	.word	_16
	.word	_43
_12:
	ldr	r0, [r4]
	ldrb	r3, [r0]
	add	r0, r0, #0x2
	str	r0, [r4]
	ldr	r2, _19
	mov	r0, #0xf
	and	r0, r0, r5
	lsl	r1, r0, #0x3
	add	r1, r1, r0
	lsl	r1, r1, #0x2
	ldr	r0, [r2]
	add	r0, r0, r1
	add	r4, r0, #4
	mov	r1, #0x4
	b	_18
_20:
	.align	2, 0
_19:
	.word	_unk3005E28
_24:
	add	r4, r4, #0x8
_18:
	add	r0, r1, #0
	sub	r1, r1, #0x1
	cmp	r0, #0
	bne	_21	@cond_branch
	b	_62
_21:
	ldrb	r0, [r4]
	cmp	r0, #0
	beq	_24	@cond_branch
	ldrb	r0, [r4, #0x1]
	cmp	r0, r3
	bne	_24	@cond_branch
	ldr	r0, [r4, #0x4]
	bl	Sound_8062A90
	mov	r0, #0x0
	strb	r0, [r4]
	b	_62
_13:
	ldr	r0, [r4]
	ldrb	r6, [r0]
	add	r0, r0, #0x1
	str	r0, [r4]
	ldrb	r7, [r0]
	add	r0, r0, #0x1
	str	r0, [r4]
	mov	r1, #0xf
	and	r1, r1, r5
	ldr	r3, _39
	ldr	r2, [r3]
	lsl	r0, r1, #0x3
	add	r0, r0, r1
	lsl	r0, r0, #0x2
	add	r0, r0, r2
	ldr	r2, [r0]
	mov	ip, r3
	cmp	r2, #0
	bne	_26	@cond_branch
	b	_62
_26:
	add	r4, r0, #4
	mov	r3, #0x0
	mov	r1, #0x3
	ldrb	r0, [r0, #0x4]
	cmp	r0, #0
	beq	_33	@cond_branch
	ldrb	r0, [r4, #0x1]
	cmp	r0, r6
	bne	_33	@cond_branch
	b	_62
_33:
	add	r4, r4, #0x8
	sub	r1, r1, #0x1
	mov	r0, #0x1
	neg	r0, r0
	cmp	r1, r0
	beq	_31	@cond_branch
	ldrb	r0, [r4]
	cmp	r0, #0
	beq	_33	@cond_branch
	ldrb	r0, [r4, #0x1]
	cmp	r0, r6
	bne	_33	@cond_branch
	mov	r3, #0x1
_31:
	cmp	r3, #0
	beq	_34	@cond_branch
	b	_62
_34:
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
_41:
	ldrb	r0, [r4]
	cmp	r0, #0
	bne	_36	@cond_branch
	cmp	r2, #0
	beq	_62	@cond_branch
	add	r0, r2, #0
	add	r1, r6, #0
	bl	Sound_80629F0
	str	r0, [r4, #0x4]
	add	r1, r7, #0
	bl	Sound_8062AD4
	mov	r0, #0x1
	strb	r0, [r4]
	strb	r6, [r4, #0x1]
	b	_62
_40:
	.align	2, 0
_39:
	.word	_unk3005E28
_36:
	add	r4, r4, #0x8
	sub	r1, r1, #0x1
	mov	r0, #0x1
	neg	r0, r0
	cmp	r1, r0
	bne	_41	@cond_branch
	b	_62
_15:
	mov	r0, #0xf
	and	r0, r0, r5
	cmp	r0, #0x1
	beq	_43	@cond_branch
	cmp	r0, #0x1
	bgt	_44	@cond_branch
	cmp	r0, #0
	beq	_45	@cond_branch
	b	_62
_44:
	cmp	r0, #0x2
	beq	_47	@cond_branch
	cmp	r0, #0x3
	beq	_48	@cond_branch
	b	_62
_45:
	ldr	r0, _51
	ldr	r0, [r0]
	str	r0, [r4]
	b	_62
_52:
	.align	2, 0
_51:
	.word	_unk3005E20
_47:
	ldr	r3, _54
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
	b	_62
_55:
	.align	2, 0
_54:
	.word	_unk3005E10
_48:
	ldr	r0, _57
	bl	printf
	b	_62
_58:
	.align	2, 0
_57:
	.word	Str_8755E14
_16:
	ldr	r0, [r4]
	ldrb	r3, [r0]
	add	r0, r0, #0x1
	str	r0, [r4]
	mov	r2, #0xf
	and	r2, r2, r5
	ldr	r0, _60
	ldr	r0, [r0]
	lsl	r1, r2, #0x3
	add	r1, r1, r2
	lsl	r1, r1, #0x2
	add	r1, r1, r0
	ldr	r0, _60 + 4
	ldr	r0, [r0]
	ldr	r0, [r0, #0xc]
	lsl	r3, r3, #0x2
	add	r3, r3, r0
	ldr	r0, [r3]
	str	r0, [r1]
	b	_62
_61:
	.align	2, 0
_60:
	.word	_unk3005E28
	.word	_unk3005E14
_43:
	ldr	r0, [r4]
	add	r0, r0, #0x1
	str	r0, [r4]
	b	_62
_6:
	lsl	r1, r5, #0x8
	ldrb	r0, [r2]
	orr	r1, r1, r0
	add	r0, r2, #1
	str	r0, [r3]
	ldr	r2, _65
	lsl	r1, r1, #0x10
	ldr	r0, [r2]
	add	r0, r0, r1
	str	r0, [r2]
_62:
	ldr	r0, _65
	ldr	r0, [r0]
	cmp	r0, #0
	bgt	_63	@cond_branch
	b	_64
_63:
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
_66:
	.align	2, 0
_65:
	.word	_unk3005E08
	thumb_func_end sub_8062C24

.align 2, 0 @ Don't pad with nop.
