	.include "asm/common.inc"

	thumb_func_start sub_805EADC
sub_805EADC:
	mov	r2, #0x80
	lsl	r2, r2, #0x13
	mov	r3, #0xd6
	lsl	r3, r3, #0x2
	add	r1, r0, r3
	ldrh	r1, [r1]
	strh	r1, [r2]
	ldr	r1, .L1
	add	r2, r0, r1
	mov	r1, #0xff
	strb	r1, [r2]
	sub	r3, r3, #0x3
	add	r0, r0, r3
	mov	r1, #0xf
	strb	r1, [r0]
	bx	lr
.L2:
	.align	2, 0
.L1:
	.4byte	0x356
	thumb_func_end sub_805EADC

.align 2, 0 @ Don't pad with nop.
