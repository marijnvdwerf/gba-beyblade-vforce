	.include "asm/common.inc"

	thumb_func_start getBeybladeData0
getBeybladeData0:
	mov	r1, #0x34
	mul	r0, r0, r1
	ldr	r1, .L1
	add	r0, r0, r1
	bx	lr
.L2:
	.align	2, 0
.L1:
	.4byte	0x807ac28
	thumb_func_end getBeybladeData0

.align 2, 0 @ Don't pad with nop.
