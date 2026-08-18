	.include "asm/common.inc"

	thumb_func_start sub_8064140
sub_8064140:
	add	r3, r0, #0
	add	r3, r3, #0xba
	ldr	r1, .L8064158
	ldrh	r2, [r3]
	and	r1, r1, r2
	mov	r2, #0x4
	orr	r1, r1, r2
	strh	r1, [r3]
	ldr	r1, [r0]
	add	r1, r1, #0x1
	str	r1, [r0]
	bx	lr
.L8064158:
	.align	2, 0

	.4byte	0xffe7
	thumb_func_end sub_8064140

.align 2, 0 @ Don't pad with nop.
