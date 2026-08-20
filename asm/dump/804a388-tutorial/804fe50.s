	.include "asm/common.inc"

	thumb_func_start sub_804FE50
sub_804FE50:
	push	{r4, lr}
	ldr	r0, .L804FE90
	ldr	r4, [r0]
	ldr	r1, .L804FE90 + 4
	add	r0, r4, r1
	ldrb	r1, [r0]
	add	r1, r1, #0x1
	strb	r1, [r0]
	mov	r1, #0xfe
	lsl	r1, r1, #0x4
	add	r4, r4, r1
	ldrb	r1, [r0]
	add	r0, r4, #0
	mov	r2, #0xf
	bl	showNumber_2
	ldr	r1, .L804FE90 + 8
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
.L804FE8E:
	.align	2, 0
.L804FE90:
	.4byte	_gameData
	.4byte	0x107d
	.4byte	Str_8727048
	thumb_func_end sub_804FE50

.align 2, 0 @ Don't pad with nop.
