	.include "asm/common.inc"

	thumb_func_start sub_804A26C
sub_804A26C:
	mov	r2, #0x80
	lsl	r2, r2, #0x13
	ldrh	r1, [r2]
	ldr	r0, .L1
	and	r0, r0, r1
	strh	r0, [r2]
	bx	lr
.L2:
	.align	2, 0
.L1:
	.4byte	0xdfff
	thumb_func_end sub_804A26C

.align 2, 0 @ Don't pad with nop.
