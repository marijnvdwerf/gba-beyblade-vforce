	.include "asm/common.inc"

	thumb_func_start sub_8058838
sub_8058838:
	push	{r4, r5, r6, r7, lr}
	add	r6, r0, #0
	ldr	r7, [r6, #0x74]
	mov	r0, #0x1
	neg	r0, r0
	cmp	r7, r0
	beq	.L80588A0	@cond_branch
	mov	r5, #0x0
	cmp	r5, r7
	bge	.L80588A0	@cond_branch
.L805884C:
	lsl	r1, r5, #0x4
	ldr	r0, [r6, #0x78]
	add	r4, r0, r1
	ldr	r2, [r4, #0x8]
	cmp	r2, #0
	beq	.L805886C	@cond_branch
	ldr	r0, [r4]
	cmp	r0, #0
	beq	.L805889A	@cond_branch
	ldr	r0, [r4, #0x4]
	cmp	r0, #0
	bgt	.L805886C	@cond_branch
	add	r0, r6, #0
	add	r1, r4, #0
	bl	_call_via_r2
.L805886C:
	ldr	r2, [r4]
	cmp	r2, #0
	ble	.L805889A	@cond_branch
	ldr	r0, .L8058888
	ldr	r1, [r0]
	ldr	r0, [r0, #0x4]
	sub	r1, r1, r0
	ldr	r0, [r4, #0x4]
	cmp	r0, #0
	ble	.L805888C	@cond_branch
	sub	r0, r0, r1
	str	r0, [r4, #0x4]
	b	.L8058890
.L8058886:
	.align	2, 0
.L8058888:
	.4byte	_unk3000E30
.L805888C:
	sub	r0, r2, r1
	str	r0, [r4]
.L8058890:
	ldr	r0, [r4]
	cmp	r0, #0
	bge	.L805889A	@cond_branch
	mov	r0, #0x0
	str	r0, [r4]
.L805889A:
	add	r5, r5, #0x1
	cmp	r5, r7
	blt	.L805884C	@cond_branch
.L80588A0:
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
	thumb_func_end sub_8058838

.align 2, 0 @ Don't pad with nop.
