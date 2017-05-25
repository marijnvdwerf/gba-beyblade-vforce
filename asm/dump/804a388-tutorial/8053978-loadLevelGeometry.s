	.include "asm/common.inc"

	thumb_func_start loadLevelGeometry
loadLevelGeometry:
	lsl	r0, r0, #0x10
	lsr	r0, r0, #0x10
	ldr	r2, .L1
	lsl	r1, r0, #0x5
	add	r1, r1, r0
	lsl	r1, r1, #0x2
	add	r2, r2, #0x80
	add	r1, r1, r2
	ldr	r0, [r1]
	bx	lr
.L2:
	.align	2, 0
.L1:
	.4byte	0x806b300
	thumb_func_end loadLevelGeometry

.align 2, 0 @ Don't pad with nop.
