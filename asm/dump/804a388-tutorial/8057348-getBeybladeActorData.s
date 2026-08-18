	.include "asm/common.inc"

	thumb_func_start getBeybladeActorData
getBeybladeActorData:
	ldr	r1, .L8057358
	ldr	r1, [r1]
	ldr	r2, .L8057358 + 4
	add	r1, r1, r2
	lsl	r0, r0, #0x3
	add	r1, r1, r0
	add	r0, r1, #0
	bx	lr
.L8057358:
	.align	2, 0

	.4byte	0x3000fb0
	.4byte	0x1110
	thumb_func_end getBeybladeActorData

.align 2, 0 @ Don't pad with nop.
