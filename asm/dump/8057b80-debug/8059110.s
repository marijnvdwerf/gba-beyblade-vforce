	.include "asm/common.inc"

	thumb_func_start sub_8059110
sub_8059110:
	push	{r4, r5, r6, r7, lr}
	add	r6, r0, #0
	add	r0, r0, #0x80
	ldr	r7, [r0]
	mov	r0, #0x1
	neg	r0, r0
	cmp	r7, r0
	beq	.L805917C	@cond_branch
	mov	r5, #0x0
	cmp	r5, r7
	bge	.L805917C	@cond_branch
.L8059126:
	add	r0, r6, #0
	add	r0, r0, #0x84
	lsl	r1, r5, #0x4
	ldr	r0, [r0]
	add	r4, r0, r1
	ldr	r2, [r4, #0x8]
	cmp	r2, #0
	beq	.L805914A	@cond_branch
	ldr	r0, [r4]
	cmp	r0, #0
	beq	.L8059176	@cond_branch
	ldr	r0, [r4, #0x4]
	cmp	r0, #0
	bgt	.L805914A	@cond_branch
	ldr	r1, [r4, #0xc]
	add	r0, r6, #0
	bl	_call_via_r2
.L805914A:
	ldr	r2, [r4]
	cmp	r2, #0
	ble	.L8059176	@cond_branch
	ldr	r0, .L8059164
	ldr	r1, [r0]
	ldr	r0, [r0, #0x4]
	sub	r1, r1, r0
	ldr	r0, [r4, #0x4]
	cmp	r0, #0
	ble	.L8059168	@cond_branch
	sub	r0, r0, r1
	str	r0, [r4, #0x4]
	b	.L805916C
.L8059164:
	.align	2, 0

	.4byte	_unk3000E30
.L8059168:
	sub	r0, r2, r1
	str	r0, [r4]
.L805916C:
	ldr	r0, [r4]
	cmp	r0, #0
	bge	.L8059176	@cond_branch
	mov	r0, #0x0
	str	r0, [r4]
.L8059176:
	add	r5, r5, #0x1
	cmp	r5, r7
	blt	.L8059126	@cond_branch
.L805917C:
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
	thumb_func_end sub_8059110

.align 2, 0 @ Don't pad with nop.
