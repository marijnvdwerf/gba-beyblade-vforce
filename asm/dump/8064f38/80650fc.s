	.include "asm/common.inc"

	thumb_func_start sub_80650FC
sub_80650FC:
	mov	r2, #0x0
	str	r2, [r0, #0x10]
	ldr	r2, [r0, #0x8]
	str	r2, [r0, #0xc]
	str	r1, [r0, #0x8]
	bx	lr
	thumb_func_end sub_80650FC

.align 2, 0 @ Don't pad with nop.
