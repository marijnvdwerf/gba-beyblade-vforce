	.include "asm/common.inc"

	thumb_func_start sub_8058F60
sub_8058F60:
	push	{r4, r5, r6, r7, lr}
	add	r6, r0, #0
	add	r4, r6, #0
	add	r4, r4, #0x5e
	ldrb	r0, [r4]
	sub	r0, r0, #0x2
	lsl	r0, r0, #0x18
	lsr	r5, r0, #0x18
	ldr	r1, [r6, #0x28]
	ldr	r0, [r6, #0x2c]
	add	r0, r1, r0
	str	r0, [r6, #0x28]
	cmp	r0, #0
	bge	.L1	@cond_branch
	mov	r1, #0x80
	lsl	r1, r1, #0x9
	add	r0, r0, r1
	str	r0, [r6, #0x28]
.L1:
	ldr	r2, [r6, #0x30]
	ldr	r0, [r6, #0x38]
	add	r2, r2, r0
	str	r2, [r6, #0x30]
	ldr	r3, [r6, #0x34]
	ldr	r0, [r6, #0x3c]
	add	r3, r3, r0
	str	r3, [r6, #0x34]
	ldrb	r0, [r4]
	ldr	r1, [r6, #0x28]
	asr	r1, r1, #0x8
	lsl	r1, r1, #0x18
	lsr	r1, r1, #0x18
	lsl	r2, r2, #0x8
	lsr	r2, r2, #0x10
	lsl	r3, r3, #0x8
	lsr	r3, r3, #0x10
	bl	sub_8059B00
	ldrb	r0, [r4]
	ldr	r7, .L9
	mov	ip, r7
	lsl	r3, r5, #0x1
	add	r3, r3, r5
	lsl	r3, r3, #0x3
	mov	r1, ip
	add	r1, r1, #0x8
	add	r1, r3, r1
	add	r2, r6, #0
	add	r2, r2, #0x48
	mov	r5, #0x0
	ldsh	r4, [r2, r5]
	ldr	r1, [r1]
	add	r2, r1, #0
	mul	r2, r2, r4
	mov	r1, ip
	add	r1, r1, #0x10
	add	r1, r3, r1
	add	r5, r6, #0
	add	r5, r5, #0x4a
	mov	r7, #0x0
	ldsh	r5, [r5, r7]
	ldr	r1, [r1]
	mul	r1, r1, r5
	sub	r2, r2, r1
	ldr	r1, [r6, #0x4c]
	sub	r1, r1, r2
	mov	r2, ip
	add	r2, r2, #0xc
	add	r2, r3, r2
	ldr	r2, [r2]
	mul	r4, r4, r2
	mov	r2, ip
	add	r2, r2, #0x14
	add	r3, r3, r2
	ldr	r2, [r3]
	mul	r2, r2, r5
	sub	r4, r4, r2
	ldr	r2, [r6, #0x50]
	add	r2, r2, r4
	bl	SetBGOffset
	ldr	r4, [r6, #0x24]
	cmp	r4, #0
	beq	.L8	@cond_branch
	ldr	r3, [r6, #0x2c]
	add	r0, r3, #0
	mul	r0, r0, r4
	asr	r5, r0, #0x8
	ldr	r2, [r6, #0x38]
	add	r0, r2, #0
	mul	r0, r0, r4
	asr	r7, r0, #0x8
	ldr	r1, [r6, #0x3c]
	add	r0, r1, #0
	mul	r0, r0, r4
	asr	r4, r0, #0x8
	sub	r3, r3, r5
	str	r3, [r6, #0x2c]
	sub	r2, r2, r7
	str	r2, [r6, #0x38]
	sub	r1, r1, r4
	str	r1, [r6, #0x3c]
	cmp	r5, #0
	bne	.L4	@cond_branch
	cmp	r3, #0
	beq	.L4	@cond_branch
	str	r5, [r6, #0x2c]
.L4:
	cmp	r7, #0
	bne	.L6	@cond_branch
	ldr	r0, [r6, #0x38]
	cmp	r0, #0
	beq	.L6	@cond_branch
	str	r7, [r6, #0x38]
.L6:
	cmp	r4, #0
	bne	.L8	@cond_branch
	ldr	r0, [r6, #0x3c]
	cmp	r0, #0
	beq	.L8	@cond_branch
	str	r4, [r6, #0x3c]
.L8:
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L10:
	.align	2, 0
.L9:
	.4byte	0x3000d00
	thumb_func_end sub_8058F60

.align 2, 0 @ Don't pad with nop.
