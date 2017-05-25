	.include "asm/common.inc"

	thumb_func_start sub_80555F4
sub_80555F4:
	ldr	r0, .L1
	ldr	r1, [r0]
	ldr	r0, .L1 + 4
	add	r2, r1, r0
	mov	r0, #0xc0
	lsl	r0, r0, #0x1
	strh	r0, [r2]
	ldr	r2, .L1 + 8
	add	r0, r1, r2
	mov	r2, #0x1
	strh	r2, [r0]
	ldr	r0, .L1 + 12
	add	r1, r1, r0
	strh	r2, [r1]
	bx	lr
.L2:
	.align	2, 0
.L1:
	.4byte	0x3000fb0
	.4byte	0x1102
	.4byte	0x10fa
	.4byte	0x10fc
	thumb_func_end sub_80555F4

.align 2, 0 @ Don't pad with nop.
