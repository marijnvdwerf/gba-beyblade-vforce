	.include "asm/common.inc"

	thumb_func_start sub_804A830
sub_804A830:
	add	r0, r0, #0x9c
	str	r2, [r0]
	bx	lr
	thumb_func_end sub_804A830

.align 2, 0 @ Don't pad with nop.
