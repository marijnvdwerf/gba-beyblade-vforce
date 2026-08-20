	.include "asm/common.inc"

	thumb_func_start sub_8061110
sub_8061110:
	ldr	r2, .L806112C
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
.L806112A:
	.align	2, 0
.L806112C:
	.4byte	word_807D90C
	thumb_func_end sub_8061110

.align 2, 0 @ Don't pad with nop.
