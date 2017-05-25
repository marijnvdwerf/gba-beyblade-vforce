	.include "asm/common.inc"

	thumb_func_start rider_vs_rider_collision_804DB94
rider_vs_rider_collision_804DB94:
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	add	sp, sp, #0xfffffffc
	mov	sl, r0
	str	r1, [sp]
	ldr	r6, [r0]
	ldr	r0, [r1]
	mov	r8, r0
	ldr	r3, [r6, #0x4]
	ldr	r4, [r6, #0x8]
	ldr	r5, [r6, #0xc]
	ldr	r0, [r0, #0x4]
	mov	r2, r8
	ldr	r1, [r2, #0x8]
	ldr	r2, [r2, #0xc]
	sub	r0, r0, r3
	asr	r7, r0, #0x8
	sub	r1, r1, r4
	asr	r1, r1, #0x8
	mov	r9, r1
	sub	r2, r2, r5
	asr	r5, r2, #0x8
	add	r0, r7, #0
	mul	r0, r0, r7
	add	r3, r1, #0
	mov	r1, r9
	mul	r1, r1, r3
	add	r0, r0, r1
	add	r1, r5, #0
	mul	r1, r1, r5
	add	r0, r0, r1
	bl	Sqrt
	lsl	r0, r0, #0x10
	lsr	r4, r0, #0x10
	cmp	r4, #0x15
	ble	.L1	@cond_branch
	b	.L12
.L1:
	lsl	r0, r7, #0x8
	add	r1, r4, #0
	bl	sub_8066084
	add	r7, r0, #0
	mov	r1, r9
	lsl	r0, r1, #0x8
	add	r1, r4, #0
	bl	sub_8066084
	mov	r9, r0
	lsl	r0, r5, #0x8
	add	r1, r4, #0
	bl	sub_8066084
	add	r5, r0, #0
	ldr	r3, [r6, #0x40]
	mov	r2, r8
	ldr	r0, [r2, #0x40]
	sub	r3, r3, r0
	ldr	r1, [r6, #0x44]
	ldr	r0, [r2, #0x44]
	sub	r1, r1, r0
	ldr	r2, [r6, #0x48]
	mov	r4, r8
	ldr	r0, [r4, #0x48]
	sub	r2, r2, r0
	add	r0, r3, #0
	mul	r0, r0, r3
	add	r3, r1, #0
	mul	r3, r3, r1
	add	r1, r3, #0
	add	r0, r0, r1
	add	r1, r2, #0
	mul	r1, r1, r2
	add	r0, r0, r1
	bl	Sqrt
	lsl	r0, r0, #0x10
	lsr	r0, r0, #0x10
	add	r1, r7, #0
	mul	r1, r1, r0
	lsl	r1, r1, #0x8
	asr	r7, r1, #0x10
	mov	r1, r9
	mul	r1, r1, r0
	lsl	r1, r1, #0x8
	asr	r1, r1, #0x10
	mov	r9, r1
	mul	r0, r0, r5
	lsl	r0, r0, #0x8
	asr	r5, r0, #0x10
	mov	r0, sl
	mov	r1, #0x2
	bl	RiderHasFlag
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L3	@cond_branch
	mov	r2, #0x8a
	lsl	r2, r2, #0x2
	ADD r2, sl
	ldrh	r4, [r2]
	add	r1, r4, #0
	mul	r1, r1, r7
	asr	r1, r1, #0x8
	ldr	r0, [r6, #0x40]
	sub	r0, r0, r1
	str	r0, [r6, #0x40]
	ldrh	r0, [r2]
	mov	r1, r9
	mul	r1, r1, r0
	asr	r1, r1, #0x8
	ldr	r0, [r6, #0x44]
	sub	r0, r0, r1
	str	r0, [r6, #0x44]
	ldrh	r2, [r2]
	add	r1, r2, #0
	mul	r1, r1, r5
	asr	r1, r1, #0x8
	ldr	r0, [r6, #0x48]
	sub	r0, r0, r1
	str	r0, [r6, #0x48]
	b	.L4
.L3:
	mov	r2, #0x8a
	lsl	r2, r2, #0x2
	ADD r2, sl
	ldrh	r3, [r2]
	add	r1, r3, #0
	mul	r1, r1, r7
	asr	r1, r1, #0x8
	mov	r4, sl
	ldr	r0, [r4, #0x40]
	sub	r0, r0, r1
	str	r0, [r4, #0x40]
	ldrh	r2, [r2]
	mov	r1, r9
	mul	r1, r1, r2
	asr	r1, r1, #0x8
	ldr	r0, [r4, #0x44]
	add	r0, r0, r1
	str	r0, [r4, #0x44]
.L4:
	ldr	r0, [sp]
	mov	r1, #0x2
	bl	RiderHasFlag
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L5	@cond_branch
	ldr	r0, [sp]
	mov	r1, #0x8a
	lsl	r1, r1, #0x2
	add	r2, r0, r1
	ldrh	r3, [r2]
	add	r1, r3, #0
	mul	r1, r1, r7
	asr	r1, r1, #0x8
	mov	r4, r8
	ldr	r0, [r4, #0x40]
	add	r0, r0, r1
	str	r0, [r4, #0x40]
	ldrh	r7, [r2]
	mov	r1, r9
	mul	r1, r1, r7
	asr	r1, r1, #0x8
	ldr	r0, [r4, #0x44]
	add	r0, r0, r1
	str	r0, [r4, #0x44]
	ldrh	r2, [r2]
	add	r1, r2, #0
	mul	r1, r1, r5
	asr	r1, r1, #0x8
	ldr	r0, [r4, #0x48]
	add	r0, r0, r1
	str	r0, [r4, #0x48]
	b	.L6
.L5:
	ldr	r0, [sp]
	mov	r1, #0x8a
	lsl	r1, r1, #0x2
	add	r2, r0, r1
	ldrh	r3, [r2]
	add	r1, r3, #0
	mul	r1, r1, r7
	asr	r1, r1, #0x8
	ldr	r0, [r0, #0x40]
	add	r0, r0, r1
	ldr	r4, [sp]
	str	r0, [r4, #0x40]
	ldrh	r2, [r2]
	mov	r1, r9
	mul	r1, r1, r2
	asr	r1, r1, #0x8
	ldr	r0, [r4, #0x44]
	sub	r0, r0, r1
	str	r0, [r4, #0x44]
.L6:
	mov	r4, #0x80
	lsl	r4, r4, #0x13
	mov	r0, sl
	add	r1, r4, #0
	bl	RiderHasFlag
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L7	@cond_branch
	mov	r0, #0x4
	mov	r1, #0x0
	mov	r2, #0x0
	bl	sub_8055734
	bl	sub_80558B8
	mov	r0, #0x0
	bl	sub_80558E8
	mov	r0, #0x1
	bl	sub_804ABFC
.L7:
	mov	r0, sl
	add	r1, r4, #0
	bl	RiderHasFlag
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L9	@cond_branch
	ldr	r0, [sp]
	add	r1, r4, #0
	bl	RiderHasFlag
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L9	@cond_branch
	ldr	r7, [sp]
	mov	r1, #0x82
	lsl	r1, r1, #0x2
	add	r0, r7, r1
	ldr	r1, [r0]
	ldr	r0, .L15
	cmp	r1, r0
	ble	.L10	@cond_branch
	mov	r1, #0x82
	lsl	r1, r1, #0x2
	ADD r1, sl
	ldr	r0, [r1]
	ldr	r2, .L15 + 4
	add	r0, r0, r2
	str	r0, [r1]
.L10:
	mov	r1, #0x88
	lsl	r1, r1, #0x2
	ADD r1, sl
	ldrh	r0, [r1]
	add	r0, r0, #0xf0
	strh	r0, [r1]
.L9:
	mov	r4, #0x80
	lsl	r4, r4, #0x13
	ldr	r0, [sp]
	add	r1, r4, #0
	bl	RiderHasFlag
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L12	@cond_branch
	mov	r0, sl
	add	r1, r4, #0
	bl	RiderHasFlag
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L12	@cond_branch
	ldr	r3, [sp]
	mov	r4, #0x82
	lsl	r4, r4, #0x2
	add	r1, r3, r4
	ldr	r0, [r1]
	ldr	r2, .L15
	cmp	r0, r2
	ble	.L14	@cond_branch
	ldr	r7, .L15 + 4
	add	r0, r0, r7
	str	r0, [r1]
	cmp	r0, r2
	bgt	.L14	@cond_branch
	mov	r0, #0x80
	lsl	r0, r0, #0x2
	str	r0, [r1]
.L14:
	ldr	r0, [sp]
	mov	r2, #0x88
	lsl	r2, r2, #0x2
	add	r1, r0, r2
	ldrh	r0, [r1]
	add	r0, r0, #0xf0
	strh	r0, [r1]
.L12:
	mov	r0, #0x0
	add	sp, sp, #0x4
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6, r7}
	pop	{r1}
	bx	r1
.L16:
	.align	2, 0
.L15:
	.4byte	0x1ff
	.4byte	0xfffffe00
	thumb_func_end rider_vs_rider_collision_804DB94

.align 2, 0 @ Don't pad with nop.
