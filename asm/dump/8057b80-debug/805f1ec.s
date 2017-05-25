	.include "asm/common.inc"

	thumb_func_start sub_805F1EC
sub_805F1EC:
	ldr	r2, [r1, #0xc]
	add	r1, r1, r2
	str	r1, [r0, #0x8]
	bx	lr
	thumb_func_end sub_805F1EC

.align 2, 0 @ Don't pad with nop.
