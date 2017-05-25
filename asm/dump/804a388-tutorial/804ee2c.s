	.include "asm/common.inc"

	thumb_func_start sub_804EE2C
sub_804EE2C:
	push	{r4, lr}
	ldr	r0, .L1
	ldr	r4, [r0]
	mov	r1, #0xf5
	lsl	r1, r1, #0x4
	add	r0, r4, r1
	bl	sub_8061228
	mov	r0, #0xf8
	lsl	r0, r0, #0x4
	add	r4, r4, r0
	add	r0, r4, #0
	bl	sub_8061228
	pop	{r4}
	pop	{r0}
	bx	r0
.L2:
	.align	2, 0
.L1:
	.4byte	0x3000fb0
	thumb_func_end sub_804EE2C

.align 2, 0 @ Don't pad with nop.
