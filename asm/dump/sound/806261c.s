	.include "asm/common.inc"

	thumb_func_start sub_806261C
sub_806261C:
	ldr	r0, _1
	mov	r1, #0x0
	str	r1, [r0, #0x4]
	ldr	r0, _1 + 4
	str	r1, [r0]
	add	r0, r0, #0xc
	str	r1, [r0]
	add	r0, r0, #0x34
	str	r1, [r0]
	sub	r0, r0, #0x4
	str	r1, [r0]
	bx	lr
_2:
	.align	2, 0
_1:
	.word	_unk3005E40
	.word	0x40000c4
	thumb_func_end sub_806261C

.align 2, 0 @ Don't pad with nop.
