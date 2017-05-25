	.include "asm/common.inc"

	thumb_func_start sub_80584B8
sub_80584B8:
	push	{r4, r5, r6, r7, lr}
	add	r4, r0, #0
	bl	sub_8058838
	add	r5, r4, #0
	add	r5, r5, #0x80
	ldr	r0, [r5]
	cmp	r0, #0
	beq	.L1	@cond_branch
	add	r0, r4, #0
	add	r0, r0, #0x84
	ldr	r0, [r0]
	cmp	r0, #0
	blt	.L2	@cond_branch
	add	r0, r4, #0
	bl	sub_805D650
.L2:
	ldr	r0, [r5]
	ldr	r2, [r4, #0x40]
	ldr	r3, [r4, #0x44]
	ldr	r7, [r4, #0x48]
	cmp	r0, #0
	bne	.L4	@cond_branch
.L1:
	add	r0, r4, #0
	add	r0, r0, #0x84
	ldr	r1, [r0]
	mov	r0, #0x1
	NEG	r0, r0
	ldr	r2, [r4, #0x40]
	ldr	r3, [r4, #0x44]
	ldr	r7, [r4, #0x48]
	cmp	r1, r0
	bne	.L4	@cond_branch
	ldr	r0, [r4, #0x4]
	add	r0, r0, r2
	str	r0, [r4, #0x4]
	ldr	r0, [r4, #0x8]
	add	r0, r0, r3
	str	r0, [r4, #0x8]
	ldr	r0, [r4, #0xc]
	add	r0, r0, r7
	str	r0, [r4, #0xc]
.L4:
	ldr	r0, [r4, #0x4c]
	add	r6, r2, r0
	str	r6, [r4, #0x40]
	ldr	r0, [r4, #0x50]
	add	r5, r3, r0
	str	r5, [r4, #0x44]
	ldr	r0, [r4, #0x54]
	add	r3, r7, r0
	str	r3, [r4, #0x48]
	ldr	r2, [r4, #0x68]
	cmp	r2, #0
	beq	.L15	@cond_branch
	add	r1, r6, #0
	mul	r1, r1, r2
	asr	r1, r1, #0x8
	add	r0, r5, #0
	mul	r0, r0, r2
	asr	r7, r0, #0x8
	add	r0, r3, #0
	mul	r0, r0, r2
	asr	r0, r0, #0x8
	mov	ip, r0
	sub	r2, r6, r1
	str	r2, [r4, #0x40]
	sub	r0, r5, r7
	str	r0, [r4, #0x44]
	mov	r5, ip
	sub	r0, r3, r5
	str	r0, [r4, #0x48]
	cmp	r1, #0
	bne	.L7	@cond_branch
	cmp	r2, #0
	beq	.L7	@cond_branch
	cmp	r2, #0
	ble	.L8	@cond_branch
	sub	r0, r2, #1
	b	.L9
.L8:
	add	r0, r2, #1
.L9:
	str	r0, [r4, #0x40]
.L7:
	cmp	r7, #0
	bne	.L11	@cond_branch
	ldr	r0, [r4, #0x44]
	cmp	r0, #0
	beq	.L11	@cond_branch
	cmp	r0, #0
	ble	.L12	@cond_branch
	sub	r0, r0, #0x1
	b	.L13
.L12:
	add	r0, r0, #0x1
.L13:
	str	r0, [r4, #0x44]
.L11:
	mov	r0, ip
	cmp	r0, #0
	bne	.L15	@cond_branch
	ldr	r0, [r4, #0x48]
	cmp	r0, #0
	beq	.L15	@cond_branch
	cmp	r0, #0
	ble	.L16	@cond_branch
	sub	r0, r0, #0x1
	b	.L17
.L16:
	add	r0, r0, #0x1
.L17:
	str	r0, [r4, #0x48]
.L15:
	ldr	r2, [r4, #0x70]
	cmp	r2, #0
	ble	.L19	@cond_branch
	ldr	r0, .L22
	ldr	r1, [r0]
	ldr	r0, [r0, #0x4]
	sub	r1, r1, r0
	sub	r1, r2, r1
	str	r1, [r4, #0x70]
	cmp	r1, #0
	bge	.L19	@cond_branch
	mov	r0, #0x0
	str	r0, [r4, #0x70]
.L19:
	ldr	r0, [r4, #0x6c]
	cmp	r0, #0
	bne	.L21	@cond_branch
	add	r1, r4, #0
	add	r1, r1, #0x98
	mov	r0, #0x1
	ldrb	r1, [r1]
	and	r0, r0, r1
	cmp	r0, #0
	bne	.L21	@cond_branch
	add	r0, r4, #0
	bl	actor_8058638
.L21:
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L23:
	.align	2, 0
.L22:
	.4byte	0x3000e30
	thumb_func_end sub_80584B8

.align 2, 0 @ Don't pad with nop.
