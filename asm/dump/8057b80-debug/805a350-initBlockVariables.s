	.include "asm/common.inc"

	thumb_func_start initBlockVariables
initBlockVariables:
	mov	r2, #0x80
	lsl	r2, r2, #0x2
	ldr	r0, .L1
	mov	r1, #0x0
	str	r1, [r0]
	ldr	r0, .L1 + 4
	str	r1, [r0]
	ldr	r0, .L1 + 8
	str	r1, [r0]
	ldr	r0, .L1 + 12
	str	r1, [r0]
	ldr	r0, .L1 + 16
	str	r1, [r0]
	ldr	r0, .L1 + 20
	str	r1, [r0]
	ldr	r1, .L1 + 24
	mov	r0, #0x80
	lsl	r0, r0, #0x12
	str	r0, [r1]
	ldr	r1, .L1 + 28
	add	r0, r2, r0
	str	r0, [r1]
	ldr	r1, .L1 + 32
	add	r2, r2, r0
	str	r2, [r1]
	bx	lr
.L2:
	.align	2, 0
.L1:
	.4byte	0x3005c88
	.4byte	0x300115c
	.4byte	0x3005c8c
	.4byte	0x3001158
	.4byte	0x3005c84
	.4byte	0x3001150
	.4byte	0x3005c80
	.4byte	0x3005c90
	.4byte	0x3001154
	thumb_func_end initBlockVariables

.align 2, 0 @ Don't pad with nop.
