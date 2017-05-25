	.include "asm/common.inc"

	thumb_func_start sub_805F3D8
sub_805F3D8:
	ldr	r1, [r0]
	ldrh	r3, [r1, #0x4]
	lsl	r2, r3, #0x2
	add	r2, r2, r3
	ldr	r1, [r0, #0x4]
	ldr	r0, [r0, #0x10]
	ldr	r3, .L1
	str	r0, [r3]
	str	r1, [r3, #0x4]
	lsl	r0, r2, #0x1
	asr	r0, r0, #0x2
	mov	r1, #0x84
	lsl	r1, r1, #0x18
	orr	r0, r0, r1
	str	r0, [r3, #0x8]
	ldr	r0, [r3, #0x8]
	bx	lr
.L2:
	.align	2, 0
.L1:
	.4byte	0x40000d4
	thumb_func_end sub_805F3D8

.align 2, 0 @ Don't pad with nop.
