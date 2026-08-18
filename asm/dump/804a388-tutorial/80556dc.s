	.include "asm/common.inc"

	thumb_func_start sub_80556DC
sub_80556DC:
	add	r1, r0, #0
	ldr	r0, .L80556EC
	ldr	r0, [r0]
	ldr	r2, .L80556EC + 4
	add	r0, r0, r2
	ldr	r0, [r0]
	and	r0, r0, r1
	bx	lr
.L80556EC:
	.align	2, 0

	.4byte	0x3000fb0
	.4byte	0x1104
	thumb_func_end sub_80556DC

.align 2, 0 @ Don't pad with nop.
