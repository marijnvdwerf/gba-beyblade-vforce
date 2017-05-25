	.include "asm/common.inc"

	thumb_func_start sub_805F8D4
sub_805F8D4:
	lsl	r1, r1, #0x10
	lsr	r1, r1, #0xc
	ldr	r0, [r0, #0x10]
	add	r0, r0, r1
	ldr	r1, [r0]
	str	r1, [r2]
	ldr	r1, [r0, #0x4]
	str	r1, [r2, #0x4]
	ldr	r0, [r0, #0x8]
	str	r0, [r2, #0x8]
	bx	lr
	thumb_func_end sub_805F8D4

.align 2, 0 @ Don't pad with nop.
