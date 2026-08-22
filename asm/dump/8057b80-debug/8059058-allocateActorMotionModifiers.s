	.include "asm/common.inc"

	thumb_func_start allocateActorMotionModifiers
allocateActorMotionModifiers:
	push	{r4, r5, r6, r7, lr}
	mov	r7, r9
	mov	r6, r8
	push	{r6, r7}
	add	r4, r0, #0
	add	r7, r1, #0
	mov	r8, r2
	mov	r9, r3
	add	r2, r4, #0
	add	r2, r2, #0x80
	ldr	r1, [r2]
	mov	r0, #0x1
	neg	r0, r0
	cmp	r1, r0
	bne	.L8059098	@cond_branch
	mov	r0, #0x0
	str	r0, [r2]
	mov	r0, #0x10
	bl	fastAllocate
	cmp	r0, #0
	bne	.L8059090	@cond_branch
	ldr	r0, .L805908C
	bl	nullsub_8
	b	.L8059102
.L805908C:
	.align	2, 0

	.4byte	Str_872CC00
.L8059090:
	add	r1, r4, #0
	add	r1, r1, #0x84
	ldr	r0, [r0]
	str	r0, [r1]
.L8059098:
	add	r0, r4, #0
	add	r0, r0, #0x80
	ldr	r1, [r0]
	add	r6, r0, #0
	cmp	r1, #0
	ble	.L80590E4	@cond_branch
	mov	r1, #0x1
	neg	r1, r1
	mov	r5, #0x0
	mov	r3, #0x0
	add	r4, r4, #0x84
	ldr	r2, [r4]
.L80590B0:
	ldr	r0, [r2]
	cmp	r0, #0
	bne	.L80590BE	@cond_branch
	cmp	r1, #0
	bge	.L80590BC	@cond_branch
	add	r1, r3, #0
.L80590BC:
	add	r5, r5, #0x1
.L80590BE:
	add	r2, r2, #0x10
	add	r3, r3, #0x1
	cmp	r3, #0
	ble	.L80590B0	@cond_branch
	mov	r0, #0x1
	neg	r0, r0
	cmp	r1, r0
	bne	.L80590D2	@cond_branch
	ldr	r1, [r4]
	b	.L80590D8
.L80590D2:
	lsl	r1, r1, #0x4
	ldr	r0, [r4]
	add	r1, r0, r1
.L80590D8:
	cmp	r5, #0x1
	bne	.L80590EE	@cond_branch
	mov	r0, #0x0
	str	r0, [r6]
	ldr	r1, [r4]
	b	.L80590EE
.L80590E4:
	add	r0, r4, #0
	add	r0, r0, #0x84
	lsl	r1, r1, #0x4
	ldr	r0, [r0]
	add	r1, r0, r1
.L80590EE:
	str	r7, [r1, #0x8]
	mov	r0, r8
	str	r0, [r1]
	mov	r0, r9
	str	r0, [r1, #0x4]
	ldr	r0, [sp, #0x1c]
	str	r0, [r1, #0xc]
	ldr	r0, [r6]
	add	r0, r0, #0x1
	str	r0, [r6]
.L8059102:
	pop	{r3, r4}
	mov	r8, r3
	mov	r9, r4
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
	thumb_func_end allocateActorMotionModifiers

.align 2, 0 @ Don't pad with nop.
