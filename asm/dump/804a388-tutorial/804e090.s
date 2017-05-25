	.include "asm/common.inc"

	thumb_func_start sub_804E090
sub_804E090:
	push	{r4, r5, lr}
	add	r5, r0, #0
	mov	r1, #0xce
	lsl	r1, r1, #0x1
	add	r0, r5, r1
	mov	r1, #0x0
	str	r1, [r0]
	mov	r2, #0xcc
	lsl	r2, r2, #0x1
	add	r0, r5, r2
	str	r1, [r0]
	add	r1, r5, #0
	add	r1, r1, #0xbc
	mov	r0, #0x1
	NEG	r0, r0
	str	r0, [r1]
	mov	r1, #0xb8
	lsl	r1, r1, #0x1
	add	r0, r5, r1
	ldr	r4, [r0]
	mov	r1, #0x80
	lsl	r1, r1, #0xb
	add	r0, r5, #0
	bl	UnsetRiderFlag
	cmp	r4, #0
	ble	.L5	@cond_branch
	add	r0, r5, #0
	add	r0, r0, #0x80
	ldr	r0, [r0]
	cmp	r0, #0
	ble	.L5	@cond_branch
	add	r0, r5, #0
	add	r0, r0, #0xec
	ldr	r0, [r0]
	cmp	r0, #0
	beq	.L4	@cond_branch
	ldrb	r0, [r0, #0xf]
	cmp	r0, #0x81
	bne	.L4	@cond_branch
	mov	r2, #0xb6
	lsl	r2, r2, #0x1
	add	r0, r5, r2
	ldr	r1, [r0]
	mov	r0, #0x80
	sub	r0, r0, r1
	mov	r1, #0xff
	and	r0, r0, r1
	mov	r1, #0x7f
	and	r0, r0, r1
	ldr	r1, [r5, #0x10]
	asr	r1, r1, #0x4
	lsl	r1, r1, #0x18
	lsr	r1, r1, #0x18
	bl	sub_804E358
	ldr	r1, [r5, #0x10]
	asr	r1, r1, #0x4
	lsl	r0, r0, #0x10
	asr	r0, r0, #0xf
	sub	r0, r0, #0x80
	sub	r1, r1, r0
	mov	r0, #0xff
	and	r1, r1, r0
	str	r1, [r5, #0xc]
	b	.L5
.L4:
	add	r0, r5, #0
	add	r0, r0, #0x90
	ldr	r1, [r5]
	ldr	r1, [r1, #0xc]
	str	r1, [r0]
.L5:
	pop	{r4, r5}
	pop	{r0}
	bx	r0
	thumb_func_end sub_804E090

.align 2, 0 @ Don't pad with nop.
