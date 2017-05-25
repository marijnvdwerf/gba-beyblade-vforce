	.include "asm/common.inc"

	thumb_func_start sub_805F8EC
sub_805F8EC:
	lsl	r1, r1, #0x10
	lsr	r1, r1, #0xc
	ldr	r0, [r0, #0x10]
	add	r0, r0, r1
	bx	lr
	thumb_func_end sub_805F8EC

.align 2, 0 @ Don't pad with nop.
