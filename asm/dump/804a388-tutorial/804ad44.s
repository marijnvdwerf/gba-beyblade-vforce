	.include "asm/common.inc"

	thumb_func_start sub_804AD44
sub_804AD44:
	ldr	r1, .L804AD4C
	mov	r0, #0x1
	strh	r0, [r1]
	bx	lr
.L804AD4C:
	.align	2, 0

	.4byte	0x3000f1c
	thumb_func_end sub_804AD44

.align 2, 0 @ Don't pad with nop.
