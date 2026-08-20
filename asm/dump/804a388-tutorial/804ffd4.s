	.include "asm/common.inc"

	thumb_func_start sub_804FFD4
sub_804FFD4:
	push	{lr}
	ldr	r2, .L804FFF8
	ldr	r0, .L804FFF8 + 4
	ldr	r1, [r0]
	ldr	r0, .L804FFF8 + 8
	add	r1, r1, r0
	ldr	r3, [r2]
	mov	r0, #0x0
	mov	r2, #0x40
	bl	_call_via_r3
	ldr	r0, .L804FFF8 + 12
	mov	r1, #0x0
	strh	r1, [r0]
	ldr	r0, .L804FFF8 + 16
	strh	r1, [r0]
	pop	{r0}
	bx	r0
.L804FFF8:
	.align	2, 0

	.4byte	__fastMemoryClearARM
	.4byte	_gameData
	.4byte	0x15d4
	.4byte	_unk3000F44
	.4byte	_unk3000F40
	thumb_func_end sub_804FFD4

.align 2, 0 @ Don't pad with nop.
