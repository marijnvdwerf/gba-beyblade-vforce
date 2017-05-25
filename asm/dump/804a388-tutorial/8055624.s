	.include "asm/common.inc"

	thumb_func_start sub_8055624
sub_8055624:
	ldr	r0, .L1
	ldr	r2, [r0]
	ldr	r0, .L1 + 4
	add	r1, r2, r0
	mov	r0, #0x0
	strh	r0, [r1]
	ldr	r0, .L1 + 8
	add	r1, r2, r0
	ldr	r0, .L1 + 12
	strh	r0, [r1]
	ldr	r0, .L1 + 16
	add	r2, r2, r0
	ldr	r0, [r2]
	mov	r1, #0x2
	NEG	r1, r1
	and	r0, r0, r1
	str	r0, [r2]
	bx	lr
.L2:
	.align	2, 0
.L1:
	.4byte	0x3000fb0
	.4byte	0x1102
	.4byte	0x10fc
	.4byte	0xffff
	.4byte	0x1104
	thumb_func_end sub_8055624

.align 2, 0 @ Don't pad with nop.
