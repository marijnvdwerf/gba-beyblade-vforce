	.include "asm/common.inc"

	thumb_func_start onVBlank
onVBlank:
	ldr	r1, .L1
	ldr	r0, .L1 + 4
	ldrh	r0, [r0]
	str	r0, [r1, #0x8]
	ldr	r1, .L1 + 8
	mov	r0, #0x1
	strh	r0, [r1]
	bx	lr
.L2:
	.align	2, 0
.L1:
	.4byte	0x3005e40
	.4byte	0x4000104
	.4byte	0x3007ff8
	thumb_func_end onVBlank

.align 2, 0 @ Don't pad with nop.
