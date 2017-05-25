	.include "asm/common.inc"

	thumb_func_start sub_80506C0
sub_80506C0:
	push	{lr}
	mov	r0, #0x0
	mov	r1, #0x0
	mov	r2, #0x0
	mov	r3, #0x0
	bl	sub_805AC28
	mov	r0, #0xa
	mov	r1, #0x1
	bl	Mod
	mov	r0, #0xa
	mov	r1, #0x1
	bl	Div
	mov	r2, #0x80
	lsl	r2, r2, #0x13
	mov	r0, #0x0
	mov	r1, #0x0
	bl	CpuSet
	mov	r0, #0x80
	bl	Sqrt
	pop	{r0}
	bx	r0
	thumb_func_end sub_80506C0

.align 2, 0 @ Don't pad with nop.
