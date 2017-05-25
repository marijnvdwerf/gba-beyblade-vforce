	.include "asm/common.inc"

	thumb_func_start sub_804DFF4
sub_804DFF4:
	push	{r4, r5, lr}
	add	r5, r0, #0
	ldr	r0, [r5, #0x70]
	mov	r1, #0xce
	lsl	r1, r1, #0x1
	add	r0, r5, r1
	mov	r4, #0x0
	str	r4, [r0]
	add	r1, r1, #0x20
	add	r0, r5, r1
	str	r4, [r0]
	mov	r1, #0x80
	lsl	r1, r1, #0x8
	add	r0, r5, #0
	bl	UnsetRiderFlag
	ldr	r0, [r5, #0x10]
	str	r0, [r5, #0x1c]
	str	r4, [r5, #0x14]
	mov	r1, #0xa2
	lsl	r1, r1, #0x1
	add	r0, r5, r1
	strh	r4, [r0]
	add	r1, r1, #0x24
	add	r0, r5, r1
	str	r4, [r0]
	add	r0, r5, #0
	add	r0, r0, #0xb8
	ldr	r0, [r0]
	cmp	r0, #0
	beq	.L2	@cond_branch
	mov	r1, #0x80
	lsl	r1, r1, #0x13
	add	r0, r5, #0
	bl	RiderHasFlag
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L2	@cond_branch
	add	r0, r5, #0
	mov	r1, #0x0
	mov	r2, #0x0
	bl	sub_804E154
.L2:
	add	r0, r5, #0
	mov	r1, #0x20
	bl	UnsetRiderFlag
	add	r1, r5, #0
	add	r1, r1, #0xd2
	mov	r0, #0x0
	strb	r0, [r1]
	mov	r1, #0x80
	lsl	r1, r1, #0x13
	add	r0, r5, #0
	bl	RiderHasFlag
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L4	@cond_branch
	mov	r1, #0xcc
	lsl	r1, r1, #0x1
	add	r0, r5, r1
	ldr	r0, [r0]
	cmp	r0, #0x8
	ble	.L4	@cond_branch
	bl	sub_80558B8
.L4:
	ldr	r1, .L5
	add	r0, r5, #0
	bl	UnsetRiderFlag
	pop	{r4, r5}
	pop	{r0}
	bx	r0
.L6:
	.align	2, 0
.L5:
	.4byte	0x4010
	thumb_func_end sub_804DFF4

.align 2, 0 @ Don't pad with nop.
