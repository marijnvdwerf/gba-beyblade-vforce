	.include "asm/common.inc"

	thumb_func_start sub_8062774
sub_8062774:
	ldr	r3, .L1
	mov	r1, #0x0
	str	r1, [r3]
	ldr	r0, .L1 + 4
	str	r1, [r0]
	ldr	r2, .L1 + 8
	str	r1, [r2]
	ldr	r1, .L1 + 12
	mov	r0, #0xc4
	lsl	r0, r0, #0x10
	ldrh	r1, [r1]
	orr	r0, r0, r1
	str	r0, [r2]
	mov	r0, #0xb6
	lsl	r0, r0, #0x18
	str	r0, [r3]
	bx	lr
.L2:
	.align	2, 0
.L1:
	.4byte	0x40000c4
	.4byte	0x40000d0
	.4byte	0x4000104
	.4byte	0x3005e18
	thumb_func_end sub_8062774

.align 2, 0 @ Don't pad with nop.
