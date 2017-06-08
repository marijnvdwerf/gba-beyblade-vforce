	.include "asm/common.inc"

	thumb_func_start sub_8062A50
sub_8062A50:
	push	{r4, lr}
	add	r3, r0, #0
	ldr	r0, _5
	ldr	r1, [r0]
	ldr	r0, _5 + 4
	ldrb	r2, [r0]
	sub	r2, r2, #0x1
	mov	r0, #0x1
	neg	r0, r0
	cmp	r2, r0
	beq	_1	@cond_branch
	add	r4, r0, #0
_7:
	ldrb	r0, [r1, #0x16]
	cmp	r0, #0
	beq	_3	@cond_branch
	ldr	r0, [r1, #0x18]
	cmp	r0, r3
	bne	_3	@cond_branch
	add	r0, r1, #0
	b	_4
_6:
	.align	2, 0
_5:
	.word	_unk3005E24
	.word	_unk3005E04
_3:
	add	r1, r1, #0x28
	sub	r2, r2, #0x1
	cmp	r2, r4
	bne	_7	@cond_branch
_1:
	mov	r0, #0x0
_4:
	pop	{r4}
	pop	{r1}
	bx	r1
	thumb_func_end sub_8062A50

.align 2, 0 @ Don't pad with nop.
