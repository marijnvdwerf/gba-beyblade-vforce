	.include "asm/common.inc"

	thumb_func_start sub_8058968
sub_8058968:
	push	{r4, r5, r6, r7, lr}
	mov	r7, r8
	push	{r7}
	add	sp, sp, #0xfffffff4
	add	r7, r0, #0
	add	r4, r1, #0
	ldr	r0, [sp, #0x24]
	mov	r8, r0
	lsl	r4, r4, #0x18
	lsr	r4, r4, #0x18
	lsl	r3, r3, #0x10
	lsr	r3, r3, #0x10
	mov	r1, r8
	lsl	r1, r1, #0x10
	lsr	r1, r1, #0x10
	mov	r8, r1
	ldr	r0, [sp, #0x28]
	asr	r5, r0, #0x3
	ldr	r1, [sp, #0x2c]
	asr	r6, r1, #0x3
	mov	r0, r8
	str	r0, [sp]
	add	r0, r7, #0
	add	r1, r4, #0
	bl	sub_8058AA8
	add	r0, r4, #0
	bl	GetBGLayerHOffsetPtr
	mov	r1, sp
	ldrh	r1, [r1, #0x28]
	strh	r1, [r0]
	add	r0, r4, #0
	bl	GetBGLayerVOffsetPtr
	mov	r2, sp
	ldrh	r2, [r2, #0x2c]
	strh	r2, [r0]
	ldr	r4, [r7, #0x8]
	str	r5, [r4, #0x10]
	str	r6, [r4, #0x14]
	str	r5, [r4]
	add	r3, r7, #0
	add	r3, r3, #0x5f
	mov	r1, #0x1
	add	r0, r1, #0
	ldrb	r2, [r3]
	LSL	r0, r2
	add	r5, r5, r0
	sub	r5, r5, #0x1
	str	r5, [r4, #0x8]
	str	r6, [r4, #0x4]
	add	r2, r7, #0
	add	r2, r2, #0x60
	add	r0, r1, #0
	ldrb	r5, [r2]
	LSL	r0, r5
	add	r6, r6, r0
	sub	r6, r6, #0x1
	str	r6, [r4, #0xc]
	ldr	r0, [sp, #0x28]
	lsl	r5, r0, #0x8
	str	r5, [r7, #0xc]
	ldr	r0, [sp, #0x2c]
	lsl	r6, r0, #0x8
	str	r6, [r7, #0x10]
	str	r5, [r7, #0x40]
	str	r6, [r7, #0x44]
	add	r6, r1, #0
	ldrb	r3, [r3]
	LSL	r6, r3
	add	r5, r1, #0
	ldrb	r2, [r2]
	LSL	r5, r2
	mov	r0, #0x2
	mov	r1, r8
	and	r0, r0, r1
	cmp	r0, #0
	bne	.L1	@cond_branch
	ldr	r1, [r4]
	ldr	r2, [r4, #0x4]
	ldr	r3, [r4, #0x10]
	ldr	r0, [r4, #0x14]
	str	r0, [sp]
	str	r6, [sp, #0x4]
	str	r5, [sp, #0x8]
	add	r0, r7, #0
	bl	sub_8059310
.L1:
	add	sp, sp, #0xc
	pop	{r3}
	mov	r8, r3
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
	thumb_func_end sub_8058968

.align 2, 0 @ Don't pad with nop.
