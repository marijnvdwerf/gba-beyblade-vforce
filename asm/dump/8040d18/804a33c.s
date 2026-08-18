	.include "asm/common.inc"

	thumb_func_start sub_804A33C
sub_804A33C:
	ldr	r0, .L804A344
	add	r0, r0, #0x81
	ldrb	r0, [r0]
	bx	lr
.L804A344:
	.align	2, 0

	.4byte	0x3000650
	thumb_func_end sub_804A33C

.align 2, 0 @ Don't pad with nop.
