	.include "asm/common.inc"

	thumb_func_start sub_8062694
sub_8062694:
	push	{r4, lr}
	ldr	r0, _1
	mov	r1, #0x0
	strh	r1, [r0]
	sub	r0, r0, #0x2
	strh	r1, [r0]
	add	r0, r0, #0x42
	mov	r1, #0x0
	str	r1, [r0]
	add	r0, r0, #0xc
	str	r1, [r0]
	add	r0, r0, #0x34
	str	r1, [r0]
	sub	r0, r0, #0x4
	str	r1, [r0]
	ldr	r3, _1 + 4
	ldr	r0, _1 + 8
	ldr	r1, [r0]
	ldr	r0, _1 + 12
	ldrh	r4, [r0]
	lsl	r2, r4, #0x1
	add	r2, r2, r4
	ldr	r3, [r3]
	mov	r0, #0x0
	bl	_call_via_r3
	pop	{r4}
	pop	{r0}
	bx	r0
_2:
	.align	2, 0
_1:
	.word	0x4000084
	.word	__fastMemoryClearARM
	.word	_soundMixer
	.word	_unk3005E4C
	thumb_func_end sub_8062694

.align 2, 0 @ Don't pad with nop.
