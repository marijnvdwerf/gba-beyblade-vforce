	.include "asm/common.inc"

	thumb_func_start sub_804924C
sub_804924C:
	ldr	r1, .L8049254
	str	r0, [r1, #0x10]
	bx	lr
.L8049252:
	.align	2, 0
.L8049254:
	.4byte	0x3000650
	thumb_func_end sub_804924C

.align 2, 0 @ Don't pad with nop.
