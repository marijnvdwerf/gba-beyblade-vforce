	.include "asm/common.inc"

	thumb_func_start sub_804AD60
sub_804AD60:
	ldr	r0, .L1
	mov	r2, #0x0
	ldsh	r1, [r0, r2]
	NEG	r0, r1
	orr	r0, r0, r1
	lsr	r0, r0, #0x1f
	bx	lr
.L2:
	.align	2, 0
.L1:
	.4byte	0x3000f1c
	thumb_func_end sub_804AD60

.align 2, 0 @ Don't pad with nop.
