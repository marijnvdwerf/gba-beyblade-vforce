	.include "asm/common.inc"

	thumb_func_start sub_8063DF0
sub_8063DF0:
	ldr	r2, [r1]
	str	r2, [r0, #0x4]
	ldr	r1, [r1, #0x4]
	str	r1, [r0, #0x8]
	mov	r3, #0x0
	mov	r1, #0x5
	strb	r1, [r0, #0xc]
	strb	r3, [r0, #0xd]
	ldrb	r1, [r2, #0x5]
	add	r1, r1, #0x4
	strb	r1, [r0, #0xe]
	ldrb	r1, [r2, #0x4]
	add	r3, r0, #0
	add	r3, r3, #0xc1
	strb	r1, [r3]
	ldrb	r1, [r2, #0x5]
	add	r0, r0, #0xc2
	strb	r1, [r0]
	bx	lr
	thumb_func_end sub_8063DF0

.align 2, 0 @ Don't pad with nop.
