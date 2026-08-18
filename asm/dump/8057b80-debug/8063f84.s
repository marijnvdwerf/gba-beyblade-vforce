	.include "asm/common.inc"

	thumb_func_start sub_8063F84
sub_8063F84:
	push	{r4, r5, r6, r7, lr}
	mov	r7, r9
	mov	r6, r8
	push	{r6, r7}
	add	sp, sp, #0xfffffffc
	add	r4, r0, #0
	add	r1, r4, #0
	add	r1, r1, #0xba
	ldrh	r0, [r1]
	cmp	r0, #0
	bne	.L8063F9E	@cond_branch
	mov	r0, #0x8
	strh	r0, [r1]
.L8063F9E:
	mov	r0, #0x8
	ldrh	r2, [r1]
	and	r0, r0, r2
	mov	r8, r1
	cmp	r0, #0
	beq	.L80640A4	@cond_branch
	mov	r6, #0x1
	mov	r5, r8
	add	r7, r4, #0
	add	r7, r7, #0xac
.L8063FB2:
	ldr	r0, [r4]
	ldrb	r1, [r0]
	add	r2, r1, #0
	add	r3, r0, #0
	cmp	r1, #0x20
	beq	.L8064004	@cond_branch
	cmp	r1, #0x20
	bgt	.L8063FDA	@cond_branch
	cmp	r1, #0x9
	beq	.L8064004	@cond_branch
	cmp	r1, #0x9
	bgt	.L8063FD0	@cond_branch
	cmp	r1, #0
	beq	.L8063FE0	@cond_branch
	b	.L806403A
.L8063FD0:
	cmp	r1, #0xa
	beq	.L8063FE8	@cond_branch
	cmp	r1, #0xc
	beq	.L8064030	@cond_branch
	b	.L806403A
.L8063FDA:
	cmp	r2, #0x7b
	beq	.L8064014	@cond_branch
	b	.L806403A
.L8063FE0:
	mov	r6, #0x0
	mov	r0, #0x2
	ldrh	r1, [r5]
	b	.L806409C
.L8063FE8:
	add	r0, r4, #0
	add	r0, r0, #0xe4
	ldr	r2, [r0]
	cmp	r2, #0
	beq	.L8063FFC	@cond_branch
	sub	r0, r0, #0x26
	ldrb	r1, [r0]
	add	r0, r4, #0
	bl	_call_via_r2
.L8063FFC:
	add	r0, r4, #0
	bl	sub_8063CD0
	b	.L80640A0
.L8064004:
	ldrb	r2, [r4, #0xc]
	lsl	r0, r2, #0x8
	ldr	r1, [r7]
	add	r1, r1, r0
	str	r1, [r7]
	add	r0, r3, #1
	str	r0, [r4]
	b	.L80640A0
.L8064014:
	mov	r1, sp
	bl	sub_8063D38
	str	r0, [r4]
	add	r0, r4, #0
	add	r0, r0, #0xdc
	ldr	r2, [r0]
	cmp	r2, #0
	beq	.L80640A0	@cond_branch
	ldr	r1, [sp]
	add	r0, r4, #0
	bl	_call_via_r2
	b	.L80640A0
.L8064030:
	mov	r6, #0x0
	add	r0, r4, #0
	bl	sub_8064140
	b	.L80640A0
.L806403A:
	add	r0, r4, #0
	bl	sub_8063BA8
	mov	r6, #0x0
	add	r0, r4, #0
	add	r0, r0, #0xc0
	ldrb	r1, [r4, #0x12]
	ldrb	r0, [r0]
	add	r0, r1, r0
	ldrb	r2, [r4, #0x11]
	cmp	r0, r2
	ble	.L8064064	@cond_branch
	ldr	r1, .L8064060
	add	r0, r1, #0
	ldrh	r2, [r5]
	and	r0, r0, r2
	mov	r1, #0x4
	b	.L806409C
.L806405E:
	.align	2, 0
.L8064060:
	.4byte	0xfff7
.L8064064:
	add	r0, r4, #0
	add	r0, r0, #0xb4
	ldr	r1, [r7]
	ldr	r0, [r0]
	add	r1, r1, r0
	add	r0, r4, #0
	add	r0, r0, #0xa4
	ldr	r0, [r0]
	cmp	r1, r0
	ble	.L8064092	@cond_branch
	add	r0, r4, #0
	add	r0, r0, #0xe4
	ldr	r2, [r0]
	cmp	r2, #0
	beq	.L806408C	@cond_branch
	sub	r0, r0, #0x26
	ldrb	r1, [r0]
	add	r0, r4, #0
	bl	_call_via_r2
.L806408C:
	add	r0, r4, #0
	bl	sub_8063CD0
.L8064092:
	ldr	r1, .L80640F0
	add	r0, r1, #0
	ldrh	r2, [r5]
	and	r0, r0, r2
	mov	r1, #0x10
.L806409C:
	orr	r0, r0, r1
	strh	r0, [r5]
.L80640A0:
	cmp	r6, #0
	bne	.L8063FB2	@cond_branch
.L80640A4:
	mov	r0, #0x10
	mov	r1, r8
	ldrh	r1, [r1]
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L80640E0	@cond_branch
	add	r0, r4, #0
	add	r0, r0, #0xe0
	ldr	r2, [r0]
	cmp	r2, #0
	beq	.L80640C4	@cond_branch
	add	r1, r4, #0
	add	r1, r1, #0x1c
	add	r0, r4, #0
	bl	_call_via_r2
.L80640C4:
	add	r0, r4, #0
	bl	sub_8063B44
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L80640E0	@cond_branch
	ldr	r0, .L80640F0 + 4
	mov	r2, r8
	ldrh	r2, [r2]
	and	r0, r0, r2
	mov	r1, #0x8
	orr	r0, r0, r1
	mov	r1, r8
	strh	r0, [r1]
.L80640E0:
	add	sp, sp, #0x4
	pop	{r3, r4}
	mov	r8, r3
	mov	r9, r4
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L80640EE:
	.align	2, 0
.L80640F0:
	.4byte	0xfff7
	.4byte	0xffef
	thumb_func_end sub_8063F84

.align 2, 0 @ Don't pad with nop.
