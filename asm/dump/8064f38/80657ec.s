	.include "asm/common.inc"

	thumb_func_start sub_80657EC
sub_80657EC:
	lsl	r1, r1, #0x18
	lsr	r1, r1, #0x18
	mov	r2, #0x10
	ldrb	r3, [r0, #0x5]
	orr	r2, r2, r3
	mov	r3, #0xf
	and	r1, r1, r3
	sub	r3, r3, #0x1f
	and	r2, r2, r3
	orr	r2, r2, r1
	strb	r2, [r0, #0x5]
	bx	lr
	thumb_func_end sub_80657EC

.align 2, 0 @ Don't pad with nop.
