	.include "asm/common.inc"

	thumb_func_start sub_8058784
sub_8058784:
	lsl	r1, r1, #0x18
	lsr	r1, r1, #0x18
	add	r0, r0, #0x31
	ldrb	r2, [r0]
	EOR	r1, r2
	strb	r1, [r0]
	bx	lr
	thumb_func_end sub_8058784

.align 2, 0 @ Don't pad with nop.
