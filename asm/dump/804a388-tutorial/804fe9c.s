	.include "asm/common.inc"

	thumb_func_start sub_804FE9C
sub_804FE9C:
	push	{r4, lr}
	ldr	r0, .L1
	ldr	r4, [r0]
	bl	sub_80518F0
	ldr	r2, .L1 + 4
	add	r1, r4, r2
	strb	r0, [r1]
	mov	r0, #0xfe
	lsl	r0, r0, #0x4
	add	r4, r4, r0
	ldrb	r1, [r1]
	add	r0, r4, #0
	mov	r2, #0xf
	bl	showNumber_2
	ldr	r1, .L1 + 8
	add	r0, r4, #0
	mov	r2, #0xf
	bl	showString
	bl	getLevelDescription2
	ldrb	r1, [r0, #0x1]
	add	r0, r4, #0
	mov	r2, #0xf
	bl	showNumber
	pop	{r4}
	pop	{r0}
	bx	r0
.L2:
	.align	2, 0
.L1:
	.4byte	0x3000fb0
	.4byte	0x107d
	.4byte	0x8727048
	thumb_func_end sub_804FE9C

.align 2, 0 @ Don't pad with nop.
