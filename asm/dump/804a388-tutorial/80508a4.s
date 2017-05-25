	.include "asm/common.inc"

	thumb_func_start sub_80508A4
sub_80508A4:
	ldr	r2, .L1
	ldrb	r1, [r0]
	strb	r1, [r2]
	ldr	r2, .L1 + 4
	ldrb	r1, [r0, #0x1]
	strb	r1, [r2]
	mov	r2, #0x80
	lsl	r2, r2, #0x13
	ldrh	r3, [r0, #0x6]
	lsl	r1, r3, #0x8
	ldrh	r3, [r0, #0x8]
	orr	r1, r1, r3
	strh	r1, [r2]
	mov	r1, #0x0
	strh	r1, [r0, #0x4]
	bx	lr
.L2:
	.align	2, 0
.L1:
	.4byte	0x3000de0
	.4byte	0x3000e3c
	thumb_func_end sub_80508A4

.align 2, 0 @ Don't pad with nop.
