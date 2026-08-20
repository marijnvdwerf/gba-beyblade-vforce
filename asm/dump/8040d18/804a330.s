	.include "asm/common.inc"

	thumb_func_start sub_804A330
sub_804A330:
	ldr	r1, .L804A338
	add	r1, r1, #0x81
	strb	r0, [r1]
	bx	lr
.L804A338:
	.align	2, 0

	.4byte	_unk3000650
	thumb_func_end sub_804A330

.align 2, 0 @ Don't pad with nop.
