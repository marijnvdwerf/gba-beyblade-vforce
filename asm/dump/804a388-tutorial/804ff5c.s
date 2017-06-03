	.include "asm/common.inc"

	thumb_func_start sub_804FF5C
sub_804FF5C:
	push	{lr}
	add	r1, r0, #0
	ldr	r0, .L1
	ldr	r3, [r0]
	mov	r0, #0x0
	mov	r2, #0x10
	bl	_call_via_r3
	ldr	r0, .L1 + 4
	mov	r1, #0x0
	strh	r1, [r0]
	ldr	r0, .L1 + 8
	strh	r1, [r0]
	pop	{r0}
	bx	r0
.L2:
	.align	2, 0
.L1:
	.4byte	0x807d970
	.4byte	0x3000f44
	.4byte	0x3000f40
	thumb_func_end sub_804FF5C

.align 2, 0 @ Don't pad with nop.
