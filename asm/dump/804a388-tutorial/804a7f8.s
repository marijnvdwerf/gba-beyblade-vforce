	.include "asm/common.inc"

	thumb_func_start sub_804A7F8
sub_804A7F8:
	push	{lr}
	ldr	r3, .L1
	add	r0, r0, #0x88
	ldr	r0, [r0]
	add	r0, r0, #0x5d
	ldrb	r0, [r0]
	lsl	r1, r0, #0xe
	mov	r0, #0xc0
	lsl	r0, r0, #0x13
	add	r1, r1, r0
	mov	r2, #0x80
	lsl	r2, r2, #0x8
	ldr	r3, [r3]
	mov	r0, #0x0
	bl	_call_via_r3
	pop	{r0}
	bx	r0
.L2:
	.align	2, 0
.L1:
	.4byte	0x807d970
	thumb_func_end sub_804A7F8

.align 2, 0 @ Don't pad with nop.
