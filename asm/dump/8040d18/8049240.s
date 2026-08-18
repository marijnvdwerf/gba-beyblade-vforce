	.include "asm/common.inc"

	thumb_func_start sub_8049240
sub_8049240:
	ldr	r0, .L8049248
	ldr	r0, [r0, #0xc]
	bx	lr
.L8049246:
	.align	2, 0
.L8049248:
	.4byte	0x3000650
	thumb_func_end sub_8049240

.align 2, 0 @ Don't pad with nop.
