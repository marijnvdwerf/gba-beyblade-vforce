	.include "asm/common.inc"

	thumb_func_start sub_8061110
sub_8061110:
	ldr	r2, .L1
	ldr	r1, [r0, #0x10]
	mov	r0, #0xc0
	lsl	r0, r0, #0x8
	and	r0, r0, r1
	asr	r0, r0, #0xc
	lsr	r1, r1, #0x1e
	orr	r0, r0, r1
	lsl	r0, r0, #0x1
	add	r0, r0, r2
	ldrb	r0, [r0]
	lsl	r0, r0, #0x1
	bx	lr
.L2:
	.align	2, 0
.L1:
	.4byte	0x807d90c
	thumb_func_end sub_8061110

.align 2, 0 @ Don't pad with nop.
