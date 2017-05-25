	.include "asm/common.inc"

	thumb_func_start sub_8057A1C
sub_8057A1C:
	ldr	r1, .L1
	str	r0, [r1]
	ldr	r2, .L1 + 4
	str	r2, [r1, #0x4]
	ldr	r2, .L1 + 8
	str	r2, [r1, #0x8]
	ldr	r3, [r1, #0x8]
	str	r0, [r1]
	mov	r0, #0xa0
	lsl	r0, r0, #0x13
	str	r0, [r1, #0x4]
	str	r2, [r1, #0x8]
	ldr	r0, [r1, #0x8]
	bx	lr
.L2:
	.align	2, 0
.L1:
	.4byte	0x40000d4
	.4byte	0x5000200
	.4byte	0x84000080
	thumb_func_end sub_8057A1C

.align 2, 0 @ Don't pad with nop.
