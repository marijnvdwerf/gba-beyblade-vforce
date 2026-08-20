	.include "asm/common.inc"

	thumb_func_start sub_8049CE8
sub_8049CE8:
	push	{r4, r5, r6, r7, lr}
	mov	r7, r8
	push	{r7}
	add	sp, sp, #0xfffffff8
	add	r7, r0, #0
	cmp	r1, #0x2
	beq	.L8049D06	@cond_branch
	cmp	r1, #0x2
	bhi	.L8049D00	@cond_branch
	cmp	r1, #0x1
	beq	.L8049D7C	@cond_branch
	b	.L8049DC8
.L8049D00:
	cmp	r1, #0x4
	beq	.L8049D94	@cond_branch
	b	.L8049DC8
.L8049D06:
	ldr	r4, .L8049D68
	ldr	r5, .L8049D68 + 4
	ldr	r0, [r4, #0x60]
	ldr	r1, [r0]
	lsl	r0, r1, #0x5
	add	r0, r0, r1
	lsl	r0, r0, #0x2
	add	r1, r5, #0
	add	r1, r1, #0x78
	add	r0, r0, r1
	ldr	r1, [r0]
	mov	r0, #0x80
	lsl	r0, r0, #0x1
	mov	r8, r0
	mov	r6, #0x10
	str	r6, [sp]
	add	r0, r4, #0
	mov	r2, #0x0
	mov	r3, r8
	bl	sub_80637E4
	add	r0, r4, #0
	add	r0, r0, #0x14
	ldr	r1, [r4, #0x60]
	ldr	r2, [r1]
	lsl	r1, r2, #0x5
	add	r1, r1, r2
	lsl	r1, r1, #0x2
	add	r5, r5, #0x7c
	add	r1, r1, r5
	ldr	r1, [r1]
	str	r6, [sp]
	mov	r2, #0x0
	mov	r3, r8
	bl	sub_80637E4
	ldr	r0, .L8049D68 + 8
	add	r1, r7, r0
	mov	r2, #0x0
	mov	r0, #0x3e
	strb	r0, [r1]
	ldr	r0, .L8049D68 + 12
	add	r1, r7, r0
	mov	r0, #0xfe
	strb	r0, [r1]
	ldr	r1, .L8049D68 + 16
	add	r0, r7, r1
	strb	r2, [r0]
	b	.L8049DC8
.L8049D68:
	.align	2, 0

	.4byte	_unk30006A4
	.4byte	_806A828
	.4byte	0x584
	.4byte	0x585
	.4byte	0x586
.L8049D7C:
	ldr	r4, .L8049D90
	add	r0, r4, #0
	bl	deallocate_80637CC
	sub	r4, r4, #0x14
	add	r0, r4, #0
	bl	deallocate_80637CC
	b	.L8049DC8
.L8049D8E:
	.align	2, 0
.L8049D90:
	.4byte	_unk30006B8
.L8049D94:
	ldr	r5, .L8049DD4
	mov	r1, #0xa0
	lsl	r1, r1, #0x13
	ldr	r0, .L8049DD4 + 4
	add	r6, r7, r0
	ldrb	r0, [r6]
	lsl	r2, r0, #0x18
	asr	r2, r2, #0x19
	mov	r4, #0x1f
	str	r4, [sp]
	str	r4, [sp, #0x4]
	add	r0, r5, #0
	mov	r3, #0x1f
	bl	sub_8063830
	add	r5, r5, #0x14
	ldr	r1, .L8049DD4 + 8
	ldrb	r6, [r6]
	lsl	r2, r6, #0x18
	asr	r2, r2, #0x19
	str	r4, [sp]
	str	r4, [sp, #0x4]
	add	r0, r5, #0
	mov	r3, #0x1f
	bl	sub_8063830
.L8049DC8:
	add	sp, sp, #0x8
	pop	{r3}
	mov	r8, r3
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L8049DD4:
	.align	2, 0

	.4byte	_unk30006A4
	.4byte	0x584
	.4byte	0x5000200
	thumb_func_end sub_8049CE8

.align 2, 0 @ Don't pad with nop.
