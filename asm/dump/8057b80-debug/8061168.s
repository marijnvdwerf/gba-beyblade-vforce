	.include "asm/common.inc"

	thumb_func_start sub_8061168
sub_8061168:
	lsl	r1, r1, #0x18
	ldr	r3, .L8061180
	ldrh	r2, [r0, #0x14]
	and	r3, r3, r2
	mov	r2, #0xf0
	lsl	r2, r2, #0x14
	and	r2, r2, r1
	lsr	r2, r2, #0xc
	orr	r3, r3, r2
	strh	r3, [r0, #0x14]
	bx	lr
.L806117E:
	.align	2, 0
.L8061180:
	.4byte	0xfff
	thumb_func_end sub_8061168

.align 2, 0 @ Don't pad with nop.
