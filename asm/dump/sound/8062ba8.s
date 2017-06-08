	.include "asm/common.inc"

	thumb_func_start sub_8062BA8
sub_8062BA8:
	push	{r4, r5, lr}
	add	r4, r0, #0
	ldr	r5, _2
	ldr	r0, [r5]
	ldr	r0, [r0]
	cmp	r4, r0
	bcs	_1	@cond_branch
	bl	sub_8062B2C
	ldr	r2, _2 + 4
	ldr	r0, [r5]
	ldr	r1, [r0, #0x8]
	lsl	r0, r4, #0x3
	add	r0, r0, r1
	ldr	r1, [r0]
	str	r1, [r2]
	ldr	r1, _2 + 8
	ldr	r0, [r0, #0x4]
	str	r0, [r1]
	ldr	r0, _2 + 12
	mov	r1, #0x0
	str	r1, [r0]
	ldr	r0, _2 + 16
	str	r1, [r0]
	ldr	r1, _2 + 20
	mov	r0, #0x1
	str	r0, [r1]
_1:
	pop	{r4, r5}
	pop	{r0}
	bx	r0
_3:
	.align	2, 0
_2:
	.word	_unk3005E14
	.word	_unk3005E00
	.word	_unk3005E20
	.word	_unk3005E08
	.word	_unk3005E10
	.word	_unk3005E0C
	thumb_func_end sub_8062BA8

.align 2, 0 @ Don't pad with nop.
