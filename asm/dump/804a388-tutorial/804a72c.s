	.include "asm/common.inc"

	thumb_func_start sub_804A72C
sub_804A72C:
	ldr	r0, .L1
	ldr	r0, [r0]
	ldr	r1, .L1 + 4
	add	r0, r0, r1
	mov	r1, #0x0
	str	r1, [r0]
	bx	lr
.L2:
	.align	2, 0
.L1:
	.4byte	0x3000fb0
	.4byte	0x13fc
	thumb_func_end sub_804A72C

.align 2, 0 @ Don't pad with nop.
