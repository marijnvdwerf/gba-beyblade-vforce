	.include "asm/common.inc"

	thumb_func_start sub_806014C
sub_806014C:
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	add	sp, sp, #0xfffffffc
	str	r0, [sp]
	add	r6, r1, #0
	lsl	r2, r2, #0x18
	lsr	r2, r2, #0x18
	mov	r8, r2
	ldr	r1, .L3
	ldr	r2, [r1]
	ldrb	r0, [r2, #0x3]
	mov	r9, r0
	ldr	r3, [r2, #0x14]
	mov	r0, #0x80
	lsl	r0, r0, #0x1
	and	r0, r0, r3
	add	r7, r1, #0
	cmp	r0, #0
	beq	.L1	@cond_branch
	mov	r0, #0x0
	b	.L44
.L4:
	.align	2, 0
.L3:
	.4byte	0x3005dc4
.L1:
	mov	r0, #0xc0
	and	r0, r0, r3
	cmp	r0, #0
	beq	.L5	@cond_branch
	mov	r1, #0x0
	mov	sl, r1
	b	.L6
.L5:
	mov	r0, #0x80
	lsl	r0, r0, #0x3
	and	r0, r0, r3
	cmp	r0, #0
	bne	.L7	@cond_branch
	mov	r1, #0x1
	mov	sl, r1
	b	.L8
.L7:
	mov	r0, #0x1
	mov	sl, r0
.L6:
	ldrb	r0, [r2, #0x5]
	add	r0, r0, #0x1
.L8:
	strb	r0, [r2, #0x5]
	ldr	r2, [r7]
	ldrb	r1, [r2, #0x5]
	cmp	r1, #0x3b
	bls	.L9	@cond_branch
	ldr	r0, [r2, #0x14]
	mov	r1, #0x80
	lsl	r1, r1, #0x1
	orr	r0, r0, r1
	str	r0, [r2, #0x14]
	mov	r0, #0x0
	b	.L44
.L9:
	ldr	r3, [r2, #0x14]
	ldr	r0, .L14
	and	r3, r3, r0
	str	r3, [r2, #0x14]
	mov	r0, #0x80
	and	r0, r0, r3
	cmp	r0, #0
	beq	.L11	@cond_branch
	ldr	r1, [r2, #0x1c]
	add	r1, r1, #0x1
	str	r1, [r2, #0x1c]
	mov	r4, #0x81
	NEG	r4, r4
	and	r4, r4, r3
	str	r4, [r2, #0x14]
	ldr	r0, [r2, #0x20]
	cmp	r1, r0
	bcc	.L12	@cond_branch
	mov	r0, #0x80
	lsl	r0, r0, #0x1
	orr	r4, r4, r0
	str	r4, [r2, #0x14]
	mov	r0, #0x0
	b	.L44
.L15:
	.align	2, 0
.L14:
	.4byte	0xfffffbbf
.L11:
	str	r0, [r2, #0x1c]
.L12:
	add	r5, r7, #0
	ldr	r0, [r5]
	ldr	r0, [r0, #0x14]
	mov	r1, #0x2
	and	r0, r0, r1
	cmp	r0, #0
	bne	.L16	@cond_branch
	b	.L17
.L16:
	bl	sub_8060040
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L18	@cond_branch
	ldr	r2, [r5]
	ldr	r1, [r2, #0x14]
	mov	r0, #0x80
	lsl	r0, r0, #0x2
	and	r0, r0, r1
	cmp	r0, #0
	bne	.L19	@cond_branch
	b	.L44
.L19:
	ldr	r0, .L25
	and	r1, r1, r0
	str	r1, [r2, #0x14]
	mov	r0, #0x0
	strb	r0, [r2]
	ldr	r4, .L25 + 4
	ldr	r0, [r5]
	ldr	r1, [r0, #0x24]
	ldr	r2, [r0, #0x18]
	ldr	r3, [r4]
	add	r0, r6, #0
	bl	_call_via_r3
	ldr	r1, [r5]
	ldr	r0, [r1, #0x24]
	str	r0, [r1, #0x3c]
	ldr	r2, .L25 + 8
	ldr	r0, .L25 + 12
	ldr	r0, [r0]
	str	r0, [r2, #0x18]
	ldr	r2, .L25 + 16
	ldr	r0, [r1, #0x10]
	strh	r0, [r2]
	ldr	r1, .L25 + 20
	mov	r0, #0xc0
	strh	r0, [r1]
	mov	r0, #0x40
	bl	EnableInterrupt
	ldr	r0, .L25 + 24
	ldr	r0, [r0]
	bl	_call_via_r0
	mov	r0, sl
	cmp	r0, #0
	bne	.L22	@cond_branch
	mov	r1, r8
	cmp	r1, #0
	bne	.L22	@cond_branch
	b	.L50
.L22:
	ldr	r1, [r5]
	ldr	r0, [r1, #0x38]
	ldr	r1, [r1, #0x18]
	mov	r2, r9
	mul	r2, r2, r1
	ldr	r3, [r4]
	ldr	r1, [sp]
	bl	_call_via_r3
	b	.L50
.L26:
	.align	2, 0
.L25:
	.4byte	0xfffffdff
	.4byte	0x807d974
	.4byte	0x3000df0
	.4byte	0x807d900
	.4byte	0x400010c
	.4byte	0x400010e
	.4byte	0x807d8fc
.L18:
	mov	r0, sl
	cmp	r0, #0
	bne	.L27	@cond_branch
	mov	r1, r8
	cmp	r1, #0
	beq	.L28	@cond_branch
.L27:
	ldr	r3, .L31
	ldr	r1, [r5]
	ldr	r0, [r1, #0x38]
	ldr	r1, [r1, #0x18]
	mov	r2, r9
	mul	r2, r2, r1
	ldr	r3, [r3]
	ldr	r1, [sp]
	bl	_call_via_r3
.L28:
	ldr	r3, .L31
	ldr	r4, .L31 + 4
	ldr	r0, [r4]
	ldr	r1, [r0, #0x40]
	ldr	r2, [r0, #0x18]
	ldr	r3, [r3]
	add	r0, r6, #0
	bl	_call_via_r3
	ldr	r4, [r4]
	ldr	r1, [r4, #0x14]
	mov	r0, #0x20
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L29	@cond_branch
	mov	r0, #0x0
	str	r0, [r4, #0x1c]
	b	.L30
.L32:
	.align	2, 0
.L31:
	.4byte	0x807d974
	.4byte	0x3005dc4
.L29:
	mov	r0, #0x80
	orr	r1, r1, r0
	str	r1, [r4, #0x14]
.L30:
	ldr	r0, .L34
	ldr	r2, [r0]
	ldr	r0, [r2, #0x14]
	mov	r1, #0x21
	NEG	r1, r1
	and	r0, r0, r1
	str	r0, [r2, #0x14]
	b	.L50
.L35:
	.align	2, 0
.L34:
	.4byte	0x3005dc4
.L17:
	mov	r4, #0x0
	ldr	r0, .L45
	ldr	r1, .L45 + 4
	add	r6, r1, #0
	strh	r6, [r0]
	bl	sub_8060040
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L36	@cond_branch
	ldr	r0, .L45 + 8
	ldrh	r0, [r0]
	add	r1, r6, #0
	cmp	r0, r1
	bne	.L37	@cond_branch
	mov	r4, #0x1
.L37:
	ldr	r0, .L45 + 12
	ldrh	r0, [r0]
	cmp	r0, r1
	bne	.L38	@cond_branch
	add	r0, r4, #1
	lsl	r0, r0, #0x10
	lsr	r4, r0, #0x10
.L38:
	ldr	r0, [r5]
	ldrb	r0, [r0, #0x4]
	cmp	r0, #0x2
	bls	.L40	@cond_branch
	ldr	r0, .L45 + 16
	ldrh	r0, [r0]
	cmp	r0, r1
	bne	.L40	@cond_branch
	add	r0, r4, #1
	lsl	r0, r0, #0x10
	lsr	r4, r0, #0x10
.L40:
	ldr	r0, .L45 + 20
	ldr	r1, [r0]
	add	r7, r0, #0
	ldrb	r1, [r1, #0x4]
	cmp	r1, #0x3
	bls	.L42	@cond_branch
	ldr	r0, .L45 + 24
	ldrh	r1, [r0]
	ldr	r0, .L45 + 4
	cmp	r1, r0
	bne	.L42	@cond_branch
	add	r0, r4, #1
	lsl	r0, r0, #0x10
	lsr	r4, r0, #0x10
.L42:
	ldr	r3, [r7]
	ldrb	r0, [r3, #0x4]
	cmp	r4, r0
	bcc	.L43	@cond_branch
	bl	sub_8060404
	b	.L44
.L46:
	.align	2, 0
.L45:
	.4byte	0x400012a
	.4byte	0xdeaf
	.4byte	0x4000120
	.4byte	0x4000122
	.4byte	0x4000124
	.4byte	0x3005dc4
	.4byte	0x4000126
.L43:
	ldr	r2, .L48
	ldrh	r0, [r2]
	mov	r1, #0x80
	orr	r0, r0, r1
	strh	r0, [r2]
	ldr	r0, [r3, #0x14]
	mov	r1, #0x80
	lsl	r1, r1, #0x2
	orr	r0, r0, r1
	str	r0, [r3, #0x14]
	b	.L50
.L49:
	.align	2, 0
.L48:
	.4byte	0x4000128
.L36:
	ldr	r1, [r7]
	ldr	r2, [r1, #0x14]
	mov	r3, #0x4
	add	r0, r2, #0
	and	r0, r0, r3
	cmp	r0, #0
	bne	.L50	@cond_branch
	orr	r2, r2, r3
	str	r2, [r1, #0x14]
	ldr	r1, .L51
	ldr	r0, .L51 + 4
	str	r0, [r1, #0x1c]
	mov	r0, #0x80
	bl	EnableInterrupt
.L50:
	mov	r0, sl
.L44:
	add	sp, sp, #0x4
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6, r7}
	pop	{r1}
	bx	r1
.L52:
	.align	2, 0
.L51:
	.4byte	0x3000df0
	.4byte	onSerialCommunication + 1
	thumb_func_end sub_806014C

.align 2, 0 @ Don't pad with nop.
