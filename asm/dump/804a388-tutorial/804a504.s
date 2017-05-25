	.include "asm/common.inc"

	thumb_func_start sub_804A504
sub_804A504:
	ldr	r0, .L1
	ldr	r0, [r0]
	mov	r1, #0xa8
	lsl	r1, r1, #0x5
	add	r0, r0, r1
	ldr	r1, [r0]
	NEG	r0, r1
	orr	r0, r0, r1
	lsr	r0, r0, #0x1f
	bx	lr
.L2:
	.align	2, 0
.L1:
	.4byte	0x3000fb0
	thumb_func_end sub_804A504

.align 2, 0 @ Don't pad with nop.
