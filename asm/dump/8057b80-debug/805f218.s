	.include "asm/common.inc"

	thumb_func_start sub_805F218
sub_805F218:
	mov	ip, r0
	mov	r3, ip
	add	r3, r3, #0x4c
	mov	r0, #0x0
	strb	r0, [r3]
	mov	r0, ip
	add	r0, r0, #0x4e
	strh	r2, [r0]
	add	r0, r0, #0x2
	strh	r1, [r0]
	mov	r1, ip
	add	r1, r1, #0x52
	mov	r0, #0x1
	ldrh	r2, [r1]
	orr	r0, r0, r2
	strh	r0, [r1]
	bx	lr
	thumb_func_end sub_805F218

.align 2, 0 @ Don't pad with nop.
