	.include "asm/common.inc"

	thumb_func_start sub_80520F4
sub_80520F4:
	push	{r4, r5, r6, lr}
	mov	r6, r8
	push	{r6}
	add	r4, r0, #0
	mov	r8, r1
	add	r0, r2, #0
	add	r5, r3, #0
	add	r1, r4, #0
	add	r1, r1, #0x40
	ldrh	r1, [r1]
	strh	r1, [r5, #0x1a]
	bl	sub_805FA68
	add	r0, r4, #0
	add	r1, r5, #0
	mov	r2, #0x0
	bl	sub_8052180
	ldr	r3, [r4, #0x18]
	mov	r0, r8
	ldr	r6, [r0, #0x34]
	add	r0, r4, #0
	mov	r1, #0x0
	add	r2, r5, #0
	bl	_call_via_r6
	mov	r0, r8
	ldr	r3, [r0, #0x78]
	add	r0, r4, #0
	add	r1, r5, #0
	mov	r2, #0x1
	bl	_call_via_r3
	pop	{r3}
	mov	r8, r3
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
	thumb_func_end sub_80520F4

.align 2, 0 @ Don't pad with nop.
