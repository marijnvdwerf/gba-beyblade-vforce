	.include "asm/common.inc"

	thumb_func_start sub_806263C
sub_806263C:
	push	{r4, r5, lr}
	ldr	r1, _1
	mov	r0, #0xb6
	lsl	r0, r0, #0x18
	str	r0, [r1]
	ldr	r2, _1 + 4
	ldr	r0, _1 + 8
	ldrh	r0, [r0]
	sub	r0, r0, #0x2
	mov	r1, #0xc4
	lsl	r1, r1, #0x10
	orr	r0, r0, r1
	str	r0, [r2]
	ldr	r5, _1 + 12
	ldr	r4, _1 + 16
	ldr	r1, [r4]
	ldr	r0, _1 + 20
	bl	__udivsi3
	mov	r1, #0x80
	lsl	r1, r1, #0x9
	sub	r1, r1, r0
	mov	r0, #0x80
	lsl	r0, r0, #0x10
	orr	r1, r1, r0
	str	r1, [r5]
	mov	r0, #0x1
	str	r0, [r4, #0x4]
	pop	{r4, r5}
	pop	{r0}
	bx	r0
_2:
	.align	2, 0
_1:
	.word	0x40000c4
	.word	0x4000104
	.word	_unk3005E18
	.word	0x4000100
	.word	_unk3005E40
	.word	0x1000ae0
	thumb_func_end sub_806263C

.align 2, 0 @ Don't pad with nop.
