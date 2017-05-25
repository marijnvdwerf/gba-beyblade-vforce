	.include "asm/common.inc"

	thumb_func_start sub_806261C
sub_806261C:
	ldr	r0, .L1
	mov	r1, #0x0
	str	r1, [r0, #0x4]
	ldr	r0, .L1 + 4
	str	r1, [r0]
	add	r0, r0, #0xc
	str	r1, [r0]
	add	r0, r0, #0x34
	str	r1, [r0]
	sub	r0, r0, #0x4
	str	r1, [r0]
	bx	lr
.L2:
	.align	2, 0
.L1:
	.4byte	0x3005e40
	.4byte	0x40000c4
	thumb_func_end sub_806261C

.align 2, 0 @ Don't pad with nop.
