	.include "asm/common.inc"

	thumb_func_start sub_804ACF0
sub_804ACF0:
	ldr	r2, .L1
	ldr	r0, .L1 + 4
	ldr	r1, [r0]
	ldr	r3, .L1 + 8
	add	r0, r1, r3
	ldrh	r0, [r0]
	strh	r0, [r2]
	ldr	r2, .L1 + 12
	ldr	r0, .L1 + 16
	add	r1, r1, r0
	ldrh	r0, [r1]
	strh	r0, [r2]
	ldr	r1, .L1 + 20
	mov	r0, #0x0
	strh	r0, [r1]
	bx	lr
.L2:
	.align	2, 0
.L1:
	.4byte	0x3000f18
	.4byte	0x3000f48
	.4byte	0x6e4
	.4byte	0x3000f14
	.4byte	0x6e6
	.4byte	0x3000f1c
	thumb_func_end sub_804ACF0

.align 2, 0 @ Don't pad with nop.
