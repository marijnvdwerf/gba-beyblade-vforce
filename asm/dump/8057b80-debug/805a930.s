	.include "asm/common.inc"

	thumb_func_start sub_805A930
sub_805A930:
	ldrh	r1, [r1]
	mov	r2, #0x0
	strh	r1, [r0, #0x8]
	strh	r2, [r0, #0xa]
	bx	lr
	thumb_func_end sub_805A930

.align 2, 0 @ Don't pad with nop.
