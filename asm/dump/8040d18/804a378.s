	.include "asm/common.inc"

	thumb_func_start sub_804A378
sub_804A378:
	ldr	r1, .L1
	lsl	r0, r0, #0x2
	add	r0, r0, r1
	ldr	r0, [r0]
	bx	lr
.L2:
	.align	2, 0
.L1:
	.4byte	0x806a77c
	thumb_func_end sub_804A378

.align 2, 0 @ Don't pad with nop.
