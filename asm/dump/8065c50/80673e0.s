	.include "asm/common.inc"

	thumb_func_start sub_80673E0
sub_80673E0:
	push	{r4, r5, r6, r7, lr}
	add	sp, sp, #0xffffffb8
	str	r0, [sp, #0x28]
	str	r1, [sp, #0x2c]
	str	r2, [sp, #0x30]
	str	r3, [sp, #0x34]
	add	r0, sp, #0x28
	mov	r1, sp
	bl	sub_8066D8C
	add	r0, sp, #0x30
	add	r4, sp, #0x14
	add	r1, r4, #0
	bl	sub_8066D8C
	mov	ip, sp
	mov	r0, #0x0
	ldr	r3, [sp]
	cmp	r3, #0x1
	bhi	.L1	@cond_branch
	mov	r0, #0x1
.L1:
	cmp	r0, #0
	beq	.L2	@cond_branch
	mov	r1, sp
	b	.L18
.L2:
	mov	r0, #0x0
	ldr	r2, [sp, #0x14]
	add	r5, r2, #0
	cmp	r2, #0x1
	bhi	.L4	@cond_branch
	mov	r0, #0x1
.L4:
	cmp	r0, #0
	beq	.L5	@cond_branch
	add	r1, r4, #0
	b	.L18
.L5:
	ldr	r0, [sp, #0x4]
	ldr	r1, [sp, #0x18]
	EOR	r0, r1
	str	r0, [sp, #0x4]
	mov	r0, #0x0
	cmp	r3, #0x4
	bne	.L7	@cond_branch
	mov	r0, #0x1
.L7:
	cmp	r0, #0
	bne	.L8	@cond_branch
	mov	r4, #0x0
	cmp	r3, #0x2
	bne	.L9	@cond_branch
	mov	r4, #0x1
.L9:
	cmp	r4, #0
	beq	.L10	@cond_branch
.L8:
	mov	r1, ip
	ldr	r0, [r1]
	cmp	r0, r5
	beq	.L11	@cond_branch
	b	.L18
.L11:
	ldr	r1, .L14
	b	.L18
.L15:
	.align	2, 0
.L14:
	.4byte	0x3000dc8
.L10:
	mov	r0, #0x0
	cmp	r2, #0x4
	bne	.L16	@cond_branch
	mov	r0, #0x1
.L16:
	cmp	r0, #0
	beq	.L17	@cond_branch
	mov	r0, #0x0
	mov	r1, #0x0
	str	r0, [sp, #0xc]
	str	r1, [sp, #0x10]
	str	r4, [sp, #0x8]
	mov	r1, sp
	b	.L18
.L17:
	mov	r0, #0x0
	cmp	r2, #0x2
	bne	.L19	@cond_branch
	mov	r0, #0x1
.L19:
	cmp	r0, #0
	beq	.L20	@cond_branch
	mov	r0, #0x4
	mov	r2, ip
	str	r0, [r2]
	b	.L21
.L20:
	mov	r3, ip
	ldr	r1, [r3, #0x8]
	ldr	r0, [sp, #0x1c]
	sub	r6, r1, r0
	str	r6, [r3, #0x8]
	ldr	r4, [r3, #0xc]
	ldr	r5, [r3, #0x10]
	ldr	r0, [sp, #0x20]
	ldr	r1, [sp, #0x24]
	str	r0, [sp, #0x38]
	str	r1, [sp, #0x3c]
	cmp	r1, r5
	bhi	.L22	@cond_branch
	ldr	r1, [sp, #0x3c]
	cmp	r1, r5
	bne	.L24	@cond_branch
	cmp	r0, r4
	bls	.L24	@cond_branch
.L22:
	lsr	r3, r4, #0x1f
	lsl	r2, r5, #0x1
	add	r1, r3, #0
	orr	r1, r1, r2
	lsl	r0, r4, #0x1
	add	r5, r1, #0
	add	r4, r0, #0
	sub	r0, r6, #1
	mov	r2, ip
	str	r0, [r2, #0x8]
.L24:
	ldr	r7, .L33 + 4
	ldr	r6, .L33
	mov	r0, #0x0
	mov	r1, #0x0
	str	r0, [sp, #0x40]
	str	r1, [sp, #0x44]
.L28:
	ldr	r1, [sp, #0x3c]
	cmp	r1, r5
	bhi	.L27	@cond_branch
	cmp	r1, r5
	bne	.L26	@cond_branch
	ldr	r2, [sp, #0x38]
	cmp	r2, r4
	bhi	.L27	@cond_branch
.L26:
	ldr	r0, [sp, #0x40]
	orr	r0, r0, r6
	ldr	r1, [sp, #0x44]
	orr	r1, r1, r7
	str	r0, [sp, #0x40]
	str	r1, [sp, #0x44]
	ldr	r0, [sp, #0x38]
	ldr	r1, [sp, #0x3c]
	sub	r4, r4, r0
	SBC	r5, r1
.L27:
	lsl	r3, r7, #0x1f
	lsr	r2, r6, #0x1
	add	r0, r3, #0
	orr	r0, r0, r2
	lsr	r1, r7, #0x1
	add	r7, r1, #0
	add	r6, r0, #0
	lsr	r3, r4, #0x1f
	lsl	r2, r5, #0x1
	add	r1, r3, #0
	orr	r1, r1, r2
	lsl	r0, r4, #0x1
	add	r5, r1, #0
	add	r4, r0, #0
	add	r0, r7, #0
	orr	r0, r0, r6
	cmp	r0, #0
	bne	.L28	@cond_branch
	mov	r0, #0xff
	ldr	r1, [sp, #0x40]
	and	r1, r1, r0
	mov	r2, #0x0
	cmp	r1, #0x80
	bne	.L32	@cond_branch
	cmp	r2, #0
	bne	.L32	@cond_branch
	add	r0, r0, #0x1
	ldr	r1, [sp, #0x40]
	and	r1, r1, r0
	add	r0, r2, #0
	orr	r0, r0, r1
	cmp	r0, #0
	bne	.L31	@cond_branch
	add	r0, r5, #0
	orr	r0, r0, r4
	cmp	r0, #0
	beq	.L32	@cond_branch
.L31:
	mov	r0, #0x80
	mov	r1, #0x0
	ldr	r2, [sp, #0x40]
	ldr	r3, [sp, #0x44]
	add	r2, r2, r0
	ADC	r3, r1
	str	r2, [sp, #0x40]
	str	r3, [sp, #0x44]
.L32:
	ldr	r0, [sp, #0x40]
	ldr	r1, [sp, #0x44]
	mov	r2, ip
	str	r0, [r2, #0xc]
	str	r1, [r2, #0x10]
.L21:
	mov	r1, ip
.L18:
	add	r0, r1, #0
	bl	sub_8066C44
	add	sp, sp, #0x48
	pop	{r4, r5, r6, r7, pc}
.L34:
	.align	2, 0
.L33:
	.4byte	0x0
	.4byte	0x10000000
	thumb_func_end sub_80673E0

.align 2, 0 @ Don't pad with nop.
