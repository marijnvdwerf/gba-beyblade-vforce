	.include "asm/common.inc"

	thumb_func_start sub_805024C
sub_805024C:
	ldrh	r1, [r0, #0x2]
	ldrh	r2, [r0, #0x4]
	EOR	r1, r2
	lsl	r1, r1, #0x10
	asr	r1, r1, #0x10
	ldrh	r3, [r0, #0x6]
	lsl	r2, r3, #0x16
	lsr	r2, r2, #0x16
	EOR	r1, r2
	ldrb	r3, [r0, #0xd]
	lsl	r2, r3, #0x1c
	lsr	r2, r2, #0x1c
	EOR	r1, r2
	ldrh	r2, [r0, #0x8]
	EOR	r1, r2
	ldrb	r3, [r0, #0xc]
	EOR	r1, r3
	ldrh	r2, [r0, #0xa]
	EOR	r1, r2
	mov	r2, #0x3f
	and	r1, r1, r2
	lsl	r1, r1, #0x2
	mov	r2, #0x3
	ldrb	r3, [r0, #0x7]
	and	r2, r2, r3
	orr	r2, r2, r1
	strb	r2, [r0, #0x7]
	bx	lr
	thumb_func_end sub_805024C

.align 2, 0 @ Don't pad with nop.
