	.include "asm/common.inc"

	thumb_func_start sub_8063544
sub_8063544:
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	add	sp, sp, #0xfffffff4
	add	r7, r0, #0
	add	r0, r1, #0
	str	r2, [sp]
	str	r3, [sp, #0x4]
	lsl	r0, r0, #0xa
	asr	r0, r0, #0x8
	mov	r1, #0x8
	ldsh	r4, [r7, r1]
	add	r1, r4, #0
	bl	__divsi3
	str	r0, [sp, #0x8]
	mov	r5, #0x0
	ldr	r2, [r7, #0xc]
	mov	ip, r2
	mov	r2, #0x0
	cmp	r2, r4
	bge	.L1	@cond_branch
.L10:
	ldrh	r0, [r7, #0x4]
	lsl	r1, r0, #0x1
	ldr	r0, [r7]
	add	r6, r0, r1
	mov	r1, #0x0
	mov	r8, r1
	ldr	r0, [sp, #0x8]
	add	r0, r0, r5
	mov	r9, r0
	add	r2, r2, #0x1
	mov	sl, r2
	ldrh	r1, [r7, #0x6]
	cmp	r8, r1
	bge	.L2	@cond_branch
.L9:
	ldrh	r1, [r6]
	mov	r4, #0x1f
	and	r4, r4, r1
	add	r0, r1, #0
	mov	r2, #0xf8
	lsl	r2, r2, #0x2
	and	r0, r0, r2
	lsr	r3, r0, #0x5
	mov	r0, #0xf8
	lsl	r0, r0, #0x7
	and	r1, r1, r0
	lsr	r2, r1, #0xa
	asr	r1, r4, #0x2
	asr	r0, r3, #0x1
	add	r1, r1, r0
	asr	r0, r2, #0x1
	add	r1, r1, r0
	cmp	r1, #0x1f
	ble	.L3	@cond_branch
	mov	r1, #0x1f
.L3:
	ldr	r0, [sp]
	cmp	r1, r0
	bge	.L4	@cond_branch
	ldr	r1, [sp, #0x4]
	sub	r0, r1, r4
	mul	r0, r0, r5
	asr	r0, r0, #0xa
	add	r4, r4, r0
	ldr	r1, [sp, #0x2c]
	sub	r0, r1, r3
	mul	r0, r0, r5
	asr	r0, r0, #0xa
	add	r3, r3, r0
	ldr	r1, [sp, #0x30]
	b	.L5
.L4:
	ldr	r1, [sp, #0x34]
	sub	r0, r1, r4
	mul	r0, r0, r5
	asr	r0, r0, #0xa
	add	r4, r4, r0
	ldr	r1, [sp, #0x38]
	sub	r0, r1, r3
	mul	r0, r0, r5
	asr	r0, r0, #0xa
	add	r3, r3, r0
	ldr	r1, [sp, #0x3c]
.L5:
	sub	r0, r1, r2
	mul	r0, r0, r5
	asr	r0, r0, #0xa
	add	r2, r2, r0
	cmp	r4, #0x1f
	ble	.L6	@cond_branch
	mov	r4, #0x1f
.L6:
	cmp	r3, #0x1f
	ble	.L7	@cond_branch
	mov	r3, #0x1f
.L7:
	cmp	r2, #0x1f
	ble	.L8	@cond_branch
	mov	r2, #0x1f
.L8:
	lsl	r0, r3, #0x5
	add	r0, r4, r0
	lsl	r1, r2, #0xa
	add	r0, r0, r1
	mov	r2, ip
	strh	r0, [r2]
	mov	r0, #0x2
	ADD ip, r0
	add	r6, r6, #0x2
	mov	r1, #0x1
	ADD r8, r1
	ldrh	r2, [r7, #0x6]
	cmp	r8, r2
	blt	.L9	@cond_branch
.L2:
	mov	r5, r9
	mov	r2, sl
	mov	r1, #0x8
	ldsh	r0, [r7, r1]
	cmp	r2, r0
	blt	.L10	@cond_branch
.L1:
	add	sp, sp, #0xc
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
	thumb_func_end sub_8063544

.align 2, 0 @ Don't pad with nop.
