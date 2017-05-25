	.include "asm/common.inc"

	thumb_func_start sub_806592C
sub_806592C:
	ldr	r3, .L1
	mov	r1, #0x0
	strh	r1, [r3]
	ldr	r2, .L1 + 4
	ldr	r0, [r2]
	strh	r1, [r0]
	add	r0, r0, #0x2
	str	r0, [r2]
	strh	r1, [r0]
	sub	r0, r0, #0x2
	str	r0, [r2]
	ldr	r2, .L1 + 8
	ldr	r0, .L1 + 12
	ldrb	r0, [r0]
	mov	r1, #0x8
	LSL	r1, r0
	ldrh	r0, [r2]
	BIC	r0, r1
	strh	r0, [r2]
	ldr	r0, .L1 + 16
	ldrh	r0, [r0]
	strh	r0, [r3]
	bx	lr
.L2:
	.align	2, 0
.L1:
	.4byte	0x4000208
	.4byte	0x3000db0
	.4byte	0x4000200
	.4byte	0x3000da8
	.4byte	0x3000db4
	thumb_func_end sub_806592C

.align 2, 0 @ Don't pad with nop.
