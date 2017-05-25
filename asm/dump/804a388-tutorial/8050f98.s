	.include "asm/common.inc"

	thumb_func_start sub_8050F98
sub_8050F98:
	push	{r4, lr}
	add	r4, r0, #0
	mov	r0, #0x3
	ldrh	r1, [r4, #0x3c]
	orr	r0, r0, r1
	strh	r0, [r4, #0x3c]
	mov	r0, #0x8
	bl	sub_804ABFC
	ldr	r0, [r4, #0x20]
	str	r0, [r4, #0x24]
	mov	r0, #0x80
	lsl	r0, r0, #0x4
	str	r0, [r4, #0x10]
	mov	r0, #0x8c
	lsl	r0, r0, #0x9
	str	r0, [r4, #0x1c]
	add	r4, r4, #0x40
	add	r0, r4, #0
	bl	sub_8061228
	pop	{r4}
	pop	{r0}
	bx	r0
	thumb_func_end sub_8050F98

.align 2, 0 @ Don't pad with nop.
