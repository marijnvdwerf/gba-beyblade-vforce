	.include "asm/common.inc"

	thumb_func_start sub_805741C
sub_805741C:
	push	{r4, lr}
	add	r4, r0, #0
	bl	getLanguage
	ldr	r1, .L1
	lsl	r0, r0, #0x2
	add	r0, r0, r1
	ldr	r0, [r0]
	lsl	r4, r4, #0x2
	add	r4, r4, r0
	ldr	r0, [r4]
	pop	{r4}
	pop	{r1}
	bx	r1
.L2:
	.align	2, 0
.L1:
	.4byte	0x807c960
	thumb_func_end sub_805741C

.align 2, 0 @ Don't pad with nop.
