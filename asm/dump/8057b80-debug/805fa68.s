	.include "asm/common.inc"

	thumb_func_start sub_805FA68
sub_805FA68:
	push	{r4, lr}
	mov	r1, #0x0
	strh	r1, [r0, #0x4]
	ldr	r3, .L1
	mov	r4, #0x1
	NEG	r4, r4
	ldr	r1, [r0, #0x8]
	ldr	r0, [r0, #0x10]
	ldr	r2, [r0, #0x4]
	ldr	r3, [r3]
	add	r0, r4, #0
	bl	_call_via_r3
	pop	{r4}
	pop	{r0}
	bx	r0
.L2:
	.align	2, 0
.L1:
	.4byte	0x807d970
	thumb_func_end sub_805FA68

.align 2, 0 @ Don't pad with nop.
