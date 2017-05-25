	.include "asm/common.inc"

	thumb_func_start sub_8044314
sub_8044314:
	push	{r4, r5, r6, r7, lr}
	add	r5, r0, #0
	add	r7, r3, #0
	asr	r4, r2, #0x5
	mov	r0, #0x1f
	and	r0, r0, r2
	add	r6, r0, #1
	bl	getLanguage
	add	r3, r0, #0
	cmp	r6, #0x1
	bne	.L1	@cond_branch
	cmp	r4, #0x1
	beq	.L2	@cond_branch
	cmp	r4, #0x1
	bgt	.L3	@cond_branch
	cmp	r4, #0
	beq	.L4	@cond_branch
	b	.L30
.L3:
	cmp	r4, #0x2
	beq	.L6	@cond_branch
	cmp	r4, #0x3
	beq	.L7	@cond_branch
	b	.L30
.L4:
	ldr	r0, [r5]
	ldr	r2, .L10
	lsl	r1, r3, #0x2
	b	.L9
.L11:
	.align	2, 0
.L10:
	.4byte	0x806e8d8
.L2:
	ldr	r0, [r5, #0x8]
	ldr	r1, .L13
	lsl	r2, r3, #0x2
	add	r1, r1, #0x14
	add	r2, r2, r1
	ldr	r1, [r2]
	b	.L15
.L14:
	.align	2, 0
.L13:
	.4byte	0x806e8d8
.L6:
	ldr	r0, [r5, #0x10]
	ldr	r1, .L16
	lsl	r2, r3, #0x2
	add	r1, r1, #0x28
	add	r2, r2, r1
	ldr	r1, [r2]
	b	.L15
.L17:
	.align	2, 0
.L16:
	.4byte	0x806e8d8
.L7:
	ldr	r0, [r5, #0x24]
	ldr	r2, .L19
	lsl	r1, r7, #0x2
	add	r1, r1, r7
	add	r1, r1, r3
	lsl	r1, r1, #0x2
.L9:
	add	r1, r1, r2
	ldr	r1, [r1]
.L15:
	mov	r2, #0xe
	bl	sub_8061660
	b	.L30
.L20:
	.align	2, 0
.L19:
	.4byte	0x806e914
.L1:
	cmp	r4, #0x1
	beq	.L21	@cond_branch
	cmp	r4, #0x1
	bgt	.L22	@cond_branch
	cmp	r4, #0
	beq	.L23	@cond_branch
	b	.L30
.L22:
	cmp	r4, #0x2
	beq	.L25	@cond_branch
	b	.L30
.L23:
	ldr	r0, .L28
	ldr	r0, [r0]
	ldr	r2, .L28 + 4
	add	r1, r0, r2
	ldrb	r2, [r1]
	ldr	r3, .L28 + 8
	add	r1, r0, r3
	add	r3, r3, #0x2
	add	r0, r0, r3
	ldrb	r1, [r1]
	ldrb	r0, [r0]
	sub	r4, r1, r0
	sub	r4, r4, r2
	ldr	r0, [r5, #0x4]
	add	r1, r2, #0
	mul	r1, r1, r6
	asr	r1, r1, #0x5
	mov	r2, #0xf
	bl	showNumber_2
	ldr	r0, [r5, #0x4]
	ldr	r1, .L28 + 12
	mov	r2, #0xf
	bl	showString
	ldr	r0, [r5, #0x4]
	add	r1, r4, #0
	mul	r1, r1, r6
	asr	r1, r1, #0x5
	mov	r2, #0xf
	bl	showNumber
	b	.L30
.L29:
	.align	2, 0
.L28:
	.4byte	0x3000f48
	.4byte	0x6a7
	.4byte	0x6a6
	.4byte	0x86fd470
.L21:
	ldr	r0, [r5, #0xc]
	ldr	r1, .L31
	ldr	r1, [r1]
	mov	r2, #0xd5
	lsl	r2, r2, #0x3
	add	r1, r1, r2
	ldrb	r1, [r1]
	mul	r1, r1, r6
	asr	r1, r1, #0x5
	mov	r2, #0xf
	bl	showNumber_2
	b	.L30
.L32:
	.align	2, 0
.L31:
	.4byte	0x3000f48
.L25:
	ldr	r0, .L33
	ldr	r0, [r0]
	ldr	r3, .L33 + 4
	add	r1, r0, r3
	ldr	r2, .L33 + 8
	add	r0, r0, r2
	ldrb	r1, [r1]
	ldrb	r0, [r0]
	sub	r1, r1, r0
	ldr	r0, [r5, #0x14]
	mul	r1, r1, r6
	asr	r1, r1, #0x5
	mov	r2, #0xf
	bl	showNumber_2
.L30:
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L34:
	.align	2, 0
.L33:
	.4byte	0x3000f48
	.4byte	0x6a5
	.4byte	0x6a6
	thumb_func_end sub_8044314

.align 2, 0 @ Don't pad with nop.
