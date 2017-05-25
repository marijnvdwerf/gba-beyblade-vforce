	.include "asm/common.inc"

	thumb_func_start sub_8049DE0
sub_8049DE0:
	push	{r4, r5, r6, r7, lr}
	mov	r7, r8
	push	{r7}
	add	sp, sp, #0xfffffff8
	add	r7, r0, #0
	cmp	r1, #0x2
	beq	.L1	@cond_branch
	cmp	r1, #0x2
	bhi	.L2	@cond_branch
	cmp	r1, #0x1
	bne	.L3	@cond_branch
	b	.L4
.L3:
	b	.L16
.L2:
	cmp	r1, #0x3
	beq	.L6	@cond_branch
	cmp	r1, #0x4
	bne	.L7	@cond_branch
	b	.L8
.L7:
	b	.L16
.L1:
	ldr	r4, .L11
	ldr	r5, .L11 + 4
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
	ldr	r0, .L11 + 8
	add	r1, r7, r0
	mov	r2, #0x0
	mov	r0, #0x3e
	strb	r0, [r1]
	ldr	r0, .L11 + 12
	add	r1, r7, r0
	mov	r0, #0xfe
	strb	r0, [r1]
	ldr	r1, .L11 + 16
	add	r0, r7, r1
	strb	r2, [r0]
	b	.L16
.L12:
	.align	2, 0
.L11:
	.4byte	0x30006a4
	.4byte	0x806a828
	.4byte	0x584
	.4byte	0x585
	.4byte	0x586
.L6:
	ldr	r4, .L14
	ldr	r5, .L14 + 4
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
	ldr	r0, .L14 + 8
	add	r1, r7, r0
	mov	r0, #0x0
	strb	r0, [r1]
	ldr	r0, .L14 + 12
	add	r1, r7, r0
	mov	r0, #0x2
	strb	r0, [r1]
	ldr	r0, .L14 + 16
	add	r1, r7, r0
	mov	r0, #0x40
	strb	r0, [r1]
	b	.L16
.L15:
	.align	2, 0
.L14:
	.4byte	0x30006a4
	.4byte	0x806a828
	.4byte	0x584
	.4byte	0x585
	.4byte	0x586
.L4:
	ldr	r4, .L17
	add	r0, r4, #0
	bl	deallocate_80637CC
	sub	r4, r4, #0x14
	add	r0, r4, #0
	bl	deallocate_80637CC
	b	.L16
.L18:
	.align	2, 0
.L17:
	.4byte	0x30006b8
.L8:
	ldr	r5, .L19
	mov	r1, #0xa0
	lsl	r1, r1, #0x13
	ldr	r0, .L19 + 4
	add	r6, r7, r0
	ldrb	r0, [r6]
	lsl	r2, r0, #0x18
	asr	r2, r2, #0x19
	mov	r4, #0x0
	str	r4, [sp]
	str	r4, [sp, #0x4]
	add	r0, r5, #0
	mov	r3, #0x0
	bl	sub_8063830
	add	r5, r5, #0x14
	ldr	r1, .L19 + 8
	ldrb	r6, [r6]
	lsl	r2, r6, #0x18
	asr	r2, r2, #0x19
	str	r4, [sp]
	str	r4, [sp, #0x4]
	add	r0, r5, #0
	mov	r3, #0x0
	bl	sub_8063830
.L16:
	add	sp, sp, #0x8
	pop	{r3}
	mov	r8, r3
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L20:
	.align	2, 0
.L19:
	.4byte	0x30006a4
	.4byte	0x584
	.4byte	0x5000200
	thumb_func_end sub_8049DE0

.align 2, 0 @ Don't pad with nop.
