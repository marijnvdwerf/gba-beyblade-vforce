	.include "asm/common.inc"

	thumb_func_start sub_8052140
sub_8052140:
	push	{r4, lr}
	mov	ip, r0
	mov	r0, #0xa0
	lsl	r0, r0, #0x4
	mov	r2, ip
	str	r0, [r2]
	mov	r0, #0x80
	lsl	r0, r0, #0x4
	str	r0, [r2, #0x4]
	mov	r3, #0x0
	str	r3, [r2, #0x8]
	mov	r4, #0x0
	mov	r0, #0x6
	strh	r0, [r2, #0x14]
	strh	r0, [r2, #0x16]
	strh	r0, [r2, #0x18]
	strh	r3, [r2, #0xe]
	strh	r3, [r2, #0x1a]
	add	r2, r2, #0x24
	mov	r0, #0x81
	strb	r0, [r2]
	mov	r0, ip
	add	r0, r0, #0x25
	strb	r4, [r0]
	add	r0, r0, #0x1
	strb	r4, [r0]
	mov	r0, ip
	strh	r3, [r0, #0x32]
	str	r1, [r0, #0x58]
	pop	{r4}
	pop	{r0}
	bx	r0
	thumb_func_end sub_8052140

.align 2, 0 @ Don't pad with nop.
