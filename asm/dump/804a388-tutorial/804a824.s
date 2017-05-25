	.include "asm/common.inc"

	thumb_func_start sub_804A824
sub_804A824:
	add	r0, r0, #0x9c
	ldr	r1, [r0]
	add	r1, r1, r2
	str	r1, [r0]
	bx	lr
	thumb_func_end sub_804A824

.align 2, 0 @ Don't pad with nop.
