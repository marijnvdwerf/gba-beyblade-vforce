	.include "asm/common.inc"

	thumb_func_start sub_804C8C0
sub_804C8C0:
	push	{r4, r5, lr}
	add	r5, r0, #0
	add	r0, r1, #0
	add	r4, r2, #0
	lsl	r0, r0, #0x8
	mov	r1, #0x64
	bl	__divsi3
	mov	r2, #0xe5
	lsl	r2, r2, #0x1
	add	r1, r5, r2
	strh	r0, [r1]
	lsl	r4, r4, #0x8
	add	r0, r4, #0
	mov	r1, #0x64
	bl	__divsi3
	mov	r2, #0xe6
	lsl	r2, r2, #0x1
	add	r1, r5, r2
	strh	r0, [r1]
	pop	{r4, r5}
	pop	{r0}
	bx	r0
	thumb_func_end sub_804C8C0

.align 2, 0 @ Don't pad with nop.
