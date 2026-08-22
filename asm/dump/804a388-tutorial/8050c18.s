	.include "asm/common.inc"

	thumb_func_start sub_8050C18
sub_8050C18:
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	add	sp, sp, #0xfffffff4
	add	r4, r0, #0
	ldr	r0, [r4, #0x8]
	add	r0, r0, #0x80
	mov	sl, r0
	ldr	r0, [r4, #0xc]
	str	r0, [sp]
	ldr	r1, [r4, #0x18]
	str	r1, [sp, #0x4]
	mov	r2, #0x0
	str	r2, [sp, #0x8]
	ldr	r5, [r4, #0x28]
	mov	r8, r2
	ldr	r0, [r4]
	cmp	r8, r0
	blt	.L8050C44	@cond_branch
	b	.L8050D94
.L8050C44:
	ldr	r3, .L8050CC4
	mov	r9, r3
.L8050C48:
	mov	r7, sl
	asr	r1, r7, #0x8
	lsl	r1, r1, #0x18
	lsr	r1, r1, #0x18
	lsl	r0, r1, #0x1
	add r0, r9
	mov	r2, #0x0
	ldsh	r0, [r0, r2]
	ldr	r3, [sp, #0x4]
	mul	r0, r0, r3
	asr	r2, r0, #0x8
	add	r1, r1, #0x40
	lsl	r1, r1, #0x1
	add r1, r9
	mov	r7, #0x0
	ldsh	r0, [r1, r7]
	mul	r0, r0, r3
	asr	r7, r0, #0x8
	ldr	r0, [r4, #0x2c]
	ldr	r0, [r0, #0x20]
	mul	r0, r0, r2
	asr	r2, r0, #0x8
	ldr	r0, [r5, #0x4]
	cmp	r0, #0
	beq	.L8050D76	@cond_branch
	add	r3, r0, #0
	ldr	r6, [r5, #0x10]
	mov	r0, #0x1
	ldrh	r1, [r4, #0x3c]
	and	r0, r0, r1
	ldr	r1, [r4, #0x4]
	cmp	r0, #0
	beq	.L8050D1A	@cond_branch
	cmp	r8, r1
	bne	.L8050D1A	@cond_branch
	mov	r0, #0x80
	lsl	r0, r0, #0x1
	cmp	r6, r0
	ble	.L8050CC8	@cond_branch
	ldr	r2, [r3, #0x8]
	mov	r1, #0xf0
	lsl	r1, r1, #0x7
	sub	r1, r1, r2
	ldr	r0, [r5, #0x8]
	mul	r0, r0, r6
	asr	r0, r0, #0x8
	sub	r1, r1, r0
	asr	r1, r1, #0x3
	add	r2, r2, r1
	str	r2, [r3, #0x8]
	ldr	r2, [r3, #0xc]
	mov	r1, #0xa0
	lsl	r1, r1, #0x7
	sub	r1, r1, r2
	ldr	r0, [r5, #0xc]
	mul	r0, r0, r6
	asr	r0, r0, #0x8
	sub	r1, r1, r0
	asr	r1, r1, #0x3
	add	r2, r2, r1
	b	.L8050CEA
.L8050CC2:
	.align	2, 0
.L8050CC4:
	.4byte	Unk_874CC3C
.L8050CC8:
	ldr	r2, [r3, #0x8]
	mov	r0, #0xf0
	lsl	r0, r0, #0x7
	sub	r0, r0, r2
	ldr	r1, [r5, #0x8]
	sub	r0, r0, r1
	asr	r0, r0, #0x3
	add	r2, r2, r0
	str	r2, [r3, #0x8]
	ldr	r2, [r3, #0xc]
	mov	r0, #0xa0
	lsl	r0, r0, #0x7
	sub	r0, r0, r2
	ldr	r1, [r5, #0xc]
	sub	r0, r0, r1
	asr	r0, r0, #0x3
	add	r2, r2, r0
.L8050CEA:
	str	r2, [r3, #0xc]
	ldr	r0, [r4, #0x20]
	ldr	r1, [r4, #0x24]
	sub	r0, r0, r1
	cmp	r0, #0x10
	ble	.L8050CFA	@cond_branch
	mov	r0, #0x4
	str	r0, [r5, #0x14]
.L8050CFA:
	ldr	r0, [r4, #0x20]
	mov	r1, #0x3
	and	r0, r0, r1
	cmp	r0, #0
	bne	.L8050D68	@cond_branch
	ldr	r0, [r5]
	ldr	r1, [r0, #0x2c]
	ldrh	r2, [r3, #0x18]
	ldrh	r7, [r0, #0x2c]
	cmp	r2, r7
	bne	.L8050D14	@cond_branch
	ldrh	r0, [r0, #0x28]
	b	.L8050D16
.L8050D14:
	add	r0, r1, #0
.L8050D16:
	strh	r0, [r3, #0x18]
	b	.L8050D68
.L8050D1A:
	mov	r0, #0x0
	str	r0, [sp, #0x8]
	cmp	r8, r1
	bne	.L8050D48	@cond_branch
	ldr	r1, [r4, #0x20]
	lsl	r1, r1, #0x1b
	lsr	r1, r1, #0x18
	add	r0, r1, #0
	add	r0, r0, #0x40
	lsl	r0, r0, #0x1
	add r0, r9
	ldrh	r0, [r0]
	lsl	r0, r0, #0x10
	asr	r0, r0, #0x14
	add	r6, r6, r0
	lsl	r1, r1, #0x1
	add r1, r9
	ldrh	r1, [r1]
	lsl	r0, r1, #0x10
	asr	r0, r0, #0x16
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	str	r0, [sp, #0x8]
.L8050D48:
	ldr	r0, [r5, #0x8]
	add	r1, r0, #0
	mul	r1, r1, r6
	asr	r1, r1, #0x8
	ldr	r0, [r4, #0x34]
	sub	r0, r0, r1
	add	r0, r0, r2
	str	r0, [r3, #0x8]
	ldr	r0, [r5, #0xc]
	add	r1, r0, #0
	mul	r1, r1, r6
	asr	r1, r1, #0x8
	ldr	r0, [r4, #0x38]
	sub	r0, r0, r1
	add	r0, r0, r7
	str	r0, [r3, #0xc]
.L8050D68:
	lsl	r2, r6, #0x10
	lsr	r2, r2, #0x10
	add	r0, r3, #0
	add	r1, r2, #0
	ldr	r3, [sp, #0x8]
	bl	sub_8060F64
.L8050D76:
	ldr	r1, [sp]
	add sl, r1
	ldr	r0, [r5, #0x14]
	ldr	r1, [r5, #0x10]
	sub	r0, r0, r1
	asr	r0, r0, #0x3
	add	r1, r1, r0
	str	r1, [r5, #0x10]
	add	r5, r5, #0x1c
	mov	r2, #0x1
	add r8, r2
	ldr	r0, [r4]
	cmp	r8, r0
	bge	.L8050D94	@cond_branch
	b	.L8050C48
.L8050D94:
	ldrh	r1, [r4, #0x14]
	str	r1, [r4, #0x14]
	mov	r0, #0x2
	ldrh	r3, [r4, #0x3c]
	and	r0, r0, r3
	ldr	r3, [r4, #0x8]
	cmp	r0, #0
	bne	.L8050DC4	@cond_branch
	sub	r2, r1, r3
	add	r1, r2, #0
	cmp	r2, #0
	bge	.L8050DAE	@cond_branch
	neg	r1, r2
.L8050DAE:
	mov	r0, #0x80
	lsl	r0, r0, #0x8
	cmp	r1, r0
	ble	.L8050DBA	@cond_branch
	ldr	r7, .L8050DF0
	add	r1, r1, r7
.L8050DBA:
	asr	r0, r1, #0x3
	cmp	r2, #0
	bge	.L8050DC2	@cond_branch
	neg	r0, r0
.L8050DC2:
	str	r0, [r4, #0x10]
.L8050DC4:
	ldr	r0, [r4, #0x10]
	add	r0, r3, r0
	ldr	r1, .L8050DF0 + 4
	and	r0, r0, r1
	str	r0, [r4, #0x8]
	ldr	r0, [r4, #0x20]
	add	r0, r0, #0x1
	str	r0, [r4, #0x20]
	ldr	r0, [r4, #0x1c]
	ldr	r1, [r4, #0x18]
	sub	r0, r0, r1
	asr	r0, r0, #0x3
	add	r1, r1, r0
	str	r1, [r4, #0x18]
	add	sp, sp, #0xc
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L8050DF0:
	.align	2, 0

	.4byte	0xffff0100
	.4byte	0xffff
	thumb_func_end sub_8050C18

.align 2, 0 @ Don't pad with nop.
