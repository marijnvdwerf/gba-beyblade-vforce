	.include "asm/common.inc"

	thumb_func_start sub_8061660
sub_8061660:
	push	{r4, r5, r6, lr}
	add	r5, r0, #0
	add	r6, r1, #0
	lsl	r4, r2, #0x18
	lsr	r4, r4, #0x18
	bl	sub_8061228
	add	r0, r5, #0
	add	r1, r6, #0
	add	r2, r4, #0
	bl	showString
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	pop	{r4, r5, r6}
	pop	{r1}
	bx	r1
	thumb_func_end sub_8061660

.align 2, 0 @ Don't pad with nop.
