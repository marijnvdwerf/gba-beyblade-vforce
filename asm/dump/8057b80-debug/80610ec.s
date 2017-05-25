	.include "asm/common.inc"

	thumb_func_start sub_80610EC
sub_80610EC:
	ldr	r2, .L1
	ldr	r0, [r0, #0x10]
	mov	r1, #0xc0
	lsl	r1, r1, #0x8
	and	r1, r1, r0
	asr	r1, r1, #0xc
	lsr	r0, r0, #0x1e
	orr	r1, r1, r0
	lsl	r1, r1, #0x1
	add	r1, r1, r2
	mov	r0, #0xff
	lsl	r0, r0, #0x8
	ldrh	r1, [r1]
	and	r0, r0, r1
	lsr	r0, r0, #0x7
	bx	lr
.L2:
	.align	2, 0
.L1:
	.4byte	0x807d90c
	thumb_func_end sub_80610EC

.align 2, 0 @ Don't pad with nop.
