	.include "asm/common.inc"

	thumb_func_start sub_8059110
sub_8059110:
	push	{r4, r5, r6, r7, lr}
	add	r6, r0, #0
	add	r0, r0, #0x80
	ldr	r7, [r0]
	mov	r0, #0x1
	NEG	r0, r0
	cmp	r7, r0
	beq	.L2	@cond_branch
	mov	r5, #0x0
	cmp	r5, r7
	bge	.L2	@cond_branch
.L12:
	add	r0, r6, #0
	add	r0, r0, #0x84
	lsl	r1, r5, #0x4
	ldr	r0, [r0]
	add	r4, r0, r1
	ldr	r2, [r4, #0x8]
	cmp	r2, #0
	beq	.L5	@cond_branch
	ldr	r0, [r4]
	cmp	r0, #0
	beq	.L11	@cond_branch
	ldr	r0, [r4, #0x4]
	cmp	r0, #0
	bgt	.L5	@cond_branch
	ldr	r1, [r4, #0xc]
	add	r0, r6, #0
	bl	_call_via_r2
.L5:
	ldr	r2, [r4]
	cmp	r2, #0
	ble	.L11	@cond_branch
	ldr	r0, .L9
	ldr	r1, [r0]
	ldr	r0, [r0, #0x4]
	sub	r1, r1, r0
	ldr	r0, [r4, #0x4]
	cmp	r0, #0
	ble	.L7	@cond_branch
	sub	r0, r0, r1
	str	r0, [r4, #0x4]
	b	.L8
.L10:
	.align	2, 0
.L9:
	.4byte	0x3000e30
.L7:
	sub	r0, r2, r1
	str	r0, [r4]
.L8:
	ldr	r0, [r4]
	cmp	r0, #0
	bge	.L11	@cond_branch
	mov	r0, #0x0
	str	r0, [r4]
.L11:
	add	r5, r5, #0x1
	cmp	r5, r7
	blt	.L12	@cond_branch
.L2:
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
	thumb_func_end sub_8059110

.align 2, 0 @ Don't pad with nop.
