	.include "asm/common.inc"

	thumb_func_start sub_8062990
sub_8062990:
	push	{r4, r5, lr}
	add	r3, r0, #0
	add	r2, r1, #0
	ldr	r0, _4
	ldr	r4, [r0]
	ldr	r0, _4 + 4
	ldrb	r1, [r0]
	sub	r1, r1, #0x1
	mov	r0, #0x1
	neg	r0, r0
	cmp	r1, r0
	beq	_1	@cond_branch
	ldr	r5, _4 + 8
_6:
	ldrb	r0, [r4, #0x16]
	cmp	r0, #0
	bne	_2	@cond_branch
	add	r0, r4, #0
	add	r1, r3, #0
	bl	sub_8062950
	ldr	r0, [r5]
	str	r0, [r4, #0x18]
	add	r0, r0, #0x1
	str	r0, [r5]
	ldr	r0, [r4, #0x18]
	b	_3
_5:
	.align	2, 0
_4:
	.word	_unk3005E24
	.word	_unk3005E04
	.word	_unk3000D9C
_2:
	add	r4, r4, #0x28
	sub	r1, r1, #0x1
	mov	r0, #0x1
	neg	r0, r0
	cmp	r1, r0
	bne	_6	@cond_branch
_1:
	ldr	r0, _7
	bl	printf
	mov	r0, #0x1
	neg	r0, r0
_3:
	pop	{r4, r5}
	pop	{r1}
	bx	r1
_8:
	.align	2, 0
_7:
	.word	Str_8755DFC
	thumb_func_end sub_8062990

.align 2, 0 @ Don't pad with nop.
