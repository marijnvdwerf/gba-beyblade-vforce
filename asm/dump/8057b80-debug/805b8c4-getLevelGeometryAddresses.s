	.include "asm/common.inc"

	thumb_func_start getLevelGeometryAddresses
getLevelGeometryAddresses:
	push	{r4, r5, r6, lr}
	add	r5, r0, #0
	str	r1, [r5]
	ldr	r0, [r1, #0x10]
	add	r0, r1, r0
	str	r0, [r5, #0x4]
	ldr	r0, [r1, #0x14]
	add	r0, r1, r0
	str	r0, [r5, #0x8]
	ldr	r0, [r1, #0x18]
	add	r0, r1, r0
	str	r0, [r5, #0xc]
	ldrh	r4, [r1, #0x4]
	mov	r2, #0x4
	ldsh	r0, [r1, r2]
	cmp	r0, #0x40
	ble	.L1	@cond_branch
	mov	r4, #0x40
	ldr	r0, .L4
	bl	nullsub_8
.L1:
	lsl	r0, r4, #0x10
	mov	r1, #0x0
	add	r6, r0, #0
	cmp	r6, #0
	ble	.L2	@cond_branch
.L3:
	lsl	r4, r1, #0x10
	asr	r4, r4, #0x10
	add	r0, r5, #0
	add	r1, r4, #0
	bl	GetSplineAtIndex
	lsl	r2, r4, #0x2
	add	r1, r5, #0
	add	r1, r1, #0x14
	add	r1, r1, r2
	str	r0, [r1]
	add	r4, r4, #0x1
	lsl	r4, r4, #0x10
	lsr	r1, r4, #0x10
	cmp	r4, r6
	blt	.L3	@cond_branch
.L2:
	mov	r1, #0x8a
	lsl	r1, r1, #0x1
	add	r0, r5, r1
	mov	r1, #0x0
	str	r1, [r0]
	str	r1, [r5, #0x10]
	mov	r2, #0x8c
	lsl	r2, r2, #0x1
	add	r0, r5, r2
	strh	r1, [r0]
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
.L5:
	.align	2, 0
.L4:
	.4byte	0x87553d0
	thumb_func_end getLevelGeometryAddresses

.align 2, 0 @ Don't pad with nop.
