	.include "asm/common.inc"

	thumb_func_start sub_8041344
sub_8041344:
	push	{r4, r5, lr}
	add	r5, r0, #0
	ldr	r0, [r5, #0x8]
	lsl	r4, r1, #0x18
	lsr	r4, r4, #0x18
	add	r1, r4, #0
	bl	sub_8061E58
	ldr	r0, [r5, #0x4]
	add	r1, r4, #0
	bl	sub_8061E58
	pop	{r4, r5}
	pop	{r0}
	bx	r0
	thumb_func_end sub_8041344

.align 2, 0 @ Don't pad with nop.
