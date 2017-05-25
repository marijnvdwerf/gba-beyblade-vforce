	.include "asm/common.inc"

	thumb_func_start sub_8043720
sub_8043720:
	push	{r4, r5, lr}
	add	r4, r0, #0
	mov	r0, #0x8f
	lsl	r0, r0, #0x3
	add	r4, r4, r0
	add	r0, r4, #0
	bl	sub_805B240
	add	r5, r0, #0
	add	r0, r4, #0
	bl	sub_805B210
	lsl	r5, r5, #0x10
	ldr	r1, .L1
	and	r1, r1, r0
	orr	r5, r5, r1
	add	r0, r5, #0
	pop	{r4, r5}
	pop	{r1}
	bx	r1
.L2:
	.align	2, 0
.L1:
	.4byte	0xffff
	thumb_func_end sub_8043720

.align 2, 0 @ Don't pad with nop.
