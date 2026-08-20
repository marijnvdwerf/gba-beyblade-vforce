	.include "asm/common.inc"

	thumb_func_start sub_804FF5C
sub_804FF5C:
	push	{lr}
	add	r1, r0, #0
	ldr	r0, .L804FF7C
	ldr	r3, [r0]
	mov	r0, #0x0
	mov	r2, #0x10
	bl	_call_via_r3
	ldr	r0, .L804FF7C + 4
	mov	r1, #0x0
	strh	r1, [r0]
	ldr	r0, .L804FF7C + 8
	strh	r1, [r0]
	pop	{r0}
	bx	r0
.L804FF7A:
	.align	2, 0
.L804FF7C:
	.4byte	__fastMemoryClearARM
	.4byte	_unk3000F44
	.4byte	_unk3000F40
	thumb_func_end sub_804FF5C

.align 2, 0 @ Don't pad with nop.
