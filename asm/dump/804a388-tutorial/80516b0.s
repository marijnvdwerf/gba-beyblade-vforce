	.include "asm/common.inc"

	thumb_func_start sub_80516B0
sub_80516B0:
	ldr	r0, .L1
	ldr	r0, [r0]
	ldrb	r0, [r0, #0x1]
	lsl	r0, r0, #0x18
	asr	r0, r0, #0x18
	bx	lr
.L2:
	.align	2, 0
.L1:
	.4byte	0x3000f48
	thumb_func_end sub_80516B0

.align 2, 0 @ Don't pad with nop.
