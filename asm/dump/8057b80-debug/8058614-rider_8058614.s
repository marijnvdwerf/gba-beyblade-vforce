	.include "asm/common.inc"

	thumb_func_start rider_8058614
rider_8058614:
	mov	ip, r0
	add	r0, r0, #0x9a
	strh	r1, [r0]
	add	r0, r0, #0x2
	strh	r2, [r0]
	add	r0, r0, #0x2
	strh	r3, [r0]
	bx	lr
	thumb_func_end rider_8058614

.align 2, 0 @ Don't pad with nop.
